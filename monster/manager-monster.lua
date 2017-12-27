Manager_Monster = Class {
	init = function(self)
		self.monsters = {};
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
	-- TODO
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