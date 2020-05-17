--[[
Moves randomly. Sets fire to the ground and runs away from the player upon seeing them.
Randomly sets fire to random squares in the house that spread and block passage.
Touching the fire kills the player.
The player can pick up a bucket and use it to put out several blocks of fire.
Bucket refills gradually if the player stands still.
Immediately knows where the player is upon using the cell phone and will continuously pursue them.
Use the taser to last until the cops arrive

States:
Idle - Hasn't seen player and player hasn't called police. Randomly walk around investigating things
Walk - Moving randomly around the level
Spotted - Sees the player. Alert for a little bit, then run away
Fleeing - Is running away from the player.
Panicked - Player has called the police. Continuously pursue the player directly.
Stunned - Stunned by the player
]]

Monster_Arsonist = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, image, player, curFloor, x, y)
		Monster.init(self, image);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_ARSONIST_WIDTH,
			h = MONSTER_ARSONIST_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.eyeLights = {
			LightWorld:newLight(0, 0, 255, 0, 0, 15),
			LightWorld:newLight(0, 0, 255, 0, 0, 15)
		};

		self.sightLight = LightWorld:newLight(0, 0, 150, 150, 150, MONSTER_ARSONIST_SIGHT_DISTANCE);
		self.sightLight:setDirection(0);
		self.sightLight:setAngle(MONSTER_ARSONIST_SIGHT_CONE);

		self.fireTimer = Timer.new();
		self.fireTimer:every(MONSTER_ARSONIST_CALM_FIRE_SETTING, function()
			self:setFire();
		end);

		local grid = Anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight());
		local walkDuration = 0.2;
		local runDuration = 0.1;
		self.animations = {
			["walk-left"] = Anim8.newAnimation(grid("1-2", 1), walkDuration),
			["run-left"] =  Anim8.newAnimation(grid("1-2", 1), runDuration),
			["walk-down"] = Anim8.newAnimation(grid("3-4", 1), walkDuration),
			["run-down"] = Anim8.newAnimation(grid("3-4", 1), runDuration),
			["walk-up"] = Anim8.newAnimation(grid("5-6", 1), walkDuration),
			["run-up"] = Anim8.newAnimation(grid("5-6", 1), runDuration),
			["walk-right"] = Anim8.newAnimation(grid("7-8", 1), walkDuration),
			["run-right"] = Anim8.newAnimation(grid("7-8", 1), runDuration)
		};
		self.curAnimation = self.animations["walk-left"];

		self.panicked = false;
		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "arsonist";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Arsonist:update(dt)
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
	elseif self.state == "fleeing" then
		self:updateFleeing(dt);
	elseif self.state == "panicked" then
		self:updatePanicked(dt);
	elseif self.state == "stunned" then
		self:updateStunned(dt);
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_ARSONIST_TURN_SPEED);
	self:updateLights(dt);
	self:updateAnimation(dt);
end

function Monster_Arsonist:updateIdle(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_ARSONIST_SIGHT_CONE, MONSTER_ARSONIST_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self:randomlySetFire();
		self.state = "walk";
	end
end

function Monster_Arsonist:updateWalk(dt)
	self.fireTimer:update(dt);

	if self:canSeePlayer(MONSTER_ARSONIST_SIGHT_CONE, MONSTER_ARSONIST_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.targetPathNode == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;

		if #self.path > MONSTER_ARSONIST_MAX_PATH then
			local newPath = {};
			for index, pathNode in pairs(self.path) do
				if index <= MONSTER_ARSONIST_MAX_PATH then
					table.insert(newPath, pathNode);
				end
			end

			self.path = newPath;
		end

		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_ARSONIST_WALK_SPEED);
	end
end

function Monster_Arsonist:updateSpotted(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_ARSONIST_SIGHT_CONE, MONSTER_ARSONIST_SIGHT_DISTANCE) then
		self.avoidTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self:setFire();
		self.soundEffects.humanAttackYell:seek(0);
		self.soundEffects.humanAttackYell:play();
		self.state = "fleeing";
	end
end

function Monster_Arsonist:updateFleeing(dt)
	if self.path == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_ARSONIST_FLEE_SPEED);
end

function Monster_Arsonist:updatePanicked(dt)
	self.fireTimer:update(dt);

	if self.targetPathNode == nil then
		self:hasSpottedPlayer();
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_ARSONIST_PANIC_CHASE_SPEED);
	end
end

function Monster_Arsonist:updateStunned(dt)
	self:resetVelocity();

	if self.stateTimer <= 0 then
		self:resetPath();
		if self.panicked then
			self.soundEffects.humanAttackYell:seek(0);
			self.soundEffects.humanAttackYell:play();
			self.state = "panicked";
		else
			self.state = "idle";
		end
	end
end

function Monster_Arsonist:hasSpottedPlayer()
	if self.panicked then
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
		self.state = "panicked";
	else
		self.soundEffects.spotted:seek(0);
		self.soundEffects.spotted:play();
		self.state = "spotted";
	end

	self.stateTimer = 1;
end

function Monster_Arsonist:panic()
	self.panicked = true;
	self.state = "panicked";

	self.fireTimer:clear();
	self.fireTimer:every(MONSTER_ARSONIST_PANIC_FIRE_SETTING, function()
		self:setFire();
	end);

	self.soundEffects.humanAttackYell:seek(0);
	self.soundEffects.humanAttackYell:play();
end

function Monster_Arsonist:followPath(dt, speed)
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
		if KILL_PLAYER and col.other.type == "player" and col.other.active and self.state ~= "stunned" and self.panicked then
			col.other.active = false;

			self.soundEffects.knifeStab:seek(0);
			self.soundEffects.playerDeathYell:seek(0);
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

function Monster_Arsonist:updateLights(dt)
	self:updatePathLights(dt);

	if self.state == "stunned" then
		self.eyeLights[1]:setVisible(false);
		self.eyeLights[2]:setVisible(false);
		self.sightLight:setVisible(false);
	else
		local facing = math.angle(0, 0, self.facing.y, self.facing.x);
		if facing < 0 then
			facing = facing + math.pi * 2;
		end

		self:updateEyeLights(facing, 255);
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
		elseif self.state == "spotted" or self.state == "fleeing" or self.state == "panicked" then
			self.sightLight:setColor(150, 0, 0);
		end
	end
end

function Monster_Arsonist:updateAnimation(dt)
	local curAnimation = self.curFacing;

	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		if self.state == "fleeing" or self.state == "panicked" then
			curAnimation = "run-" .. curAnimation;
		else
			curAnimation = "walk-" .. curAnimation;
		end

		self.curAnimation = self.animations[curAnimation];
		self.curAnimation:update(dt);
	else
		curAnimation = "walk-" .. curAnimation;
		self.curAnimation = self.animations[curAnimation];
		self.curAnimation:gotoFrame(1);
	end
end

function Monster_Arsonist:randomlySetFire()
	if love.math.random(100) < MONSTER_ARSONIST_FIRE_CHANCE then
		self:setFire();
	end
end

function Monster_Arsonist:setFire()
	self.parentManager:setFire(
		self.box.x + self.box.w / 2,
		self.box.y + self.box.h / 2,
		self.curFloor
	);
end

function Monster_Arsonist:draw()
	if not self.active then
		return;
	end

	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, MONSTER_SCALE, MONSTER_SCALE);

	if DRAW_MONSTER_PATH and self.state ~= "stunned" then
		if self.path ~= nil then
			love.graphics.setColor(1, 0, 0);
			for index, path in pairs(self.path) do
				love.graphics.rectangle("fill", path.origin.x, path.origin.y, PATH_NODE_SIZE, PATH_NODE_SIZE);
			end
		end
	end

	if DRAW_MONSTER_SENSES and self.state ~= "stunned" then
		love.graphics.setColor(1, 1, 1, 0.5);
		local facingAngle = math.angle(0, 0, self.facing.y, self.facing.x);
		love.graphics.arc("fill",
			self.box.x + self.box.w / 2, self.box.y + self.box.h / 2,
			MONSTER_ARSONIST_SIGHT_DISTANCE,
			facingAngle - MONSTER_ARSONIST_SIGHT_CONE / 2, facingAngle + MONSTER_ARSONIST_SIGHT_CONE / 2
		);
	end
end
