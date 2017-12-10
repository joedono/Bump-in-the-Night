State_Title = {};

function State_Title:keypressed(key, unicode)
	GameState.switch(State_Game);
end

function State_Title:draw()
	love.graphics.printf("Bump in the Night", 0, SCREEN_HEIGHT / 2, SCREEN_WIDTH, "center");
end