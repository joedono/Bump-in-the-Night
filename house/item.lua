Item = Class {
	init = function(self, x, y, itemType, worldSpritesheet, heldSpritesheet)
		self.box = {
			x = x,
			y = y,
			w = ITEM_WIDTH,
			h = ITEM_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.itemType = itemType;

		local wix = INVENTORY_MAP.world[itemType].x;
		local wiy = INVENTORY_MAP.world[itemType].y;
		local hix = INVENTORY_MAP.held[itemType].x;
		local hiy = INVENTORY_MAP.held[itemType].y;

		local worldImageData = love.image.newImageData(ITEM_IMAGE_WIDTH, ITEM_IMAGE_HEIGHT);
		local heldImageData = love.image.newImageData(INVENTORY_ITEM_WIDTH, INVENTORY_ITEM_HEIGHT);

		worldImageData:paste(worldSpritesheet,
			0,
			0,
			wix,
			wiy,
			ITEM_IMAGE_WIDTH,
			ITEM_IMAGE_HEIGHT
		);

		heldImageData:paste(heldSpritesheet,
			0,
			0,
			hix,
			hiy,
			INVENTORY_ITEM_WIDTH,
			INVENTORY_ITEM_HEIGHT
		);

		self.heldImage = love.graphics.newImage(heldImageData);
		self.worldImage = love.graphics.newImage(worldImageData);

		self.light = LightWorld:newLight(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, 255, 255, 255);
		self.glowStrength = 0;
		self.glowChange = ITEM_GLOW_RATE;

		self.type = "item";
		self.active = true;
	end
}

function Item:pickup()
	self.active = false;
	LightWorld:remove(self.light);
	BumpWorld:remove(self);
end

function Item:update(dt)
	if not self.active then
		return;
	end

	self.glowStrength = self.glowStrength + self.glowChange * dt;

	if self.glowStrength <= ITEM_WIDTH / 2 then
		self.glowStrength = ITEM_WIDTH / 2;
		self.glowChange = ITEM_GLOW_RATE;
	end

	if self.glowStrength >= ITEM_WIDTH * 2/3 then
		self.glowStrength = ITEM_WIDTH * 2/3;
		self.glowChange = -ITEM_GLOW_RATE;
	end

	self.light:setRange(self.glowStrength);
end

function Item:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(self.worldImage, self.box.x, self.box.y, 0, ITEM_WORLD_SCALE, ITEM_WORLD_SCALE);
end

function Item:drawInventory(x, y)
	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(self.heldImage, x, y);
end