require "lib/pathfinding";

require "monster/monster-wolf";

Manager_Monster = Class {
	init = function(self, paths)
		self.monsters = {};
		self.paths = paths;
		self.numPaths = #paths;
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
	table.insert(self.monsters, Monster_Wolf(self, 1, 1090, 1290));
end

function Manager_Monster:randomNode()
	return self.paths[love.math.random(self.numPaths)];
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