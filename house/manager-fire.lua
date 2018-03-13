require "house/fire";

Manager_Fire = Class {
	init = function(self, limits, imageStore)
		self.limits = limits;
		self.fires = {};
		self.numFires = 0;

		self.image = imageStore.burningFire;
		local grid = Anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight());
		self.animation = Anim8.newAnimation(grid("1-3", 1), 0.1);

		self.fireSpreadTimer = 0;
	end
};

function Manager_Fire:setFire(targetX, targetY, floorIndex)
	local tileX = targetX - (targetX % TILE_SIZE);
	local tileY = targetY - (targetY % TILE_SIZE);
	local alreadyLit = false;

	for index, fire in pairs(self.fires) do
		if fire.box.x == tileX and fire.box.y == tileY and fire.active then
			alreadyLit = true;
		end
	end

	if not alreadyLit then
		table.insert(self.fires, Fire(self, tileX, tileY, floorIndex));
		self.numFires = self.numFires + 1;
	end
end

function Manager_Fire:spreadFire()
	local spreadableFires = {};

	for index, fire in pairs(self.fires) do
		local numFilled = 9;
		local limit = self.limits[fire.floorIndex];

		-- Get all adjacent fires
		local adjacentFires, len = BumpWorld:queryRect(
			fire.box.x - TILE_SIZE,
			fire.box.y - TILE_SIZE,
			fire.box.w * 3,
			fire.box.h * 3,
			fireFilter
		);

		-- Figure out what number of fires would be "full"
		if fire.box.y - TILE_SIZE < limit.y1 then
			if fire.box.x - TILE_SIZE < limit.x1 or fire.box.x + TILE_SIZE >= limit.x2 then
				-- NE or NW corner
				numFilled = 4;
			else
				-- N side
				numFilled = 6;
			end
		elseif fire.box.y + TILE_SIZE >= limit.y2 then
			if fire.box.x - TILE_SIZE < limit.x1 or fire.box.x + TILE_SIZE >= limit.x2 then
				-- SE or SW corner
				numFilled = 4;
			else
				-- S side
				numFilled = 6;
			end
		end

		if len < numFilled then
			table.insert(spreadableFires, fire);
		end
	end

	local sourceFire = spreadableFires[love.math.random(#spreadableFires)];
	local floorIndex = sourceFire.floorIndex;
	local limit = self.limits[floorIndex];
	local possibilities = {
		{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y - TILE_SIZE },
		{ x = sourceFire.box.x, y = sourceFire.box.y - TILE_SIZE },
		{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y - TILE_SIZE },
		{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y },
		{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y },
		{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y + TILE_SIZE },
		{ x = sourceFire.box.x, y = sourceFire.box.y + TILE_SIZE },
		{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y + TILE_SIZE },
	};

	if sourceFire.box.y - TILE_SIZE < limit.y1 then
		if sourceFire.box.x - TILE_SIZE < limit.x1 then
			-- NW Corner
			possibilities = {
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y },
				{ x = sourceFire.box.x, y = sourceFire.box.y + TILE_SIZE },
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y + TILE_SIZE }
			};
		elseif sourceFire.box.x + TILE_SIZE >= limit.x2 then
			-- NE corner
			possibilities = {
				{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y },
				{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y + TILE_SIZE },
				{ x = sourceFire.box.x, y = sourceFire.box.y + TILE_SIZE }
			};
		else
			-- N side
			possibilities = {
				{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y },
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y },
				{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y + TILE_SIZE },
				{ x = sourceFire.box.x, y = sourceFire.box.y + TILE_SIZE },
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y + TILE_SIZE }
			};
		end
	elseif sourceFire.box.y + TILE_SIZE >= limit.y2 then
		if sourceFire.box.x - TILE_SIZE < limit.x1 then
			-- SW Corner
			possibilities = {
				{ x = sourceFire.box.x, y = sourceFire.box.y - TILE_SIZE },
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y - TILE_SIZE },
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y }
			};
			elseif sourceFire.box.x + TILE_SIZE >= limit.x2 then
				-- SE Corner
				possibilities = {
					{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y - TILE_SIZE },
					{ x = sourceFire.box.x, y = sourceFire.box.y - TILE_SIZE },
					{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y }
				};
		else
			-- S side
			possibilities = {
				{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y - TILE_SIZE },
				{ x = sourceFire.box.x, y = sourceFire.box.y - TILE_SIZE },
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y - TILE_SIZE },
				{ x = sourceFire.box.x - TILE_SIZE, y = sourceFire.box.y },
				{ x = sourceFire.box.x + TILE_SIZE, y = sourceFire.box.y }
			};
		end
	end

	local emptyPossibilities = {};
	local adjacentFires, len = BumpWorld:queryRect(
		sourceFire.box.x - TILE_SIZE,
		sourceFire.box.y - TILE_SIZE,
		sourceFire.box.w * 3,
		sourceFire.box.h * 3,
		fireFilter
	);

	for index, possibility in pairs(possibilities) do
		local empty = true;
		for index2, adjacentFire in pairs(adjacentFires) do
			if possibility.x == adjacentFire.box.x and possibility.y == adjacentFire.box.y then
				empty = false;
			end
		end

		if empty then
			table.insert(emptyPossibilities, possibility);
		end
	end

	local finalDestination = emptyPossibilities[love.math.random(#emptyPossibilities)];
	self:setFire(finalDestination.x, finalDestination.y, floorIndex);
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
			LightWorld:remove(fire.ambientLight);
		end
	end

	self.fires = activeFires;
	self.numFires = numFires;

	if self.numFires > 0 then
		self.animation:update(dt);

		self.fireSpreadTimer = self.fireSpreadTimer - dt;
		if self.fireSpreadTimer < 0 then
			self:spreadFire();
			self.fireSpreadTimer = FIRE_SPREAD_TIMER;
		end
	end
end

function Manager_Fire:draw()
	love.graphics.setColor(255, 255, 255);

	for index, fire in pairs(self.fires) do
		self.animation:draw(self.image, fire.box.x - 8, fire.box.y - 16, 0, 1.5, 1.5);
		if DRAW_BOXES then
			love.graphics.rectangle("line", fire.box.x, fire.box.y, fire.box.w, fire.box.h);
		end
	end
end