require "lib/pathfinding";

require "house/manager-fire";
require "house/manager-ray-guns";

require "monster/base-monster"
require "monster/monster-wolf";
require "monster/monster-panther";
require "monster/monster-burglar";
require "monster/monster-arsonist";
require "monster/monster-killer";
require "monster/monster-vampire";
require "monster/monster-ghost";
require "monster/monster-alien";
require "monster/monster-zombie";

Manager_Monster = Class {
	init = function(self, parentStateGame, pathNodes, floorLimits, player, soundEffects)
		self.parentStateGame = parentStateGame;
		self.monsters = {};
		self.pathNodes = pathNodes;
		self.numPathNodes = #pathNodes;
		self.floorLimits = floorLimits;
		self.player = player;
		self.soundEffects = soundEffects;
	end
};

function Manager_Monster:spawnMonsters(scenarioId)
	self.scenarioId = scenarioId;

	local enemyImage = love.graphics.newImage("asset/image/enemy/" .. scenarioId .. ".png");
	if scenarioId == "wolf" then
		table.insert(self.monsters, Monster_Wolf(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Wolf(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Wolf(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "panther" then
		table.insert(self.monsters, Monster_Panther(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "burglar" then
		table.insert(self.monsters, Monster_Burglar(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "arsonist" then
		self.fireManager = Manager_Fire(self.floorLimits, self.parentStateGame.imageStore);
		table.insert(self.monsters, Monster_Arsonist(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "killer" then
		table.insert(self.monsters, Monster_Killer(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "vampire" then
		table.insert(self.monsters, Monster_Vampire(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "ghost" then
		table.insert(self.monsters, Monster_Ghost(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "alien" then
		self.rayManager = Manager_Ray_Guns(self, self.soundEffects);
		table.insert(self.monsters, Monster_Alien(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Alien(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "zombie" then
		table.insert(self.monsters, Monster_Zombie(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Zombie(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Zombie(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
		table.insert(self.monsters, Monster_Zombie(self, self.soundEffects, enemyImage, self.player, MONSTER_SPAWN_FLOOR, MONSTER_SPAWN_X, MONSTER_SPAWN_Y));
	elseif scenarioId == "elder_god" then
	end
end

function Manager_Monster:randomPathNode()
	return self.pathNodes[love.math.random(self.numPathNodes)];
end

function Manager_Monster:randomPathNodeInRange(x, y, range)
	local eligibleNodes = {};
	local numEligibleNodes = 0;

	for index, pathNode in pairs(self.pathNodes) do
		if math.dist(x, y, pathNode.origin.x, pathNode.origin.y) <= range then
			table.insert(eligibleNodes, pathNode);
			numEligibleNodes = numEligibleNodes + 1;
		end
	end

	return eligibleNodes[love.math.random(numEligibleNodes)];
end

function Manager_Monster:setFire(centerX, centerY, curFloor)
	self.fireManager:setFire(centerX, centerY, curFloor);
end

function Manager_Monster:update(dt)
	for index, monster in pairs(self.monsters) do
		monster:update(dt);
	end

	if self.scenarioId == "wolf" then
		self:updateWolfSpecial(dt);
	elseif self.scenarioId == "panther" then
		self:updatePantherSpecial(dt);
	elseif self.scenarioId == "arsonist" then
		self:updateArsonistSpecial(dt);
	elseif self.scenarioId == "vampire" then
		self:updateVampireSpecial(dt);
	elseif self.scenarioId == "alien" then
		self:updateAlienSpecial(dt);
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

function Manager_Monster:updateArsonistSpecial(dt)
	self.fireManager:update(dt);
end

function Manager_Monster:updateVampireSpecial(dt)
	if self.monsters[1].state == "dead" then
		self.parentStateGame:winGame();
	end
end

function Manager_Monster:updateAlienSpecial(dt)
	self.rayManager:update(dt);
end

function Manager_Monster:alertZombies(originator)
	for index, monster in pairs(self.monsters) do
		if originator == nil or monster ~= originator then
			monster:hasSpottedPlayer();
		end
	end
end

function Manager_Monster:draw()
	for index, monster in pairs(self.monsters) do
		monster:draw();
	end

	if self.scenarioId == "arsonist" then
		self.fireManager:draw();
	end
end

function Manager_Monster:drawSpecial()
	if self.scenarioId == "vampire" then
		self.monsters[1]:drawAura();
	end

	if self.scenarioId == "alien" then
		self.rayManager:draw();
	end
end
