-- Fired from the shotgun
Bullets = Class {
	init = function(self, x, y, dirX, dirY)

	end
}

function Bullets:update(dt)
  if not self.active then
    return;
  end

end

function Bullets:draw()
  if not self.active then
    return;
  end

end