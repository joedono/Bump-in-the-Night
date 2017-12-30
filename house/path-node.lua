PathNode = Class {
  init = function (self, floorIndex, floor, sourceNode)
    self.id = sourceNode.id;
    self.sourceNode = sourceNode;
    self.floorIndex = floorIndex;
    self.origin = {
      x = sourceNode.x + floor.origin.x,
      y = sourceNode.y + floor.origin.y,
      w = sourceNode.width,
      h = sourceNode.height
    };

    self.center = {
      x = self.origin.x + self.origin.w / 2,
      y = self.origin.y + self.origin.h / 2
    };

    BumpWorld:add(self, self.origin.x, self.origin.y, self.origin.w, self.origin.h);
    self.connections = {};
    self.type = "path";
  end
}

function PathNode:addConnection(path)
  local newConnection = {
    path = path,
    distance = math.dist(self.center.x, self.center.y, path.center.x, path.center.y)
  };

  table.insert(self.connections, newConnection);
end

function PathNode:draw()
  love.graphics.setColor(100, 255, 0);
  love.graphics.rectangle("fill", self.origin.x, self.origin.y, self.origin.w, self.origin.h);

  love.graphics.setColor(255, 255, 255);
  for index, connection in pairs(self.connections) do
    love.graphics.line(
      self.origin.x, self.origin.y,
      connection.path.origin.x + connection.path.origin.w, connection.path.origin.y + connection.path.origin.h
    );
  end
end