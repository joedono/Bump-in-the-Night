--[[
Volume Control
Keyboard bindings
Gamepad bindings
Brightness?
Fullscreen
]]

State_Options = {};

function State_Options:init()

end

function State_Options:enter()

end

function State_Options:keypressed(key, unicode)

end

function State_Options:gamepadpressed(joystick, button)

end

function State_Options:update(dt)

end

function State_Options:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();
    love.graphics.setColor(255, 255, 255);
    love.graphics.print("Options");
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end