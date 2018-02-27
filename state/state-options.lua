State_Options = {};

function State_Options:init()
  self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 80);
  self.defaultFont = love.graphics.newFont("asset/font/Fiendish.ttf", 16);
end

function State_Options:enter(previous, animate)
	love.graphics.setBackgroundColor(0, 0, 0);
  love.mouse.setVisible(true);

  self.fullScreenCheckbox = { checked = false };
  self.brightnessSlider = { value = 0, min = 0, max = 1 };
  self.volumeSlider = { value = 1, min = 0, max = 1 };
  self.helpTextCheckbox = { checked = false };
end

function State_Options:leave()
  love.mouse.setVisible(false);
end

function State_Options:keypressed(key, unicode)
  suit.keypressed(key);
end

function State_Options:textinput(t)
  suit.textinput(t);
end

function State_Options:gamepadpressed(joystick, button)
  GameState.switch(State_Title, false);
end

function State_Options:update(dt)
  Suit.layout:reset(SCREEN_WIDTH / 4, SCREEN_HEIGHT / 4, 20, 30);

  local x, y, w, h = Suit.layout:row(SCREEN_WIDTH / 4, 30)
  Suit.Label("Fullscreen", x, y, w, h);
  Suit.Checkbox(self.fullScreenCheckbox, x + w + 50, y, w, h);

  x, y, w, h = Suit.layout:row(SCREEN_WIDTH / 4, 30)
  Suit.Label("Brightness", x, y, w, h);
  Suit.Slider(self.brightnessSlider, x + w + 50, y, w, h);

  x, y, w, h = Suit.layout:row(SCREEN_WIDTH / 4, 30)
  Suit.Label("Volume", x, y, w, h);
  Suit.Slider(self.volumeSlider, x + w + 50, y, w, h);

  x, y, w, h = Suit.layout:row(SCREEN_WIDTH / 4, 30)
  Suit.Label("Help Text", x, y, w, h);
  Suit.Checkbox(self.helpTextCheckbox, x + w + 50, y, w, h);


  -- Keybindings
  -- Controller settings
end

function State_Options:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
    love.graphics.setFont(self.titleFont);
		love.graphics.setColor(255, 0, 0);
		love.graphics.printf("Options", 0, 10, SCREEN_WIDTH, "center");
		love.graphics.setColor(255, 255, 255, 255);

    love.graphics.setFont(self.defaultFont);
    Suit.draw();
	end);

	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end