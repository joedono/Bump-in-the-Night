-- Fired from the shotgun
Shotgun_Blast = Class {
	init = function(self, originX, originY, dirX, dirY, image)
		local dirVector = Vector(dirX, dirY);
		dirVector:normalizeInplace();

		offsetVector = dirVector * (PLAYER_WIDTH / 2 - 7);
		local insideVector = Vector(originX, originY) + offsetVector;
		local outsideVector = insideVector + (dirVector * SHOTGUN_RANGE) + offsetVector;

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

		self.rotation = math.angle(0, 0, dirY, dirX);
		if self.rotation < 0 then
			self.rotation = self.rotation + math.pi * 2;
		end

		self.image = image;
		self.imageData = {
			w = image:getWidth(),
			h = image:getHeight();
		};
		self.activeTimer = 0.1;
		self.belowPlayer = false;
		self.type = "placed-shotgun-blast";
		self.active = true;
	end
}

function Shotgun_Blast:update(dt)
	if not self.active then
		return;
	end

	local actualX, actualY, cols, len = BumpWorld:check(self, self.box.x, self.box.y, weaponBlastCollision);

	for i = 1, len do
		local col = cols[i];
		if col.other.monsterType == "wolf" then
			if col.other.state == "trapped" then
				col.other.state = "dead";
			end
		end
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

	love.graphics.setColor(1, 1, 1);
	love.graphics.draw(
		self.image,
		self.box.x + self.box.w / 2,
		self.box.y + self.box.h / 2,
		self.rotation,
		1,
		1,
		self.imageData.w / 2,
		self.imageData.h / 2
	);
end
