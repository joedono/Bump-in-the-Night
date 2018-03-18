-- Dig graves during ghost attach
Shovel_Dig = Class {
	init = function(self, originX, originY, dirX, dirY, soundEffects)
		self.soundEffects = soundEffects;
		local dirVector = Vector(dirX, dirY);
		local angle = dirVector:angleTo();
		local dx = 0;
		local dy = 0;

		if angle < 0 then
			angle = angle + math.pi * 2;
		end

		if angle >= math.pi * 7/4 or angle <= math.pi * 1/4 then
			-- Facing Right
			dx = PLAYER_WIDTH / 2 + SHOVEL_DIG_WIDTH / 2;
		elseif angle >= math.pi * 1/4 and angle <= math.pi * 3/4 then
			-- Facing Down
			dy = PLAYER_HEIGHT / 2 + SHOVEL_DIG_HEIGHT / 2;
		elseif angle >= math.pi * 3/4 and angle <= math.pi * 5/4 then
			-- Facing Left
			dx = -PLAYER_WIDTH / 2 - SHOVEL_DIG_WIDTH / 2;
		elseif angle >= math.pi * 5/4 and angle <= math.pi * 7/4 then
			-- Facing Up
			dy = -PLAYER_HEIGHT / 2 - SHOVEL_DIG_HEIGHT / 2;
		end

		self.box = {
			x = originX + dx - SHOVEL_DIG_WIDTH / 2,
			y = originY + dy - SHOVEL_DIG_HEIGHT / 2,
			w = SHOVEL_DIG_WIDTH,
			h = SHOVEL_DIG_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.type = "placed-shovel-dig";
		self.active = true;
	end
}

function Shovel_Dig:update(dt)
	if not self.active then
		return;
	end

	local dug = false;
	local actualX, actualY, cols, len = BumpWorld:check(self, self.box.x, self.box.y, shovelDigCollision);

	for i = 1, len do
    dug = cols[i].other:dig(dt);
	end

	if len > 0 then
		if dug then
			self.soundEffects.shovelDig:play();
		else
			self.soundEffects.shovelDig:stop();
		end
	else
		self.soundEffects.shovelDigFail:play();
	end
end

function Shovel_Dig:draw()
end