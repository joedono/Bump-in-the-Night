-- Left around to prevent the ghost from moving
Salt = Class {
	init = function(self)

	end
}

function Salt:update(dt)
	if not self.active then
		return;
	end

end

function Salt:draw()
	if not self.active then
		return;
	end

end