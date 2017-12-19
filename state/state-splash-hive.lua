State_Splash_Hive = {};

function State_Splash_Hive:enter()
  self.hiveImage = love.graphics.newImage("asset/image/splash/hive.png");
  self.alphas = {
    imageAlpha = 0,
    eyeAlpha = 0,
    wordAlpha = 0
  }

  Timer.clear();
  Timer.script(function(wait)
    Timer.tween(1, self.alphas, {imageAlpha = 255, eyeAlpha = 255, wordAlpha = 255}, "in-linear");
    wait(3);
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
    love.graphics.clear();
    love.graphics.setColor(255, 255, 255, self.alphas.imageAlpha);
    love.graphics.draw(self.hiveImage, 0, 0);

    love.graphics.setColor(255, 255, 255, self.alphas.eyeAlpha);
    love.graphics.circle("fill", 0, 0, 5);
    love.graphics.circle("fill", 0, 0, 5);

    love.graphics.setColor(255, 255, 255, self.alphas.wordAlpha);
    love.graphics.print("Developed by", 0, 0);
    love.graphics.print("Little HIVE Studios", 0, 0);
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end