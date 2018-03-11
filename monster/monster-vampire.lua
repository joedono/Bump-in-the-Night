--[[
Moves randomly and hunts by sight.
Cannot be seen unless within range of his ability.
Moving at all while within range of his ability will freeze the player and cause the vampire to move slowly towards the player.
Attempting to move will gradually break the spell.
Holding the cross will make the player immune to the freeze and the immediate-detect effect,
allowing them to get close enough to use the stake.

States:
Idle - Hasn't seen or heard player and player hasn't dropped meat. Randomly walk around sniffing and eating things. Avoid traps
Walk - Moving randomly around the level
Spotted - Sees the player, or the player has tried to move while too close and without the cross. Freeze them, then start stalking them
Stalking - Walking slowly toward the player's last location. Bite when contact is made
Dead - Shot by player. Dead
]]

Monster_Vampire = Class {__includes = Monster,
	init = function(self, parentManager, soundEffects, image, player, curFloor, x, y)
		Monster.init(self, image);
		self.parentManager = parentManager;
		self.soundEffects = soundEffects;
		self.player = player;
		self.curFloor = curFloor;
		self.box = {
			x = x,
			y = y,
			w = MONSTER_VAMPIRE_WIDTH,
			h = MONSTER_VAMPIRE_HEIGHT
		};

		BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

		self.eyeLights = {
			LightWorld:newLight(0, 0, 255, 0, 0, 15),
			LightWorld:newLight(0, 0, 255, 0, 0, 15)
		};

		self.eyeLights[1]:setVisible(false);
		self.eyeLights[2]:setVisible(false);

		self.freezeAura = love.graphics.newImage("asset/image/noise.png");
		self.freezeAuraData = {
			x = self.box.x + self.box.w / 2,
			y = self.box.y + self.box.h / 2,
			w = self.freezeAura:getWidth(),
			h = self.freezeAura:getHeight()
		}
		self.freezeAuraTimer = Timer.new();
		self.freezeAuraRepeatTimer = Timer.new();
		self.freezeAuraEffect = {
			scale = 0,
			alpha = 255
		};

		self.freezeAuraRepeatTimer:every(1.5, function()
			self.freezeAuraTimer:clear();
			self.freezeAuraData.x = self.box.x + self.box.w / 2;
			self.freezeAuraData.y = self.box.y + self.box.h / 2;
			self.freezeAuraEffect = {
				scale = 0,
				alpha = 255
			};

			self.freezeAuraTimer:tween(1.5, self.freezeAuraEffect, {scale = 4, alpha = 0});
		end);

		local grid = Anim8.newGrid(32, 32, self.image:getWidth(), self.image:getHeight());
		local walkDuration = 0.2;
		self.animations = {
			["walk-left"] = Anim8.newAnimation(grid("1-2", 1), walkDuration),
			["walk-down"] = Anim8.newAnimation(grid("3-4", 1), walkDuration),
			["walk-up"] = Anim8.newAnimation(grid("5-6", 1), walkDuration),
			["walk-right"] = Anim8.newAnimation(grid("7-8", 1), walkDuration),
		};
		self.curAnimation = self.animations["walk-left"];

		self.freezeTarget = {};
		self.hasFrozenPlayer = false;
		self.state = "idle";
		self.stateTimer = 5;
		self.monsterType = "vampire";
		self.type = "monster";
		self.active = true;
	end
};

function Monster_Vampire:update(dt)
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
	elseif self.state == "spotted" then
		self:updateSpotted(dt);
	elseif self.state == "stalking" then
		self:updateStalking(dt);
	elseif self.state == "dead" then
		-- Do nothing
	elseif self.state == "test" then

	else
		error("Invalid State " .. self.state);
	end

	self:updateFacing(dt, MONSTER_VAMPIRE_TURN_SPEED);
	self:updateLights(dt);
	self:updateAnimation(dt);
	self.freezeAuraTimer:update(dt);
	self.freezeAuraRepeatTimer:update(dt);
end

function Monster_Vampire:updateIdle(dt)
	self:resetVelocity();
	if self:trySensePlayer() then
		return;
	end

	if self.stateTimer <= 0 then
		self.hasFrozenPlayer = false;
		self:resetPath();
		self.state = "walk";
	end
end

function Monster_Vampire:updateWalk(dt)
	if self:trySensePlayer() then
		return;
	end

	if self.targetPathNode == nil then
		local randomHunt = love.math.random(100);
		if randomHunt < MONSTER_VAMPIRE_HUNT_CHANCE then
			self.path = pathfinding.findPath(self.box.x, self.box.y, self.player.box.x, self.player.box.y, self.parentManager.pathNodes);
		else
			local finalPathNode = self.parentManager:randomPathNode();
			self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		end

		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_VAMPIRE_WALK_SPEED);
	end
end

function Monster_Vampire:updateSpotted(dt)
	self:resetVelocity();

	if self.stateTimer <= 0 then
		self:resetPath();
		self.soundEffects.monsterVampireLaugh:rewind();
		self.soundEffects.monsterVampireLaugh:play();
		self.state = "stalking";
	end
end

function Monster_Vampire:updateStalking(dt)
	if self.targetPathNode == nil then
		self.path = pathfinding.findPath(self.box.x, self.box.y, self.freezeTarget.x, self.freezeTarget.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_VAMPIRE_STALK_SPEED);
	end
end

function Monster_Vampire:followPath(dt, speed)
	local warped = false;
	self.velocity = {
		x = self.targetPathNode.origin.x - self.box.x,
		y = self.targetPathNode.origin.y - self.box.y
	};
	self.velocity.x, self.velocity.y = math.normalize(self.velocity.x, self.velocity.y);
	self.speed = speed;

	local actualX, actualY, cols, len = self:updatePosition(dt);

	for i = 1, len do
		local col = cols[i];
		if KILL_PLAYER and col.other.type == "player" and col.other.active and self.state ~= "dead" then
			col.other.active = false;

			self.soundEffects.monsterBite:rewind();
			self.soundEffects.playerDeathYell:rewind();
			self.soundEffects.monsterBite:play();
			self.soundEffects.playerDeathYell:play();

			self.parentManager.parentStateGame:loseGame();
		end

		if col.other.type == "door" then
			if not col.other.isOpen then
				col.other:open(self);
			end
		end
	end

	if self.targetPathNode ~= nil then
		local distanceTraveled = math.dist(0, 0, self.velocity.x * self.speed * dt, self.velocity.y * self.speed * dt);
		local distanceToPath = math.dist(self.box.x, self.box.y, self.targetPathNode.origin.x, self.targetPathNode.origin.y);

		if distanceToPath < distanceTraveled or distanceToPath == 0 then
			-- Reached target node. Go after next node
			self.box.x = self.targetPathNode.origin.x;
			self.box.y = self.targetPathNode.origin.y;
			BumpWorld:update(self, self.box.x, self.box.y);
			warped = true;

			if self.targetPathNode.multifloor then
				self.targetPathNode.light:setVisible(false);
			end

			self.targetPathNodeIndex = self.targetPathNodeIndex + 1;
			self.targetPathNode = self.path[self.targetPathNodeIndex];

			-- Move to other floor
			if self.targetPathNode ~= nil and self.curFloor ~= self.targetPathNode.floorIndex then
				self.box.x = self.targetPathNode.origin.x;
				self.box.y = self.targetPathNode.origin.y;
				self.curFloor = self.targetPathNode.floorIndex;
				BumpWorld:update(self, self.box.x, self.box.y);
			end

			-- Reached end of path
			if self.targetPathNode == nil then
				self:resetPath();
				self.state = "idle";
				self.stateTimer = love.math.random(2, 5);
			end
		end
	end

	if not warped then
		self.box.x = actualX;
		self.box.y = actualY;
	end

	if self.targetPathNode ~= nil and self.targetPathNode.isGoal and math.dist(self.box.x, self.box.y, self.targetPathNode.origin.x, self.targetPathNode.origin.y) < 32 then
		self:resetPath();
		self.state = "idle";
		self.stateTimer = love.math.random(2, 5);
	end
end

function Monster_Vampire:updateLights(dt)
	self:updatePathLights(dt);

	if self.state == "dead" then
		if self.eyeLights ~= nil then
			LightWorld:remove(self.eyeLights[1]);
			LightWorld:remove(self.eyeLights[2]);

			self.eyeLights = nil;
		end

		return;
	else
		self.eyeLights[1]:setPosition(self.box.x + self.box.w / 4, self.box.y + 10);
		self.eyeLights[2]:setPosition(self.box.x + self.box.w * 3/4, self.box.y + 10);

		if self.state == "spotted" or self.state == "stalking"
			or math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y) < MONSTER_VAMPIRE_EYES_PLAYER_DISTANCE then
			local facing = math.angle(0, 0, self.facing.y, self.facing.x);
			if facing < 0 then
				facing = facing + math.pi * 2;
			end

			self:updateEyeLights(facing);
		else
			self.eyeLights[1]:setVisible(false);
			self.eyeLights[2]:setVisible(false);
		end
	end
end

function Monster_Vampire:updateAnimation(dt)
	local curAnimation = self.curFacing;
	curAnimation = "walk-" .. curAnimation;

	if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
		self.curAnimation = self.animations[curAnimation];
		self.curAnimation:update(dt);
	else
		self.curAnimation = self.animations[curAnimation];
		self.curAnimation:gotoFrame(1);
	end
end

function Monster_Vampire:trySensePlayer()
	if not self.hasFrozenPlayer then
		local freezePlayer = false;

		if self:canSeePlayer(MONSTER_VAMPIRE_SIGHT_CONE, MONSTER_VAMPIRE_SIGHT_DISTANCE) then
			freezePlayer = true;
		end

		if math.dist(self.box.x, self.box.y, self.player.box.x, self.player.box.y) < MONSTER_VAMPIRE_FREEZE_DISTANCE and
			(self.player.velocity.x ~= 0 or self.player.velocity.y ~= 0)
			and self.parentManager.parentStateGame:playerHasItem("cross") == nil then
			freezePlayer = true;
		end

		if freezePlayer then
			self.freezeTarget.x = self.player.box.x;
			self.freezeTarget.y = self.player.box.y;

			self.parentManager.parentStateGame:freezePlayer();
			self.hasFrozenPlayer = true;
			self.stateTimer = 1;
			self.state = "spotted";

			return true;
		end
	end

	return false;
end

function Monster_Vampire:draw()
	if not self.active then
		return;
	end

	love.graphics.setColor(255, 255, 255);
	self.curAnimation:draw(self.image, self.box.x, self.box.y, 0, MONSTER_SCALE, MONSTER_SCALE);

	if DRAW_MONSTER_PATH and self.state ~= "dead" then
		if self.path ~= nil then
			love.graphics.setColor(255, 0, 0);
			for index, path in pairs(self.path) do
				love.graphics.rectangle("fill", path.origin.x, path.origin.y, 32, 32);
			end
		end
	end

	if DRAW_MONSTER_SENSES and self.state ~= "dead" then
		love.graphics.setColor(255, 255, 255);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_VAMPIRE_FREEZE_DISTANCE);

		love.graphics.setColor(255, 255, 255, 150);
		local facingAngle = math.angle(0, 0, self.facing.y, self.facing.x);
		love.graphics.arc("fill",
			self.box.x + self.box.w / 2, self.box.y + self.box.h / 2,
			MONSTER_VAMPIRE_SIGHT_DISTANCE,
			facingAngle - MONSTER_VAMPIRE_SIGHT_CONE / 2, facingAngle + MONSTER_VAMPIRE_SIGHT_CONE / 2
		);
	end
end

function Monster_Vampire:drawAura()
	love.graphics.setColor(0, 255, 255, self.freezeAuraEffect.alpha);
	local fax = self.freezeAuraData.x - (self.freezeAuraData.w / 2 * self.freezeAuraEffect.scale);
	local fay = self.freezeAuraData.y - (self.freezeAuraData.h / 2 * self.freezeAuraEffect.scale);

	love.graphics.draw(self.freezeAura,
		fax, fay,
		0,
		self.freezeAuraEffect.scale, self.freezeAuraEffect.scale);

	if DRAW_MONSTER_SENSES and self.state ~= "dead" then
		love.graphics.setColor(0, 255, 255);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_VAMPIRE_FREEZE_DISTANCE);
	end
end