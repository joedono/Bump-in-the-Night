ITEM_WIDTH = 16;
ITEM_HEIGHT = 16;
ITEM_GLOW_RATE = 5;

INVENTORY_ITEM_X = 20;
INVENTORY_ITEM_Y = 520;
INVENTORY_ITEM_WIDTH = 60;
INVENTORY_ITEM_HEIGHT = 60;

WORLD_INVENTORY_SPRITESHEET = love.image.newImageData("asset/image/world_inventory.png");
HELD_INVENTORY_SPRITESHEET = love.image.newImageData("asset/image/held_inventory.png");

INVENTORY_MAP = {
	world = {
		["meat"] = {x = 0, y = 0},
		["trap"] = {x = 16, y = 0},
		["shotgun"] = {x = 32, y = 0},
		["shotgun_rounds"] = {x = 48, y = 0},
		["taser"] = {x = 64, y = 0},
		["cellphone_dead"] = {x = 80, y = 0},
		["cellphone_live"] = {x = 0, y = 16},
		["cellphone_battery"] = {x = 16, y = 16},
		["bucket"] = {x = 32, y = 16},
		["fuse"] = {x = 48, y = 16},
		["book"] = {x = 64, y = 16},
		["cross"] = {x = 80, y = 16},
		["stake"] = {x = 0, y = 32},
		["knife"] = {x = 16, y = 32},
		["music_box"] = {x = 32, y = 32},
		["battery"] = {x = 48, y = 32},
		["foil"] = {x = 64, y = 32},
		["axe"] = {x = 80, y = 32},
		["gasoline"] = {x = 0, y = 48},
		["lighter"] = {x = 16, y = 48},
		["crystal"] = {x = 32, y = 48},
		["scroll"] = {x = 48, y = 48}
	},
	held = {
		["meat"] = {x = 0, y = 0},
		["trap"] = {x = 60, y = 0},
		["shotgun"] = {x = 120, y = 0},
		["shotgun_rounds"] = {x = 180, y = 0},
		["taser"] = {x = 240, y = 0},
		["cellphone_dead"] = {x = 300, y = 0},
		["cellphone_live"] = {x = 0, y = 60},
		["cellphone_battery"] = {x = 60, y = 60},
		["bucket"] = {x = 120, y = 60},
		["fuse"] = {x = 180, y = 60},
		["book"] = {x = 240, y = 60},
		["cross"] = {x = 300, y = 60},
		["stake"] = {x = 0, y = 120},
		["knife"] = {x = 60, y = 120},
		["music_box"] = {x = 120, y = 120},
		["battery"] = {x = 180, y = 120},
		["foil"] = {x = 240, y = 120},
		["axe"] = {x = 300, y = 120},
		["gasoline"] = {x = 0, y = 180},
		["lighter"] = {x = 60, y = 180},
		["crystal"] = {x = 120, y = 180},
		["scroll"] = {x = 180, y = 180}
	}
};

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