State_Scenario_Select = {};

function State_Scenario_Select:init()
	self.background = love.graphics.newImage("asset/image/screen/scenario-select.png");
	self.indicator = love.graphics.newImage("asset/image/screen/scenario-select-indicator.png");
	self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 50);
end

function State_Scenario_Select:enter()
	love.graphics.setBackgroundColor(0, 0, 0);
	self.indicatorVisible = true;
	self.selection = {
		x = 2,
		y = 2;
	};

	Timer.every(0.25, function()
		self.indicatorVisible = not self.indicatorVisible;
	end);
end

function State_Scenario_Select:keypressed(key, unicode)
	if key == KEY_LEFT or key == KEY_MENU_LEFT then
		self.selection.x = self.selection.x - 1;
	end

	if key == KEY_RIGHT or key == KEY_MENU_RIGHT then
		self.selection.x = self.selection.x + 1;
	end

	if key == KEY_UP or key == KEY_MENU_UP then
		self.selection.y = self.selection.y - 1;
	end

	if key == KEY_DOWN or key == KEY_MENU_DOWN then
		self.selection.y = self.selection.y + 1;
	end

	self:fixSelection();

	if key == KEY_PAUSE then
		self:selectScenario();
	end
end

function State_Scenario_Select:gamepadpressed(joystick, button)
	if button == GAMEPAD_LEFT then
		self.selection.x = self.selection.x - 1;
	end

	if button == GAMEPAD_RIGHT then
		self.selection.x = self.selection.x + 1;
	end

	if button == GAMEPAD_UP then
		self.selection.y = self.selection.y - 1;
	end

	if button == GAMEPAD_DOWN then
		self.selection.y = self.selection.y + 1;
	end

	self:fixSelection();

	if button == GAMEPAD_START or button == GAMEPAD_ITEM_USE then
		self:selectScenario();
	end
end

function State_Scenario_Select:update(dt)
	Timer.update(dt);
end

function State_Scenario_Select:fixSelection()
	if self.selection.y < 1 then
		self.selection.y = 3;
	end

	if self.selection.y > 3 then
		self.selection.y = 1;
	end

	if self.selection.y == 2 then
		if self.selection.x < 1 then
			self.selection.x = 3;
		end

		if self.selection.x > 3 then
			self.selection.x = 1;
		end
	else
		if self.selection.x < 1 then
			self.selection.x = 4;
		end

		if self.selection.x > 4 then
			self.selection.x = 1;
		end
	end
end

function State_Scenario_Select:selectScenario()
	local scenarioDescription = SCENARIO_SELECTION[self.selection.y][self.selection.x];

	if scenarioDescription == "random" then
		scenarioDescription = SCENARIO_RANDOM[love.math.random(10)];
	end

	scenarioDescription = "wolf";

	GameState.switch(State_Game, scenarioDescription)
end

function State_Scenario_Select:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();

		love.graphics.setColor(255, 255, 255);
		love.graphics.draw(self.background, 0, 0);
		love.graphics.setColor(255, 0, 0);
		love.graphics.setFont(self.titleFont);
		love.graphics.printf("Select a Threat", 0, 15, SCREEN_WIDTH, "center");

		love.graphics.print("?", 770, 315);

		local scenarioDescription = SCENARIO_SELECTION[self.selection.y][self.selection.x];
		scenarioDescription = scenarioDescription:gsub("_", " ");
		scenarioDescription = scenarioDescription:gsub("(%l)(%w*)", function(a,b) return string.upper(a) .. b end);
		love.graphics.printf(scenarioDescription, 0, 650, SCREEN_WIDTH, "center");

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