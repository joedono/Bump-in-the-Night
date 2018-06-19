require "house/ray";

Manager_Ray_Guns = Class {
	init = function(self, parentMonsterManager, soundEffects)
		self.parentMonsterManager = parentMonsterManager;
		self.soundEffects = soundEffects;

		self.rays = {};
		self.rayExplodeImage = love.graphics.newImage("asset/image/noise.png");
	end
};

function Manager_Ray_Guns:shootRayGun(x, y, targetX, targetY)
  table.insert(self.rays, Ray(self, x, y, targetX, targetY, self.rayExplodeImage));
	-- TODO Play ray gun sound effect
end

function Manager_Ray_Guns:update(dt)
	local activeRays = {};

	for index, ray in pairs(self.rays) do
		if ray.active then
      ray:update(dt);
			table.insert(activeRays, ray);
		end
	end

	self.rays = activeRays;
end

function Manager_Ray_Guns:draw()
	for index, ray in pairs(self.rays) do
		ray:draw();
	end
end