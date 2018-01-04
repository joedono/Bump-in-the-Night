State_Controls = {};

function State_Controls:init()
end

function State_Controls:enter()
	love.graphics.setBackgroundColor(0, 0, 0);
end

function State_Controls:keypressed(key, unicode)
end

function State_Controls:gamepadpressed(joystick, button)
end

function State_Controls:update(dt)
end

function State_Controls:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();
		love.graphics.setColor(255, 255, 255, 255);
		love.graphics.print("Controls", 0, 0);
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end