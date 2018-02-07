Player = Class {
	init = function (self, parentStateGame, spawnPoint, spawnOffset, soundEffects)
		self.parentStateGame = parentStateGame;

		self.box = {
			x = spawnPoint.x + spawnOffset.x,
			y = spawnPoint.y + spawnOffset.y,
			w = PLAYER_WIDTH,
			h = PLAYER_HEIGHT
		};

		self.velocity = { x = 0, y = 0 };
		self.gamepadVelocity = { x = 0, y = 0 };
		self.facing = {
			x = spawnPoint.properties.dirX,
			y = spawnPoint.properties.dirY,
		};

		self.flashlightFacing = {
			x = self.facing.x,
			y = self.facing.y
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.image = love.graphics.newImage("asset/image/player.png");
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
			["run-right"] = Anim8.newAnimation(grid("7-8", 1), runDuration),
			["death"] = Anim8.newAnimation(grid(1, 2), 1),
			["use-item-right"] = Anim8.newAnimation(grid(2, 2), 1),
			["use-item-up"] = Anim8.newAnimation(grid(3, 2), 1),
			["use-item-left"] = Anim8.newAnimation(grid(4, 2), 1),
			["use-item-down"] = Anim8.newAnimation(grid(5, 2), 1)
		};
		self.curAnimation = self.animations["walk-left"];
		self.useItemAnimationTimer = 0;

		self.flashLight = LightWorld:newLight(0, 0, 255, 255, 255, 400);
		self.flashLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
		self.flashLight:setAngle(math.pi * 1/3);
		self.flashLight:setDirection(math.angle(0, 0, self.flashlightFacing.y, self.flashlightFacing.x));
		self.flashLightVisible = true;

		self.ambientLight = LightWorld:newLight(0, 0, 50, 50, 50, 200);
		self.ambientLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);

		self.soundEffects = soundEffects;

		self:resetKeys();

		self.active = true;
		self.type = "player";
	end
}

function Player:resetKeys()
	self.leftPressed = false;
	self.rightPressed = false;
	self.upPressed = false;
	self.downPressed = false;

	self.leftLightPressed = false;
	self.rightLightPressed = false;
	self.upLightPressed = false;
	self.downLightPressed = false;

	self.runPressed = false;
	self.gamepadVelocity = { x = 0, y = 0 };
end

function Player:toggleFlashlight()
	self.flashLightVisible = not self.flashLightVisible;
	self.flashLight:setVisible(self.flashLightVisible);
end

function Player:update(dt)
	if not self.active then
		self.curAnimation = self.animations["death"];
		return;
	end

	self:updateVelocity();
	self:updateRotation();
	self:updatePosition(dt);
	self:updateLights(dt);
	self:updateAnimation(dt);
end

function Player:useItem()
	self.useItemAnimationTimer = 0.1;
end

function Player:updateVelocity()
	local vx = 0;
	local vy = 0;

	if self.leftPressed or self.rightPressed or self.upPressed or self.downPressed then
		if self.leftPressed then
			vx = vx - 1;
		end

		if self.rightPressed then
			vx = vx + 1;
		end

		if self.upPressed then
			vy = vy - 1;
		end

		if self.downPressed then
			vy = vy + 1;
		end
	else
		vx = self.gamepadVelocity.x;
		vy = self.gamepadVelocity.y;

		if math.dist(0, 0, vx, vy) < GAMEPAD_DEADZONE then
			vx = 0;
			vy = 0;
		end
	end

	if vx ~= 0 or vy ~= 0 then
		vx, vy = math.normalize(vx, vy);

		if self.runPressed then
			self.soundEffects.footstepsRun:play();
			self.soundEffects.footstepsWalk:stop();
		else
			self.soundEffects.footstepsRun:stop();
			self.soundEffects.footstepsWalk:play();
		end
	else
		self.soundEffects.footstepsRun:stop();
		self.soundEffects.footstepsWalk:stop();
	end

	if self.runPressed then
		self.velocity.x = vx * PLAYER_RUN_SPEED;
		self.velocity.y = vy * PLAYER_RUN_SPEED;
	else
		self.velocity.x = vx * PLAYER_WALK_SPEED;
		self.velocity.y = vy * PLAYER_WALK_SPEED;
	end
end

function Player:updateRotation()
	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		local fx, fy = math.normalize(self.velocity.x, self.velocity.y);
		self.facing.x = fx;
		self.facing.y = fy;
	end
end

function Player:updatePosition(dt)
	local warped = false;
	local dx = self.box.x + self.velocity.x * dt;
	local dy = self.box.y + self.velocity.y * dt;

	local actualX, actualY, cols, len = BumpWorld:move(self, dx, dy, playerCollision);

	for i = 1, len do
		local col = cols[i];
		if col.other.type == "door" then
			if not col.other.isOpen then
				col.other:open(self);
			end
		end

		if col.other.type == "portal" then
			self:moveThroughPortal(col.other);
			warped = true;
		end

		if col.other.type == "item" then
			self.parentStateGame:pickupItem(col.other);
		end

		if col.other.type == "fire" and KILL_PLAYER then
			self.active = false;
			self.soundEffects.monsterBite:rewind();
			self.soundEffects.playerDeathYell:rewind();
			self.soundEffects.monsterBite:play();
			self.soundEffects.playerDeathYell:play();

			self.parentStateGame:loseGame();
		end
	end

	if not warped then
		self.box.x = actualX;
		self.box.y = actualY;
	end
end

function Player:updateLights(dt)
	if self.leftLightPressed or self.rightLightPressed or self.upLightPressed or self.downLightPressed then
		local lx = 0;
		local ly = 0;

		if self.leftLightPressed then
			lx = lx - 1;
		end

		if self.rightLightPressed then
			lx = lx + 1;
		end

		if self.upLightPressed then
			ly = ly - 1;
		end

		if self.downLightPressed then
			ly = ly + 1;
		end

		self.flashlightFacing.x = lx;
		self.flashlightFacing.y = ly;
	end

	if (self.flashlightFacing.x ~= 0 or self.flashlightFacing.y ~= 0) and math.dist(0, 0, self.flashlightFacing.x, self.flashlightFacing.y) > GAMEPAD_DEADZONE then
		local curFacing = self.flashLight.direction;
		local goalFacing = math.angle(0, 0, self.flashlightFacing.y, self.flashlightFacing.x);
		local nextFacing = gradualTurn(curFacing, goalFacing, PLAYER_TURN_SPEED, dt);

		self.flashLight:setDirection(nextFacing);
	end

	self.flashLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
	self.ambientLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
end

function Player:updateAnimation(dt)
	local curAnimation = "left";
	local facing = math.angle(0, 0, self.facing.y, self.facing.x);
	if facing < 0 then
		facing = facing + math.pi * 2;
	end

	if facing >= math.pi * 7/4 or facing <= math.pi * 1/4 then
		curAnimation = "right";
	elseif facing >= math.pi * 1/4 and facing <= math.pi * 3/4 then
		curAnimation = "down";
	elseif facing >= math.pi * 3/4 and facing <= math.pi * 5/4 then
		curAnimation = "left";
	elseif facing >= math.pi * 5/4 and facing <= math.pi * 7/4 then
		curAnimation = "up";
	end

	if self.useItemAnimationTimer > 0 then
		self.useItemAnimationTimer = self.useItemAnimationTimer - dt;
		curAnimation = "use-item-" .. curAnimation;
		self.curAnimation = self.animations[curAnimation];
	elseif self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		if self.runPressed then
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

function Player:moveThroughPortal(portal)
	local dx = portal.properties.dx;
	local dy = portal.properties.dy;
	local room = self.parentStateGame.floors[portal.properties.room]

	dx = dx + room.origin.x;
	dy = dy + room.origin.y;

	self.box.x = dx;
	self.box.y = dy;
	BumpWorld:update(self, dx, dy);
end

function Player:draw()
	love.graphics.setColor(255, 255, 255);
	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, PLAYER_SCALE, PLAYER_SCALE);
end