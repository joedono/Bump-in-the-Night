--[[
Hunts by sight. Moves randomly. Can shoot the player from long range with his gun.
After the police are called, becomes panicked.
When panicked, moves randomly at increased speed. Will randomly home in on the player location using "killer instinct", similar to the Panther "catching the scent".
When panicked, shoots the player on sight.

States:
Idle - Hasn't seen player and player hasn't called police. Randomly walk around investigating things
Walk - Moving randomly around the level
Spotted - Sees the player. Alert for a little bit, then either shoot player or give chase
Shooting - Has alerted and can still see the player. Shoot them.
Active Chase - Keep the player's location for a set time and continuously pursue them. Shoot them if they can be seen.
Panicked Walk - Player has called the police. Move randomly around the level. Randomly switch to Panicked Pursue
Panicked Pursue - Player has called the police. Home in on the player's last location
Panicked Shooting - Player has called the police and can be seen. Shoot with reduced accuracy
]]

Monster_Killer = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, player, curFloor, x, y)
		Monster.init(self);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_KILLER_WIDTH,
			h = MONSTER_KILLER_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.eyeLights = {
			LightWorld:newLight(0, 0, 255, 0, 0, 15),
			LightWorld:newLight(0, 0, 255, 0, 0, 15)
		};

		self.sightLight = LightWorld:newLight(0, 0, 150, 150, 150, MONSTER_KILLER_SIGHT_DISTANCE);
		self.sightLight:setDirection(0);
		self.sightLight:setAngle(MONSTER_KILLER_SIGHT_CONE);

		self.armored = true;
		self.panicked = false;
		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "killer";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Killer:update(dt)
	if not self.active then
		return;
	end

	if self:hasCalledPolice() and not self.panicked then
		self:panic();
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
	elseif self.state == "shooting" then
		self:updateShooting(dt);
	elseif self.state == "active-chase" then
		self:updateActiveChase(dt);
	elseif self.state == "panicked" then
		self:updatePanicked(dt);
	elseif self.state == "panicked-walk" then
		self:updatePanickedWalk(dt);
	elseif self.state == "panicked-pursue" then
		self:updatePanickedPursue(dt);
	elseif self.state == "panicked-shooting" then
		self:updatePanickedShooting(dt);
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_KILLER_TURN_SPEED);
	self:updateLights(dt);
end

function Monster_Killer:updateIdle(dt)
	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "walk";
	end
end

function Monster_Killer:updateWalk(dt)
	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
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
		self:followPath(dt, MONSTER_KILLER_WALK_SPEED);
	end
end

function Monster_Killer:updateSpotted(dt)
	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
			self.state = "shooting";
		else
			self.soundEffects.humanAttackYell:rewind();
			self.soundEffects.humanAttackYell:play();
			self.state = "active-chase";
			self.stateTimer = MONSTER_KILLER_CHASE_TIMER;
		end
	end
end

function Monster_Killer:updateShooting(dt)
end

function Monster_Killer:updateActiveChase(dt)
	local seeTarget = false;
	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) or self.path == nil then
		self:shootPlayer();
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

	self:followPath(dt, MONSTER_KILLER_CHASE_SPEED);
end

function Monster_Killer:updatePanicked(dt)
end

function Monster_Killer:updatePanickedWalk(dt)
end

function Monster_Killer:updatePanickedPursue(dt)
end

function Monster_Killer:updatePanickedShooting(dt)
end

function Monster_Killer:hasSpottedPlayer()
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	if self.panicked then
		self.state = "panicked";
	else
		self.soundEffects.spotted:rewind();
		self.soundEffects.spotted:play();
		self.state = "spotted";
	end

	self.stateTimer = 1;
end

function Monster_Killer:shootPlayer()
	-- TODO
end

function Monster_Killer:panic()
	self.panicked = true;
	self.state = "panicked";
	self.soundEffects.humanAttackYell:rewind();
	self.soundEffects.humanAttackYell:play();
end

function Monster_Killer:followPath(dt, speed)
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
		if KILL_PLAYER and col.other.type == "player" and col.other.active then
			col.other.active = false;

			self.soundEffects.knifeStab:rewind();
			self.soundEffects.playerDeathYell:rewind();
			self.soundEffects.knifeStab:play();
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

			if self.targetPathNode.multifloor then
				self.targetPathNode.light:setVisible(false);
			end

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
				self.stateTimer = love.math.random(2, 5);

				if self.panicked then
					self.state = "panicked";
				else
					self.state = "idle";
				end
			end
		end
	end

	if not warped then
		self.box.x = actualX;
    self.box.y = actualY;
	end

	if self.targetPathNode ~= nil and self.targetPathNode.isGoal and math.dist(self.box.x, self.box.y, self.targetPathNode.origin.x, self.targetPathNode.origin.y) < 32 then
		self:resetPath();
		self.stateTimer = love.math.random(2, 5);

		if self.panicked then
			self.state = "panicked";
		else
			self.state = "idle";
		end
	end
end

function Monster_Killer:updateLights(dt)
	self:updatePathLights(dt);

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
		self.sightLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);

		if self.state == "idle" or self.state == "walk" then
			self.sightLight:setColor(150, 150, 150);
		elseif self.state == "spotted" or self.state == "active-chase" or self.panicked then
			self.sightLight:setColor(150, 0, 0);
		end
	end
end

function Monster_Killer:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(0, 255, 0);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.h, self.box.w);

	-- Draw eyes
	love.graphics.setColor(255, 0, 0);
	love.graphics.circle("fill", self.box.x + self.box.w / 4, self.box.y + 10, 5, 5);
	love.graphics.circle("fill", self.box.x + self.box.w * 3/4, self.box.y + 10, 5, 5);

	if DRAW_MONSTER_PATH then
		if self.path ~= nil then
			love.graphics.setColor(255, 0, 0);
			for index, path in pairs(self.path) do
				love.graphics.rectangle("fill", path.origin.x, path.origin.y, PATH_NODE_SIZE, PATH_NODE_SIZE);
			end
		end
	end

	if DRAW_MONSTER_SENSES then
		love.graphics.setColor(255, 255, 255, 150);
		local facingAngle = math.angle(0, 0, self.facing.y, self.facing.x);
		love.graphics.arc("fill",
			self.box.x + self.box.w / 2, self.box.y + self.box.h / 2,
			MONSTER_KILLER_SIGHT_DISTANCE,
			facingAngle - MONSTER_KILLER_SIGHT_CONE / 2, facingAngle + MONSTER_KILLER_SIGHT_CONE / 2
		);
	end
end