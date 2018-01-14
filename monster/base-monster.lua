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

function Monster:resetPath()
	self.path = nil;
	self.targetPathNodeIndex = 1;
	self.targetPathNode = nil;
end