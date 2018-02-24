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

		self.light = LightWorld:newLight(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, 255, 255, 255, ITEM_WIDTH * 2/3);
		self.lightColor = { color = 255 };
		self.lightRepeatTimer = Timer.new();
		self.lightScriptTimer = Timer.new();
		self.lightTweenTimer = Timer.new();

		self.lightRepeatTimer:every(ITEM_GLOW_RATE * 2, function()
			self:resetLightTimers();
		end);
		self:resetLightTimers();

		self.lightGlowTimer = 0;
		self.lightIncreasing = true;

		self.type = "item";
		self.active = true;
	end
}

function Item:resetLightTimers()
	self.lightScriptTimer:clear();
	self.lightTweenTimer:clear();

	self.lightScriptTimer:script(function(wait)
		self.lightTweenTimer:tween(ITEM_GLOW_RATE, self.lightColor, { color = 100 }, "in-quad");
		wait(ITEM_GLOW_RATE);
		self.lightTweenTimer:tween(ITEM_GLOW_RATE, self.lightColor, { color = 255 }, "out-quad");
		wait(ITEM_GLOW_RATE);
	end);
end

function Item:pickup()
	self.active = false;
	LightWorld:remove(self.light);
	BumpWorld:remove(self);
end

function Item:update(dt)
	if not self.active then
		return;
	end

	self.lightRepeatTimer:update(dt);
	self.lightScriptTimer:update(dt);
	self.lightTweenTimer:update(dt);

	self.light:setColor(self.lightColor.color, self.lightColor.color, self.lightColor.color);
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