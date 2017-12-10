Bump = require "lib/bump/bump";
LightWorld = require "lib/lightWorld";
Camera = require "lib/hump/camera";

require "player";
require "hudManager";
require "house/house";

State_Game = {};
Bump_World = Bump.newWorld(50);
Light_World = LightWorld({
	ambient = {0, 0, 0},
	shadowBlur = 0.0
});

function State_Game:init()
	self.hud = HUDManager();
	self.player = Player(90, 40);
	self.house = House();
	
	self.camera = Camera(0, 0);
	self:updateCamera(self.player.x, self.player.y);
end

function State_Game:enter()
	self.house:setFloor("main-floor");
	self:updateCamera(self.player.x, self.player.y);
end

function State_Game:keypressed(key, unicode)
	self.player:keypressed(key, unicode);
end

function State_Game:keyreleased(key, unicode)
	
end

function State_Game:update(dt)
	local nextFloor = self.player:update(dt, self.hud);
	
	if(nextFloor ~= nil) then
		self.house:setFloor(nextFloor.name);
		self.player:move(nextFloor.x, nextFloor.y);
		self.player:setFacing(nextFloor.facing);
	end
	
	self.house:update(dt);
	Light_World:update(dt);
	self:updateCamera(self.player.x, self.player.y);
end

function State_Game:updateCamera(worldFocusX, worldFocusY)
	local cameraFocusX, cameraFocusY = self.camera:cameraCoords(worldFocusX, worldFocusY);
	local cameraX, cameraY = self.camera:pos();
	cameraX = cameraX - SCREEN_WIDTH / 2;
	cameraY = cameraY - SCREEN_HEIGHT / 2;
	local moveCamera = false;
	
	if(cameraFocusX < CAMERA_LEFT_BOUND) then
		cameraX = worldFocusX - CAMERA_LEFT_BOUND;
		moveCamera = true;
	end
	
	if(cameraFocusX > CAMERA_RIGHT_BOUND) then
		cameraX = worldFocusX - CAMERA_RIGHT_BOUND;
		moveCamera = true;
	end
	
	if(cameraFocusY < CAMERA_TOP_BOUND) then
		cameraY = worldFocusY - CAMERA_TOP_BOUND;
		moveCamera = true;
	end
	
	if(cameraFocusY > CAMERA_BOTTOM_BOUND - HUD_HEIGHT) then
		cameraY = worldFocusY - CAMERA_BOTTOM_BOUND + HUD_HEIGHT;
		moveCamera = true;
	end
	
	cameraX = math.clamp(cameraX, 0, self.house:getFloorWidth() - SCREEN_WIDTH);
	cameraY = math.clamp(cameraY, 0, self.house:getFloorHeight() - SCREEN_HEIGHT + HUD_HEIGHT);
	
	self.camera:lookAt(cameraX + SCREEN_WIDTH / 2, cameraY + SCREEN_HEIGHT / 2);
	Light_World:setTranslation(-cameraX, -cameraY, 1);
end

function State_Game:draw()
	self.camera:attach();
	if(DEBUG_LIGHTING_ENABLED) then
		Light_World:draw(function()
			self.house:draw();
			self.player:draw();
		end);
	else
		self.house:draw();
		self.player:draw();
	end
	self.camera:detach();
	
	self.hud:draw();
	
	if(DEBUG_MOUSE_POSITION) then
		local mx, my = self.camera:worldCoords(love.mouse.getPosition());
		love.graphics.setColor(255, 255, 255);
		love.graphics.print(mx .. ", " .. my, 0, 0);
	end
end