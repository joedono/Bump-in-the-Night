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
  -- TODO Load Tiles
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

function Floor:draw()
  -- TODO Draw tiles

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