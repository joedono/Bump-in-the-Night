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
	init = function(self, parent, curFloor, x, y)
		self.parent = parent;
		self.curFloor = curFloor;
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
		self.type = "monster";
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
	if self:canHearPlayer() then
		self.state == "alert";
		return;
	end

	if self:canSeePlayer() then
		self.state == "spotted";
		return;
	end

	if self:canSmellMeat() then
		self.state == "smells-meat";
		return;
	end

	-- Nothing interesting is happening. Amble around
	if self.target == nil then
		local finalTarget = self.parent:randomNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalTarget.center.x, finalTarget.center.x, nodes);
		self.targetIndex = 1;
		self.target = self.path[self.targetIndex];
	else
		self.velocity = {
			x = self.target.origin.x - self.box.x,
			y = self.target.origin.y - self.box.y
		};
		self.velocity.x, self.velocity.y = math.normalize(self.velocity.x, self.velocity.y);
		self.speed = MONSTER_WOLF_IDLE_SPEED;

		local actualX, actualY, cols, len = self:updatePosition(dt);

		for i = 1, len do
	    local col = cols[i];
	    if col.other.type == "door" then
	      if not col.other.isOpen then
	        col.other:open();
	      end
	    end

	    if col.other.type == "path" then
	      if col.other.floorIndex == self.target.floorIndex and col.other.source.id == self.target.source.id then
					-- Reached target node. Go after next node
					self.targetIndex = self.targetIndex + 1;
					self.target = self.path[self.targetIndex];

					-- Move to other floor
					if self.curFloor ~= self.target.floorIndex then
						self.box.x = self.target.origin.x;
						self.box.y = self.target.origin.y;
						BumpWorld:update(self, self.box.x, self.box.y);
				end
	    end
	  end

		self.box.x = actualX;
    self.box.y = actualY;
	end
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

function Monster_Wolf:canHearPlayer()
	return false;
end

function Monster_Wolf:canSeePlayer()
	return false;
end

function Monster_Wolf:canSmellMeat()
	return false;
end

function Monster_Wolf:updatePosition(dt)
	local dx = self.box.x + self.velocity.x * self.speed * dt;
  local dy = self.box.y + self.velocity.y * self.speed * dt;

	return BumpWorld:move(self, dx, dy, monsterCollision);
end

function Monster_Wolf:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.h, self.box.w);
end