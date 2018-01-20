require "house/fire";

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

function Manager_Fire:setFire(targetX, targetY, curFloor)
	local tileX = targetX - (targetX % TILE_SIZE);
	local tileY = targetY - (targetY % TILE_SIZE);
	table.insert(self.fires, Fire(tileX, tileY, curFloor));
end

function Fire:update(dt)
	if not self.active then
		return;
	end


end

function Fire:draw()
	if not self.active then
		return;
	end
end