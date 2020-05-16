--[[
Hunts by sight and moves randomly.
If it sees the player, hears the shotgun, or hears another zombie groan, start hunting the player.
If can see the player, continuously pursue.
If can't see the player, pursue for a decent amount of time.

States:
Idle - Hasn't seen or heard player and player hasn't dropped meat. Randomly walk around sniffing and eating things. Avoid traps
Walk - Moving randomly around the level
Heard Noise - Has heard player. Idle for a bit, then switch to Investigating
Investigating - Has heard player or other noise. Has Idled. Is now moving towards the player.
Spotted - Sees the player. Alert for a little bit, then give chase
Active Chase - Is giving chase and can still see the player. Constantly pathfind to the node closest to the player. If the player is within range, attack the player
Passive Chase - Is giving chase and cannot see the player. Hunt player for X more seconds, then return to Idle.
Stunned - Has been shot by the shotgun. Wait for a while, then switch to Idle.
Burning - Has been shot by the shotgun, then soaked in gasoline, then set on fire. Wander aimlessly for a bit, then die
Dead - Burned. Dead
]]

Monster_Zombie = Class {
	init = function(self, parentManager, soundEffects, image, player, curFloor, x, y)
		Monster.init(self, image);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_ZOMBIE_WIDTH,
			h = MONSTER_ZOMBIE_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.eyeLights = {
			LightWorld:newLight(0, 0, 255, 0, 0, 15),
			LightWorld:newLight(0, 0, 255, 0, 0, 15)
		};

		self.eyeLights[1]:setVisible(false);
		self.eyeLights[2]:setVisible(false);

		local grid = Anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight());
		local duration = 0.3;
		self.animations = {
			["left"] = Anim8.newAnimation(grid("1-2", 1), duration),
			["down"] = Anim8.newAnimation(grid("3-4", 1), duration),
			["up"] = Anim8.newAnimation(grid("5-6", 1), duration),
			["right"] = Anim8.newAnimation(grid("7-8", 1), duration),
		};
		self.curAnimation = self.animations["down"];

		self.state = "idle";
		self.stateTimer = 5;
		self.burningTimer = MONSTER_ZOMBIE_BURN_TIMER;
		self.monsterType = "zombie";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Zombie:update(dt)
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
	elseif self.state == "heard-noise" then
		self:updateHeardNoise(dt);
	elseif self.state == "investigating" then
		self:updateInvestigating(dt);
	elseif self.state == "spotted" then
		self:updateSpotted(dt);
	elseif self.state == "active-chase" then
		self:updateActiveChase(dt);
	elseif self.state == "passive-chase" then
		self:updatePassiveChase(dt);
	elseif self.state == "stunned" then
		self:updateStunned(dt);
	elseif self.state == "burning" then
		self:updateBurning(dt);
	elseif self.state == "dead" then
		-- Do nothing
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_ZOMBIE_TURN_SPEED);
	self:updateLights(dt);
	self:updateAnimation(dt);
end

function Monster_Zombie:updateIdle(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "walk";
	end
end

function Monster_Zombie:updateWalk(dt)
	if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	-- Nothing interesting is happening. Amble around
	if self.targetPathNode == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_ZOMBIE_WALK_SPEED);
	end
end

function Monster_Zombie:updateHeardNoise(dt)
	self:resetVelocity();

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "investigating";
	end
end

function Monster_Zombie:updateInvestigating(dt)
	if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	self.target = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	if self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.audioTarget.x, self.audioTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_ZOMBIE_WALK_SPEED);
end

function Monster_Zombie:updateSpotted(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
		self.target = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
			self.soundEffects.monsterZombieGroan:seek(0);
			self.soundEffects.monsterZombieGroan:play();
			self.state = "active-chase";
		else
			self.state = "passive-chase";
		end
	end
end

function Monster_Zombie:updateActiveChase(dt)
	local seeTarget = false;

	if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
		seeTarget = true;
		self.target = {
			x = self.player.box.x,
			y = self.player.box.y
		};
	end

	if seeTarget or self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.visualTarget.x, self.visualTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_ZOMBIE_WALK_SPEED);
end

function Monster_Zombie:updatePassiveChase(dt)
	if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
		self.target = {
			x = self.player.box.x,
			y = self.player.box.y
		};

		self.soundEffects.monsterZombieGroan:seek(0);
		self.soundEffects.monsterZombieGroan:play();
		self.state = "active-chase";
		return;
	end

	if self.path == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.audioTarget.x, self.audioTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	end

	self:followPath(dt, MONSTER_ZOMBIE_WALK_SPEED);
end

function Monster_Zombie:updateStunned(dt)
	self:resetVelocity();

	if self:canSeePlayer(MONSTER_ZOMBIE_SIGHT_CONE, MONSTER_ZOMBIE_SIGHT_DISTANCE) then
		self:hasSpottedPlayer();
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "walk";
	end
end

function Monster_Zombie:updateBurning(dt)
	self:updateWalk(dt);
	self.state = "burning";

	if self.stateTimer <= 0 then
		self.state = "dead";
	end
end

function Monster_Zombie:hasSpottedPlayer()
	self.target = {
		x = self.player.box.x,
		y = self.player.box.y
	};

	self.soundEffects.spotted:seek(0);
	self.soundEffects.spotted:play();

	self.state = "spotted";
	self.stateTimer = 1;
end

function Monster_Zombie:updateLights(dt)
	-- TODO
end

function Monster_Zombie:updateAnimation(dt)
	self.curAnimation = self.animations[curAnimation];

	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		self.curAnimation:update(dt);
	else
		self.curAnimation:gotoFrame(1);
	end
end

function Monster_Zombie:draw()

end
