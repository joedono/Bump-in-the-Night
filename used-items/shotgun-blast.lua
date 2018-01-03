-- Fired from the shotgun
Shotgun_Blast = Class {
	init = function(self, originX, originY, dirX, dirY)
		local dirVector = Vector(dirX, dirY);
		dirVector:normalizeInplace();
		dirVector = dirVector * SHOTGUN_RANGE;

		local insideVector = Vector(originX, originY);
		local outsideVector = insideVector + dirVector;

		-- Get outside points of the shotgun bounded box
		local x1 = math.min(insideVector.x, outsideVector.x);
		local y1 = math.min(insideVector.y, outsideVector.y);
		local x2 = math.max(insideVector.x, outsideVector.x);
		local y2 = math.max(insideVector.y, outsideVector.y);

		local w = x2 - x1;
		local h = y2 - y1;

		-- Box is too small. Stretch it to the min size
		if w < SHOTGUN_MIN_SIZE then
			local diffX = SHOTGUN_MIN_SIZE - w;
			w = SHOTGUN_MIN_SIZE;
			x1 = x1 - diffX / 2;
		end

		if h < SHOTGUN_MIN_SIZE then
			local diffY = SHOTGUN_MIN_SIZE - h;
			h = SHOTGUN_MIN_SIZE;
			y1 = y1 - diffY / 2;
		end

		self.box = {
			x = x1,
			y = y1,
			w = w,
			h = h
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.activeTimer = 0.25;
		self.type = "placed-shotgun-blash";
		self.active = true;
	end
}

function Shotgun_Blast:update(dt)
  if not self.active then
    return;
  end

	self.activeTimer = self.activeTimer - dt;
	if self.activeTimer < 0 then
		self.active = false;
	end
end

function Shotgun_Blast:draw()
  if not self.active then
    return;
  end

	love.graphics.setColor(255, 255, 255);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.w, self.box.h);
end