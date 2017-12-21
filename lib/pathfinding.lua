pathfinding = {};

function pathfinding.findPath(startX, startY, goalX, goalY, nodes, walls)
  local startNode = pathfinding.findClosestNode(startX, startY, nodes, walls);
  local goalNode = pathfinding.findClosestNode(goalX, goalY, nodes, walls);
  local path = {};

  -- TODO find path
  --[[
  1. Add startNode to closed list
  2. Add all of startNode's connections to the open list
  3. Compute the heuristic distance between all nodes on the open list and the goalNode
  4. Add each of those distances to the total accumulated distance from the start node to the given node
  5. Find the node with the lowest total distance
  6. Add that node to the closed list plus a reference to which node you came from
  7. Add all of that node's connections to the open list
  8. Repeat steps 3-7 until the open list contains the goalNode or until there are no more nodes on the open list
  9. Work backwards through parent nodes set in step 6 to construct the path
  ]]

  return path;
end

function pathfinding.findClosestNode(x, y, nodes, walls)
  local closestNode = nodes[1];
  local dist = math.dist(x, y, closestNode.center.x, closestNode.center.y);

  for index, node in pairs(nodes) do
    if math.dist(x, y, node.center.x, node.center.y) < dist and pathfinding.canReachNode(x, y, node, walls) then
      dist = math.dist(x, y, node.center.x, node.center.y);
      closestNode = node;
  end

  return closestNode;
end

function pathfinding.canReachNode(x, y, node, walls)
  return true;
end