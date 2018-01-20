require "house/fire";

Manager_Fire = Class {
	init = function(self, parentStateGame, limits)
		self.parentStateGame = parentStateGame;
		self.limits = limits;
		self.fires = {};
		self.numFires = 0;

		self.fireSpreadTimer = love.math.random(FIRE_SPREAD_TIMER_MIN, FIRE_SPREAD_TIMER_MAX);
	end
};

function Manager_Fire:setFire(targetX, targetY, floorIndex)
	local tileX = targetX - (targetX % TILE_SIZE);
	local tileY = targetY - (targetY % TILE_SIZE);
	table.insert(self.fires, Fire(self, tileX, tileY, floorIndex));
	self.numFires = self.numFires + 1;
end

function Manager_fire:spreadFire()
end

function Manager_Fire:update(dt)
	local activeFires = {};
	local numFires = 0;

	for index, fire in pairs(self.fires) do
		fire:update(dt);

		if fire.active then
			table.insert(activeFires, fire);
			numFires = numFires + 1;
		end
	end

	self.fires = activeFires;
	self.numFires = numFires;

	if self.numFires > 0 then
		self.fireSpreadTimer = self.fireSpreadTimer - dt;
		if self.fireSpreadTimer < 0 then
			self:spreadFire();
			self.fireSpreadTimer = love.math.random(FIRE_SPREAD_TIMER_MIN, FIRE_SPREAD_TIMER_MAX);
		end
	end
end

function Manager_Fire:draw()
	for index, fire in pairs(self.fires) do
		fire:draw();
	end
end