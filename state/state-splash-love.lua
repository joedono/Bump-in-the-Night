State_Splash_Love = {};

function State_Splash_Love:init()
	self.splashLib = require "lib/o-ten-one";
end

function State_Splash_Love:enter()
	self.splash = self.splashLib();
	self.splash.onDone = self.onDone;
end

function State_Splash_Love:onDone()
	love.graphics.setNewFont(14);
	GameState.switch(State_Title);
end

function State_Splash_Love:keypressed(key, unicode)
	self.splash:skip();
end

function State_Splash_Love:gamepadpressed(joystick, button)
	self.splash:skip();
end

function State_Splash_Love:update(dt)
	self.splash:update(dt);
end

function State_Splash_Love:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		self.splash:draw();
	end);

	love.graphics.setColor(1, 1, 1);
	love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end