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
		self.animations = {
			["walk-left"] = Anim8.newAnimation(grid("1-2", 1), walkDuration),
			["walk-down"] = Anim8.newAnimation(grid("3-4", 1), walkDuration),
			["walk-up"] = Anim8.newAnimation(grid("5-6", 1), walkDuration),
			["walk-right"] = Anim8.newAnimation(grid("7-8", 1), walkDuration),
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
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, MONSTER_SCALE, MONSTER_SCALE);


	
end