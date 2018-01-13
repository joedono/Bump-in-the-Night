--[[
States:
Idle - Hasn't seen or heard player and player hasn't dropped meat. Randomly walk around sniffing and eating things. Avoid traps
Walk - Moving randomly around the level
Heard Player - Has heard player. Idle for a bit, then switch to Investigating
Investigating - Has heard player or is being randomly directed to player. Has Idled. Is now moving towards the source of the sound
Spotted - Sees the player. Alert for a little bit, then give chase
Active Chase - Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
Passive Chase - Is giving chase and cannot see the player. Stop at node closest to last known player location. Downgrade to Alert when node is reached.
Smells Meat - Player has dropped meat somewhere on the floor. Walk to Meat
Eating - Reached meat that isn't in a trap. Consume meat for a time.
Trapped - Has walked into a trap. Whimper and try to free seld
Dead - Shot by player. Dead
]]

Monster_Panther = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, player, curFloor, x, y)
		Monster.init(self);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_PANTHER_WIDTH,
			h = MONSTER_PANTHER_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.eyeLights = {
			LightWorld:newLight(0, 0, 255, 0, 0, 15),
			LightWorld:newLight(0, 0, 255, 0, 0, 15)
		};

		self.eyeLights[1]:setVisible(false);
		self.eyeLights[2]:setVisible(false);

		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "panther";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Panther:update(dt)
	if not self.active then
		return;
	end

	if self.stateTimer > 0 then
		self.stateTimer = self.stateTimer - dt;
	end

	if self.state == "idle" then
		self:updateIdle(dt);
	elseif self.state == "walk" then
		self:updateWalk(dt);
	elseif self.state == "heard-player" then
		self:updateHeardPlayer(dt);
	elseif self.state == "investigating" then
		self:updateInvestigating(dt);
	elseif self.state == "spotted" then
		self:updateSpotted(dt);
	elseif self.state == "active-chase" then
		self:updateActiveChase(dt);
	elseif self.state == "passive-chase" then
		self:updatePassiveChase(dt);
	elseif self.state == "smells-meat" then
		self:updateSmellsMeat(dt);
	elseif self.state == "eating" then
		self:updateEating(dt);
	elseif self.state == "trapped" then
		self:updateTrapped(dt);
	elseif self.state == "dead" then
		-- Do nothing
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_PANTHER_TURN_SPEED);
	self:updateLights(dt);
end

function Monster_Panther:updateIdle(dt)
	if self:canHearPlayer() then
		self:hasHeardPlayer();
		return;
	end

	if self:canSeePlayer() then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();

		local randomHunt = love.math.random(100);
		if randomHunt < MONSTER_PANTHER_HUNT_CHANCE then
			self:hasHeardPlayer();
			self.state = "investigating";
		else
			self.state = "walk";
		end
	end
end

-- Hasn't seen or heard player and player hasn't dropped meat. Randomly walk around sniffing and eating things. Avoid traps
function Monster_Panther:updateWalk(dt)
	if self:canHearPlayer() then
		self:hasHeardPlayer();
		return;
	end

	if self:canSeePlayer() then
		self:hasSpottedPlayer();
		return;
	end

	-- Nothing interesting is happening. Amble around
	if self.targetPathNode == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_PANTHER_WALK_SPEED);
	end
end

-- Has heard the player. Look towards sound. If can't see player for some time, switch to alert
function Monster_Panther:updateHeardPlayer(dt)
	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "investigating";
	end
end

-- Has heard the player. Walk towards source of sound. If still can't see player for some time, go back to idle
function Monster_Panther:updateInvestigating(dt)
	local hearTarget = false;

	if self:canHearPlayer() then
		hearTarget = true;
		self.audioTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self:canSeePlayer() then
		self:hasSpottedPlayer();
		return;
	end

	if hearTarget or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.audioTarget.x, self.audioTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_PANTHER_INVESTIGATE_SPEED);
end

-- Sees the player. Alert for a little bit, then give chase
function Monster_Panther:updateSpotted(dt)
	if self:canHearPlayer() then
		self.audioTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self:canSeePlayer() then
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};

		self.audioTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		if self:canSeePlayer() then
			self.soundEffects.monsterPantherRoar:rewind();
			self.soundEffects.monsterPantherRoar:play();
			self.state = "active-chase";
		else
			self.state = "passive-chase";
		end
	end
end

-- Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
function Monster_Panther:updateActiveChase(dt)
	local seeTarget = false;

	if self:canSeePlayer() then
		seeTarget = true;
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	elseif self:canHearPlayer() then
		self.audioTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};

		self.state = "passive-chase";
		return;
	end

	if seeTarget or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_PANTHER_ACTIVE_CHASE_SPEED);
end

-- Is giving chase and cannot see the player. Stop at node closest to last known player location. Downgrade to Alert when node is reached.
function Monster_Panther:updatePassiveChase(dt)
	local hearTarget = false;
	if self:canSeePlayer() then
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};

		self.soundEffects.monsterPantherRoar:rewind();
		self.soundEffects.monsterPantherRoar:play();
		self.state = "active-chase";
		return;
	elseif self:canHearPlayer() then
		hearTarget = true;
		self.audioTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if hearTarget or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.audioTarget.x, self.audioTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_PANTHER_PASSIVE_CHASE_SPEED);
end

-- Player has dropped meat somewhere on the floor. Walk to Meat
function Monster_Panther:updateSmellsMeat(dt)
	local canSmellTarget = false;
	local placedMeat = self.parentManager.parentStateGame:getPlacedItem("placed-meat");
	if placedMeat ~= nil and (self.smellTarget == nil or self.smellTarget.x ~= placedMeat.center.x or self.smellTarget.y ~= placedMeat.center.y) then
		canSmellTarget = true;
		self.smellTarget = {
			x = placedMeat.center.x,
			y = placedMeat.center.y
		};
	end

	if canSmellTarget or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.smellTarget.x, self.smellTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_PANTHER_INVESTIGATE_SPEED);
end

-- Reached meat that isn't in a trap. Consume meat for a time.
function Monster_Panther:updateEating(dt)
	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "idle";
	end
end

-- Has walked into a trap. Whimper and try to free seld
function Monster_Panther:updateTrapped(dt)
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
	self.targetPathNodeIndex = 1;
	self.targetPathNode = self.path[self.targetPathNodeIndex];

	self:followPath(dt, MONSTER_PANTHER_TRAPPED_CHASE_SPEED);

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "idle";
	end
end

function Monster_Panther:canHearPlayer()
	local dist = math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y);

	if dist < MONSTER_PANTHER_RUN_HEAR_DISTANCE and self.player.runPressed and  (self.player.velocity.x ~= 0 or self.player.velocity.y ~= 0) then
		return true;
	end

	return false;
end

function Monster_Panther:canSeePlayer()
	local facingAngle = math.deg(math.angle(0, 0, self.facing.y, self.facing.x));
	local targetAngle = math.deg(math.angle(self.box.y, self.box.x, self.player.box.y, self.player.box.x));
	local sightCone = math.deg(MONSTER_PANTHER_SIGHT_CONE / 2);
	local angleDiff = (math.abs(facingAngle - targetAngle) + 180 + 360) % 360 - 180;
	local distToPlayer = math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y);
	local items, len = BumpWorld:querySegment(self.box.x, self.box.y, self.player.box.x, self.player.box.y, canSeeFilter);

	if distToPlayer < MONSTER_PANTHER_SIGHT_DISTANCE and len == 0 and angleDiff <= sightCone and angleDiff >= -sightCone then
		return true;
	end

	return false;
end

function Monster_Panther:hasHeardPlayer()
	self.audioTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	self.state = "heard-player";
	self.stateTimer = 2;
end

function Monster_Panther:hasSpottedPlayer()
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	self.audioTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	self.soundEffects.spotted:rewind();
	self.soundEffects.spotted:play();

	self.state = "spotted";
	self.stateTimer = 1;
end

function Monster_Panther:resetPath()
	self.path = nil;
	self.targetPathNodeIndex = 1;
	self.targetPathNode = nil;
end

function Monster_Panther:followPath(dt, speed)
	local warped = false;
	self.velocity = {
		x = self.targetPathNode.origin.x - self.box.x,
		y = self.targetPathNode.origin.y - self.box.y
	};
	self.velocity.x, self.velocity.y = math.normalize(self.velocity.x, self.velocity.y);
	self.speed = speed;

	local actualX, actualY, cols, len = self:updatePosition(dt);

	for i = 1, len do
    local col = cols[i];
		if KILL_PLAYER and col.other.type == "player" and col.other.active and
			self.state ~= "smells-meat" and self.state ~= "eating" and self.state ~= "dead" then
			col.other.active = false;

			self.soundEffects.monsterBite:rewind();
			self.soundEffects.playerDeathYell:rewind();
			self.soundEffects.monsterBite:play();
			self.soundEffects.playerDeathYell:play();

			self.parentManager.parentStateGame:loseGame();
		end

    if col.other.type == "door" then
      if not col.other.isOpen then
        col.other:open(self);
      end
    end

		if col.other.type == "placed-meat" and self.state == "smells-meat" then
			self:resetPath();
			self.state = "eating";
			self.stateTimer = 5;
			col.other.active = false;
		end

		if col.other.type == "placed-trap" and (self.state == "idle" or self.state == "walk" or self.state == "smells-meat" or self.state == "eating") then
			self.soundEffects.trapSpring:rewind();
			self.soundEffects.trapSpring:play();
			self:resetPath();
			self.state = "trapped";
			self.stateTimer = 5;
			col.other.active = false;
		end

		if col.other.type == "placed-shotgun-blast" then
			if self.state == "trapped" then
				col.other.active = false;
				self.state = "dead";
			else
				self.visualTarget = {
					x = self.player.box.x,
					y = self.player.box.y
				};

				self.audioTarget = {
					x = self.player.box.x,
					y = self.player.box.y
				};

				self.state = "spotted";
				self.stateTimer = 1;
			end
		end
	end

	local distanceTraveled = math.dist(0, 0, self.velocity.x * self.speed * dt, self.velocity.y * self.speed * dt);
	local distanceToPath = math.dist(self.box.x, self.box.y, self.targetPathNode.origin.x, self.targetPathNode.origin.y);

	if distanceToPath < distanceTraveled or distanceToPath == 0 then
		-- Reached target node. Go after next node
		self.box.x = self.targetPathNode.origin.x;
		self.box.y = self.targetPathNode.origin.y;
		BumpWorld:update(self, self.box.x, self.box.y);
		warped = true;

		self.targetPathNodeIndex = self.targetPathNodeIndex + 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];

		-- Move to other floor
		if self.targetPathNode ~= nil and self.curFloor ~= self.targetPathNode.floorIndex then
			self.box.x = self.targetPathNode.origin.x;
			self.box.y = self.targetPathNode.origin.y;
			self.curFloor = self.targetPathNode.floorIndex;
			BumpWorld:update(self, self.box.x, self.box.y);
		end

		-- Reached end of path
		if self.targetPathNode == nil then
			self:resetPath();
			self.state = "idle";
			self.stateTimer = love.math.random(2, 5);
		end
	end
	if not warped then
		self.box.x = actualX;
    self.box.y = actualY;
	end

	if self.targetPathNode ~= nil and self.targetPathNode.isGoal and math.dist(self.box.x, self.box.y, self.targetPathNode.origin.x, self.targetPathNode.origin.y) < 32 then
		self:resetPath();
		self.state = "idle";
		self.stateTimer = love.math.random(2, 5);
	end
end

function Monster_Panther:updatePosition(dt)
	local dx = self.box.x + self.velocity.x * self.speed * dt;
  local dy = self.box.y + self.velocity.y * self.speed * dt;
	return BumpWorld:move(self, dx, dy, monsterCollision);
end

function Monster_Panther:updateLights()
	if self.state == "dead" then
		if self.eyeLights ~= nil then
			LightWorld:remove(self.eyeLights[1]);
			LightWorld:remove(self.eyeLights[2]);

			self.eyeLights = nil;
		end

		return;
	else
		self.eyeLights[1]:setPosition(self.box.x + self.box.w / 4, self.box.y + 10);
		self.eyeLights[2]:setPosition(self.box.x + self.box.w * 3/4, self.box.y + 10);

		if self.state == "heard-player" or self.state == "investigating" or self.state == "spotted"
			or self.state == "active-chase" or self.state == "passive-chase" or self.state == "trapped"
			or math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y) < MONSTER_PANTHER_EYES_PLAYER_DISTANCE then
			self.eyeLights[1]:setVisible(true);
			self.eyeLights[2]:setVisible(true);
		else
			self.eyeLights[1]:setVisible(false);
			self.eyeLights[2]:setVisible(false);
		end
	end
end

function Monster_Panther:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(75, 75, 75);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.h, self.box.w);

	-- Draw eyes
	if self.state ~= "dead" then
		love.graphics.setColor(255, 0, 0);
		love.graphics.circle("fill", self.box.x + self.box.w / 4, self.box.y + 10, 5, 5);
		love.graphics.circle("fill", self.box.x + self.box.w * 3/4, self.box.y + 10, 5, 5);
	end

	if DRAW_MONSTER_PATH and self.state ~= "dead" then
		if self.path ~= nil then
			love.graphics.setColor(255, 0, 0);
			for index, path in pairs(self.path) do
				love.graphics.rectangle("fill", path.origin.x, path.origin.y, 32, 32);
			end
		end

		if self.finalTarget ~= nil then
			love.graphics.setColor(0, 0, 255);
			love.graphics.rectangle("fill", self.finalTarget.origin.x, self.finalTarget.origin.y, 32, 32);
		end
	end

	if DRAW_MONSTER_SENSES and self.state ~= "dead" then
		love.graphics.setColor(255, 255, 255);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_PANTHER_RUN_HEAR_DISTANCE);

		love.graphics.setColor(255, 255, 255, 150);
		local facingAngle = math.angle(0, 0, self.facing.y, self.facing.x);
		love.graphics.arc("fill",
			self.box.x + self.box.w / 2, self.box.y + self.box.h / 2,
			MONSTER_PANTHER_SIGHT_DISTANCE,
			facingAngle - MONSTER_PANTHER_SIGHT_CONE / 2, facingAngle + MONSTER_PANTHER_SIGHT_CONE / 2
		);
	end

	love.graphics.setColor(255, 255, 255, 255);
	love.graphics.print(self.state, 0, 0, 0, 10, 10);
end