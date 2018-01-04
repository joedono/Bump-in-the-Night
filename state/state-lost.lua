State_Lost = {};

function State_Lost:enter()

end

function State_Lost:keypressed(key, unicode)

end

function State_Lost:gamepadpressed(joystick, button)

end

function State_Lost:update(dt)

end

function State_Lost:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();

  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end