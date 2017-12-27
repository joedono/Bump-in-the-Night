require "player";
require "monster/manager-monster";

require "house/floor";
require "house/item";
require "house/path";

State_Game = {};

function State_Game:init()
	BumpWorld = Bump.newWorld(32);
	LightWorld = Light({
		ambient = {0, 0, 0},
		shadowBlur = 0.0
	});
end

function State_Game:enter(previous, scenarioId)
	local items = BumpWorld:getItems();
  for index, item in pairs(items) do
    BumpWorld:remove(item);
  end

	self.itemWorldSpriteSheet = love.image.newImageData('asset/image/world_inventory.png');
	self.itemHeldSpriteSheet = love.image.newImageData('asset/image/held_inventory.png');

	self.player = Player(self);
	self.floors = self:loadFloors();
	self.items = self:spawnItems(scenarioId);
	self.inventory = {};
	self.paths = self:loadPathfinding();
	self.monsterManager = Manager_Monster(self.paths);
	self.monsterManager:spawnMonsters(scenarioId);

	self.camera = Camera(CAMERA_START_X, CAMERA_START_Y);
	self:updateCamera(self.player.box.x, self.player.box.y);

	self.active = true;
end

function State_Game:resume()
	self.player:resetKeys();
end

function State_Game:loadFloors()
	local floors = {};

	table.insert(floors, Floor("asset/config/floor-layout/main-floor.lua", 0, 0));
	table.insert(floors, Floor("asset/config/floor-layout/second-floor.lua", FLOOR_WIDTH + FLOOR_GAP, 0));
	table.insert(floors, Floor("asset/config/floor-layout/basement.lua", 0, FLOOR_HEIGHT + FLOOR_GAP));
	table.insert(floors, Floor("asset/config/floor-layout/attic.lua", FLOOR_WIDTH + FLOOR_GAP, FLOOR_HEIGHT + FLOOR_GAP));

	return floors;
end

function State_Game:spawnItems(scenarioId)
	local items = {};
	local scenarioItems = SCENARIO_ITEMS[scenarioId];
	local takenSpots = {};

	for index, item in pairs(scenarioItems) do
		local floorIndex = love.math.random(4);
		local randomFloor = self.floors[floorIndex];
		local spotIndex = love.math.random(#randomFloor.itemLocations);

		while takenSpots[floorIndex .. "-" .. spotIndex] do
			floorIndex = love.math.random(4);
			randomFloor = self.floors[floorIndex];
			spotIndex = love.math.random(#randomFloor.itemLocations);
		end

		local randomLocation = randomFloor.itemLocations[spotIndex];

		takenSpots[floorIndex .. "-" .. spotIndex] = true;

		local x = randomLocation.x + randomFloor.origin.x;
		local y = randomLocation.y + randomFloor.origin.y;

		table.insert(items, Item(x, y, item, self.itemWorldSpriteSheet, self.itemHeldSpriteSheet));
	end

	return items;
end

function State_Game:loadPathfinding()
	local allPaths = {};
	local floorPaths = {};

	for index, floor in pairs(self.floors) do
		local curFloorPaths = {};
		for index2, path in pairs(floor.paths) do
			table.insert(curFloorPaths, Path(index, floor, path));
		end

		for index2, path in pairs(curFloorPaths) do
			local connections = path.source.properties["connections"];
			for id in string.gmatch(connections, "%d+") do
				for index2, connection in pairs(curFloorPaths) do
					if tonumber(id) == connection.source.id then
						path:addConnection(connection);
					end
				end
			end
		end

		table.insert(floorPaths, curFloorPaths);
	end

	for index, floorPath in pairs(floorPaths) do
		for index2, path in pairs(floorPath) do
			if path.source.properties["multifloor"] then
				local floorIndex = path.source.properties["multifloorIndex"];
				local pathId = path.source.properties["multifloorID"];
				local connectedPaths = floorPaths[floorIndex];

				for index3, connection in pairs(connectedPaths) do
					if pathId == connection.source.id then
						path:addConnection(connection);
					end
				end
			end

			table.insert(allPaths, path);
		end
	end

	return allPaths;
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

	if key == KEY_PAUSE then
		GameState.push(State_Pause);
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

	if key == KEY_LIGHT_LEFT then
		self.player.leftLightPressed = true;
	end

	if key == KEY_LIGHT_RIGHT then
		self.player.rightLightPressed = true;
	end

	if key == KEY_LIGHT_UP then
    self.player.upLightPressed = true;
  end

	if key == KEY_LIGHT_DOWN then
    self.player.downLightPressed = true;
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

	if key == KEY_LIGHT_LEFT then
		self.player.leftLightPressed = false;
	end

	if key == KEY_LIGHT_RIGHT then
		self.player.rightLightPressed = false;
	end

	if key == KEY_LIGHT_UP then
    self.player.upLightPressed = false;
  end

	if key == KEY_LIGHT_DOWN then
    self.player.downLightPressed = false;
  end

  if key == KEY_RUN then
    self.player.runPressed = false;
  end
end

function State_Game:gamepadpressed(joystick, button)
  if not self.active then
    return;
  end

	if button == GAMEPAD_LEFT then
    self.player.leftPressed = true;
  end

  if button == GAMEPAD_RIGHT then
    self.player.rightPressed = true;
  end

  if button == GAMEPAD_UP then
    self.player.upPressed = true;
  end

  if button == GAMEPAD_DOWN then
    self.player.downPressed = true;
  end

  if button == GAMEPAD_RUN then
    self.player.runPressed = true;
  end

  if button == GAMEPAD_START then
		GameState.push(State_Pause);
  end
end

function State_Game:gamepadreleased(joystick, button)
  if not self.active then
    return;
  end

	if button == GAMEPAD_LEFT then
    self.player.leftPressed = false;
  end

  if button == GAMEPAD_RIGHT then
    self.player.rightPressed = false;
  end

  if button == GAMEPAD_UP then
    self.player.upPressed = false;
  end

  if button == GAMEPAD_DOWN then
    self.player.downPressed = false;
  end

  if button == GAMEPAD_RUN then
    self.player.runPressed = false;
  end
end

function State_Game:gamepadaxis(joystick, axis, value)
	if axis == "leftx" then -- X Movement
		self.player.gamepadVelocity.x = value;
	elseif axis == "lefty" then -- Y Movement
		self.player.gamepadVelocity.y = value;
	elseif axis == "rightx" then -- X Flashlight
		self.player.flashlightFacing.x = value;
	elseif axis == "righty" then -- Y Flashlight
		self.player.flashlightFacing.y = value;
	end
end

function State_Game:update(dt)
	if not self.active then
    return;
  end

	for index, floor in pairs(self.floors) do
		floor:update(dt);
	end

	for index, item in pairs(self.items) do
		item:update(dt);
	end

	self.player:update(dt);
	self.monsterManager:update(dt);
	LightWorld:update(dt);
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
	cameraY = math.clamp(cameraY, curFloor.origin.y, curFloor.origin.y + FLOOR_HEIGHT - SCREEN_HEIGHT + HUD_HEIGHT);

	cameraX = math.floor(cameraX);
	cameraY = math.floor(cameraY);

	self.camera:lookAt(cameraX + SCREEN_WIDTH / 2, cameraY + SCREEN_HEIGHT / 2);
	LightWorld:setTranslation(-cameraX, -cameraY, 1);
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

function State_Game:pickupItem(item)
	table.insert(self.inventory, item);
	item:pickup();
end

function State_Game:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		self.camera:attach();

		if DRAW_LIGHTS then
			LightWorld:draw(function()
				self:drawGame();
			end);
		else
			self:drawGame();
		end

		self.camera:detach();
		self:drawHUD();
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end

function State_Game:drawGame()
	for index, floor in pairs(self.floors) do
		floor:draw(self.camera);
	end

	for index, item in pairs(self.items) do
		item:draw();
	end

	if DRAW_PATHS then
		for index, path in pairs(self.paths) do
			path:draw();
		end
	end

	self.player:draw();
	self.monsterManager:draw();
end

function State_Game:drawHUD()
	love.graphics.setColor(0, 0, 0);
	love.graphics.rectangle("fill", 0, SCREEN_HEIGHT - HUD_HEIGHT, SCREEN_WIDTH, HUD_HEIGHT);

	local y = SCREEN_HEIGHT - HUD_HEIGHT + 20;
	for index, item in pairs(self.inventory) do
		item:drawInventory((index-1) * 100 + 30, y);
	end
end