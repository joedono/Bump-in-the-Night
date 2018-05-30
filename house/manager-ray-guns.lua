require "house/ray";

Manager_Ray_Guns = Class {
	init = function(self)
		self.rays = {};
		self.numRays = 0;
	end
};

function Manager_Ray_Guns:shootRayGun(x, y, targetX, targetY)
  table.insert(self.rays, Ray(self, x, y, targetX, targetY));
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
		else
			BumpWorld:remove(ray);
			LightWorld:remove(ray.light);
		end
	end

	self.rays = activeRays;
	self.numRays = numRays;
end

function Manager_Ray_Guns:draw()
  if DRAW_BOXES then
    love.graphics.setColor(135, 0, 255);
    for index, ray in pairs(self.rays) do
			ray:draw();
    end
  end
end