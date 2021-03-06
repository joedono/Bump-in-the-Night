State_Title = {};

function State_Title:init()
	self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 80);
	self.menuFont = love.graphics.newFont("asset/font/Fiendish.ttf", 30);

	self.soundSelectionChange = love.audio.newSource("asset/sound/menu-option-change.wav", "static");
	self.soundSelect = love.audio.newSource("asset/sound/menu-select.wav", "static");

	self.music = love.audio.newSource("asset/music/title.ogg", "stream");
	self.music:setLooping(true);
end

function State_Title:enter(previous, animate)
	love.graphics.setBackgroundColor(0, 0, 0);
	self.alphas = {
		titleAlpha = 0
	};
	self.showMenu = false;
	self.menuSelection = 1;

	self.soundSelectionChange:setVolume(MASTER_VOLUME);
	self.soundSelect:setVolume(MASTER_VOLUME);
	self.music:setVolume(MASTER_VOLUME);

	Timer.clear();

	if animate == nil then
		animate = true;
	end

	if animate then
		Timer.script(function(wait)
			Timer.tween(5, self.alphas, { titleAlpha = 1 }, "in-linear");
			wait(5);
			self.showMenu = true;
		end);
	else
		self.alphas.titleAlpha = 1;
		self.showMenu = true;
	end

	if PLAY_SOUNDS then
		self.music:play();
	end
end

function State_Title:keypressed(key, unicode)
	if not self.showMenu then
		Timer.clear();
		self.alphas.titleAlpha = 1;
		self.showMenu = true;
		return;
	end

	if key == KEY_UP or key == KEY_MENU_UP then
		self.soundSelectionChange:seek(0);
		self.soundSelectionChange:play();
		self.menuSelection = self.menuSelection - 1;
		if self.menuSelection < 1 then
			self.menuSelection = 3;
		end
	end

	if key == KEY_DOWN or key == KEY_MENU_DOWN then
		self.soundSelectionChange:seek(0);
		self.soundSelectionChange:play();
		self.menuSelection = self.menuSelection + 1;
		if self.menuSelection > 3 then
			self.menuSelection = 1;
		end
	end

	if key == KEY_PAUSE then
		self:makeSelection();
	end
end

function State_Title:gamepadpressed(joystick, button)
	if not self.showMenu then
		Timer.clear();
		self.alphas.titleAlpha = 1;
		self.showMenu = true;
		return;
	end

	if button == GAMEPAD_UP then
		self.soundSelectionChange:seek(0);
		self.soundSelectionChange:play();
		self.menuSelection = self.menuSelection - 1;
		if self.menuSelection < 1 then
			self.menuSelection = 3;
		end
	end

	if button == GAMEPAD_DOWN then
		self.soundSelectionChange:seek(0);
		self.soundSelectionChange:play();
		self.menuSelection = self.menuSelection + 1;
		if self.menuSelection > 3 then
			self.menuSelection = 1;
		end
	end

	if button == GAMEPAD_START or button == GAMEPAD_ITEM_USE then
		self:makeSelection();
	end
end

function State_Title:makeSelection()
	if self.menuSelection == 1 then
		self.soundSelect:seek(0);
		self.soundSelect:play();
		GameState.switch(State_Scenario_Select);
	elseif self.menuSelection == 2 then
		GameState.switch(State_Options);
	elseif self.menuSelection == 3 then
		love.event.quit();
	end
end

function State_Title:update(dt)
	Timer.update(dt);
end

function State_Title:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		love.graphics.setFont(self.titleFont);
		love.graphics.setColor(1, 0, 0, self.alphas.titleAlpha);
		love.graphics.printf("Bump in the Night", 0, 200, SCREEN_WIDTH, "center");
		love.graphics.setColor(1, 1, 1, 1);

		if self.showMenu then
			love.graphics.setFont(self.menuFont);

			if self.menuSelection == 1 then
				love.graphics.setColor(0.4, 0, 0);
			else
				love.graphics.setColor(1, 1, 1);
			end
			love.graphics.printf("Start Game", 0, 550, SCREEN_WIDTH, "center");

			if self.menuSelection == 2 then
				love.graphics.setColor(0.4, 0, 0);
			else
				love.graphics.setColor(1, 1, 1);
			end
			love.graphics.printf("Options", 0, 630, SCREEN_WIDTH, "center");

			if self.menuSelection == 3 then
				love.graphics.setColor(0.4, 0, 0);
			else
				love.graphics.setColor(1, 1, 1);
			end
			love.graphics.printf("Quit", 0, 710, SCREEN_WIDTH, "center");
		end
	end);

	love.graphics.setColor(1, 1, 1);
	love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end
