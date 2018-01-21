-- Thrown on fire to put it out during an arsonist attack
Bucket_Water = Class {
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
			dx = PLAYER_WIDTH / 2 + 62 / 2;
		elseif angle >= math.pi * 1/4 and angle <= math.pi * 3/4 then
			-- Facing Down
			dy = PLAYER_HEIGHT / 2 + 32 / 2;
		elseif angle >= math.pi * 3/4 and angle <= math.pi * 5/4 then
			-- Facing Left
			dx = -PLAYER_WIDTH / 2 - 62 / 2;
		elseif angle >= math.pi * 5/4 and angle <= math.pi * 7/4 then
			-- Facing Up
			dy = -PLAYER_HEIGHT / 2 - 32 / 2;
		end

		self.box = {
			x = originX + dx - 62 / 2,
			y = originY + dy - 32 / 2,
			w = 62,
			h = 32
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.image = image;
		self.animation = animation;

		self.activeTimer = 0.4;
		self.belowPlayer = true;
		self.type = "placed-water-splash";
		self.active = true;
	end
}

function Bucket_Water:update(dt)
	if not self.active then
    return;
  end

	self.animation:update(dt);
	local actualX, actualY, cols, len = BumpWorld:check(self, self.box.x, self.box.y, waterSplashCollision);

	for i = 1, len do
		local col = cols[i];
		col.other.active = false;
	end

	self.activeTimer = self.activeTimer - dt;
	if self.activeTimer < 0 then
		self.active = false;
	end
end

function Bucket_Water:draw()
  if not self.active then
    return;
  end

	love.graphics.setColor(255, 255, 255);
	self.animation:draw(self.image, self.box.x, self.box.y);
end