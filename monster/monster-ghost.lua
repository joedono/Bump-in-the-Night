--[[
Randomly fades into existence close to the player and chases them for a short time
Will fade out of existence after a set period of time, only to fade back in later
Can move through walls.

OPTIONAL - Will fade faster if the player shines the flashlight on them
OPTIONAL - Will appear with more frequency as the player digs for more corpses
OPTIONAL - Will chase the player without fading away once their body starts to burn

Idle - Not visible and will not interact with anything
Fading In - Slowly fading into existence close to the player
Chasing - Actively chasing the player. Will fade out of existence after a little while
]]

Monster_Ghost = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, image, player, curFloor, x, y)
		Monster.init(self, image);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_GHOST_WIDTH,
			h = MONSTER_GHOST_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

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

		self.light = LightWorld:newLight(0, 0, 0, 0, 0, MONSTER_GHOST_LIGHT_DISTANCE);
		self.light:setVisible(false);

		self.fadeTimer = Timer.new();
		self.fadeTable = { alpha = 0, eyeLight = 0, volume = 1 };

		self.state = "idle";
		self.stateTimer = 60;
		self.monsterType = "ghost";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Ghost:update(dt)
	if not self.active then
		return;
	end

	if self.stateTimer > 0 then
		self.stateTimer = self.stateTimer - dt;
	end

	if self.state == "idle" then
		self:updateIdle(dt);
	elseif self.state == "fading-in" then
		self:updateFadingIn(dt);
	elseif self.state == "chasing" then
		self:updateChasing(dt);
	elseif self.state == "fading-out" then
		self:updateFadingOut(dt);
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_GHOST_TURN_SPEED);
	self:updateLights(dt);
	self:updateAnimation(dt);
end

function Monster_Ghost:updateIdle(dt)
	self:resetVelocity();

	if self.stateTimer <= 0 then
		self:startFadeIn();
	end
end

function Monster_Ghost:updateFadingIn(dt)
	self.fadeTimer:update(dt);
end

function Monster_Ghost:updateChasing(dt)
	if self.stateTimer <= 0 then
		self:startFadeOut();
	end

	self:chasePlayer(dt, MONSTER_GHOST_CHASE_SPEED);
end

function Monster_Ghost:updateFadingOut(dt)
	self.fadeTimer:update(dt);
	self.soundEffects.ghostApproach:setVolume(self.fadeTable.volume);
	self:chasePlayer(dt, MONSTER_GHOST_CHASE_SPEED);
end

function Monster_Ghost:chasePlayer(dt, speed)
	self.velocity = {
		x = self.player.box.x - self.box.x,
		y = self.player.box.y - self.box.y
	};
	self.velocity.x, self.velocity.y = math.normalize(self.velocity.x, self.velocity.y);
	self.speed = speed;

	local actualX, actualY, cols, len = self:updatePosition(dt);

	for i = 1, len do
		local col = cols[i];
		if KILL_PLAYER and self.state == "chasing" and col.other.type == "player" and col.other.active then
			self.soundEffects.ghostKill:seek(0);
			self.soundEffects.playerDeathYell:seek(0);
			self.soundEffects.ghostKill:play();
			self.soundEffects.playerDeathYell:play();

			col.other.active = false;
			self.parentManager.parentStateGame:loseGame();
		end
	end

	self.box.x = actualX;
	self.box.y = actualY;
end

function Monster_Ghost:updatePosition(dt)
	local dx = self.box.x + self.velocity.x * self.speed * dt;
	local dy = self.box.y + self.velocity.y * self.speed * dt;
	return BumpWorld:move(self, dx, dy, ghostCollision);
end

function Monster_Ghost:updateLights(dt)
	self.light:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);

	if self.state == "fading-in" or self.state == "chasing"or self.state == "fading-out" then
		local facing = math.angle(0, 0, self.facing.y, self.facing.x);
		if facing < 0 then
			facing = facing + math.pi * 2;
		end

		self.light:setVisible(true);
		self.light:setColor(self.fadeTable.eyeLight * 5/8, 0, 0);
	else
		self.light:setVisible(false);
	end
end

function Monster_Ghost:updateAnimation(dt)
	local curAnimation = self.curFacing;
	curAnimation = "walk-" .. curAnimation;

	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		self.curAnimation = self.animations[curAnimation];
		self.curAnimation:update(dt);
	else
		self.curAnimation = self.animations[curAnimation];
		self.curAnimation:gotoFrame(1);
	end
end

function Monster_Ghost:startFadeIn()
	self.state = "fading-in";
	self.fadeTable.volume = 1;
	self.soundEffects.ghostApproach:setVolume(1);
	self.soundEffects.ghostApproach:seek(0);
	self.soundEffects.ghostApproach:play();

	local px = self.player.box.x;
	local py = self.player.box.y;

	local spawnPathNode = self.parentManager:randomPathNodeInRange(px, py, MONSTER_GHOST_SPAWN_RANGE);
	self.box.x = spawnPathNode.origin.x;
	self.box.y = spawnPathNode.origin.y;
	BumpWorld:update(self, self.box.x, self.box.y);

	self.fadeTimer:tween(MONSTER_GHOST_FADEIN_TIMER, self.fadeTable, { alpha = 1, eyeLight = 1 }, "linear", function()
		self.stateTimer = MONSTER_GHOST_CHASE_TIMER;
		self.state = "chasing";
	end);
end

function Monster_Ghost:startFadeOut()
	self.state = "fading-out";

	self.fadeTimer:tween(MONSTER_GHOST_FADEOUT_TIMER, self.fadeTable, { alpha = 0, eyeLight = 0, volume = 0 }, "linear",
		function()
			self.soundEffects.ghostApproach:stop();
			self.stateTimer = love.math.random(10, 30);
			self:resetVelocity();
			self.state = "idle";
		end
	);
end

function Monster_Ghost:draw()
	if not self.active or self.state == "idle" then
		return;
	end

	love.graphics.setColor(1, 1, 1, self.fadeTable.alpha);
	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, MONSTER_SCALE, MONSTER_SCALE);
end
