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
	init = function(self, parentManager, soundEffects, player, curFloor, x, y)
		Monster.init(self);
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
			w = self.freezeAura:getWidth(),
			h = self.freezeAura:getHeight()
		}
		self.freezeAuraTimer = Timer.new();
		self.freezeAuraRepeatTimer = Timer.new();
		self.freezeAuraEffect = {
			scale = 0,
			alpha = 255
		};

		self.freezeAuraRepeatTimer:every(5, function()
			self.freezeAuraTimer:clear();
			self.freezeAuraEffect = {
				scale = 0,
				alpha = 255
			};

			self.freezeAuraTimer:tween(5, self.freezeAuraEffect, {scale = 4, alpha = 0});
		end);

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
	self.freezeAuraTimer:update(dt);
	self.freezeAuraRepeatTimer:update(dt);
end

function Monster_Vampire:updateIdle(dt)
	if self:trySensePlayer() then
		return;
	end

	if self.stateTimer <= 0 then
		self:resetPath();
		self.state = "walk";
	end
end

function Monster_Vampire:updateWalk(dt)
	if self:trySensePlayer() then
		return;
	end

	if self.targetPathNode == nil then
		local finalPathNode = self.parentManager:randomPathNode();
		self.path = pathfinding.findPath(self.box.x, self.box.y, finalPathNode.origin.x, finalPathNode.origin.y, self.parentManager.pathNodes);
		self.targetPathNodeIndex = 1;
		self.targetPathNode = self.path[self.targetPathNodeIndex];
	else
		self:followPath(dt, MONSTER_VAMPIRE_WALK_SPEED);
	end
end

function Monster_Vampire:updateSpotted(dt)
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
	-- TODO Vampire following the path
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
			self.eyeLights[1]:setVisible(true);
			self.eyeLights[2]:setVisible(true);
		else
			self.eyeLights[1]:setVisible(false);
			self.eyeLights[2]:setVisible(false);
		end
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
			self.stateTimer = 3;
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

	love.graphics.setColor(100, 30, 30);
	love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.h, self.box.w);

	-- Draw eyes
	if self.state ~= "dead" then
		love.graphics.setColor(255, 0, 0);
		love.graphics.circle("fill", self.box.x + self.box.w / 4, self.box.y + 10, 5, 5);
		love.graphics.circle("fill", self.box.x + self.box.w * 3/4, self.box.y + 10, 5, 5);
	end

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
	love.graphics.draw(self.freezeAura,
		self.box.x + self.box.w / 2 - self.freezeAuraData.w * self.freezeAuraEffect.scale / 2,
		self.box.y + self.box.h / 2 - self.freezeAuraData.h * self.freezeAuraEffect.scale / 2,
		0,
		self.freezeAuraEffect.scale, self.freezeAuraEffect.scale);

	if DRAW_MONSTER_SENSES and self.state ~= "dead" then
		love.graphics.setColor(0, 255, 255);
		love.graphics.circle("line", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_VAMPIRE_FREEZE_DISTANCE);
	end
end