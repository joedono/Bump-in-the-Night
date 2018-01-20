Fire = Class {
	init = function(self, parentManager, x, y, floorIndex)
    self.parentManager = parentManager;
    self.box = {
      x = x,
      y = y,
      w = TILE_SIZE,
      h = TILE_SIZE
    };

    self.floorIndex = floorIndex;

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.type = "fire";
		self.active = true;
	end
};