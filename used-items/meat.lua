-- Left around to lure the wolf or bear into the trap
Meat = Class {
	init = function(self, x, y)

	end
}

function Meat:update(dt)
  if not self.active then
    return;
  end

end

function Meat:draw()
  if not self.active then
    return;
  end

end