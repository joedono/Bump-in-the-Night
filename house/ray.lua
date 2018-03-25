Ray = Class {
	init = function(self, parentManager, centerX, centerY, targetX, targetY)
    self.parentManager = parentManager;

    -- TODO Snap position and direction to grid
    self.box = {
      x = centerX,
      y = centerY,
      w = MONSTER_ALIEN_RAY_GUN_SIZE,
      h = MONSTER_ALIEN_RAY_GUN_SIZE,
    };

    self.velocity = {
      x = targetX,
      y = targetY
    };

    BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);
		self.light = LightWorld:newLight(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2, 135, 0, 255, MONSTER_ALIEN_RAY_GUN_RADIUS);

		self.type = "ray-gun";
		self.active = true;
	end
};

function Ray:update(dt)
  local dx = self.box.x + self.velocity.x * MONSTER_ALIEN_RAY_GUN_SPEED * dt;
	local dy = self.box.y + self.velocity.y * MONSTER_ALIEN_RAY_GUN_SPEED * dt;
	local actualX, actualY, cols, len =  BumpWorld:move(self, dx, dy, rayGunCollision);

  for i = 1, len do
		local col = cols[i];

    if KILL_PLAYER and col.other.type == "player" and col.other.active then
			col.other.active = false;

			self.soundEffects.rayGunImpact:rewind();
			self.soundEffects.playerDeathYell:rewind();
      self.soundEffects.rayGunImpact:play();
			self.soundEffects.playerDeathYell:play();

			self.parentManager.parentStateGame:loseGame();
		end

    if col.other.type == "wall" or col.other.type == "door" then
      self.active = false;
    end
  end

  self.box.x = actualX;
  self.box.y = actualY;

  self.light:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
end