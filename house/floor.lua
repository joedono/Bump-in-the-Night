require "house/door";
require "house/grave";

Floor = Class {
	init = function (self, parentStateGame, layoutFile, index, originX, originY, scenarioId, soundEffects, imageStore)
		self.parentStateGame = parentStateGame;
		self.origin = {
			x = originX,
			y = originY
		};

		self.source = love.filesystem.load(layoutFile)();
		self.soundEffects = soundEffects;
		self.imageStore = imageStore;
		self.defaultFont = love.graphics.newFont(12);

		self.tilesets = self.source.tilesets;
		for index, tileset in pairs(self.tilesets) do
			local imageFilename = string.gsub(tileset.image, "%.%./%.%./", "");
			tileset.tilesetImage = love.graphics.newImage(imageFilename);
		end

		self.index = index;
		self.tiles = {};
		self.walls = {};
		self.doors = {};
		self.portals = {};
		self.itemLocations = {};
		self.sourceNodes = {};
		self.spawns = {};
		self.graves = {};
		self.scenarioId = scenarioId;

		for index, layer in pairs(self.source.layers) do
			if layer.type == "tilelayer" then
				table.insert(self.tiles, layer);
			elseif layer.name == "Wall" then
				self:addWalls(layer);
			elseif layer.name == "Door H" then
				self:addDoors(layer, "horizontal");
			elseif layer.name == "Door V" then
				self:addDoors(layer, "vertical");
			elseif layer.name == "Portals" then
				self:addPortals(layer);
			elseif layer.name == "Item" then
				self.itemLocations = layer.objects;
			elseif layer.name == "Paths" then
				self.sourceNodes = layer.objects;
			elseif layer.name == "Spawn" then
				self.spawns = layer.objects;
			elseif layer.name == "FireProof" then
				self:addFireProofing(layer);
			elseif layer.name == "Graves" and self.scenarioId == "ghost" then
				self:addGraves(layer);
			end
		end
	end
}

function Floor:addWalls(layer)
	self.walls = layer.objects;

	for index, wall in pairs(self.walls) do
		wall.x = wall.x + self.origin.x;
		wall.y = wall.y + self.origin.y;

		-- local lightBody = BodyLib:new(LightWorld);
		-- PolygonShadowLib:new(
		-- 	lightBody,
		-- 	wall.x,
		-- 	wall.y,
		-- 	wall.width,
		-- 	wall.height
		-- );
		BumpWorld:add(wall, wall.x, wall.y, wall.width, wall.height);
	end
end

function Floor:addDoors(layer, direction)
	for index, door in pairs(layer.objects) do
		table.insert(self.doors, Door(door.x + self.origin.x, door.y + self.origin.y, direction, self.soundEffects));
	end
end

function Floor:addPortals(layer)
	self.portals = layer.objects;

	for index, portal in pairs(self.portals) do
		portal.x = portal.x + self.origin.x;
		portal.y = portal.y + self.origin.y;
		BumpWorld:add(portal, portal.x, portal.y, portal.width, portal.height);
	end
end

function Floor:addFireProofing(layer)
	for index, object in pairs(layer.objects) do
		BumpWorld:add(object, object.x + self.origin.x, object.y + self.origin.y, object.width, object.height);
	end
end

function Floor:addGraves(layer)
	for index, grave in pairs(layer.objects) do
		table.insert(self.graves, Grave(self.parentStateGame, grave.x + self.origin.x, grave.y + self.origin.y, grave.width, grave.height, self.imageStore));
	end
end

function Floor:getLimits()
	return {
		x1 = self.origin.x,
		y1 = self.origin.y,
		x2 = self.origin.x + self.source.width * self.source.tilewidth,
		y2 = self.origin.y + self.source.height * self.source.tileheight,
	};
end

function Floor:update(dt)
	for index, door in pairs(self.doors) do
		door:update(dt);
	end

	for index, grave in pairs(self.graves) do
		grave:update(dt);
	end
end

function Floor:draw(camera)
	love.graphics.setColor(1, 1, 1);

	for index, tile in pairs(self.tiles) do
		self:drawTile(tile, camera);
	end

	for index, door in pairs(self.doors) do
		door:draw();
	end

	for index, grave in pairs(self.graves) do
		grave:draw();
	end

	if DRAW_BOXES then
		love.graphics.setColor(0.4, 0.4, 0.4);
		for index, wall in pairs(self.walls) do
			love.graphics.rectangle("fill", wall.x, wall.y, wall.width, wall.height);
		end
	end

	if DRAW_PORTALS then
		for index, portal in pairs(self.portals) do
			if portal.visible then
				love.graphics.setFont(self.defaultFont);
				love.graphics.setColor(1, 1, 0);
				love.graphics.rectangle("fill", portal.x, portal.y, portal.width, portal.height);
				love.graphics.setColor(0, 0, 0);
				love.graphics.printf("Stairs", portal.x, portal.y + portal.height / 2 - 8, portal.width, "center");
			end
		end
	end
end

function Floor:drawTile(tile, camera)
	if not tile.visible then
		return;
	end

	local curIndex = 1;
	local tileIndex = 0;
	local quad = {};
	local cx, cy = camera:position();
	local qx, qy;
	local dx, dy;

	for y = 1, tile.height do
		for x = 1, tile.width do
			dx = (x - 1) * (self.source.tilewidth) + self.origin.x;
			dy = (y - 1) * (self.source.tileheight) + self.origin.y;

			-- Only draw if inside the camera frame
			if (dx > cx - SCREEN_WIDTH / 2 - 100
				and dx < cx + SCREEN_WIDTH / 2 + 100
				and dy > cy - SCREEN_HEIGHT / 2 - 100
				and dy < cy + SCREEN_HEIGHT / 2 + 100)
				or DRAW_ENTIRE_HOUSE
			then
				qx = 1;
				qy = 1;
				tileIndex = tile.data[curIndex];

				if tileIndex ~= 0 then
					local tilesetData = nil;
					for index, tileset in pairs(self.tilesets) do
						if tileIndex >= tileset.firstgid then
							tilesetData = tileset;
						end
					end

					local numHorizTiles = tilesetData.imagewidth / tilesetData.tilewidth;

					qx = tileIndex - tilesetData.firstgid + 1;
					while qx > numHorizTiles do
						qx = qx - numHorizTiles;
						qy = qy + 1;
					end

					qx = (qx - 1) * self.source.tilewidth;
					qy = (qy - 1) * self.source.tileheight;

					quad = love.graphics.newQuad(
						qx,
						qy,
						self.source.tilewidth,
						self.source.tileheight,
						tilesetData.imagewidth,
						tilesetData.imageheight
					);

					love.graphics.draw(
						tilesetData.tilesetImage,
						quad,
						dx, dy
					);
				end
			end

			curIndex = curIndex + 1;
		end
	end
end
