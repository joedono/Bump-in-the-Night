Floor = Class {
  init = function (self, layoutFile)
    self.source = love.filesystem.load(layoutFile)();

    local imageFilename = string.gsub(self.source.tilesets[1].image, "%.%./%.%.", "asset");
    self.tilesetImage = love.graphics.newImage(imageFilename);

    for index, layer in pairs(self.source.layers) do
      if layer.name == "Floor" then
        self:loadTiles(layer);
      elseif layer.name == "Wall" then
        self:loadWalls(layer);
      elseif layer.name == "Door H" then
        self:loadDoorsHorizontal(layer);
      elseif layer.name == "Door V" then
        self:loadDoorsVertical(layer);
      elseif layer.name == "Stairs" or layer.name == "Dumbwaiter" or layer.name == "Shute" then
        self:addPortals(layer);
      end
    end
  end
}

function Floor:loadTiles(layer)

end

function Floor:loadWalls(layer)
  self.walls = layer.objects;

  for index, wall in pairs(layer.objects) do
    BumpWorld:add(wall, wall.x, wall.y, wall.width, wall.height);
  end
end

function Floor:loadDoorsHorizontal(layer)

end

function Floor:loadDoorsVertical(layer)

end

function Floor:addPortals(layer)

end

function Floor:draw()
  if DRAW_BOXES then
    love.graphics.setColor(255, 255, 255);
    for index, wall in pairs(self.walls) do
      love.graphics.rectangle("line", wall.x, wall.y, wall.width, wall.height);
    end
  end
end