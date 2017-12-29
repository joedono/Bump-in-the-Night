pathfinding = {};

function pathfinding.findPath(startX, startY, goalX, goalY, nodes)
  local startNode = pathfinding.findClosestNode(startX, startY, nodes);
  local goalNode = pathfinding.findClosestNode(goalX, goalY, nodes);
  local path = {};
  local closedList = {};
  local openList = {};
  local done = false;

  if startNode.id == goalNode.id and startNode.floorIndex == goalNode.floorIndex then
    table.insert(path, startNode);
  else
    table.insert(openList, {
      from = nil,
      distanceFromStart = 0,
      distanceFromGoal = math.dist(startNode.center.x, startNode.center.y, goalNode.center.x, goalNode.center.y),
      node = startNode
    });

    while not done do
      -- Find the node in the open list with the shortest distance between the start and the goal
      local curIndex = 1;
      local testNode = openList[curIndex];
      local shortestDistance = testNode.distanceFromStart + testNode.distanceFromGoal;

      -- Find the path with the shortest distance
      for index, node in pairs(openList) do
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
        local toAdd = true;

        -- Only insert if node isn't already on the open list
        for index2, openNode in pairs(openList) do
          if openNode.node.id == path.id and openNode.node.floorIndex == path.floorIndex then
            toAdd = false;
          end
        end

        -- Only insert if node isn't already on the closed list
        for index2, closedNode in pairs(closedList) do
          if closedNode.node.id == path.id and closedNode.node.floorIndex == path.floorIndex then
            toAdd = false;
          end
        end

        if toAdd then
          table.insert(openList, {
            from = testNode,
            distanceFromStart = testNode.distanceFromStart + node.distance,
            distanceFromGoal = math.dist(path.center.x, path.center.y, goalNode.center.x, goalNode.center.y),
            node = path
          });
        end
      end

      -- No more open paths to take
      if #openList == 0 then
        error("Path not found");
      else
        local endNode = nil;
        for index, node in pairs(openList) do
          if node.node.id == goalNode.id and node.node.floorIndex == goalNode.floorIndex then
            endNode = node;
          end
        end

        if endNode ~= nil then
          -- Goal node found
          table.insert(path, endNode.node);
          local fromNode = endNode.from;

          while fromNode ~= nil do
            table.insert(path, fromNode.node);
            fromNode = fromNode.from;
          end

          done = true;
        end
      end
    end
  end

  local pathLen = #path;

  -- Reverse the path so path[1] is the start node
  local i, j = 1, pathLen;
  while i < j do
    path[i], path[j] = path[j], path[i];

    i = i + 1;
    j = j - 1;
  end


  if pathLen > 1 then
    -- Test to see if the first node will be away from the goal
    local firstNode = path[1];
    local secondNode = path[2];

    local startToSecond = math.dist(startX, startY, secondNode.origin.x, secondNode.origin.y);
    local firstToSecond = math.dist(firstNode.origin.x, firstNode.origin.y, secondNode.origin.x, secondNode.origin.y);

    -- Going to first node will be farther from goal
    if startToSecond < firstToSecond then
      table.remove(path, 1);
      pathLen = pathLen - 1;
    end
  end

  if pathLen > 1 then
    -- Test to see if the goal will be reached before the last node
    local lastNode = path[pathLen];
    local secondLastNode = path[pathLen-1];

    local secondToLast = math.dist(secondLastNode.origin.x, secondLastNode.origin.y, lastNode.origin.x, lastNode.origin.y);
    local secondToGoal = math.dist(secondLastNode.origin.x, secondLastNode.origin.y, goalX, goalY);

    -- Pathfinder will reach the goal before reaching the last node
    if secondToGoal < secondToLast then
      table.remove(path);
      pathLen = pathLen - 1;
    end
  end

  -- Insert the goal as a node at the end
  table.insert(path, {
    origin = {
      x = goalX,
      y = goalY,
      w = 32,
      h = 32
    },
    floorIndex = path[pathLen].floorIndex,
    type = "path",
    isGoal = true
  });

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