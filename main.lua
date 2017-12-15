Camera = require "lib/hump/camera";
Class = require "lib/hump/class";
GameState = require "lib/hump/gamestate";
Vector = require "lib/hump/vector";
Bump = require "lib/bump";
Inspect = require "lib/inspect";

require "lib/general";

require "config/collisions";
require "config/constants";

require "state/state-game";

function love.load()
	love.window.setFullscreen(FULLSCREEN);

  CANVAS = love.graphics.newCanvas(SCREEN_WIDTH, SCREEN_HEIGHT);

  local w = love.graphics.getWidth();
  local h = love.graphics.getHeight();

  local scaleX = 1;
  local scaleY = 1;

  if FULLSCREEN then
    scaleX = w / SCREEN_WIDTH;
    scaleY = h / SCREEN_HEIGHT;
  end

  CANVAS_SCALE = math.min(scaleX, scaleY);

  CANVAS_OFFSET_X = w / 2 - (SCREEN_WIDTH * CANVAS_SCALE) / 2;
  CANVAS_OFFSET_Y = h / 2 - (SCREEN_HEIGHT * CANVAS_SCALE) / 2;

	love.graphics.setDefaultFilter("nearest", "nearest");

	GameState.registerEvents();
	GameState.switch(State_Game, "wolf");
end

function love.keypressed(key, unicode)
	if key == KEY_QUIT then
		love.event.quit();
	end
end