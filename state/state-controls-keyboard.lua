State_Controls_Keyboard = {};

function State_Controls_Keyboard:init()
	self.image = love.graphics.newImage("asset/image/screen/controls-keyboard.png");
	self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 30);
	self.controlsFont = love.graphics.newFont("asset/font/Fiendish.ttf", 16);
end

function State_Controls_Keyboard:enter()
	love.graphics.setBackgroundColor(0, 0, 0);
end

function State_Controls_Keyboard:keypressed(key, unicode)
	GameState.switch(State_Title, false);
end

function State_Controls_Keyboard:gamepadpressed(joystick, button)
	GameState.switch(State_Title, false);
end

function State_Controls_Keyboard:update(dt)
end

function State_Controls_Keyboard:draw()
	CANVAS:renderTo(function()
    love.graphics.clear();
		love.graphics.setColor(255, 0, 0);
		love.graphics.draw(self.image, 0, 0);
		love.graphics.setFont(self.titleFont);
		love.graphics.printf("Keyboard", 0, 12, SCREEN_WIDTH, "center");

		love.graphics.setFont(self.controlsFont);
    love.graphics.print("Walk", 280, 390);
    love.graphics.print("Flashlight", 660, 390);
    love.graphics.print("Confirm/Pause", 1290, 320);
    love.graphics.print("Quit", 1290, 410);
    love.graphics.print("Previous Item", 300, 575);
		love.graphics.print("Next Item", 300, 675);
    love.graphics.print("Use Item", 705, 605);
		love.graphics.print("Run", 1290, 605);

		love.graphics.printf("Press any key to go back", 0, 840, SCREEN_WIDTH, "center");
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end