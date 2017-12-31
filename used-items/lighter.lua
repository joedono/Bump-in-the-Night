-- Used to light the zombie corpses on fire
Lighter = Class {
	init = function(self)

	end
}

function Lighter:update(dt)
  if not self.active then
    return;
  end

end

function Lighter:draw()
  if not self.active then
    return;
  end

end