State_Splash_Hive = {};

function State_Splash_Hive:enter()
  self.hiveImage = love.graphics.newImage("asset/image/splash/hive.png");
  self.imageScale = 0.75;

  self.imagePos = {
    x = SCREEN_WIDTH / 2 - self.hiveImage:getWidth() / 2 * self.imageScale,
    y = SCREEN_HEIGHT / 2 - self.hiveImage:getHeight() / 2 * self.imageScale
  };

  local eyePos = self.imagePos.x + 285 * self.imageScale;
  self.eyePos = {
    x1 = eyePos,
    x2 = eyePos + 20 * self.imageScale,
    y = self.imagePos.y + 370 * self.imageScale
  };

  self.wordPos = {
    y1 = self.imagePos.y + self.hiveImage:getHeight() * self.imageScale + 10,
    y2 = self.imagePos.y + self.hiveImage:getHeight() * self.imageScale + 32
  };

  self.alphas = {
    imageAlpha = 0,
    eyeAlpha = 0,
    wordAlpha = 0
  };

  Timer.clear();
  Timer.script(function(wait)
    Timer.tween(2, self.alphas, {imageAlpha = 255}, "in-linear");
    wait(2);
    Timer.tween(2, self.alphas, {eyeAlpha = 255}, "in-linear");
    wait(2);
    Timer.tween(2, self.alphas, {wordAlpha = 255}, "in-linear");
    wait(5);
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
    love.graphics.draw(self.hiveImage, self.imagePos.x, self.imagePos.y, 0, self.imageScale, self.imageScale);

    love.graphics.setColor(255, 255, 255, self.alphas.eyeAlpha);
    love.graphics.circle("fill", self.eyePos.x1, self.eyePos.y, 5);
    love.graphics.circle("fill", self.eyePos.x2, self.eyePos.y, 5);

    love.graphics.setColor(255, 255, 255, self.alphas.wordAlpha);
    love.graphics.printf("Developed by", 0, self.wordPos.y1, SCREEN_WIDTH, "center");
    love.graphics.printf("Little HIVE Studios", 0, self.wordPos.y2, SCREEN_WIDTH / 2, "center", 0, 2, 2);
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end