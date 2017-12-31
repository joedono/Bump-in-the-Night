-- Left around to trap the wolf or bear
Trap = Class {
	init = function(self, x, y)

	end
}

function Trap:update(dt)
  if not self.active then
    return;
  end

end

function Trap:draw()
  if not self.active then
    return;
  end

end