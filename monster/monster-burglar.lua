--[[
Hunts by sight and moves randomly.
Attacks with a knife for an instant melee kill. Can be stunned temporarily with the taser.
The cell phone must be used while he is stunned in order to win.

States:
Idle - Hasn't seen player and player hasn't called police. Randomly walk around investigating things
Walk - Moving randomly around the level
Spotted - Sees the player. Alert for a little bit, then give chase
Active Chase - Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
Called Police - Move randomly around the level faster. Randomly head directly towards the player.
Called Police Pursue - Heading directly for the player
Stunned - Stunned by the player
]]

Monster_Burglar = Class {
	init = function(self, parentManager, soundEffects, player, curFloor, x, y)
		Monster.init(self);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_BURGLAR_WIDTH,
			h = MONSTER_BURGLAR_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "burglar";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Burglar:update(dt)

end

function Monster_Burglar:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(0, 255, 0);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.h, self.box.w);

	-- Draw eyes
	if self.state ~= "stunned" then
		love.graphics.setColor(255, 0, 0);
		love.graphics.circle("fill", self.box.x + self.box.w / 4, self.box.y + 10, 5, 5);
		love.graphics.circle("fill", self.box.x + self.box.w * 3/4, self.box.y + 10, 5, 5);
	end
  --
	-- if DRAW_MONSTER_PATH and self.state ~= "stunned" then
	-- 	if self.path ~= nil then
	-- 		love.graphics.setColor(255, 0, 0);
	-- 		for index, path in pairs(self.path) do
	-- 			love.graphics.rectangle("fill", path.origin.x, path.origin.y, PATH_NODE_SIZE, PATH_NODE_SIZE);
	-- 		end
	-- 	end
	-- end
  --
	-- if DRAW_MONSTER_SENSES and self.state ~= "stunned" then
	-- 	love.graphics.setColor(255, 255, 255, 150);
	-- 	local facingAngle = math.angle(0, 0, self.facing.y, self.facing.x);
	-- 	love.graphics.arc("fill",
	-- 		self.box.x + self.box.w / 2, self.box.y + self.box.h / 2,
	-- 		MONSTER_BURGLAR_SIGHT_DISTANCE,
	-- 		facingAngle - MONSTER_BURGLAR_SIGHT_CONE / 2, facingAngle + MONSTER_BURGLAR_SIGHT_CONE / 2
	-- 	);
	-- end
end