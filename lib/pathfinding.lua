pathfinding = {};

function pathfinding.findPath(startX, startY, goalX, goalY, pathNodes)
  local startPathNode = pathfinding.findClosestNode(startX, startY, pathNodes);
  local goalPathNode = pathfinding.findClosestNode(goalX, goalY, pathNodes);
  local finalPath = {};
  local closedList = {};
  local openList = {};
  local done = false;

  if startPathNode.id == goalPathNode.id and startPathNode.floorIndex == goalPathNode.floorIndex then
    table.insert(finalPath, startPathNode);
  else
    table.insert(openList, {
      from = nil,
      distanceFromStart = 0,
      distanceFromGoal = math.dist(startPathNode.center.x, startPathNode.center.y, goalPathNode.center.x, goalPathNode.center.y),
      pathNode = startPathNode
    });

    while not done do
      -- Find the node in the open list with the shortest distance between the start and the goal
      local curIndex = 1;
      local testPathfindingNode = openList[curIndex];
      local shortestDistance = testPathfindingNode.distanceFromStart + testPathfindingNode.distanceFromGoal;

      -- Find the path with the shortest distance
      for index, pathfindingNode in pairs(openList) do
        if pathfindingNode.distanceFromStart + pathfindingNode.distanceFromGoal < shortestDistance then
          curIndex = index;
          testPathfindingNode = pathfindingNode;
          shortestDistance = testPathfindingNode.distanceFromStart + testPathfindingNode.distanceFromGoal;
        end
      end

      table.insert(closedList, testPathfindingNode);
      table.remove(openList, curIndex);

      -- Add all of that node's connections for evaluation
      for index, connectionNode in pairs(testPathfindingNode.pathNode.connections) do
        local pathNode = connectionNode.pathNode;
        local toAdd = true;

        -- Only insert if node isn't already on the open list
        for index2, openPathfindingNode in pairs(openList) do
          if openPathfindingNode.pathNode.id == pathNode.id and openPathfindingNode.pathNode.floorIndex == pathNode.floorIndex then
            toAdd = false;
          end
        end

        -- Only insert if node isn't already on the closed list
        for index2, closedPathfindingNode in pairs(closedList) do
          if closedPathfindingNode.pathNode.id == pathNode.id and closedPathfindingNode.pathNode.floorIndex == pathNode.floorIndex then
            toAdd = false;
          end
        end

        if toAdd then
          table.insert(openList, {
            from = testPathfindingNode,
            distanceFromStart = testPathfindingNode.distanceFromStart + connectionNode.distance,
            distanceFromGoal = math.dist(pathNode.center.x, pathNode.center.y, goalPathNode.center.x, goalPathNode.center.y),
            pathNode = pathNode
          });
        end
      end

      -- No more open paths to take
      if #openList == 0 then
        error("Path not found");
      else
        local endPathfindingNode = nil;
        for index, pathfindingNode in pairs(openList) do
          if pathfindingNode.pathNode.id == goalPathNode.id and pathfindingNode.pathNode.floorIndex == goalPathNode.floorIndex then
            endPathfindingNode = pathfindingNode;
          end
        end

        if endPathfindingNode ~= nil then
          -- Goal node found
          table.insert(finalPath, endPathfindingNode.pathNode);
          local fromPathfindingNode = endPathfindingNode.from;

          while fromPathfindingNode ~= nil do
            table.insert(finalPath, fromPathfindingNode.pathNode);
            fromPathfindingNode = fromPathfindingNode.from;
          end

          done = true;
        end
      end
    end
  end

  local finalPathLen = #finalPath;

  -- Reverse the finalPath so finalPath[1] is the start node
  local i, j = 1, finalPathLen;
  while i < j do
    finalPath[i], finalPath[j] = finalPath[j], finalPath[i];

    i = i + 1;
    j = j - 1;
  end

  -- Test to see if the first node will be away from the goal
  if finalPathLen > 1 then
    local firstPathNode = finalPath[1];
    local secondPathNode = finalPath[2];

    local startToSecond = math.dist(startX, startY, secondPathNode.origin.x, secondPathNode.origin.y);
    local firstToSecond = math.dist(firstPathNode.origin.x, firstPathNode.origin.y, secondPathNode.origin.x, secondPathNode.origin.y);

    -- Going to first node will be farther from goal
    if startToSecond < firstToSecond and firstPathNode.floorIndex == secondPathNode.floorIndex and pathfinding.canReachNode(startX, startY, secondPathNode) then
      table.remove(finalPath, 1);
      finalPathLen = finalPathLen - 1;
    end
  end

  -- Test to see if the goal will be reached before the last node
  if finalPathLen > 1 then
    local lastPathNode = finalPath[finalPathLen];
    local secondLastPathNode = finalPath[finalPathLen-1];

    local secondToLast = math.dist(secondLastPathNode.origin.x, secondLastPathNode.origin.y, lastPathNode.origin.x, lastPathNode.origin.y);
    local secondToGoal = math.dist(secondLastPathNode.origin.x, secondLastPathNode.origin.y, goalX, goalY);

    -- Pathfinder will reach the goal before reaching the last node
    if secondToGoal < secondToLast and lastPathNode.floorIndex == secondLastPathNode.floorIndex and pathfinding.canReachNode(goalX, goalY, secondLastPathNode) then
      table.remove(finalPath);
      finalPathLen = finalPathLen - 1;
    end
  end

  -- If there is only one node, test to see if it goes away from the goal
  if finalPathLen == 1 then
    local currentToGoal = math.dist(startX, startY, goalX, goalY);
    local pathToGoal = math.dist(finalPath[1].origin.x, finalPath[1].origin.y, goalX, goalY);

    if currentToGoal < pathToGoal then
      table.remove(finalPath);
      finalPathLen = finalPathLen - 1;
    end
  end

  -- Insert the goal as a node at the end
  table.insert(finalPath, {
    origin = {
      x = goalX,
      y = goalY,
      w = PATH_NODE_SIZE,
      h = PATH_NODE_SIZE
    },
    floorIndex = goalPathNode.floorIndex,
    type = "path",
    isGoal = true
  });

  return finalPath;
end

function pathfinding.findClosestNode(x, y, pathNodes)
  local closestPathNode = pathNodes[1];
  local dist = math.dist(x, y, closestPathNode.center.x, closestPathNode.center.y);

  for index, pathNode in pairs(pathNodes) do
    if math.dist(x, y, pathNode.center.x, pathNode.center.y) < dist and pathfinding.canReachNode(x, y, pathNode) then
      dist = math.dist(x, y, pathNode.center.x, pathNode.center.y);
      closestPathNode = pathNode;
    end
  end

  return closestPathNode;
end

function pathfinding.canReachNode(x, y, pathNode)
  local pathNodeX = pathNode.center.x;
  local pathNodeY = pathNode.center.y;

  local items, len = BumpWorld:querySegment(x, y, pathNodeX, pathNodeY, canMoveFilter);

  return len == 0;
end

function pathfinding.canSeePosition(startX, startY, goalX, goalY)
  local items, len = BumpWorld:querySegment(startX, startY, goalX, goalY, canSeeFilter);
  return len == 0;
end