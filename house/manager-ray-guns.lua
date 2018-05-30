require "house/ray";

Manager_Ray_Guns = Class {
	init = function(self, parentMonsterManager, soundEffects)
		self.parentMonsterManager = parentMonsterManager;
		self.soundEffects = soundEffects;

		self.rays = {};
		self.numRays = 0;
		self.rayExplodeImage = love.graphics.newImage("asset/image/noise.png");
	end
};

function Manager_Ray_Guns:shootRayGun(x, y, targetX, targetY)
  table.insert(self.rays, Ray(self, x, y, targetX, targetY, self.rayExplodeImage));
  self.numRays = self.numRays + 1;
end

function Manager_Ray_Guns:update(dt)
	local activeRays = {};
	local numRays = 0;

	for index, ray in pairs(self.rays) do
		if ray.active then
      ray:update(dt);
			table.insert(activeRays, ray);
			numRays = numRays + 1;
		end
	end

	self.rays = activeRays;
	self.numRays = numRays;
end

function Manager_Ray_Guns:draw()
	for index, ray in pairs(self.rays) do
		ray:draw();
	end
end