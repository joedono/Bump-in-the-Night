Monster = Class {
  init = function(self)
    self.velocity = { x = 0, y = 0 };
		self.speed = 0;
    self.facing = { x = 0, y = 0 };
  end
};

function Monster:updateFacing(dt, turnSpeed)
	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		local goalFacing = math.angle(0, 0, self.velocity.y, self.velocity.x);
		local curFacing = math.angle(0, 0, self.facing.y, self.facing.x);
    local nextFacing = gradualTurn(curFacing, goalFacing, turnSpeed, dt);

		self.facing.x = math.cos(nextFacing);
		self.facing.y = math.sin(nextFacing);
	end
end

function Monster:updatePosition(dt)
	local dx = self.box.x + self.velocity.x * self.speed * dt;
  local dy = self.box.y + self.velocity.y * self.speed * dt;
	return BumpWorld:move(self, dx, dy, monsterCollision);
end

function Monster:updatePathLights(dt)
  if self.path == nil then
    return;
  end

  local previousMultifloor = false;
  for index = self.targetPathNodeIndex, self.targetPathNodeIndex + 4 do
    if self.path[index] ~= nil then
      if self.path[index].multifloor then
        if previousMultifloor then
          self.path[index].light:setVisible(true);
          previousMultifloor = false;
        else
          previousMultifloor = true;
        end
      end
    end
  end
end

function Monster:resetPath()
  if self.path ~= nil then
    for index, pathNode in pairs(self.path) do
      if pathNode.multifloor then
        pathNode.light:setVisible(false);
      end
    end
  end

	self.path = nil;
	self.targetPathNodeIndex = 1;
	self.targetPathNode = nil;
end

function Monster:hasCalledPolice()
	return self.parentManager.parentStateGame:hasPlayerCalledPolice();
end

function Monster:canSeePlayer(baseSightCone, baseSightDistance)
	local facingAngle = math.deg(math.angle(0, 0, self.facing.y, self.facing.x));
	local targetAngle = math.deg(math.angle(self.box.y, self.box.x, self.player.box.y, self.player.box.x));
	local sightCone = math.deg(baseSightCone / 2);
	local angleDiff = (math.abs(facingAngle - targetAngle) + 180 + 360) % 360 - 180;
	local distToPlayer = math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y);
	local items, len = BumpWorld:querySegment(self.box.x, self.box.y, self.player.box.x, self.player.box.y, canSeeFilter);

	if distToPlayer < baseSightDistance and len == 0 and angleDiff <= sightCone and angleDiff >= -sightCone then
		return true;
	end

	return false;
end

function Monster:stun()
  if not self.armored then
    self:resetPath();
    self.state = "stunned";
    self.stateTimer = 5;
  end
end