--[[
Hunts by detecting light and movement in proximity, or by detecting reading from the book.
Can move through walls.
Moves around to random notes.
Can only kill player if the player has the flashlight turned on, or if the player has moved in close proximity.
Not entirely visible all the time. Light will pulse slowly, illuminating the ghost when he's on screen

Idle - Hasn't seen or heard player. Stand still for a bit, then randomly move to moving or chasing
Moving - Moving to a random spot in the house
Chasing - Has seen the player flashlight or movement, or heard them reading. Move to player location.
Patrolling - Lost sight of player. Move around randomly for a bit, then move away.
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

		self.light = LightWorld:newLight(0, 0, 150, 150, 150, MONSTER_GHOST_LIGHT_DISTANCE);
		self.lightColor = { color = 0 };
		self.lightRepeatTimer = Timer.new();
		self.lightScriptTimer = Timer.new();
		self.lightTweenTimer = Timer.new();

		self.lightRepeatTimer:every(MONSTER_GHOST_LIGHT_RATE * 2, function()
			self:resetLightTimers();
		end);
		self:resetLightTimers();

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

		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "ghost";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Ghost:resetLightTimers()
	self.lightScriptTimer:clear();
	self.lightTweenTimer:clear();

	self.lightScriptTimer:script(function(wait)
		self.lightTweenTimer:tween(MONSTER_GHOST_LIGHT_RATE, self.lightColor, { color = 0 }, "out-quad");
		wait(MONSTER_GHOST_LIGHT_RATE);
		self.lightTweenTimer:tween(MONSTER_GHOST_LIGHT_RATE, self.lightColor, { color = 175 }, "in-quad");
		wait(MONSTER_GHOST_LIGHT_RATE);
	end);
end

function Monster_Ghost:update(dt)
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
	elseif self.state == "active-chase" then
		self:updateActiveChase(dt);
	elseif self.state == "patrolling" then
		self:updatePatrolling(dt);
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_GHOST_TURN_SPEED);
	self:updateLights(dt);
	self:updateAnimation(dt);
end

function Monster_Ghost:updateIdle(dt)
	-- TODO
end

function Monster_Ghost:updateWalk(dt)
	-- TODO
end

function Monster_Ghost:updateActiveChase(dt)
	-- TODO
end

function Monster_Ghost:updatePatrolling(dt)
	-- TODO
end

function Monster_Ghost:updateLights(dt)
	self.light:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);

	self.lightRepeatTimer:update(dt);
	self.lightScriptTimer:update(dt);
	self.lightTweenTimer:update(dt);

	self.light:setColor(self.lightColor.color, self.lightColor.color, self.lightColor.color);
end

function Monster_Ghost:updateAnimation(dt)
	local curAnimation = self.curFacing;

	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		if self.state == "active-chase" then
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

function Monster_Ghost:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, MONSTER_SCALE, MONSTER_SCALE);

	if DRAW_MONSTER_SENSES then
		love.graphics.setColor(255, 255, 255, 150);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_GHOST_LIGHT_SENSE_DISTANCE);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_GHOST_MOVEMENT_SENSE_DISTANCE);
	end
end