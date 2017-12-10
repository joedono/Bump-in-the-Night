Portal = Class {
	init = function(self, x, y, dest, destX, destY, destFacing)
		self.x = x;
		self.y = y;
		self.w = PORTAL_WIDTH;
		self.h = PORTAL_HEIGHT;
		self.dest = {
			name = dest,
			x = tonumber(destX),
			y = tonumber(destY),
			facing = -1
		};

		if(destFacing == "right") then
			self.dest.facing = 0;
		elseif(destFacing == "down") then
			self.dest.facing = math.pi / 2;
		elseif(destFacing == "left") then
			self.dest.facing = math.pi;
		elseif(destFacing == "up") then
			self.dest.facing = math.pi * 3/2;
		end

		self.bType = "portal";
	end
};

function Portal:draw()
	love.graphics.setColor(0, 255, 0);
	love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);
end