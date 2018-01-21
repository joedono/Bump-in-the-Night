-- Thrown on fire to put it out during an arsonist attack
Bucket_Water = Class {
	init = function(self, originX, originY, dirX, dirY, image, animation)

		self.image = image;
		self.animation = animation;

		self.activeTimer = 0.3;
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