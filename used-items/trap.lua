-- Left around to trap the wolf or panther
Trap = Class {
	init = function(self, x, y, spriteSheet)
		self.box = {
			x = x - INVENTORY_ITEM_WIDTH / 2,
			y = y - INVENTORY_ITEM_HEIGHT / 2,
			w = INVENTORY_ITEM_WIDTH,
			h = INVENTORY_ITEM_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		local ix = INVENTORY_MAP.held["trap"].x;
		local iy = INVENTORY_MAP.held["trap"].y;
		local imageData = love.image.newImageData(INVENTORY_ITEM_WIDTH, INVENTORY_ITEM_HEIGHT);

		imageData:paste(spriteSheet,
			0,
			0,
			ix,
			iy,
			INVENTORY_ITEM_WIDTH,
			INVENTORY_ITEM_HEIGHT
		);

		self.image = love.graphics.newImage(imageData);

		self.type = "placed-trap";
		self.active = true;
	end
}

function Trap:update(dt)
	if not self.active then
		return;
	end


end

function Trap:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(self.image, self.box.x, self.box.y);
end