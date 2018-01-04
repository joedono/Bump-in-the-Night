State_Won = {};

function State_Won:enter()
end

function State_Won:keypressed(key, unicode)
end

function State_Won:gamepadpressed(joystick, button)
end

function State_Won:update(dt)
end

function State_Won:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end