--[[
Hunts by sight and moves randomly.
Attacks with a knife for an instant melee kill. Can be stunned temporarily with the taser.
The cell phone must be used while he is stunned in order to win.

States:
Idle - Hasn't seen player and player hasn't called police. Randomly walk around investigating things
Walk - Moving randomly around the level
Spotted - Sees the player. Alert for a little bit, then give chase
Active Chase - Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
Called Police - Move randomly around the level faster. Randomly head directly towards the player.
Called Police Pursue - Heading directly for the player
Stunned - Stunned by the player
]]

Monster_Burglar = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, player, curFloor, x, y)
		Monster.init(self);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_BURGLAR_WIDTH,
			h = MONSTER_BURGLAR_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.eyeLights = {
			LightWorld:newLight(0, 0, 255, 0, 0, 15),
			LightWorld:newLight(0, 0, 255, 0, 0, 15)
		};

		self.sightLight = LightWorld:newLight(0, 0, 150, 150, 150, MONSTER_BURGLAR_SIGHT_DISTANCE);
		self.sightLight:setDirection(0);
		self.sightLight:setAngle(MONSTER_BURGLAR_SIGHT_CONE);

		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "burglar";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Burglar:update(dt)
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
	elseif self.state == "spotted" then
		self:updateSpotted(dt);
	elseif self.state == "active-chase" then
		self:updateActiveChase(dt);
	elseif self.state == "called-police-idle" then
		self:updateCalledPoliceIdle(dt);
	elseif self.state == "called-police-walk" then
		self:updateCalledPoliceWalk(dt);
	elseif self.state == "called-police-pursue" then
		self:updateCalledPolicePursue(dt);
	elseif self.state == "stunned" then
		self:updateStunned(dt);
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_BURGLAR_TURN_SPEED);
	self:updateLights(dt);
end

function Monster_Burglar:updateIdle(dt)
	if self:hasCalledPolice() then
		self:panic();
	end

	if self:canSeePlayer() then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "walk";
	end
end

function Monster_Burglar:updateWalk(dt)
	if self:hasCalledPolice() then
		self:panic();
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
		self:followPath(dt, MONSTER_BURGLAR_WALK_SPEED);
	end
end

function Monster_Burglar:updateSpotted(dt)
	if self:hasCalledPolice() then
		self:panic();
	end

	if self:canSeePlayer() then
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "active-chase";
	end
end

function Monster_Burglar:updateActiveChase(dt)
	if self:hasCalledPolice() then
		self:panic();
	end

	local seeTarget = false;
	if self:canSeePlayer() then
		seeTarget = true;
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if seeTarget or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_BURGLAR_CHASE_SPEED);
end

function Monster_Burglar:updateCalledPoliceIdle(dt)
	if self:canSeePlayer() then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "called-police-walk";
	end
end

function Monster_Burglar:updateCalledPoliceWalk(dt)
	if self:canSeePlayer() then
		self:hasSpottedPlayer();
		return;
	end

	if self.targetPathNode == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_BURGLAR_PANIC_WALK_SPEED);
	end
end

function Monster_Burglar:updateCalledPolicePursue(dt)
	local seeTarget = false;
	if self:canSeePlayer() then
		seeTarget = true;
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if seeTarget or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_BURGLAR_PANIC_CHASE_SPEED);
end

function Monster_Burglar:updateStunned(dt)
	if self.stateTimer <= 0 then
		self:resetPath();
		if self:hasCalledPolice() then
			self.state = "called-police-idle";
		else
			self.state = "idle";
		end
	end
end

function Monster_Burglar:canSeePlayer()
	local facingAngle = math.deg(math.angle(0, 0, self.facing.y, self.facing.x));
	local targetAngle = math.deg(math.angle(self.box.y, self.box.x, self.player.box.y, self.player.box.x));
	local sightCone = math.deg(MONSTER_BURGLAR_SIGHT_CONE / 2);
	local angleDiff = (math.abs(facingAngle - targetAngle) + 180 + 360) % 360 - 180;
	local distToPlayer = math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y);
	local items, len = BumpWorld:querySegment(self.box.x, self.box.y, self.player.box.x, self.player.box.y, canSeeFilter);

	if distToPlayer < MONSTER_BURGLAR_SIGHT_DISTANCE and len == 0 and angleDiff <= sightCone and angleDiff >= -sightCone then
		return true;
	end

	return false;
end

function Monster_Burglar:hasSpottedPlayer()
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	self.soundEffects.spotted:rewind();
	self.soundEffects.spotted:play();

	if self:hasCalledPolice() then
		self.state = "spotted";
	else
		self.state = "called-police-pursue";
	end

	self.stateTimer = 1;
end

function Monster_Burglar:hasCalledPolice()
	self.parentManager.parentStateGame:hasPlayerCalledPolice();
end

function Monster_Burglar:panic()
	self.state = "called-police-idle";
	self.stateTimer = 2;
end

function Monster_Burglar:followPath(dt, speed)
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
		if KILL_PLAYER and col.other.type == "player" and col.other.active and self.state ~= "stunned" then
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
	end

	if self.targetPathNode ~= nil then
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

function Monster_Burglar:updateLights()
	if self.state == "stunned" then
		self.eyeLights[1]:setVisible(false);
		self.eyeLights[2]:setVisible(false);
		self.sightLight:setVisible(false);
	else
		self.eyeLights[1]:setVisible(true);
		self.eyeLights[2]:setVisible(true);
		self.sightLight:setVisible(true);

		self.eyeLights[1]:setPosition(self.box.x + self.box.w / 4, self.box.y + 10);
		self.eyeLights[2]:setPosition(self.box.x + self.box.w * 3/4, self.box.y + 10);

		local facing = math.angle(0, 0, self.facing.y, self.facing.x);
    if facing < 0 then
      facing = facing + math.pi * 2;
    end

    self.sightLight:setDirection(facing);
		self.sightLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2 - 10);

		if self.state == "idle" or self.state == "walk" then
			self.sightLight:setColor(150, 150, 150);
		elseif self.state == "called-police-idle" or self.state == "called-police-walk" then
			self.sightLight:setColor(150, 150, 0);
		elseif self.state == "spotted" or self.state == "active-chase" or self.state == "called-police-pursue" then
			self.sightLight:setColor(150, 0, 0);
		end
	end
end

function Monster_Burglar:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(0, 255, 0);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.h, self.box.w);

	-- Draw eyes
	if self.state ~= "stunned" then
		love.graphics.setColor(255, 0, 0);
		love.graphics.circle("fill", self.box.x + self.box.w / 4, self.box.y + 10, 5, 5);
		love.graphics.circle("fill", self.box.x + self.box.w * 3/4, self.box.y + 10, 5, 5);
	end

	if DRAW_MONSTER_PATH and self.state ~= "stunned" then
		if self.path ~= nil then
			love.graphics.setColor(255, 0, 0);
			for index, path in pairs(self.path) do
				love.graphics.rectangle("fill", path.origin.x, path.origin.y, PATH_NODE_SIZE, PATH_NODE_SIZE);
			end
		end
	end

	if DRAW_MONSTER_SENSES and self.state ~= "stunned" then
		love.graphics.setColor(255, 255, 255, 150);
		local facingAngle = math.angle(0, 0, self.facing.y, self.facing.x);
		love.graphics.arc("fill",
			self.box.x + self.box.w / 2, self.box.y + self.box.h / 2,
			MONSTER_BURGLAR_SIGHT_DISTANCE,
			facingAngle - MONSTER_BURGLAR_SIGHT_CONE / 2, facingAngle + MONSTER_BURGLAR_SIGHT_CONE / 2
		);
	end
end