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

		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "ghost";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Ghost:update(dt)
end

function Monster_Ghost:draw()
end