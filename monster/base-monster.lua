Monster = Class {
  init = function(self)
    self.velocity = { x = 0, y = 0 };
		self.speed = 0;
    self.facing = { x = 0, y = 0 };
  end
};

function Monster:updateFacing(dt, turnSpeed)
  local dx, dy = self.velocity.x, self.velocity.y;

	if dx ~= 0 or dy ~= 0 then
		local goalFacing = math.angle(0, 0, dy, dx);
		local curFacing = math.angle(0, 0, self.facing.y, self.facing.x);

		if(goalFacing < 0) then
			goalFacing = goalFacing + math.pi * 2;
		end

		if math.abs(goalFacing - curFacing) < 0.15 then
			-- Close enough. Don't update facing
		else
			-- Determine which circular direction will get to the goal the fastest
			local positiveSearch = curFacing;
			local negativeSearch = curFacing;
			local finalDirection = 0;

			while math.abs(positiveSearch - goalFacing) > 0.15 and math.abs(negativeSearch - goalFacing) > 0.15 do
				positiveSearch = positiveSearch + 0.1;
				negativeSearch = negativeSearch - 0.1;

				if positiveSearch > math.pi * 2 then
					positiveSearch = positiveSearch - math.pi * 2;
				end

				if negativeSearch < 0 then
					negativeSearch = negativeSearch + math.pi * 2;
				end
			end

			if math.abs(positiveSearch - goalFacing) < 0.15 then
				finalDirection = turnSpeed * dt;
			elseif(math.abs(negativeSearch - goalFacing) < 0.15) then
				finalDirection = -turnSpeed * dt;
			end

			goalFacing = curFacing + finalDirection;
		end

		if goalFacing > math.pi * 2 then
			goalFacing = goalFacing - math.pi * 2;
		end

		if goalFacing < 0 then
			goalFacing = goalFacing + math.pi * 2;
		end

		self.facing.x = math.cos(goalFacing);
		self.facing.y = math.sin(goalFacing);
	end
end