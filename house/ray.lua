--[[
Ray gun functions more like a grenade. When traveling initially, it is harmless. Once it reaches it's target (hits the ground),
it explodes in a shockwave that will kill the player if they touch it.
This give the player a little time to run away and not get trapped,
but will still make it difficult if the player is affected by the mind-muddling powers of the aliens.
]]

Ray = Class {
	init = function(self, parentManager, centerX, centerY, targetX, targetY)
    self.parentManager = parentManager;

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
		self.type = "ray-gun";
		self.active = true;
	end
};

function Ray:explode()
	self.exploding = true;
end

function Ray:update(dt)
	if not self.active then
		return;
	end

	if self.exploding then
		-- TODO
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

function Ray:draw()
	if not self.active then
		return;
	end

	if self.exploding then
		-- TODO
	else
		love.graphics.setColor(135, 0, 255);
		love.graphics.circle("fill", self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, MONSTER_ALIEN_RAY_GUN_SIZE / 2);
	end
end