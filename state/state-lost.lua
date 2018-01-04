State_Lost = {};

function State_Lost:init()
	self.font = love.graphics.newFont("asset/font/Fiendish.ttf", 100);
end

function State_Lost:enter()
	self.inputEnabled = false;
	self.alphas = {
		alpha = 0
	};

	Timer.clear();
	Timer.script(function(wait)
		Timer.tween(4, self.alphas, {alpha = 255}, "in-linear");
    wait(4);
		self.inputEnabled = true;
	end);
end

function State_Lost:keypressed(key, unicode)
	if not self.inputEnabled then
		return;
	end

	GameState.switch(State_Title);
end

function State_Lost:gamepadpressed(joystick, button)
	if not self.inputEnabled then
		return;
	end

	GameState.switch(State_Title);
end

function State_Lost:update(dt)
	Timer.update(dt);
end

function State_Lost:draw()
	CANVAS:renderTo(function()
    love.graphics.clear(255, 0, 0);
		love.graphics.setColor(0, 0, 0, self.alphas.alpha);
		love.graphics.printf("You lose", 0, 400, SCREEN_WIDTH, "center");
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end