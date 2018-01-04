require "lib/pathfinding";

require "monster/monster-wolf";

Manager_Monster = Class {
	init = function(self, parentStateGame, pathNodes, player)
		self.parentStateGame = parentStateGame;
		self.monsters = {};
		self.pathNodes = pathNodes;
		self.numPathNodes = #pathNodes;
		self.player = player;
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
	self.scenarioId = scenarioId;

	if scenarioId == "wolf" then
		local spawnPoint = self:randomPathNode();
		table.insert(self.monsters, Monster_Wolf(self, self.player, spawnPoint.floorIndex, spawnPoint.origin.x, spawnPoint.origin.y));
		spawnPoint = self:randomPathNode();
		table.insert(self.monsters, Monster_Wolf(self, self.player, spawnPoint.floorIndex, spawnPoint.origin.x, spawnPoint.origin.y));
		spawnPoint = self:randomPathNode();
		table.insert(self.monsters, Monster_Wolf(self, self.player, spawnPoint.floorIndex, spawnPoint.origin.x, spawnPoint.origin.y));
	elseif scenarioId == "bear" then
	elseif scenarioId == "burgler" then
	elseif scenarioId == "arson" then
	elseif scenarioId == "killer" then
	elseif scenarioId == "vampire" then
	elseif scenarioId == "ghost" then
	elseif scenarioId == "alien" then
	elseif scenarioId == "zombie" then
	elseif scenarioId == "elder_god" then
	end
end

function Manager_Monster:randomPathNode()
	return self.pathNodes[love.math.random(self.numPathNodes)];
end

function Manager_Monster:areEnemiesDown()
	local allEnemiesDown = true;

	if self.scenarioId == "wolf" then
		for index, monster in pairs(self.monsters) do
			if monster.state ~= "dead" then
				allEnemiesDown = false;
			end
		end
	end

	return allEnemiesDown;
end

function Manager_Monster:update(dt)
	for index, monster in pairs(self.monsters) do
		monster:update(dt);
	end

	if self.scenarioId == "wolf" then
		self:updateWolfSpecial(dt);
	end
end

function Manager_Monster:updateWolfSpecial(dt)
	local allWolvesDead = true;
	local wolfGoingAfterMeat = false;
	local usedMeat = self.parentStateGame:getPlacedItem("placed-meat");

	for index, wolf in pairs(self.monsters) do
		if wolf.state == "smells-meat" then
			wolfGoingAfterMeat = true;
		end

		if wolf.state ~= "dead" then
			allWolvesDead = false;
		end
	end

	if usedMeat == nil then -- Clean up any wolves that were going after the meat
		for index, wolf in pairs(self.monsters) do
			if wolf.state == "smells-meat" then
				wolf.state = "idle";
			end
		end
	elseif not wolfGoingAfterMeat then -- Send the closest wolf after the meat
		local closestWolf = nil;
		local distToClosestWolf = 0;

		for index, wolf in pairs(self.monsters) do
			local dist = math.dist(wolf.box.x, wolf.box.y, usedMeat.center.x, usedMeat.center.y);
			if wolf.state ~= "dead" and (closestWolf == nil or dist < distToClosestWolf) then
				distToClosestWolf = dist;
				closestWolf = wolf;
			end
		end

		if closestWolf ~= nil and closestWolf.state ~= "trapped" then
			closestWolf:resetPath();
			closestWolf.state = "smells-meat";
			closestWolf.smellTarget = {
				x = usedMeat.center.x,
				y = usedMeat.center.y
			};
		end
	end

	if allWolvesDead then
		self.parentStateGame:winGame();
	end
end

function Manager_Monster:draw()
	for index, monster in pairs(self.monsters) do
		monster:draw();
	end
end