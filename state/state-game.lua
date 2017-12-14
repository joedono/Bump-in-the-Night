require "player";

require "house/floor";

State_Game = {};

function State_Game:init()
	BumpWorld = Bump.newWorld(32);
end

function State_Game:enter()
	local items = BumpWorld:getItems();
  for index, item in pairs(items) do
    BumpWorld:remove(item);
  end

	self.player = Player(self);
	self.floors = self:loadFloors();

	self.camera = Camera(0, 0);
	self:updateCamera(self.player.box.x, self.player.box.y);

	self.active = true;
end

function State_Game:loadFloors()
	local floors = {};

	table.insert(floors, Floor("asset/config/floor-layout/main-floor.lua", 0, 0));
	table.insert(floors, Floor("asset/config/floor-layout/second-floor.lua", FLOOR_WIDTH + FLOOR_GAP, 0));
	table.insert(floors, Floor("asset/config/floor-layout/basement.lua", 0, FLOOR_HEIGHT + FLOOR_GAP));
	table.insert(floors, Floor("asset/config/floor-layout/attic.lua", FLOOR_WIDTH + FLOOR_GAP, FLOOR_HEIGHT + FLOOR_GAP));

	return floors;
end

function State_Game:focus(focused)
  if focused then
    self.active = true;
  else
    self.active = false;
  end
end

function State_Game:keypressed(key, unicode)
	if not self.active then
    return;
  end

  if key == KEY_LEFT then
    self.player.leftPressed = true;
  end

  if key == KEY_RIGHT then
    self.player.rightPressed = true;
  end

  if key == KEY_UP then
    self.player.upPressed = true;
  end

  if key == KEY_DOWN then
    self.player.downPressed = true;
  end

  if key == KEY_RUN then
    self.player.runPressed = true;
  end
end

function State_Game:keyreleased(key, unicode)
	if not self.active then
    return;
  end

	if key == KEY_LEFT then
    self.player.leftPressed = false;
  end

  if key == KEY_RIGHT then
    self.player.rightPressed = false;
  end

  if key == KEY_UP then
    self.player.upPressed = false;
  end

  if key == KEY_DOWN then
    self.player.downPressed = false;
  end

  if key == KEY_RUN then
    self.player.runPressed = false;
  end
end

function State_Game:update(dt)
	if not self.active then
    return;
  end

	for index, floor in pairs(self.floors) do
		floor:update(dt);
	end

	self.player:update(dt);

	self:updateCamera(self.player.box.x, self.player.box.y);
end

function State_Game:updateCamera(x, y)
	local cameraFocusX, cameraFocusY = self.camera:cameraCoords(x, y);
	local cameraX, cameraY = self.camera:position();

	cameraX = cameraX - SCREEN_WIDTH / 2;
	cameraY = cameraY - SCREEN_HEIGHT / 2;
	local moveCamera = false;

	if(cameraFocusX < CAMERA_LEFT_BOUND) then
		cameraX = x - CAMERA_LEFT_BOUND;
		moveCamera = true;
	end

	if(cameraFocusX > CAMERA_RIGHT_BOUND) then
		cameraX = x - CAMERA_RIGHT_BOUND;
		moveCamera = true;
	end

	if(cameraFocusY < CAMERA_TOP_BOUND) then
		cameraY = y - CAMERA_TOP_BOUND;
		moveCamera = true;
	end

	if(cameraFocusY > CAMERA_BOTTOM_BOUND) then
		cameraY = y - CAMERA_BOTTOM_BOUND;
		moveCamera = true;
	end

	local curFloor = self:getPlayerFloor();
	cameraX = math.clamp(cameraX, curFloor.origin.x, curFloor.origin.x + FLOOR_WIDTH - SCREEN_WIDTH);
	cameraY = math.clamp(cameraY, curFloor.origin.y, curFloor.origin.y + FLOOR_HEIGHT - SCREEN_HEIGHT);

	self.camera:lookAt(cameraX + SCREEN_WIDTH / 2, cameraY + SCREEN_HEIGHT / 2);
end

function State_Game:getPlayerFloor()
	local px = self.player.box.x;
	local py = self.player.box.y;

	if px > FLOOR_WIDTH + FLOOR_GAP and py > FLOOR_HEIGHT + FLOOR_GAP then
		return self.floors[4]; -- Player is in the attic
	elseif py > FLOOR_HEIGHT + FLOOR_GAP then
		return self.floors[3]; -- Player is in the basement
	elseif px > FLOOR_WIDTH + FLOOR_GAP then
		return self.floors[2] -- Player is on the second floor
	elseif px > 0 and py > 0 then
		return self.floors[1]; -- Player is on the main floor
	end
end

function State_Game:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		self.camera:attach();

		for index, floor in pairs(self.floors) do
			floor:draw(self.camera);
		end

    self.player:draw();

		self.camera:detach();
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end