PathNode = Class {
  init = function (self, floorIndex, floor, sourceNode)
    self.id = sourceNode.id;
    self.sourceNode = sourceNode;
    self.floorIndex = floorIndex;
    self.origin = {
      x = sourceNode.x + floor.origin.x,
      y = sourceNode.y + floor.origin.y
    };

    self.connections = {};
    self.type = "path";
  end
}

function PathNode:addConnection(pathNode)
  local newConnection = {
    pathNode = pathNode,
    distance = math.dist(self.origin.x, self.origin.y, pathNode.origin.x, pathNode.origin.y)
  };

  table.insert(self.connections, newConnection);
end

function PathNode:draw()
  love.graphics.setColor(100, 255, 0);
  love.graphics.rectangle("fill", self.origin.x, self.origin.y, PATH_NODE_SIZE, PATH_NODE_SIZE);

  love.graphics.setColor(255, 255, 255);
  for index, connection in pairs(self.connections) do
    love.graphics.line(
      self.origin.x, self.origin.y,
      connection.pathNode.origin.x + PATH_NODE_SIZE, connection.pathNode.origin.y + PATH_NODE_SIZE
    );
  end
end