State_Losing = {};

function State_Losing:init()
end

function State_Losing:enter()
end

function State_Losing:keypressed(key, unicode)
end

function State_Losing:gamepadpressed(joystick, button)
end

function State_Losing:update(dt)
end

function State_Losing:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end