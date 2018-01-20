require "house/fire";

Manager_Fire = Class {
	init = function(self, parentStateGame, limits)
		self.parentStateGame = parentStateGame;
		self.limits = limits;
		self.fires = {};
		self.numFires = 0;

		self.image = love.graphics.newImage("asset/image/fire.png");
		local grid = Anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight());
		self.animation = Anim8.newAnimation(grid("1-3", "1-3"), 0.1);

		self.fireSpreadTimer = love.math.random(FIRE_SPREAD_TIMER_MIN, FIRE_SPREAD_TIMER_MAX);
	end
};

function Manager_Fire:setFire(targetX, targetY, floorIndex)
	local tileX = targetX - (targetX % TILE_SIZE);
	local tileY = targetY - (targetY % TILE_SIZE);
	local alreadyLit = false;

	for index, fire in pairs(self.fires) do
		if fire.box.x == tileX and file.box.y == tileY and fire.active then
			alreadyLit = true;
		end
	end

	if not alreadyLit then
		table.insert(self.fires, Fire(self, tileX, tileY, floorIndex));
		self.numFires = self.numFires + 1;
	end
end

function Manager_Fire:spreadFire()
	print("spreading fire");
end

function Manager_Fire:update(dt)
	local activeFires = {};
	local numFires = 0;

	for index, fire in pairs(self.fires) do
		if fire.active then
			table.insert(activeFires, fire);
			numFires = numFires + 1;
		else
			BumpWorld:remove(fire);
		end
	end

	self.fires = activeFires;
	self.numFires = numFires;

	if self.numFires > 0 then
		self.animation:update(dt);

		self.fireSpreadTimer = self.fireSpreadTimer - dt;
		if self.fireSpreadTimer < 0 then
			self:spreadFire();
			self.fireSpreadTimer = love.math.random(FIRE_SPREAD_TIMER_MIN, FIRE_SPREAD_TIMER_MAX);
		end
	end
end

function Manager_Fire:draw()
	for index, fire in pairs(self.fires) do
		self.animation:draw(self.image, fire.box.x, fire.box.y);
	end
end