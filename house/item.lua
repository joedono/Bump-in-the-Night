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

    self.type = "item";
    self.active = true;
	end
}

function Item:update(dt)
  if not self.active then
    return;
  end

  -- TODO Update glow timer
end

function Item:draw()
  if not self.active then
    return;
  end

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(self.worldImage, self.box.x, self.box.y, 0, ITEM_WORLD_SCALE, ITEM_WORLD_SCALE);
end