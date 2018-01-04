State_Losing = {};

function State_Losing:enter(from)
	self.from = from;
	self.color = {
		r = 255,
		g = 255,
		b = 255,
		a = 255
	};

	Timer.clear();
	Timer.script(function(wait)
		wait(0.1);
		self.color.g = 0;
		self.color.b = 0;
		self.color.a = 0;
		Timer.tween(4, self.color, {a = 255}, "in-linear");
    wait(4);
		self:onDone();
	end);
end

function State_Losing:onDone()
	GameState.switch(State_Lost);
end

function State_Losing:update(dt)
	Timer.update(dt);
end

function State_Losing:draw()
	self.from:draw();

	love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a);
	love.graphics.rectangle("fill", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
end