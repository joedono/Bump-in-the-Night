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

    self.origin = {
      x = centerX,
      y = centerY,
    };

    self.target = {
      x = targetX,
      y = targetY
    };

		self.exploding = false;
		self.explodeEffectImage = explodeEffectImage;
		self.explodeTimer = Timer.new();
		self.explodeEffect = {
			alpha = 1,
			w = self.explodeEffectImage:getWidth(),
			h = self.explodeEffectImage:getHeight(),
			scale = 0.1
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
	self.soundEffects.rayGunExplode:play();
end

function Ray:update(dt)
	if not self.active then
		return;
	end

	if self.exploding then
		self.explodeTimer:update(dt);

		local w = self.explodeEffect.w * self.explodeEffect.scale * 3/8;
		local h = self.explodeEffect.h * self.explodeEffect.scale * 3/8;
		local x = self.origin.x - w / 2;
		local y = self.origin.y - h / 2;

		local cols, len = BumpWorld:queryRect(x, y, w, h, rayGunFilter);
		for i = 1, len do
			local col = cols[i];
			if KILL_PLAYER and col.type == "player" and col.active and self.active then
				col.active = false;

				self.soundEffects.monsterBite:seek(0);
				self.soundEffects.playerDeathYell:seek(0);
				self.soundEffects.monsterBite:play();
				self.soundEffects.playerDeathYell:play();

				self.parentManager.parentMonsterManager.parentStateGame:loseGame();
			end
		end
	else
		local dx = self.target.x - self.origin.x;
		local dy = self.target.y - self.origin.y;

		dx, dy = math.normalize(dx, dy);

		dx = dx * MONSTER_ALIEN_RAY_GUN_SPEED * dt;
		dy = dy * MONSTER_ALIEN_RAY_GUN_SPEED * dt;

	  self.origin.x = self.origin.x + dx;
	  self.origin.y = self.origin.y + dy;

		if math.dist(self.origin.x, self.origin.y, self.target.x, self.target.y) < MONSTER_ALIEN_RAY_GUN_SPEED * dt then
			self:explode();
		end
	end
end

function Ray:draw()
	if not self.active then
		return;
	end

	if DRAW_BOXES then
		love.graphics.setColor(0.5, 0, 1);

		local w = self.explodeEffect.w * self.explodeEffect.scale * 3/8;
		local h = self.explodeEffect.h * self.explodeEffect.scale * 3/8;
		local x = self.origin.x - w / 2;
		local y = self.origin.y - h / 2;

		love.graphics.rectangle("line", x, y, w, h);
	end

	love.graphics.setColor(0.5, 0, 1, self.explodeEffect.alpha);
	local fax = self.origin.x - (self.explodeEffect.w / 2 * self.explodeEffect.scale);
	local fay = self.origin.y - (self.explodeEffect.h / 2 * self.explodeEffect.scale);

	love.graphics.draw(self.explodeEffectImage,
		fax, fay,
		0,
		self.explodeEffect.scale, self.explodeEffect.scale);
end