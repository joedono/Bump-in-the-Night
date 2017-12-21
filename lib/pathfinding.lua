pathfinding = {};

function pathfinding.findPath(startX, startY, goalX, goalY, nodes)
  local startNode = pathfinding.findClosestNode(startX, startY, nodes);
  local goalNode = pathfinding.findClosestNode(goalX, goalY, nodes);
  local path = {};

  -- TODO find path

  return path;
end

function pathfinding.findClosestNode(x, y, nodes)
  local closestNode = nodes[1];
  local dist = math.dist(x, y, closestNode.center.x, closestNode.center.y);

  for index, node in pairs(nodes) do
    if math.dist(x, y, node.center.x, node.center.y) < dist then
      dist = math.dist(x, y, node.center.x, node.center.y);
      closestNode = node;
  end

  return closestNode;
end