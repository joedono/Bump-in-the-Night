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

    for index, layer in pairs(self.source.layers) do
      if layer.name == "Floor" then
        self:loadTiles(layer);
      elseif layer.name == "Wall" then
        self:loadWalls(layer);
      elseif layer.name == "Door H" then
        self:addDoors(layer, "horizontal");
      elseif layer.name == "Door V" then
        self:addDoors(layer, "vertical");
      elseif layer.name == "Stairs" or layer.name == "Dumbwaiter" or layer.name == "Shute" then
        self:addPortals(layer);
      end
    end
  end
}

function Floor:loadTiles(layer)
  table.insert(self.tiles, layer);
end

function Floor:loadWalls(layer)
  self.walls = layer.objects;

  for index, wall in pairs(layer.objects) do
    BumpWorld:add(wall, wall.x + self.origin.x, wall.y + self.origin.y, wall.width, wall.height);
  end
end

function Floor:addDoors(layer, direction)
  for index, door in pairs(layer.objects) do
    table.insert(self.doors, Door(door.x + self.origin.x, door.y + self.origin.y, direction));
  end
end

function Floor:addPortals(layer)
  -- TODO Load Portals
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
    love.graphics.setColor(150, 150, 150);
    for index, wall in pairs(self.walls) do
      love.graphics.rectangle("fill", wall.x + self.origin.x, wall.y + self.origin.y, wall.width, wall.height);
    end

    -- TODO Draw portals
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

				if(tileIndex ~= 0) then
					qx = tileIndex;
					while(qx > numHorizTiles) do
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
						dx + self.origin.x,
						dy + self.origin.x
					);
				end
			end

			curIndex = curIndex + 1;
		end
	end
end