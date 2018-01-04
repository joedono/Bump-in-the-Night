State_Scenario_Select = {};

function State_Scenario_Select:enter()

end

function State_Scenario_Select:keypressed(key, unicode)

end

function State_Scenario_Select:gamepadpressed(joystick, button)

end

function State_Scenario_Select:update(dt)

end

function State_Scenario_Select:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();
		love.graphics.setColor(255, 255, 255, 255);
		love.graphics.print("Scenario Selection", 0, 0);
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end