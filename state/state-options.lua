State_Options = {};

function State_Options:init()
  self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 80);
  self.menuFont = love.graphics.newFont("asset/font/Fiendish.ttf", 16);
  self.defaultFont = love.graphics.newFont(16);
end

function State_Options:enter(previous, animate)
	love.graphics.setBackgroundColor(0, 0, 0);
  love.mouse.setVisible(true);

  self.fullScreenCheckbox = { checked = FULLSCREEN };
  self.brightnessSlider = { value = MASTER_BRIGHTNESS, min = 0, max = 255 };
  self.volumeSlider = { value = MASTER_VOLUME, min = 0, max = 1 };
  self.helpTextCheckbox = { checked = HELP_TEXT_ENABLED };

  self.keyTextLeft = { text = KEY_LEFT};
  self.keyTextRight = { text = KEY_RIGHT};
  self.keyTextUp = { text = KEY_UP };
  self.keyTextDown = { text = KEY_DOWN };
  self.keyTextRun = { text = KEY_RUN };
  self.keyTextLeftItem = { text = KEY_ITEM_LEFT };
  self.keyTextRightItem = { text = KEY_ITEM_RIGHT};
  self.keyTextUseItem = { text = KEY_ITEM_USE};
  self.keyTextFlashlight = { text = KEY_FLASHLIGHT };

  self.gamepadTextLeft = { text = GAMEPAD_LEFT};
  self.gamepadTextRight = { text = GAMEPAD_RIGHT};
  self.gamepadTextUp = { text = GAMEPAD_UP};
  self.gamepadTextDown = { text = GAMEPAD_DOWN};
  self.gamepadTextRun = { text = "N/A" };
  self.gamepadTextLeftItem = { text = GAMEPAD_ITEM_LEFT};
  self.gamepadTextRightItem = { text = GAMEPAD_ITEM_RIGHT};
  self.gamepadTextUseItem = { text = GAMEPAD_ITEM_USE};
  self.gamepadTextFlashlight = { text = GAMEPAD_FLASHLIGHT };
end

function State_Options:leave()
  love.mouse.setVisible(false);
end

function State_Options:keypressed(key, unicode)
  Suit.keypressed(key);
end

function State_Options:textinput(t)
  Suit.textinput(t);
end

function State_Options:gamepadpressed(joystick, button)
  GameState.switch(State_Title, false);
end

function State_Options:update(dt)
  Suit.layout:reset(SCREEN_WIDTH / 4 - 50, SCREEN_HEIGHT / 4 - 30, 20, 30);

  local w = SCREEN_WIDTH / 4;
  local h = 30;
  Suit.Label("Fullscreen", Suit.layout:row(w, h));
  Suit.Checkbox(self.fullScreenCheckbox, Suit.layout:col(w, h));

  Suit.layout:row(w, h);
  Suit.Label("Brightness", Suit.layout:left(w, h));
  Suit.Slider(self.brightnessSlider, Suit.layout:col(w / 2, h));

  Suit.layout:row(w, h);
  Suit.Label("Volume", Suit.layout:left(w, h));
  Suit.Slider(self.volumeSlider, Suit.layout:col(w, h));

  Suit.layout:row(w, h);
  Suit.Label("Help Text", Suit.layout:left(w, h));
  Suit.Checkbox(self.helpTextCheckbox, Suit.layout:col(w, h));

  Suit.layout:row(w, h);
  Suit.Label("Controls", Suit.layout:left(w, h));
  w = w / 3 + 15;
  local x, y, w, h = Suit.layout:col(w, h);
  local padding = 5;
  x = x - 50;
  Suit.Label("Keyboard", x + w, y, w, h);
  Suit.Label("Controller", x + (w * 2), y, w, h);
  Suit.Label("Left", x + (w + padding) * 0, y + (h + padding) * 1, w, h);
  Suit.Label("Right", x + (w + padding) * 0, y + (h + padding) * 2, w, h);
  Suit.Label("Up", x + (w + padding) * 0, y + (h + padding) * 3, w, h);
  Suit.Label("Down", x + (w + padding) * 0, y + (h + padding) * 4, w, h);
  Suit.Label("Run", x + (w + padding) * 0, y + (h + padding) * 5, w, h);
  Suit.Label("Left Item", x + (w + padding) * 0, y + (h + padding) * 6, w, h);
  Suit.Label("Right Item", x + (w + padding) * 0, y + (h + padding) * 7, w, h);
  Suit.Label("Use Item", x + (w + padding) * 0, y + (h + padding) * 8, w, h);
  Suit.Label("Flashlight", x + (w + padding) * 0, y + (h + padding) * 9, w, h);

  love.graphics.setFont(self.defaultFont);
  local offset = 1;
  Suit.Input(self.keyTextLeft, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextLeft, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextRight, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextRight, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextUp, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextUp, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextDown, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextDown, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextRun, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextRun, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextLeftItem, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextLeftItem, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextRightItem, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextRightItem, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextUseItem, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextUseItem, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
  offset = offset + 1;
  Suit.Input(self.keyTextFlashlight, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
  Suit.Input(self.gamepadTextFlashlight, x + (w + padding) * 2, y + (h + padding) * offset, w, h);

  if Suit.Button("Apply", 700, 810, 100, 30).hit then
    self:save();
  end

  if Suit.Button("Cancel", 810, 810, 100, 30).hit then
    GameState.switch(State_Title, false);
  end
end

function State_Options:save()
  -- TODO Save options to constants.lua and to save file
  print("saving");
end

function State_Options:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
    love.graphics.setFont(self.titleFont);
		love.graphics.setColor(255, 0, 0);
		love.graphics.printf("Options", 0, 10, SCREEN_WIDTH, "center");
		love.graphics.setColor(255, 255, 255, 255);
    love.graphics.rectangle("line", 480, 420, 710, 370)

    love.graphics.setFont(self.menuFont);
    Suit.draw();

    -- love.graphics.setFont(self.defaultFont);
    -- local mx, my = love.mouse.getPosition();
    -- love.graphics.print(mx .. ", " .. my, 0, 0);
	end);

	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end