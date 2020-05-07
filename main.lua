Anim8 = require "lib/anim8";
Camera = require "lib/hump/camera";
Class = require "lib/hump/class";
GameState = require "lib/hump/gamestate";
Timer = require "lib/hump/timer";
Vector = require "lib/hump/vector";
Bump = require "lib/bump";
Inspect = require "lib/inspect";
Suit = require "lib/suit";
Light = require "lib/lightWorld";

require "lib/general";
require "lib/pathfinding";

require "config/collisions";
require "config/constants";

require "state/state-controls-controller";
require "state/state-controls-keyboard";
require "state/state-game";
require "state/state-losing";
require "state/state-lost";
require "state/state-options";
require "state/state-pause";
require "state/state-scenario-select";
require "state/state-splash-hive";
require "state/state-splash-love";
require "state/state-title";
require "state/state-winning";
require "state/state-won";

function love.load()
	setFullscreen(FULLSCREEN);
	love.mouse.setVisible(false);
	love.graphics.setDefaultFilter("nearest", "nearest");

	loadGame();

	GameState.registerEvents();
	GameState.switch(State_Title);
end

function love.keypressed(key, unicode)
	if key == KEY_QUIT then
		love.event.quit();
	end
end

function love.gamepadpressed(joystick, button)
	if button == GAMEPAD_QUIT then
		love.event.quit();
	end
end

function setFullscreen(fullscreen)
	love.window.setFullscreen(fullscreen);

	if DRAW_ENTIRE_HOUSE then
		SCREEN_WIDTH = SCREEN_WIDTH_WHOLE_HOUSE;
		SCREEN_HEIGHT = SCREEN_HEIGHT_WHOLE_HOUSE;
	end

	CANVAS = love.graphics.newCanvas(SCREEN_WIDTH, SCREEN_HEIGHT);

	local w = love.graphics.getWidth();
	local h = love.graphics.getHeight();
	local scaleX = 1;
	local scaleY = 1;

	if fullscreen or DRAW_ENTIRE_HOUSE then
		scaleX = w / SCREEN_WIDTH;
		scaleY = h / SCREEN_HEIGHT;
	end

	CANVAS_SCALE = math.min(scaleX, scaleY);
	CANVAS_OFFSET_X = w / 2 - (SCREEN_WIDTH * CANVAS_SCALE) / 2;
	CANVAS_OFFSET_Y = h / 2 - (SCREEN_HEIGHT * CANVAS_SCALE) / 2;
end

function saveGame()
	if not LOAD_SAVE_ENABLED then
		return;
	end

	local file, errorStr = love.filesystem.newFile("data.sav");
	file:open("w");
	file:write("return " .. Inspect(SCENARIO_COMPLETED));
	file:close();

	-- TODO Save options
end

function loadGame()
	if not LOAD_SAVE_ENABLED then
		return;
	end

	local data = love.filesystem.load("data.sav");

	if data ~= nil then
		SCENARIO_COMPLETED = data();
	end

	-- TODO Load options
end
