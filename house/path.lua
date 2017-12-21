Path = Class {
  init = function (self, floor, source)
    self.source = source;
    self.origin = {
      x = source.x,
      y = source.y,
      w = source.width,
      h = source.height
    };

    self.center = {
      x = source.x + source.width / 2,
      y = source.y + source.height / 2
    };

    self.offset = {
      x = self.origin.x + floor.origin.x,
      y = self.origin.y + floor.origin.y
    };

    self.offsetCenter = {
      x = self.center.x + floor.origin.x,
      y = self.center.y + floor.origin.y
    };

    BumpWorld:add(self, self.offset.x, self.offset.y, self.origin.w, self.origin.h);
    self.connections = {};
    self.type = "path";
  end
}

function Path:addConnection(path)
  local newConnection = {
    path = path,
    distance = math.dist(self.center.x, self.center.y, path.center.x, path.center.y)
  };

  table.insert(self.connections, newConnection);
end

function Path:draw()
  love.graphics.setColor(100, 255, 0);
  love.graphics.rectangle("fill", self.offset.x, self.offset.y, self.origin.w, self.origin.h);

  love.graphics.setColor(255, 255, 255);
  for index, connection in pairs(self.connections) do
    love.graphics.line(
      self.offset.x, self.offset.y,
      connection.path.offset.x + connection.path.origin.w, connection.path.offset.y + connection.path.origin.h
    );
  end
end