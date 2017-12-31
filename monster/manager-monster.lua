require "lib/pathfinding";

require "monster/monster-wolf";

Manager_Monster = Class {
	init = function(self, parent, pathNodes, player)
		self.parent = parent;
		self.monsters = {};
		self.pathNodes = pathNodes;
		self.numPathNodes = #pathNodes;
		self.player = player;
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
	self.scenarioId = scenarioId;
	local spawnPoint = self:randomPathNode();
	table.insert(self.monsters, Monster_Wolf(self, self.player, spawnPoint.floorIndex, spawnPoint.origin.x, spawnPoint.origin.y));
	spawnPoint = self:randomPathNode();
	table.insert(self.monsters, Monster_Wolf(self, self.player, spawnPoint.floorIndex, spawnPoint.origin.x, spawnPoint.origin.y));
	spawnPoint = self:randomPathNode();
	table.insert(self.monsters, Monster_Wolf(self, self.player, spawnPoint.floorIndex, spawnPoint.origin.x, spawnPoint.origin.y));
end

function Manager_Monster:randomPathNode()
	return self.pathNodes[love.math.random(self.numPathNodes)];
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
	local wolfGoingAfterMeat = false;
	local usedMeat = self.parent:getPlacedMeat();

	for index, wolf in pairs(self.monsters) do
		if wolf.state == "smells-meat" then
			wolfGoingAfterMeat = true;
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
			if wolf.state ~= "dead" and (closestWolf == nil or math.dist(wolf.box.x, wolf.box.y, usedMeat.box.x, usedMeat.box.y) < distToClosestWolf) then
				closestWolf = wolf;
			end
		end

		if closestWolf ~= nil then
			closestWolf.state = "smells-meat";
			closestWolf.smellTarget = {
				x = usedMeat.box.x,
				y = usedMeat.box.y
			};
		end
	end
end

function Manager_Monster:draw()
	for index, monster in pairs(self.monsters) do
		monster:draw();
	end
end