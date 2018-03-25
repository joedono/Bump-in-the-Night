--[[
Spawns a group of 2. Hunts by sight and moves randomly.
Kills the player from long range with a ray gun. Ray gun moves slowly, but takes up entire hallway
Will randomly send out psychic waves that disrupt the player's vision and reverses their controls.
Wearing the tin hat prevents this.
Use the music box to fill the gauge and send them back to their dimension.
Using the music box will increase the aliens' movement speed, but they won't know where the player is.

States:
Idle - Hasn't seen player. Randomly walk around investigating things
Walk - Moving randomly around the level
Spotted - Sees the player. Alert for a little bit, then give shoot ray gun
Shooting - Has alerted and can still see the player. Shoot them.
]]

Monster_Alien = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, image, player, curFloor, x, y)
		Monster.init(self, image);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_ALIEN_WIDTH,
			h = MONSTER_ALIEN_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.eyeLights = {
			LightWorld:newLight(0, 0, 255, 0, 0, 15),
			LightWorld:newLight(0, 0, 255, 0, 0, 15)
		};

		self.sightLight = LightWorld:newLight(0, 0, 150, 150, 150, MONSTER_ALIEN_SIGHT_DISTANCE);
		self.sightLight:setDirection(0);
		self.sightLight:setAngle(MONSTER_ALIEN_SIGHT_CONE);

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
		self.reloadTimer = 0;
		self.shootDrawTimer = 0;
		self.monsterType = "alien";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Alien:update(dt)
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
	elseif self.state == "shooting" then
		self:updateShooting(dt);
	elseif self.state == "reloading" then
		self:updateReloading(dt);
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_ALIEN_TURN_SPEED);
	self:updateLights(dt);
	self:updateAnimation(dt);
end

function Monster_Alien:updateIdle(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_ALIEN_SIGHT_CONE, MONSTER_ALIEN_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "walk";
	end
end

function Monster_Alien:updateWalk(dt)
	if self:canSeePlayer(MONSTER_ALIEN_SIGHT_CONE, MONSTER_ALIEN_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.targetPathNode == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_ALIEN_WALK_SPEED);
	end
end

function Monster_Alien:updateSpotted(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_ALIEN_SIGHT_CONE, MONSTER_ALIEN_SIGHT_DISTANCE) then
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		if self:canSeePlayer(MONSTER_ALIEN_SIGHT_CONE, MONSTER_ALIEN_SIGHT_DISTANCE) then
			self.state = "shooting";
		else
			self.state = "idle";
		end
	end
end

function Monster_Alien:updateShooting(dt)
	self.parentManager.rayManager:shootRayGun(
		self.box.x + self.box.w / 2, self.box.y + self.box.h / 2,
		self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2
	);
	self.stateTimer = 3;
	self.state = "reloading";
end

function Monster_Alien:updateReloading(dt)
	if self.stateTimer <= 0 then
		self.state = "idle";
	end
end

function Monster_Alien:hasSpottedPlayer()
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	self.soundEffects.spotted:rewind();
	self.soundEffects.spotted:play();
	self.stateTimer = 0.3;
	self.state = "spotted";
end

function Monster_Alien:followPath(dt, speed)
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
				self.state = "idle";
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
		self.state = "idle";
	end
end

function Monster_Alien:updateLights(dt)
	self:updatePathLights(dt);

	local facing = math.angle(0, 0, self.facing.y, self.facing.x);
	if facing < 0 then
		facing = facing + math.pi * 2;
	end

	self:updateEyeLights(facing, 255);

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
	elseif self.state == "spotted" or self.state == "shooting" or self.state == "reloading" then
		self.sightLight:setColor(150, 0, 0);
	end
end

function Monster_Alien:updateAnimation(dt)
	local curAnimation = self.curFacing;
	curAnimation = "walk-" .. curAnimation;
	self.curAnimation = self.animations[curAnimation];

	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		self.curAnimation:update(dt);
	else
		self.curAnimation:gotoFrame(1);
	end
end

function Monster_Alien:draw()
	if not self.active then
		return;
	end

	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, MONSTER_SCALE, MONSTER_SCALE);

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
			MONSTER_ALIEN_SIGHT_DISTANCE,
			facingAngle - MONSTER_ALIEN_SIGHT_CONE / 2, facingAngle + MONSTER_ALIEN_SIGHT_CONE / 2
		);
	end
end