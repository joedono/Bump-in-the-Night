Item = Class {
	init = function(self, x, y, itemType)
		self.x = x;
		self.y = y;
		self.w = ITEM_WIDTH;
		self.h = ITEM_HEIGHT;
		self.alive = true;

		self.lightBody = nil;
		self.alive = true;
		self.glowStrength = 0;
		self.glowChange = ITEM_GLOW_RATE;

		self.itemType = itemType;
		self.bType = "item";

		local wix = INVENTORY_MAP.world[itemType].x;
		local wiy = INVENTORY_MAP.world[itemType].y;
		local hix = INVENTORY_MAP.held[itemType].x;
		local hiy = INVENTORY_MAP.held[itemType].y;

		local worldImageData = love.image.newImageData(ITEM_WIDTH, ITEM_HEIGHT);
		local heldImageData = love.image.newImageData(INVENTORY_ITEM_WIDTH, INVENTORY_ITEM_HEIGHT);

		worldImageData:paste(WORLD_INVENTORY_SPRITESHEET,
			0,
			0,
			wix,
			wiy,
			ITEM_WIDTH,
			ITEM_HEIGHT
		);

		heldImageData:paste(HELD_INVENTORY_SPRITESHEET,
			0,
			0,
			hix,
			hiy,
			INVENTORY_ITEM_WIDTH,
			INVENTORY_ITEM_HEIGHT
		);

		self.heldImage = love.graphics.newImage(heldImageData);
		self.worldImage = love.graphics.newImage(worldImageData);
	end
}

function Item:addLight()
	self.light = Light_World:newLight(self.x + self.w / 2, self.y + self.h / 2, 255, 255, 255);
end

function Item:destroy()
	self.alive = false;
	Light_World:remove(self.light);
	Bump_World:remove(self);
end

function Item:update(dt)
	if(self.alive) then
		self.glowStrength = self.glowStrength + self.glowChange * dt;

		if(self.glowStrength <= 7) then
			self.glowStrength = 7;
			self.glowChange = ITEM_GLOW_RATE;
		end

		if(self.glowStrength >= 15) then
			self.glowStrength = 15;
			self.glowChange = -ITEM_GLOW_RATE;
		end

		self.light:setRange(self.glowStrength);
	end
end

function Item:drawWorld()
	if(self.alive) then
		love.graphics.setColor(255, 255, 255);
		love.graphics.draw(self.worldImage, self.x, self.y)
	end
end

function Item:drawInventory(slot)
	love.graphics.setColor(255, 255, 255);
	local drawX = INVENTORY_ITEM_X + (slot - 1) * 90;

	love.graphics.draw(self.heldImage, drawX, INVENTORY_ITEM_Y);
end