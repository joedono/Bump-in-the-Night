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

		-- local lightBody = BodyLib:new(LightWorld);
		-- local shadow = PolygonShadowLib:new(lightBody, self.x, self.y, self.x + self.w, self.y + self.h);
		-- self.lightBody = lightBody;

		self.soundOpen = soundEffects.doorOpen;
		self.soundClose = soundEffects.doorClose;

		self.openedByPlayer = false;
		self.type = "door";
	end
}

function Door:open(other)
	self.isOpen = true;
	self.openTimer = DOOR_OPEN_TIMER;
	-- self.lightBody:Remove();

	if other.type == "player" then
		self.soundOpen:seek(0);
		self.soundOpen:play();
		self.openedByPlayer = true;
	end
end

function Door:update(dt)
	if self.isOpen then
		self.openTimer = self.openTimer - dt;

		if self.openTimer < 0 then
			local cols, len = BumpWorld:queryRect(self.x, self.y, self.w, self.h, doorFilter);

			if len <= 1 then
				self.isOpen = false;
				-- LightWorld:AddBody(self.lightBody);

				if self.openedByPlayer then
					self.soundClose:seek(0);
					self.soundClose:play();
				end

				self.openedByPlayer = false;
			end
		end
	end
end

function Door:draw()
	if not self.isOpen then
		love.graphics.setColor(0.5, 0.25, 0);
		love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);
	end
end
