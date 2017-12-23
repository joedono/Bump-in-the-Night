require "house/door";

Floor = Class {
  init = function (self, layoutFile, originX, originY)
    self.origin = {
      x = originX,
      y = originY
    };

    self.source = love.filesystem.load(layoutFile)();

    local imageFilename = string.gsub(self.source.tilesets[1].image, "%.%./%.%.", "asset");
    self.tilesetImage = love.graphics.newImage(imageFilename);
    self.tilesetData = self.source.tilesets[1];

    self.tiles = {};
    self.walls = {};
    self.doors = {};
    self.portals = {};
    self.itemLocations = {};
    self.paths = {};

    for index, layer in pairs(self.source.layers) do
      if layer.name == "Floor" then
        table.insert(self.tiles, layer);
      elseif layer.name == "Wall" then
        self:loadWalls(layer);
      elseif layer.name == "Door H" then
        self:addDoors(layer, "horizontal");
      elseif layer.name == "Door V" then
        self:addDoors(layer, "vertical");
      elseif layer.name == "Portals" then
        self:addPortals(layer);
      elseif layer.name == "Item" then
        self.itemLocations = layer.objects;
      elseif layer.name == "Paths" then
        self.paths = layer.objects;
      end
    end
  end
}

function Floor:loadWalls(layer)
  self.walls = layer.objects;

  for index, wall in pairs(self.walls) do
    wall.x = wall.x + self.origin.x;
    wall.y = wall.y + self.origin.y;
    BumpWorld:add(wall, wall.x, wall.y, wall.width, wall.height);
  end
end

function Floor:addDoors(layer, direction)
  for index, door in pairs(layer.objects) do
    table.insert(self.doors, Door(door.x + self.origin.x, door.y + self.origin.y, direction));
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

function Floor:update(dt)
  for index, door in pairs(self.doors) do
    door:update(dt);
  end
end

function Floor:draw(camera)
  love.graphics.setColor(255, 255, 255);

  for index, tile in pairs(self.tiles) do
    self:drawTile(tile, camera);
  end

  for index, door in pairs(self.doors) do
    door:draw();
  end

  if DRAW_BOXES then
    love.graphics.setColor(100, 100, 100);
    for index, wall in pairs(self.walls) do
      love.graphics.rectangle("fill", wall.x, wall.y, wall.width, wall.height);
    end

    love.graphics.setColor(255, 255, 0);
    for index, portal in pairs(self.portals) do
      love.graphics.rectangle("fill", portal.x, portal.y, portal.width, portal.height);
    end
  end
end

function Floor:drawTile(tile, camera)
  if not tile.visible then
		return;
	end

	local curIndex = 1;
	local tileIndex = 0;
	local numHorizTiles = self.tilesetData.imagewidth / self.tilesetData.tilewidth;
	local quad = {};
	local cx, cy = camera:position();
	local qx, qy;
	local dx, dy;

	for y = 1, tile.height do
		for x = 1, tile.width do
			dx = (x - 1) * (self.tilesetData.tilewidth) + self.origin.x;
			dy = (y - 1) * (self.tilesetData.tileheight) + self.origin.y;

			-- Only draw if inside the camera frame
			if dx > cx - SCREEN_WIDTH / 2 - 100
				and dx < cx + SCREEN_WIDTH / 2 + 100
				and dy > cy - SCREEN_HEIGHT / 2 - 100
				and dy < cy + SCREEN_HEIGHT / 2 + 100
			then
				qx = 1;
				qy = 1;
				tileIndex = tile.data[curIndex];

				if tileIndex ~= 0 then
					qx = tileIndex;
					while qx > numHorizTiles do
						qx = qx - numHorizTiles;
						qy = qy + 1;
					end

					qx = (qx - 1) * self.tilesetData.tilewidth;
					qy = (qy - 1) * self.tilesetData.tileheight;

					quad = love.graphics.newQuad(
						qx,
						qy,
						self.tilesetData.tilewidth,
						self.tilesetData.tileheight,
						self.tilesetData.imagewidth,
						self.tilesetData.imageheight
					);

					love.graphics.draw(
						self.tilesetImage,
						quad,
						dx, dy
					);
				end
			end

			curIndex = curIndex + 1;
		end
	end
end