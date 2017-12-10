WALL_IMAGE = love.graphics.newImage("asset/image/wall.png");
WALL_WIDTH = 16;
WALL_HEIGHT = 16;

Wall = Class {
	init = function(self, x, y)
		self.x = x;
		self.y = y;
		self.w = WALL_WIDTH;
		self.h = WALL_HEIGHT;
		self.bType = "wall";
	end
};

function Wall:draw()
	love.graphics.setColor(0, 0, 0);
	love.graphics.draw(WALL_IMAGE, self.x, self.y);
end