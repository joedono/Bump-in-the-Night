State_Controls_Controller = {};

function State_Controls_Controller:init()
	self.image = love.graphics.newImage("asset/image/screen/controls-controller.png");
	self.titleFont = love.graphics.newFont("asset/font/Fiendish.ttf", 30);
	self.controlsFont = love.graphics.newFont("asset/font/Fiendish.ttf", 20);
end

function State_Controls_Controller:enter()
	love.graphics.setBackgroundColor(0, 0, 0);
end

function State_Controls_Controller:keypressed(key, unicode)
	GameState.switch(State_Title, false);
end

function State_Controls_Controller:gamepadpressed(joystick, button)
	GameState.switch(State_Title, false);
end

function State_Controls_Controller:update(dt)
end

function State_Controls_Controller:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		love.graphics.setColor(255, 0, 0);
		love.graphics.draw(self.image, 0, 0);
		love.graphics.setFont(self.titleFont);
		love.graphics.printf("Controller", 0, 12, SCREEN_WIDTH, "center");

		love.graphics.setFont(self.controlsFont);
		love.graphics.print("L1/LB - Previous Item", 50, 195);
		love.graphics.print("Select/Back - Quit", 630, 125);
		love.graphics.print("Start - Pause", 800, 175);
		love.graphics.print("R1/RB - Next Item", 1315, 195);
		love.graphics.print("R2/RT - Run", 1315, 105);
		love.graphics.print("DPad/L Joystick - Walk", 140, 725);
		love.graphics.print("R Joystick - Flashlight", 1040, 725);
		love.graphics.print("Use Item", 1275, 455);

		love.graphics.printf("Press any button to go back", 0, 840, SCREEN_WIDTH, "center");
	end);

	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end