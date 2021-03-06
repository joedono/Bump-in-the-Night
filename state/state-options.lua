State_Options = {};

function State_Options:init()
	self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 80);
	self.menuFont = love.graphics.newFont("asset/font/Fiendish.ttf", 16);
	self.defaultFont = love.graphics.newFont(16);
end

function State_Options:enter(previous)
	self.previous = previous;
	love.graphics.setBackgroundColor(0, 0, 0);
	love.mouse.setVisible(true);

	self.fullScreenCheckbox = { checked = FULLSCREEN };
	self.brightnessSlider = { value = MASTER_BRIGHTNESS, min = 0, max = 1 };
	self.volumeSlider = { value = MASTER_VOLUME, min = 0, max = 1 };
	self.helpTextCheckbox = { checked = HELP_TEXT_ENABLED };

	self.inputs = Suit.new();

	self.keyboardInputs = {
		["keyTextLeft"] = { text = KEY_LEFT },
		["keyTextRight"] = { text = KEY_RIGHT },
		["keyTextUp"] = { text = KEY_UP },
		["keyTextDown"] = { text = KEY_DOWN },
		["keyTextRun"] = { text = KEY_RUN },
		["keyTextLeftItem"] = { text = KEY_ITEM_LEFT },
		["keyTextRightItem"] = { text = KEY_ITEM_RIGHT },
		["keyTextUseItem"] = { text = KEY_ITEM_USE },
		["keyTextFlashlight"] = { text = KEY_FLASHLIGHT }
	};

	self.gamepadInputs = {
		["gamepadTextLeft"] = { text = GAMEPAD_LEFT },
		["gamepadTextRight"] = { text = GAMEPAD_RIGHT },
		["gamepadTextUp"] = { text = GAMEPAD_UP },
		["gamepadTextDown"] = { text = GAMEPAD_DOWN },
		["gamepadTextRun"] = { text = "N/A" },
		["gamepadTextLeftItem"] = { text = GAMEPAD_ITEM_LEFT },
		["gamepadTextRightItem"] = { text = GAMEPAD_ITEM_RIGHT },
		["gamepadTextUseItem"] = { text = GAMEPAD_ITEM_USE },
		["gamepadTextFlashlight"] = { text = GAMEPAD_FLASHLIGHT }
	};

	self.appliedTimer = 0;
end

function State_Options:leave()
	love.mouse.setVisible(false);
end

function State_Options:keypressed(key, unicode)
	for id, textInput in pairs(self.keyboardInputs) do
		if self.inputs:hasKeyboardFocus(id) then
			textInput.text = key;
		elseif textInput.text == key then
			textInput.text = "";
		end
	end
end

function State_Options:gamepadpressed(joystick, button)
	local setGamepad = false;
	for id, gamepadInput in pairs(self.gamepadInputs) do
		if id ~= "gamepadTextRun" and self.inputs:hasKeyboardFocus(id) then
			gamepadInput.text = button;
			setGamepad = true;
		end
	end

	if setGamepad then
		for id, gamepadInput in pairs(self.gamepadInputs) do
			if id ~= "gamepadTextRun" and not self.inputs:hasKeyboardFocus(id) and gamepadInput.text == button then
				gamepadInput.text = "";
			end
		end

		return;
	end

	if button == "b" then
		GameState.switch(State_Title, false);
	end
end

function State_Options:update(dt)
	if self.appliedTimer > 0 then
		self.appliedTimer = self.appliedTimer - dt;
	end

	self.inputs:updateMouse(love.mouse.getX() / CANVAS_SCALE, love.mouse.getY() / CANVAS_SCALE, love.mouse.isDown(1));

	self.inputs.layout:reset(SCREEN_WIDTH / 4 - 50, SCREEN_HEIGHT / 4 - 30, 20, 30);

	local w = SCREEN_WIDTH / 4;
	local h = 30;
	self.inputs:Label("Fullscreen", self.inputs.layout:row(w, h));
	self.inputs:Checkbox(self.fullScreenCheckbox, self.inputs.layout:col(w, h));

	self.inputs.layout:row(w, h);
	self.inputs:Label("Brightness", self.inputs.layout:left(w, h));
	self.inputs:Slider(self.brightnessSlider, self.inputs.layout:col(w / 2, h));

	self.inputs.layout:row(w, h);
	self.inputs:Label("Volume", self.inputs.layout:left(w, h));
	self.inputs:Slider(self.volumeSlider, self.inputs.layout:col(w, h));

	self.inputs.layout:row(w, h);
	self.inputs:Label("Help Text", self.inputs.layout:left(w, h));
	self.inputs:Checkbox(self.helpTextCheckbox, self.inputs.layout:col(w, h));

	self.inputs.layout:row(w, h);
	self.inputs:Label("Controls", self.inputs.layout:left(w, h));
	w = w / 3 + 15;
	local x, y, w, h = self.inputs.layout:col(w, h);
	local padding = 5;
	x = x - 50;
	self.inputs:Label("Keyboard", x + w, y, w, h);
	self.inputs:Label("Controller", x + (w * 2), y, w, h);
	self.inputs:Label("Left", x + (w + padding) * 0, y + (h + padding) * 1, w, h);
	self.inputs:Label("Right", x + (w + padding) * 0, y + (h + padding) * 2, w, h);
	self.inputs:Label("Up", x + (w + padding) * 0, y + (h + padding) * 3, w, h);
	self.inputs:Label("Down", x + (w + padding) * 0, y + (h + padding) * 4, w, h);
	self.inputs:Label("Run", x + (w + padding) * 0, y + (h + padding) * 5, w, h);
	self.inputs:Label("Left Item", x + (w + padding) * 0, y + (h + padding) * 6, w, h);
	self.inputs:Label("Right Item", x + (w + padding) * 0, y + (h + padding) * 7, w, h);
	self.inputs:Label("Use Item", x + (w + padding) * 0, y + (h + padding) * 8, w, h);
	self.inputs:Label("Flashlight", x + (w + padding) * 0, y + (h + padding) * 9, w, h);

	love.graphics.setFont(self.defaultFont);
	local offset = 1;
	self.inputs:Input(self.keyboardInputs["keyTextLeft"], { id = "keyTextLeft" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextLeft"], { id = "gamepadTextLeft" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextRight"], { id = "keyTextRight" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextRight"], { id = "gamepadTextRight" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextUp"], { id = "keyTextUp" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextUp"], { id = "gamepadTextUp" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextDown"], { id = "keyTextDown" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextDown"], { id = "gamepadTextDown" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextRun"], { id = "keyTextRun" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextRun"], { id = "gamepadTextRun" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextLeftItem"], { id = "keyTextLeftItem" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextLeftItem"], { id = "gamepadTextLeftItem" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextRightItem"], { id = "keyTextRightItem" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextRightItem"], { id = "gamepadTextRightItem" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextUseItem"], { id = "keyTextUseItem" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextUseItem"], { id = "gamepadTextUseItem" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);
	offset = offset + 1;
	self.inputs:Input(self.keyboardInputs["keyTextFlashlight"], { id = "keyTextFlashlight" }, x + (w + padding) * 1, y + (h + padding) * offset, w, h);
	self.inputs:Input(self.gamepadInputs["gamepadTextFlashlight"], { id = "gamepadTextFlashlight" }, x + (w + padding) * 2, y + (h + padding) * offset, w, h);

	if self.inputs:Button("Save", 700, 810, 100, 30).hit then
		self:save();
	end

	if self.inputs:Button("Close", 810, 810, 100, 30).hit then
		GameState.switch(State_Title, false);
	end
end

function State_Options:save()
	if self.fullScreenCheckbox.checked ~= FULLSCREEN then
		FULLSCREEN = self.fullScreenCheckbox.checked;
		setFullscreen(FULLSCREEN);
	end

	MASTER_BRIGHTNESS = self.brightnessSlider.value;
	MASTER_VOLUME = self.volumeSlider.value;
	HELP_TEXT_ENABLED = self.helpTextCheckbox.checked;

	self.previous.soundSelectionChange:setVolume(MASTER_VOLUME);
	self.previous.soundSelect:setVolume(MASTER_VOLUME);
	self.previous.music:setVolume(MASTER_VOLUME);

	KEY_LEFT = self.keyboardInputs["keyTextLeft"].text;
	KEY_RIGHT = self.keyboardInputs["keyTextRight"].text;
	KEY_UP = self.keyboardInputs["keyTextUp"].text;
	KEY_DOWN = self.keyboardInputs["keyTextDown"].text;
	KEY_RUN = self.keyboardInputs["keyTextRun"].text;
	KEY_ITEM_LEFT = self.keyboardInputs["keyTextLeftItem"].text;
	KEY_ITEM_RIGHT = self.keyboardInputs["keyTextRightItem"].text;
	KEY_ITEM_USE = self.keyboardInputs["keyTextUseItem"].text;
	KEY_FLASHLIGHT = self.keyboardInputs["keyTextFlashlight"].text;

	GAMEPAD_LEFT = self.gamepadInputs["gamepadTextLeft"].text;
	GAMEPAD_RIGHT = self.gamepadInputs["gamepadTextRight"].text;
	GAMEPAD_UP = self.gamepadInputs["gamepadTextUp"].text;
	GAMEPAD_DOWN = self.gamepadInputs["gamepadTextDown"].text;
	GAMEPAD_ITEM_LEFT = self.gamepadInputs["gamepadTextLeftItem"].text;
	GAMEPAD_ITEM_RIGHT = self.gamepadInputs["gamepadTextRightItem"].text;
	GAMEPAD_ITEM_USE = self.gamepadInputs["gamepadTextUseItem"].text;
	GAMEPAD_FLASHLIGHT = self.gamepadInputs["gamepadTextFlashlight"].text;

	saveGame();

	self.appliedTimer = 5;
end

function State_Options:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		love.graphics.setFont(self.titleFont);
		love.graphics.setColor(1, 0, 0);
		love.graphics.printf("Options", 0, 10, SCREEN_WIDTH, "center");
		love.graphics.setColor(1, 1, 1, 1);
		love.graphics.rectangle("line", 480, 420, 710, 370);

		love.graphics.setFont(self.menuFont);
		love.graphics.setColor(1, 1, 1);
		love.graphics.rectangle("line", 995, 250, 175, 40);
		love.graphics.setColor(1, 0, 0);
		love.graphics.printf("BUMP", 995, 253, 175, "center");
		-- love.graphics.rectangle("fill", 995, 250, 175, 40);
		love.graphics.setColor(0, 0, 0, 1 - self.brightnessSlider.value);
		love.graphics.rectangle("fill", 995, 250, 175, 40);
		self.inputs:draw();

		if self.appliedTimer > 0 then
			love.graphics.setColor(1, 1, 1, 1 * self.appliedTimer / 5);
			love.graphics.print("Saved", 765, 845);
		end
	end);

	love.graphics.setColor(1, 1, 1);
	love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end