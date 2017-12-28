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
	init = function(self, parent, player, curFloor, x, y)
		self.parent = parent;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_WOLF_WIDTH,
			h = MONSTER_WOLF_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.velocity = { x = 0, y = 0 };
		self.speed = 0;
    self.facing = { x = 0, y = 0 };

		self.state = "idle";
		self.stateTimer = 0;
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Wolf:update(dt)
	if not self.active then
		return;
	end

	if self.stateTimer > 0 then
		self.stateTimer = self.stateTimer - dt;
	end

	if self.state == "idle" then
		self:updateIdle(dt);
	elseif self.state == "walk" then
		self:updateWalk(dt);
	elseif self.state == "heard-player" then
		self:updateHeardPlayer(dt);
	elseif self.state == "investigating" then
		self:updateInvestigating(dt);
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

function Monster_Wolf:updateIdle(dt)
	if self:canHearPlayer() then
		self.audioTarget = {
			x = self.player.box.x + self.player.box.w / 2,
			y = self.player.box.y + self.player.box.h / 2
		};

		self.state = "heard-player";
		self.stateTimer = 2;
		return;
	end

	if self:canSeePlayer() then
		self.state = "spotted";
		return;
	end

	if self:canSmellMeat() then
		self.state = "smells-meat";
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "walk";
	end
end

-- Hasn't seen or heard player and player hasn't dropped meat. Randomly walk around sniffing and eating things. Avoid traps
function Monster_Wolf:updateWalk(dt)
	if self:canHearPlayer() then
		self.audioTarget = {
			x = self.player.box.x + self.player.box.w / 2,
			y = self.player.box.y + self.player.box.h / 2
		};

		self.state = "heard-player";
		self.stateTimer = 2;
		return;
	end

	if self:canSeePlayer() then
		self.state = "spotted";
		return;
	end

	if self:canSmellMeat() then
		self.state = "smells-meat";
		return;
	end

	-- Nothing interesting is happening. Amble around
	if self.target == nil then
		self.finalTarget = self.parent:randomNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.finalTarget.center.x, self.finalTarget.center.y, self.parent.paths);
		self.targetIndex = 1;
		self.target = self.path[self.targetIndex];
	else
		self:followPath(dt, MONSTER_WOLF_WALK_SPEED);
	end
end

-- Has heard the player. Look towards sound. If can't see player for some time, switch to alert
function Monster_Wolf:updateHeardPlayer(dt)
	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "investigating";
	end
end

-- Has heard the player. Walk towards source of sound. If still can't see player for some time, go back to idle
function Monster_Wolf:updateInvestigating(dt)
	local heardTarget = false;

	if self:canHearPlayer() then
		heardTarget = true;
		self.audioTarget = {
			x = self.player.box.x + self.player.box.w / 2,
			y = self.player.box.y + self.player.box.h / 2
		};
	end

	if self:canSeePlayer() then
		self.state = "spotted";
		return;
	end

	if self:canSmellMeat() then
		self.state = "smells-meat";
		return;
	end

	if heardTarget or self.finalTarget == nil then
		self.finalTarget = pathfinding.findClosestNode(self.audioTarget.x, self.audioTarget.y, self.parent.paths);
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.finalTarget.center.x, self.finalTarget.center.y, self.parent.paths);
		self.targetIndex = 1;
		self.target = self.path[self.targetIndex];
	end

	self:followPath(dt, MONSTER_WOLF_INVESTIGATE_SPEED);
end

-- Sees the player. Alert for a little bit, then give chase
function Monster_Wolf:updateSpotted(dt)
end

-- Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
function Monster_Wolf:updateActiveChase(dt)
end

-- Is giving chase and cannot see the player. Stop at node closest to last known player location. Downgrade to Alert when node is reached.
function Monster_Wolf:updatePassiveChase(dt)
end

-- Player has dropped meat somewhere on the floor. Walk to Meat
function Monster_Wolf:updateSmellsMeat(dt)
end

-- Reached meat that isn't in a trap. Consume meat for a time.
function Monster_Wolf:updateEating(dt)
end

-- Has walked into a beartrap. Whimper and try to free seld
function Monster_Wolf:updateTrapped(dt)
end

-- Shot by player. Dead
function Monster_Wolf:updateDead(dt)
end

function Monster_Wolf:canHearPlayer()
	local dist = math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y);

	if dist < MONSTER_WOLF_RUN_HEAR_DISTANCE and self.player.runPressed and (self.player.velocity.x > 0 or self.player.velocity.y > 0) then
		return true;
	end

	if dist < MONSTER_WOLF_WALK_HEAR_DISTANCE and not self.player.runPressed and (self.player.velocity.x > 0 or self.player.velocity.y > 0) then
		return true;
	end

	return false;
end

function Monster_Wolf:canSeePlayer()
	return false;
end

function Monster_Wolf:canSmellMeat()
	return false;
end

function Monster_Wolf:resetPath()
	self.finalTarget = nil;
	self.path = nil;
	self.targetIndex = 1;
	self.target = nil;
end

function Monster_Wolf:followPath(dt, speed)
	local warped = false;
	self.velocity = {
		x = self.target.origin.x - self.box.x,
		y = self.target.origin.y - self.box.y
	};
	self.velocity.x, self.velocity.y = math.normalize(self.velocity.x, self.velocity.y);
	self.speed = speed;

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
				if self.target ~= nil and self.curFloor ~= self.target.floorIndex then
					self.box.x = self.target.origin.x;
					self.box.y = self.target.origin.y;
					self.curFloor = self.target.floorIndex;
					BumpWorld:update(self, self.box.x, self.box.y);
					warped = true;
				end

				if self.target == nil then
					-- Reached the point where the player was last heard. Stop and idle
					self:resetPath();
					self.state = "idle";
					self.stateTimer = love.math.random(2, 5);
				end
			end
    end
	end

	if not warped then
		self.box.x = actualX;
    self.box.y = actualY;
	end
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

	if DRAW_MONSTER_PATH then
		if self.path ~= nil then
			love.graphics.setColor(255, 0, 0);
			for index, path in pairs(self.path) do
				love.graphics.rectangle("fill", path.origin.x, path.origin.y, path.origin.w, path.origin.h);
			end
		end

		if self.finalTarget ~= nil then
			love.graphics.setColor(0, 0, 255);
			love.graphics.rectangle("fill", self.finalTarget.origin.x, self.finalTarget.origin.y, self.finalTarget.origin.w, self.finalTarget.origin.h);
		end
	end

	if DRAW_MONSTER_SENSES then
		love.graphics.setColor(255, 255, 255);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_WOLF_RUN_HEAR_DISTANCE);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_WOLF_WALK_HEAR_DISTANCE);
	end

	love.graphics.setColor(255, 255, 255);
	love.graphics.print(self.state, 0, 0, 0, 12, 12);
end