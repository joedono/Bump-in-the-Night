require "house/floor";

House = Class {
	init = function(self)
		self.floors = {};
		self.floors["attic"] = Floor(love.graphics.newImage("asset/image/floor4.png"), love.filesystem.newFile("asset/floorLayout/attic.csv"));
		self.floors["second-floor"] = Floor(love.graphics.newImage("asset/image/floor3.png"), love.filesystem.newFile("asset/floorLayout/second-floor.csv"));
		self.floors["main-floor"] = Floor(love.graphics.newImage("asset/image/floor2.png"), love.filesystem.newFile("asset/floorLayout/main-floor.csv"));
		self.floors["basement"] = Floor(love.graphics.newImage("asset/image/floor1.png"), love.filesystem.newFile("asset/floorLayout/basement.csv"));
		
		self.curFloor = self.floors["main-floor"];
		
		self.floors["main-floor"]:addItem("meat", 150, 120);
	end
};

function House:setFloor(floorName)
	self.curFloor:tearDown();
	self.curFloor = self.floors[floorName];
	self.curFloor:setup();
end

function House:getFloorWidth()
	return self.curFloor.width;
end

function House:getFloorHeight()
	return self.curFloor.height;
end

function House:update(dt)
	self.curFloor:update(dt);
end

function House:draw()
	self.curFloor:draw();
end