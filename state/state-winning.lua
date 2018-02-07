State_Winning = {};

function State_Winning:enter(from)
	self.from = from;
	self.color = {
		r = 255,
		g = 255,
		b = 255,
		a = 0
	};

	Timer.clear();
	Timer.script(function(wait)
		Timer.tween(4, self.color, {a = 255}, "in-linear");
		wait(4);
		self:onDone();
	end);
end

function State_Winning:onDone()
	GameState.switch(State_Won);
end

function State_Winning:update(dt)
	Timer.update(dt);
end

function State_Winning:draw()
	self.from:draw();

	love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a);
	love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH * CANVAS_SCALE, SCREEN_HEIGHT * CANVAS_SCALE);
end