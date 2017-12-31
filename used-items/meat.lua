-- Left around to lure the wolf or bear into the trap
Meat = Class {
	init = function(self)

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