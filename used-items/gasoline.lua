-- Thrown on zombie to get them ready for burning
Gasoline = Class {
	init = function(self, originX, originY, dirX, dirY, image, animation)
		local dirVector = Vector(dirX, dirY);
		local angle = dirVector:angleTo();
		local dx = 0;
		local dy = 0;

		if angle < 0 then
			angle = angle + math.pi * 2;
		end

		if angle >= math.pi * 7/4 or angle <= math.pi * 1/4 then
			-- Facing Right
			dx = PLAYER_WIDTH / 2 + WATER_SPLASH_WIDTH / 2;
		elseif angle >= math.pi * 1/4 and angle <= math.pi * 3/4 then
			-- Facing Down
			dy = PLAYER_HEIGHT / 2 + WATER_SPLASH_HEIGHT / 2;
		elseif angle >= math.pi * 3/4 and angle <= math.pi * 5/4 then
			-- Facing Left
			dx = -PLAYER_WIDTH / 2 - WATER_SPLASH_WIDTH / 2;
		elseif angle >= math.pi * 5/4 and angle <= math.pi * 7/4 then
			-- Facing Up
			dy = -PLAYER_HEIGHT / 2 - WATER_SPLASH_HEIGHT / 2;
		end

		self.box = {
			x = originX + dx - WATER_SPLASH_WIDTH / 2,
			y = originY + dy - WATER_SPLASH_HEIGHT / 2,
			w = WATER_SPLASH_WIDTH,
			h = WATER_SPLASH_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.image = image;
		self.animation = animation;

		self.activeTimer = 0.4;
		self.belowPlayer = true;
		self.type = "placed-gasoline";
		self.active = true;
	end
}

function Gasoline:update(dt)
	if not self.active then
		return;
	end

	self.animation:update(dt);

	self.activeTimer = self.activeTimer - dt;
	if self.activeTimer < 0 then
		self.active = false;
	end
end

function Gasoline:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	self.animation:draw(self.image, self.box.x, self.box.y, 0, WATER_SPLASH_SCALE, WATER_SPLASH_SCALE);
end
