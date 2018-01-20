Manager_Fire = Class {
	init = function(self, parentStateGame, limits)
		self.parentStateGame = parentStateGame;
		self.limits = limits;
		self.fires = {};
	end
};

function Manager_Fire:setFire(targetX, targetY, curFloor)
	local tileX = targetX - (targetX % TILE_SIZE);
	local tileY = targetY - (targetY % TILE_SIZE);
	local limit = self.limits[curFloor];
end

function Manager_Fire:update(dt)
end

function Manager_Fire:draw()
end