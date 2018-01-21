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
		self.ambientLight = LightWorld:newLight(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, 255, 125, 50, 50);

		self.type = "fire";
		self.active = true;

		local items, len = BumpWorld:queryRect(self.box.x, self.box.y, self.box.w, self.box.h, fireProofFilter);

		if len > 0 then
			self.active = false;
		end
	end
};