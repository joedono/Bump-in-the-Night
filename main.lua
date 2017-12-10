GameState = require "lib/hump/gamestate";
Class = require "lib/hump/class";
Vector = require "lib/hump/vector-light";
require "lib/general";

require "state/state_title";
require "state/state_game";

SCREEN_WIDTH = 800;
SCREEN_HEIGHT = 600;

CAMERA_LEFT_BOUND = 200;
CAMERA_RIGHT_BOUND = SCREEN_WIDTH - CAMERA_LEFT_BOUND;
CAMERA_TOP_BOUND = 200;
CAMERA_BOTTOM_BOUND = SCREEN_HEIGHT - CAMERA_TOP_BOUND;

HUD_HEIGHT = 100;

DEBUG_LIGHTING_ENABLED = true;
DEBUG_DRAW_PORTALS = true;
DEBUG_MOUSE_POSITION = true;

function love.load()
	GameState.registerEvents();
	-- GameState.switch(State_Title);
	GameState.switch(State_Game);
end

function love.mousepressed(x, y, button)
	
end

function love.mousereleased(x, y, button)
	
end

function love.keypressed(key, unicode)
	if(key == "escape") then
		love.event.quit();
	end
end

function love.keyreleased(key, unicode)
	
end

function love.focus(f)
	
end

function love.update(dt)
	
end

function love.draw()
	
end

function love.quit()
	
end