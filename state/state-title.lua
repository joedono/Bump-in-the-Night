State_Title = {};

function State_Title:enter()

end

function State_Title:keypressed(key, unicode)

end

function State_Title:gamepadpressed(joystick, button)

end

function State_Title:update(dt)

end

function State_Title:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();
    love.graphics.setColor(255, 255, 255);
    love.graphics.print("Bump in the Night", 400, 300);
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end