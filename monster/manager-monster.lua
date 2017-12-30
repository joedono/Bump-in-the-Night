require "lib/pathfinding";

require "monster/monster-wolf";

Manager_Monster = Class {
	init = function(self, pathNodes, player)
		self.monsters = {};
		self.pathNodes = pathNodes;
		self.numPathNodes = #pathNodes;
		self.player = player;
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
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
end

function Manager_Monster:draw()
	for index, monster in pairs(self.monsters) do
		monster:draw();
	end
end