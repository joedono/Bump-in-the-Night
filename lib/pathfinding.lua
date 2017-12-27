pathfinding = {};

function pathfinding.findPath(startX, startY, goalX, goalY, nodes)
  local startNode = pathfinding.findClosestNode(startX, startY, nodes);
  local goalNode = pathfinding.findClosestNode(goalX, goalY, nodes);
  local path = {};
  local closedList = {};
  local openList = {};
  local done = false;

  table.insert(closedList, {
    from = nil,
    distanceFromStart = 0,
    distanceFromGoal = math.dist(startNode.center.x, startNode.center.y, goalNode.center.x, goalNode.center.y),
    node = startNode
  });

  for index, node in pairs(startNode.connections) do
    local path = node.path;
    table.insert(openList, {
      from = startNode,
      distanceFromStart = node.distance,
      distanceFromGoal = math.dist(path.center.x, path.center.y, goalNode.center.x, goalNode.center.y),
      node = path
    });
  end

  while not done do
    -- Find the node in the open list with the shortest distance between the start and the goal
    local curIndex = 1;
    local testNode = openList[curIndex];
    local shortestDistance = testNode.distanceFromStart + testNode.distanceFromGoal;

    -- Find the path with the shortest distance
    for index, node in pairs(openList) do
      -- TODO Take floor indexes into account when measuring distance
      if node.distanceFromStart + node.distanceFromGoal < shortestDistance then
        curIndex = index;
        testNode = node;
        shortestDistance = testNode.distanceFromStart + testNode.distanceFromGoal;
      end
    end

    table.insert(closedList, testNode);
    table.remove(openList, curIndex);

    -- Add all of that node's connections for evaluation
    for index, node in pairs(testNode.node.connections) do
      local path = node.path;

      for index2, closedNode in pairs(closedList) do
        -- Only insert if node isn't already on the closed list
        if closedNode.id ~= path.id and closedNode.floorIndex ~= path.floorIndex then
          table.insert(openList, {
            from = testNode,
            distanceFromStart = testNode.distanceFromStart + node.distance,
            distanceFromGoal = math.dist(path.center.x, path.center.y, goalNode.center.x, goalNode.center.y),
            node = node
          });
        end
      end
    end

    -- No more open paths to take
    if #openList == 0 then
      return nil;
    else
      for index, node in pairs(openList) do
        if node.node.id == goalNode.id and node.node.floorIndex == goalNode.floorIndex then
          -- Goal node found
          table.insert(path, node);
          local fromNode = node.from;

          while fromNode ~= nil do
            table.insert(path, fromMode)
            fromNode = fromNode.from;
          end

          done = true;
        end
      end
    end
  end

  -- Reverse the path so path[1] is the start node
  local i, j = 1, #path;
  while i < j do
    path[i], path[j] = path[j], path[i];

    i = i + 1;
    j = j - 1;
  end

  return path;
end

function pathfinding.findClosestNode(x, y, nodes)
  local closestNode = nodes[1];
  local dist = math.dist(x, y, closestNode.center.x, closestNode.center.y);

  for index, node in pairs(nodes) do
    if math.dist(x, y, node.center.x, node.center.y) < dist and pathfinding.canReachNode(x, y, node) then
      dist = math.dist(x, y, node.center.x, node.center.y);
      closestNode = node;
    end
  end

  return closestNode;
end

function pathfinding.canReachNode(x, y, node)
  local nodeX = node.center.x;
  local nodeY = node.center.y;

  local items, len = BumpWorld:querySegment(x, y, nodeX, nodeY, canMoveFilter);

  return len == 0;
end

function pathfinding.canSeePosition(startX, startY, goalX, goalY)
  local items, len = BumpWorld:querySegment(startX, startY, goalX, goalY, canSeeFilter);
  return len == 0;
end