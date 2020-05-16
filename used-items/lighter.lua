-- Dig graves during ghost attach
Lighter = Class {
	init = function(self, originX, originY, dirX, dirY)
		local dirVector = Vector(dirX, dirY);
		local angle = dirVector:angleTo();
		local dx = 0;
		local dy = 0;

		if angle < 0 then
			angle = angle + math.pi * 2;
		end

		if angle >= math.pi * 7/4 or angle <= math.pi * 1/4 then
			-- Facing Right
			dx = PLAYER_WIDTH / 2 + LIGHTER_WIDTH / 2;
		elseif angle >= math.pi * 1/4 and angle <= math.pi * 3/4 then
			-- Facing Down
			dy = PLAYER_HEIGHT / 2 + LIGHTER_HEIGHT / 2;
		elseif angle >= math.pi * 3/4 and angle <= math.pi * 5/4 then
			-- Facing Left
			dx = -PLAYER_WIDTH / 2 - LIGHTER_WIDTH / 2;
		elseif angle >= math.pi * 5/4 and angle <= math.pi * 7/4 then
			-- Facing Up
			dy = -PLAYER_HEIGHT / 2 - LIGHTER_HEIGHT / 2;
		end

		self.box = {
			x = originX + dx - LIGHTER_WIDTH / 2,
			y = originY + dy - LIGHTER_HEIGHT / 2,
			w = LIGHTER_WIDTH,
			h = LIGHTER_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.type = "placed-lighter";
		self.active = true;
	end
}

function Lighter:update(dt)
	if not self.active then
		return;
	end

	local actualX, actualY, cols, len = BumpWorld:check(self, self.box.x, self.box.y, lighterCollision);

	for i = 1, len do
    cols[i].other:setFire();
	end

	-- Only check for one frame, then die
	self.active = false;
end

function Lighter:draw()
end
