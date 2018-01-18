require "lib/pathfinding";

require "monster/base-monster"
require "monster/monster-wolf";
require "monster/monster-panther";
require "monster/monster-burglar";
require "monster/monster-arsonist";

Manager_Monster = Class {
	init = function(self, parentStateGame, pathNodes, player, soundEffects)
		self.parentStateGame = parentStateGame;
		self.monsters = {};
		self.pathNodes = pathNodes;
		self.numPathNodes = #pathNodes;
		self.player = player;
		self.soundEffects = soundEffects;
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
	self.scenarioId = scenarioId;

	if scenarioId == "wolf" then
		table.insert(self.monsters, Monster_Wolf(self, self.soundEffects, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Wolf(self, self.soundEffects, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Wolf(self, self.soundEffects, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "panther" then
		table.insert(self.monsters, Monster_Panther(self, self.soundEffects, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "burglar" then
		table.insert(self.monsters, Monster_Burglar(self, self.soundEffects, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "arson" then
		table.insert(self.monsters, Monster_Arsonist(self, self.soundEffects, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
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
	elseif self.scenarioId == "panther" then
		self:updatePantherSpecial(dt);
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

function Manager_Monster:updatePantherSpecial(dt)
	local pantherIsDead = true;
	local pantherGoingAfterMeat = false;
	local usedMeat = self.parentStateGame:getPlacedItem("placed-meat");
	local panther = self.monsters[1];

	if panther.state == "smells-meat" then
		pantherGoingAfterMeat = true;
	end

	if panther.state ~= "dead" then
		pantherIsDead = false;
	end

	if usedMeat == nil then -- Clean up if the panther is going after the meat
		if panther.state == "smells-meat" then
			panther.state = "idle";
		end
	elseif not pantherGoingAfterMeat then -- Send the panther after the meat
		if panther.state ~= "trapped" and panther.state ~= "dead" then
			panther:resetPath();
			panther.state = "smells-meat";
			panther.smellTarget = {
				x = usedMeat.center.x,
				y = usedMeat.center.y
			};
		end
	end

	if pantherIsDead then
		self.parentStateGame:winGame();
	end
end

function Manager_Monster:draw()
	for index, monster in pairs(self.monsters) do
		monster:draw();
	end
end