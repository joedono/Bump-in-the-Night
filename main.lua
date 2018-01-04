Camera = require "lib/hump/camera";
Class = require "lib/hump/class";
GameState = require "lib/hump/gamestate";
Timer = require "lib/hump/timer";
Vector = require "lib/hump/vector";
Bump = require "lib/bump";
Inspect = require "lib/inspect";
Light = require "lib/lightWorld";

require "lib/general";
require "lib/pathfinding";

require "config/collisions";
require "config/constants";

require "state/state-splash-hive";
require "state/state-splash-love";
require "state/state-title";
require "state/state-controls";
require "state/state-scenario-select";
require "state/state-game";
require "state/state-pause";
require "state/state-losing";
require "state/state-lost";
require "state/state-winning";
require "state/state-won";

function love.load()
	love.window.setFullscreen(FULLSCREEN);
	love.mouse.setVisible(false);
	love.graphics.setDefaultFilter("nearest", "nearest");

	if DRAW_ENTIRE_HOUSE then
		SCREEN_WIDTH = SCREEN_WIDTH_WHOLE_HOUSE;
		SCREEN_HEIGHT = SCREEN_HEIGHT_WHOLE_HOUSE;
	end

  CANVAS = love.graphics.newCanvas(SCREEN_WIDTH, SCREEN_HEIGHT);

  local w = love.graphics.getWidth();
  local h = love.graphics.getHeight();
  local scaleX = 1;
  local scaleY = 1;

  if FULLSCREEN or DRAW_ENTIRE_HOUSE then
    scaleX = w / SCREEN_WIDTH;
    scaleY = h / SCREEN_HEIGHT;
  end

  CANVAS_SCALE = math.min(scaleX, scaleY);
  CANVAS_OFFSET_X = w / 2 - (SCREEN_WIDTH * CANVAS_SCALE) / 2;
  CANVAS_OFFSET_Y = h / 2 - (SCREEN_HEIGHT * CANVAS_SCALE) / 2;

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