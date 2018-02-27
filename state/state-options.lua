State_Options = {};

function State_Options:init()
end

function State_Options:enter(previous, animate)
	love.graphics.setBackgroundColor(0, 0, 0);
  love.mouse.setVisible(true);
end

function State_Options:leave()
  love.mouse.setVisible(false);
end

function State_Options:keypressed(key, unicode)
  suit.keypressed(key);
end

function State_Options:textinput(t)
  suit.textinput(t);
end

function State_Options:gamepadpressed(joystick, button)
  GameState.switch(State_Title, false);
end

function State_Options:update(dt)
end

function State_Options:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
    Suit.draw();
	end);

	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end