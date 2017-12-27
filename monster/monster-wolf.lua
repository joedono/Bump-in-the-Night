--[[
States:
Idle - Hasn't seen or heard player and player hasn't dropped meat. Randomly walk around sniffing and eating things. Avoid traps
Alert - Has heard the player. Look towards sound. If can't see player for some time, walk towards source of sound. If still can't see player for some time, go back to idle
Spotted - Sees the player. Alert for a little bit, then give chase
Active Chase - Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
Passive Chase - Is giving chase and cannot see the player. Stop at node closest to last known player location. Downgrade to Alert when node is reached.
Smells Meat - Player has dropped meat somewhere on the floor. Walk to Meat
Eating - Reached meat that isn't in a trap. Consume meat for a time.
Trapped - Has walked into a beartrap. Whimper and try to free seld
Dead - Shot by player. Dead
]]

Monster_Wolf = Class {
	init = function(self, x, y)
		self.box = {
			x = x,
			y = y,
			w = MONSTER_WOLF_WIDTH,
			h = MONSTER_WOLF_HEIGHT
		};

		self.velocity = { x = 0, y = 0 };
		self.speed = 0;
    self.facing = { x = 0, y = 0 };

    BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.state = "idle";
		self.type = "wolf";
		self.active = true;
	end
};

function Monster_Wolf:update(dt)
	if not self.active then
		return;
	end

	if self.state == "idle" then
		self:updateIdle(dt);
	elseif self.state == "alert" then
		self:updateAlert(dt);
	elseif self.state == "spotted" then
		self:updateSpotted(dt);
	elseif self.state == "active-chase" then
		self:updateActiveChase(dt);
	elseif self.state == "passive-chase" then
		self:updatePassiveChase(dt);
	elseif self.state == "smells-meat" then
		self:updateSmellsMeat(dt);
	elseif self.state == "eating" then
		self:updateEating(dt);
	elseif self.state == "trapped" then
		self:updateTrapped(dt);
	elseif self.state == "dead" then
		self:updateDead(dt);
	else
		error("Invalid State " .. self.state);
	end
end

-- Hasn't seen or heard player and player hasn't dropped meat. Randomly walk around sniffing and eating things. Avoid traps
function Monster_wolf:updateIdle(dt)
end

-- Has heard the player. Look towards sound. If can't see player for some time, walk towards source of sound. If still can't see player for some time, go back to idle
function Monster_wolf:updateAlert(dt)
end

-- Sees the player. Alert for a little bit, then give chase
function Monster_wolf:updateSpotted(dt)
end

-- Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
function Monster_wolf:updateActiveChase(dt)
end

-- Is giving chase and cannot see the player. Stop at node closest to last known player location. Downgrade to Alert when node is reached.
function Monster_wolf:updatePassiveChase(dt)
end

-- Player has dropped meat somewhere on the floor. Walk to Meat
function Monster_wolf:updateSmellsMeat(dt)
end

-- Reached meat that isn't in a trap. Consume meat for a time.
function Monster_wolf:updateEating(dt)
end

-- Has walked into a beartrap. Whimper and try to free seld
function Monster_Wolf:updateTrapped(dt)
end

-- Shot by player. Dead
function Monster_wolf:updateDead(dt)
end

function Monster_Wolf:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.h, self.box.w);
end