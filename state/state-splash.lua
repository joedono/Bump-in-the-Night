State_Splash = {};

function State_Splash:enter()
  local splash = require "lib/o-ten-one";
  self.splash = splash({fill="lighten"});
  self.splash.onDone = self.onDone;
end

function State_Splash:onDone()
  GameState.switch(State_Game, "wolf");
end

function State_Splash:keypressed(key, unicode)
  self.splash:skip();
end

function State_Splash:gamepadpressed(joystick, button)
  self.splash:skip();
end

function State_Splash:update(dt)
  self.splash:update(dt);
end

function State_Splash:draw()
	CANVAS:renderTo(function()
		self.splash:draw();
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end