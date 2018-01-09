State_Scenario_Select = {};

function State_Scenario_Select:init()
	self.background = love.graphics.newImage("asset/image/screen/scenario-select.png");
	self.indicator = love.graphics.newImage("asset/image/screen/scenario-select-indicator.png");
	self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 50);

	self.soundSelectionChange = love.audio.newSource("asset/sound/menu-option-change.wav", "static");
	self.soundSelect = love.audio.newSource("asset/sound/menu-select.wav", "static");
end

function State_Scenario_Select:enter(previous)
	self.previous = previous;
	love.graphics.setBackgroundColor(0, 0, 0);
	self.indicatorVisible = true;
	self.scenarioDescription = "Random";
	self.selection = {
		x = 2,
		y = 2;
	};

	Timer.every(0.25, function()
		self.indicatorVisible = not self.indicatorVisible;
	end);
end

function State_Scenario_Select:keypressed(key, unicode)
	local x = self.selection.x;
	local y = self.selection.y;
	local pressed = nil;

	if key == KEY_LEFT or key == KEY_MENU_LEFT then
		x = x - 1;
		pressed = "left";
	end

	if key == KEY_RIGHT or key == KEY_MENU_RIGHT then
		x = x + 1;
		pressed = "right";
	end

	if key == KEY_UP or key == KEY_MENU_UP then
		y = y - 1;
		pressed = "up";
	end

	if key == KEY_DOWN or key == KEY_MENU_DOWN then
		y = y + 1;
		pressed = "down";
	end

	if pressed ~= nil then
		self:updateSelection(x, y, pressed);
	end

	if key == KEY_PAUSE then
		self:selectScenario();
	end
end

function State_Scenario_Select:gamepadpressed(joystick, button)
	local x = self.selection.x;
	local y = self.selection.y;
	local pressed = nil;

	if button == GAMEPAD_LEFT then
		x = x - 1;
		pressed = "left";
	end

	if button == GAMEPAD_RIGHT then
		x = x + 1;
		pressed = "right";
	end

	if button == GAMEPAD_UP then
		y = y - 1;
		pressed = "up";
	end

	if button == GAMEPAD_DOWN then
		y = y + 1;
		pressed = "down";
	end

	if pressed ~= nil then
		self:updateSelection(x, y, pressed);
	end

	if button == GAMEPAD_START or button == GAMEPAD_ITEM_USE then
		self:selectScenario();
	end
end

function State_Scenario_Select:leave()
	self.previous.music:stop();
end

function State_Scenario_Select:update(dt)
	Timer.update(dt);
end

function State_Scenario_Select:updateSelection(x, y, pressed)
	if y < 1 then
		y = 3;
	end

	if y > 3 then
		y = 1;
	end

	if y == 2 then
		if x < 1 then
			x = 3;
		end

		if x > 3 then
			if pressed == "up" or pressed == "down" then
				x = 3;
			else
				x = 1;
			end
		end
	else
		if x < 1 then
			x = 4;
		end

		if x > 4 then
			x = 1;
		end
	end

	local scenarioDescription = SCENARIO_SELECTION[y][x];
	local unlocked = false;

	for index, scenario in pairs(SCENARIO_COMPLETED) do
		if scenario == scenarioDescription then
			unlocked = true;
		end
	end

	if scenarioDescription == "random" or unlocked then
		scenarioDescription = scenarioDescription:gsub("_", " ");
		scenarioDescription = scenarioDescription:gsub("(%l)(%w*)", function(a,b) return string.upper(a) .. b end);
	else
		scenarioDescription = "LOCKED";
	end

	self.scenarioDescription = scenarioDescription;

	self.selection.x = x;
	self.selection.y = y;

	self.soundSelectionChange:rewind();
	self.soundSelectionChange:play();
end

function State_Scenario_Select:selectScenario()
	local scenarioDescription = SCENARIO_SELECTION[self.selection.y][self.selection.x];

	local unlocked = false;

	for index, scenario in pairs(SCENARIO_COMPLETED) do
		if scenario == scenarioDescription then
			unlocked = true;
		end
	end

	if scenarioDescription == "random" then
		scenarioDescription = self:chooseRandomLockedScenario();
	elseif not unlocked then
		-- TODO Play locked noise or something
		return;
	end

	self.soundSelect:rewind();
	self.soundSelect:play();
	GameState.switch(State_Game, scenarioDescription)
end

function State_Scenario_Select:chooseRandomLockedScenario()
	local lockedScenarios = {};

	for index, availableScenario in pairs(SCENARIO_ALL) do
		local locked = true;
		for index2, completedScenario in pairs(SCENARIO_COMPLETED) do
			if availableScenario == completedScenario then
				locked = false;
			end
		end

		if locked then
			table.insert(lockedScenarios, availableScenario);
		end
	end

	return lockedScenarios[love.math.random(#lockedScenarios)];
end

function State_Scenario_Select:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();

		love.graphics.setColor(255, 255, 255);
		love.graphics.draw(self.background, 0, 0);
		love.graphics.setColor(255, 0, 0);
		love.graphics.setFont(self.titleFont);
		love.graphics.printf("Choose Your Threat", 0, 15, SCREEN_WIDTH, "center");

		love.graphics.print("?", 770, 315);

		love.graphics.printf(self.scenarioDescription, 0, 650, SCREEN_WIDTH, "center");

		if self.indicatorVisible then
			love.graphics.setColor(255, 255, 255);
			local x = 499;
			local y = 147 + (self.selection.y-1) * 151;
			if self.selection.y == 2 then
				x = 571;
			end
			x = x + (self.selection.x-1) * 151;

			love.graphics.draw(self.indicator, x, y);
		end
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end