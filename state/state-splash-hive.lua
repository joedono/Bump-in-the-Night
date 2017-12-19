State_Splash_Hive = {};

function State_Splash_Hive:enter()
  Timer.clear();
  Timer.script(function(wait)

    self:onDone();
  end);
end

function State_Splash_Hive:keypressed(key, unicode)
  self:onDone();
end

function State_Splash_Hive:gamepadpressed(joystick, button)
  self:onDone();
end

function State_Splash_Hive:onDone()
  GameState.switch(State_Game, "wolf");
end

function State_Splash_Hive:update(dt)
  Timer.update(dt);
end

function State_Splash_Hive:draw()
	CANVAS:renderTo(function()

  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end