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
	init = function(self, parentManager, soundEffects, image, player, curFloor, x, y)
		Monster.init(self, image);
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

		self.shotgunBlastImage = love.graphics.newImage("asset/image/used-items/shotgun-blast.png");
		self.shotgunBlastImageData = {
			w = self.shotgunBlastImage:getWidth(),
			h = self.shotgunBlastImage:getHeight();
		};

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

	if self.reloadTimer > 0 then
		self.reloadTimer = self.reloadTimer - dt;
	end

	if self.shootDrawTimer > 0 then
		self.shootDrawTimer = self.shootDrawTimer - dt;
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
	elseif self.state == "panicked-spotted" then
		self:updatePanickedSpotted(dt);
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
	self:updateAnimation(dt);
end

function Monster_Killer:updateIdle(dt)
	self:resetVelocity();

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
	self:resetVelocity();

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
			self.soundEffects.humanAttackYell:seek(0);
			self.soundEffects.humanAttackYell:play();
			self.state = "active-chase";
			self.stateTimer = MONSTER_KILLER_CHASE_TIMER;
		end
	end
end

function Monster_Killer:updateShooting(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self:shootPlayer();
	else
		self.soundEffects.humanAttackYell:seek(0);
		self.soundEffects.humanAttackYell:play();
		self.state = "active-chase";
		self.stateTimer = MONSTER_KILLER_CHASE_TIMER;
	end
end

function Monster_Killer:updateActiveChase(dt)
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self:shootPlayer();
		self.stateTimer = MONSTER_KILLER_CHASE_TIMER;
	end

	if self.stateTimer > 0 or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_KILLER_CHASE_SPEED);
end

function Monster_Killer:updatePanicked(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();

		local randomHunt = love.math.random(100);
		if randomHunt < MONSTER_KILLER_HUNT_CHANCE then
			self:hasSpottedPlayer();
			self.state = "panicked-pursue";
		else
			self.state = "panicked-walk";
		end
	end
end

function Monster_Killer:updatePanickedSpotted(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self.visualTarget = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
			self.state = "panicked-shooting";
		else
			self.soundEffects.humanAttackYell:seek(0);
			self.soundEffects.humanAttackYell:play();
			self.state = "panicked-pursue";
			self.stateTimer = MONSTER_KILLER_CHASE_TIMER;
		end
	end
end

function Monster_Killer:updatePanickedWalk(dt)
	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.targetPathNode == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_KILLER_PANIC_WALK_SPEED);
	end
end

function Monster_Killer:updatePanickedPursue(dt)
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self:shootPlayer();
		self.stateTimer = MONSTER_KILLER_CHASE_TIMER;
	end

	if self.stateTimer > 0 or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_KILLER_PANIC_CHASE_SPEED);
end

function Monster_Killer:updatePanickedShooting(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_KILLER_SIGHT_CONE, MONSTER_KILLER_SIGHT_DISTANCE) then
		self:shootPlayer();
	else
		self.soundEffects.humanAttackYell:seek(0);
		self.soundEffects.humanAttackYell:play();
		self.state = "panicked-pursue";
		self.stateTimer = MONSTER_KILLER_CHASE_TIMER;
	end
end

function Monster_Killer:hasSpottedPlayer()
	self.visualTarget = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	if self.panicked then
		self.stateTimer = 0.5;
		self.state = "panicked-spotted";
	else
		self.soundEffects.spotted:seek(0);
		self.soundEffects.spotted:play();
		self.stateTimer = 1;
		self.state = "spotted";
	end
end

function Monster_Killer:shootPlayer()
	if self.reloadTimer <= 0 then
		self.soundEffects.gunshot:seek(0);
		self.soundEffects.gunshot:play();

		local originX = self.box.x + self.box.w / 2;
		local originY = self.box.y + self.box.h / 2;
		local dirX = self.player.box.x - self.box.x;
		local dirY = self.player.box.y - self.box.y;
		local dirVector = Vector(dirX, dirY);
		dirVector:normalizeInplace();

		offsetVector = dirVector * (PLAYER_WIDTH / 2 - 7);
		local insideVector = Vector(originX, originY) + offsetVector;
		local outsideVector = insideVector + (dirVector * SHOTGUN_RANGE) + offsetVector;

		-- Get outside points of the shotgun bounded box
		local x1 = math.min(insideVector.x, outsideVector.x);
		local y1 = math.min(insideVector.y, outsideVector.y);
		local x2 = math.max(insideVector.x, outsideVector.x);
		local y2 = math.max(insideVector.y, outsideVector.y);

		local w = x2 - x1;
		local h = y2 - y1;

		-- Box is too small. Stretch it to the min size
		if w < SHOTGUN_MIN_SIZE then
			local diffX = SHOTGUN_MIN_SIZE - w;
			w = SHOTGUN_MIN_SIZE;
			x1 = x1 - diffX / 2;
		end

		if h < SHOTGUN_MIN_SIZE then
			local diffY = SHOTGUN_MIN_SIZE - h;
			h = SHOTGUN_MIN_SIZE;
			y1 = y1 - diffY / 2;
		end

		local rotation = math.angle(0, 0, dirY, dirX);
		if rotation < 0 then
			rotation = rotation + math.pi * 2;
		end

		self.reloadTimer = MONSTER_KILLER_RELOAD_TIMER;
		self.shootDrawTimer = 0.3;
		self.shootBox = {
			x = x1 - originX,
			y = y1 - originY,
			w = w,
			h = h,
			r = rotation
		};

		if KILL_PLAYER then
			local hitChance = love.math.random(100);
			print(hitChance);
			if hitChance < MONSTER_KILLER_CALM_HIT_CHANCE or (self.panicked and hitChance < MONSTER_KILLER_PANICKED_HIT_CHANCE) then
				self.player.active = false;
				self.parentManager.parentStateGame:loseGame();
			end
		end
	end
end

function Monster_Killer:panic()
	self.panicked = true;
	self.state = "panicked";
	self.soundEffects.humanAttackYell:seek(0);
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

				if self.panicked then
					self.stateTimer = 1;
					self.state = "panicked";
				else
					self.stateTimer = love.math.random(2, 5);
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
		if self.panicked then
			self.stateTimer = 1;
			self.state = "panicked";
		else
			self.stateTimer = love.math.random(2, 5);
			self.state = "idle";
		end
	end
end

function Monster_Killer:updateLights(dt)
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
	elseif self.state == "spotted" or self.state == "active-chase" or self.panicked then
		self.sightLight:setColor(150, 0, 0);
	end
end

function Monster_Killer:updateAnimation(dt)
	local curAnimation = self.curFacing;

	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		if self.state == "active-chase" or self.state == "panicked-walk" or self.state == "panicked-pursue" then
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

function Monster_Killer:draw()
	if not self.active then
		return;
	end

	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, MONSTER_SCALE, MONSTER_SCALE);

	if self.shootDrawTimer > 0 then
		love.graphics.setColor(255, 255, 255);
		love.graphics.draw(
			self.shotgunBlastImage,
			self.shootBox.x + self.shootBox.w / 2 + self.box.x + self.box.w / 2,
			self.shootBox.y + self.shootBox.h / 2 + self.box.y + self.box.h / 2,
			self.shootBox.r,
			1,
			1,
			self.shotgunBlastImageData.w / 2,
			self.shotgunBlastImageData.h / 2
		);
	end

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