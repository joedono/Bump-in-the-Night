GameState = require "lib/hump/gamestate";
Class = require "lib/hump/class";
Vector = require "lib/hump/vector";
Bump = require "lib/bump";
require "lib/general";

require "config/constants";

require "state/state-game";

function love.load()
	GameState.registerEvents();
	GameState.switch(State_Game);
end

function love.keypressed(key, unicode)
	if(key == "escape") then
		love.event.quit();
	end
end