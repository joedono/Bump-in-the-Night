HUDManager = Class {
	init = function(self)
		self.x = 0;
		self.y = SCREEN_HEIGHT - HUD_HEIGHT;
		self.w = SCREEN_WIDTH;
		self.h = HUD_HEIGHT;
		
		self.item1 = nil;
		self.item2 = nil;
	end
}

function HUDManager:pickupItem(item)
	if(self.item1 == nil) then
		self.item1 = item;
	elseif(self.item2 == nil) then
		self.item2 = item;
	end
end

function HUDManager:draw()
	love.graphics.setColor(125, 0, 255);
	love.graphics.rectangle("fill", self.x, self.y, self.w, self.h);
	
	love.graphics.setColor(0, 0, 0);
	love.graphics.rectangle("fill", self.x + 10, self.y + 10, self.w - 20, self.h - 20);
	
	love.graphics.setColor(125, 0, 255);
	for i = 1, 3 do
		love.graphics.rectangle("fill", self.x + i * 90, self.y, 10, self.h);
	end
	
	if(self.item1 ~= nil) then
		self.item1:drawInventory(1);
	end
	
	if(self.item2 ~= nil) then
		self.item2:drawInventory(2);
	end
end