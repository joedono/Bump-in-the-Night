DOOR_OPEN_TIMER = 0.3;
DOOR_THICKNESS = 5;
DOOR_LENGTH = 48;

Door = Class {
	init = function(self, x, y, direction)
		self.x = x;
		self.y = y;
		self.w = 0;
		self.h = 0;
		
		if(direction == "vertical") then
			self.x = self.x + 7;
			
			self.w = DOOR_THICKNESS;
			self.h = DOOR_LENGTH;
		elseif(direction == "horizontal") then
			self.y = self.y + 7;
			
			self.w = DOOR_LENGTH;
			self.h = DOOR_THICKNESS;
		end
		
		self.isOpen = false;
		self.openTimer = 0;
		
		self.lightBody = nil;
		self.bType = "door";
	end
}

function Door:open()
	self.isOpen = true;
	self.openTimer = DOOR_OPEN_TIMER;
	self.lightBody:setShadow(false);
end

function Door:addLightBody()
	local lightBody = Light_World:newRectangle(self.x + self.w / 2, self.y + self.h / 2, self.w, self.h);
	
	lightBody:setColor(255, 255, 255);
	lightBody:setAlpha(255 * 0.2);
	
	self.lightBody = lightBody;
end

function Door:update(dt)
	if(self.isOpen) then
		self.openTimer = self.openTimer - dt;
		
		if(self.openTimer < 0) then
			local cols, len = Bump_World:queryRect(self.x, self.y, self.w, self.h);
			
			if(len <= 1) then
				self.isOpen = false;
				self.lightBody:setShadow(true);
			end
		end
	end
end

function Door:draw()
	if(not self.isOpen) then
		love.graphics.setColor(128, 64, 0);
		love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);
	end
end