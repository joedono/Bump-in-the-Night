require "lib/pathfinding";

require "monster/monster-wolf";

Manager_Monster = Class {
	init = function(self, nodes, player)
		self.monsters = {};
		self.nodes = nodes;
		self.numNodes = #nodes;
		self.player = player;
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
	table.insert(self.monsters, Monster_Wolf(self, self.player, 1, 1090, 1290));
end

function Manager_Monster:randomNode()
	return self.nodes[love.math.random(self.numNodes)];
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