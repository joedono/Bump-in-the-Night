Door = Class {
	init = function(self, x, y, direction, soundEffects)
		self.x = x;
		self.y = y;
		self.w = 0;
		self.h = 0;

		if direction == "vertical" then
			self.x = self.x + DOOR_OFFSET;

			self.w = DOOR_THICKNESS;
			self.h = DOOR_LENGTH;
		elseif direction == "horizontal" then
			self.y = self.y + DOOR_OFFSET;

			self.w = DOOR_LENGTH;
			self.h = DOOR_THICKNESS;
		end

		BumpWorld:add(self, self.x, self.y, self.w, self.h);

		self.isOpen = false;
		self.openTimer = 0;

		local lightBody = LightWorld:newRectangle(self.x + self.w / 2, self.y + self.h / 2, self.w, self.h);
		lightBody:setColor(255, 255, 255);
		lightBody:setAlpha(255 * 0.2);
		self.lightBody = lightBody;

		self.soundOpen = soundEffects.doorOpen;
		self.soundClose = soundEffects.doorClose;

		self.openedByPlayer = false;
		self.type = "door";
	end
}

function Door:open(other)
	self.isOpen = true;
	self.openTimer = DOOR_OPEN_TIMER;
	self.lightBody:setShadow(false);

	if other.type == "player" then
		self.soundOpen:rewind();
		self.soundOpen:play();
		self.openedByPlayer = true;
	end
end

function Door:update(dt)
	if self.isOpen then
		self.openTimer = self.openTimer - dt;

		if self.openTimer < 0 then
			local cols, len = BumpWorld:queryRect(self.x, self.y, self.w, self.h);

			if len <= 1 then
				self.isOpen = false;
				self.lightBody:setShadow(true);

				if self.openedByPlayer then
					self.soundClose:rewind();
					self.soundClose:play();
				end

				self.openedByPlayer = false;
			end
		end
	end
end

function Door:draw()
	if not self.isOpen then
		love.graphics.setColor(128, 64, 0);
		love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);
	end
end