--[[
Ray gun functions more like a grenade. When traveling initially, it is harmless. Once it reaches it's target (hits the ground),
it explodes in a shockwave that will kill the player if they touch it.
This give the player a little time to run away and not get trapped,
but will still make it difficult if the player is affected by the mind-muddling powers of the aliens.
]]

Ray = Class {
	init = function(self, parentManager, centerX, centerY, targetX, targetY, explodeEffectImage)
    self.parentManager = parentManager;
		self.soundEffects = parentManager.soundEffects;

    self.box = {
      x = centerX - MONSTER_ALIEN_RAY_GUN_SIZE / 2,
      y = centerY - MONSTER_ALIEN_RAY_GUN_SIZE / 2,
      w = MONSTER_ALIEN_RAY_GUN_SIZE,
      h = MONSTER_ALIEN_RAY_GUN_SIZE,
    };

    self.target = {
      x = targetX,
      y = targetY
    };

		self.light = LightWorld:newLight(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, 135, 0, 255, MONSTER_ALIEN_RAY_GUN_RADIUS);

		self.exploding = false;
		self.explodeEffectImage = explodeEffectImage;
		self.explodeTimer = Timer.new();
		self.explodeEffect = {
			alpha = 255,
			w = self.explodeEffectImage:getWidth(),
			h = self.explodeEffectImage:getHeight(),
			scale = 0
		};

		self.explodeTimer:tween(
			MONSTER_ALIEN_RAY_GUN_EXPLODE_TIME,
			self.explodeEffect,
			{ alpha = 0, scale = 4 },
			'linear',
			function()
				self.active = false;
			end
		);

		self.type = "ray-gun";
		self.active = true;
	end
};

function Ray:explode()
	self.exploding = true;
	LightWorld:remove(self.light);
end

function Ray:update(dt)
	if not self.active then
		return;
	end

	if self.exploding then
		self.explodeTimer:update(dt);

		local cx = self.box.x + self.box.w / 2;
		local cy = self.box.y + self.box.h / 2;
		local w = self.explodeEffect.w * self.explodeEffect.scale;
		local h = self.explodeEffect.h * self.explodeEffect.scale;

		local originX = cx - w / 2;
		local originY = cy - h / 2;

		local players, len = BumpWorld:queryRect(originX, originY, w, h, rayGunFilter);
		for i = 1, len do
			local col = cols[i];
			if KILL_PLAYER and col.other.type == "player" and col.other.active and self.active then
				col.other.active = false;

				self.soundEffects.monsterBite:rewind();
				self.soundEffects.playerDeathYell:rewind();
				self.soundEffects.monsterBite:play();
				self.soundEffects.playerDeathYell:play();

				self.parentManager.parentMonsterManager.parentStateGame:loseGame();
			end
		end
	else
		local dx = self.target.x - self.box.x;
		local dy = self.target.y - self.box.y;

		dx, dy = math.normalize(dx, dy);

		dx = dx * MONSTER_ALIEN_RAY_GUN_SPEED * dt;
		dy = dy * MONSTER_ALIEN_RAY_GUN_SPEED * dt;

	  self.box.x = self.box.x + dx;
	  self.box.y = self.box.y + dy;

	  self.light:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);

		if math.dist(self.box.x, self.box.y, self.target.x, self.target.y) < MONSTER_ALIEN_RAY_GUN_SPEED * dt then
			self:explode();
		end
	end
end

function Ray:drawSpecial()
	if not self.active then
		return;
	end

	if self.exploding then
		if DRAW_BOXES then
			love.graphics.setColor(135, 0, 255);

			local cx = self.box.x + self.box.w / 2;
			local cy = self.box.y + self.box.h / 2;
			local w = self.explodeEffect.w * self.explodeEffect.scale;
			local h = self.explodeEffect.h * self.explodeEffect.scale;

			local originX = cx - w / 2;
			local originY = cy - h / 2;

			love.graphics.rectangle("line", originX, originY, w, h);
		end

		love.graphics.setColor(135, 0, 255, self.explodeEffect.alpha);
		local fax = self.box.x + self.box.w / 2 - (self.explodeEffect.w / 2 * self.explodeEffect.scale);
		local fay = self.box.y + self.box.h / 2 - (self.explodeEffect.h / 2 * self.explodeEffect.scale);

		love.graphics.draw(self.explodeEffectImage,
			fax, fay,
			0,
			self.explodeEffect.scale, self.explodeEffect.scale);
	end
end