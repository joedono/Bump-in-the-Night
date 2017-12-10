require "house/wall";
require "house/portal";
require "house/door";
require "house/item";

Floor = Class {
	init = function(self, floorImage, floorLayout)
		self.isSetup = false;
		self.walls = {};
		self.portals = {};
		self.doors = {};
		self.items = {}
		self.floorImage = floorImage;
		self.width = 0;
		self.height = 0;
	
		floorLayout:open('r');
		fileContents = floorLayout:read();
		local lineData = string.explode(fileContents:sub(0, string.len(fileContents) - 2), "\r\n");
		local levelH = #lineData;
		
		for y, line in ipairs(lineData) do
			local data = string.explode(line, ",");
			local levelW = #data;
			for x, value in ipairs(data) do
				local sx = (x - 1) * WALL_WIDTH;
				local sy = (y - 1) * WALL_HEIGHT;
				
				-- Solid Wall (W)
				if(string.find(value, "W") ~= nil) then
					local newWall = Wall(sx, sy);
					table.insert(self.walls, newWall);
					
					if(self.width < newWall.x + newWall.w) then
						self.width = newWall.x + newWall.w;
					end
					
					if(self.height < newWall.y + newWall.h) then
						self.height = newWall.y + newWall.h;
					end
				end
				
				-- Portals P<DEST-FLOOR_xDEST-X_yDEST-Y_fDEST-FACING>
				local portalStart, portalEnd = string.find(value, "P%b<>");
				if(portalStart ~= nil) then
					local portalConfig = string.sub(value, portalStart, portalEnd);
					portalConfig = string.sub(portalConfig, 3, string.len(portalConfig) - 1);
					portalConfig = string.explode(portalConfig, "_");
					table.insert(self.portals,
						Portal(
							sx,
							sy,
							portalConfig[1],
							string.sub(portalConfig[2], 2),
							string.sub(portalConfig[3], 2),
							string.sub(portalConfig[4], 2)
						)
					);
				end
				
				-- Doors D<VERTICAL-OR-HORIZONTAL>
				local doorStart, doorEnd = string.find(value, "D%b<>");
				if(doorStart ~= nil) then
					local doorConfig = string.sub(value, doorStart, doorEnd);
					doorConfig = string.sub(doorConfig, 3, string.len(doorConfig) - 1);
					table.insert(self.doors,
						Door(
							sx,
							sy,
							doorConfig
						)
					);
				end
			end
		end
	end
};

function Floor:addItem(itemType, x, y)
	table.insert(self.items, Item(x, y, itemType));
end

function Floor:tearDown()
	if(self.isSetup) then
		Light_World:clearBodies();
		
		for index, wall in ipairs(self.walls) do
			Bump_World:remove(wall);
		end
		
		for index, portal in ipairs(self.portals) do
			Bump_World:remove(portal);
		end
		
		for index, door in ipairs(self.doors) do
			Bump_World:remove(door);
		end
		
		for index, item in ipairs(self.items) do
			if(item.alive) then
				Bump_World:remove(item);
				Light_World:remove(item.light);
			end
		end
	end
	
	self.isSetup = false;
end

function Floor:setup()
	if(not self.isSetup) then
		for index, wall in ipairs(self.walls) do
			Bump_World:add(wall, wall.x, wall.y, wall.w, wall.h);
			Light_World:newRectangle(wall.x + wall.w / 2, wall.y + wall.h / 2, wall.w, wall.h);
		end
		
		for index, portal in ipairs(self.portals) do
			Bump_World:add(portal, portal.x, portal.y, portal.w, portal.h);
		end
		
		for index, door in ipairs(self.doors) do
			Bump_World:add(door, door.x, door.y, door.w, door.h);
			door:addLightBody();
		end
		
		for index, item in ipairs(self.items) do
			if(item.alive) then
				Bump_World:add(item, item.x, item.y, item.w, item.h);
				item:addLight();
			end
		end
	end
	
	self.isSetup = true;
end

function Floor:update(dt)
	for index, door in ipairs(self.doors) do
		door:update(dt);
	end
	
	for index, item in ipairs(self.items) do
		item:update(dt);
	end
end

function Floor:draw()
	local flrImageW, flrImageH = self.floorImage:getWidth(), self.floorImage:getHeight();
	
	love.graphics.setColor(255, 255, 255);
	for x = 0, self.width, flrImageW  do
		for y = 0, self.height, flrImageH do
			love.graphics.draw(self.floorImage, x, y);
		end
	end
	
	for index, door in ipairs(self.doors) do
		door:draw();
	end
	
	for index, wall in ipairs(self.walls) do
		wall:draw();
	end
	
	for index, item in ipairs(self.items) do
		item:drawWorld();
	end
	
	if(DEBUG_DRAW_PORTALS) then
		for index, portal in ipairs(self.portals) do
			portal:draw();
		end
	end
end