State_Winning = {};

function State_Winning:enter()

end

function State_Winning:keypressed(key, unicode)

end

function State_Winning:gamepadpressed(joystick, button)

end

function State_Winning:update(dt)

end

function State_Winning:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();

  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end