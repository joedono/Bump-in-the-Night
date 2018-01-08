require "player";
require "monster/manager-monster";

require "house/floor";
require "house/item";
require "house/path-node";

require "used-items/axe";
require "used-items/blood-pool";
require "used-items/bucket-water";
require "used-items/lighter";
require "used-items/meat";
require "used-items/salt";
require "used-items/shotgun-blast";
require "used-items/stake";
require "used-items/taser";
require "used-items/trap";

State_Game = {};

function State_Game:init()
	BumpWorld = Bump.newWorld(32);
	LightWorld = Light({
		ambient = {0, 0, 0},
		shadowBlur = 0.0
	});

	LightWorld:refreshScreenSize(SCREEN_WIDTH * CANVAS_SCALE^2, SCREEN_HEIGHT * CANVAS_SCALE^2);
	LightWorld:setScale(CANVAS_SCALE);

	self.itemWorldSpriteSheet = love.image.newImageData('asset/image/world_inventory.png');
	self.itemHeldSpriteSheet = love.image.newImageData('asset/image/held_inventory.png');

	self.usedItemImages = {
		["shotgun-blast"] = love.graphics.newImage("asset/image/used-items/shotgun-blast.png")
	};

	self.soundEffects = {
		doorClose = love.audio.newSource("asset/sound/door-close.wav", "static"),
		doorOpen = love.audio.newSource("asset/sound/door-open.wav", "static"),
		footstepsRun = love.audio.newSource("asset/sound/footsteps-run.wav", "static"),
		footstepsWalk = love.audio.newSource("asset/sound/footsteps-walk.wav", "static"),
		gunshot = love.audio.newSource("asset/sound/gunshot.wav", "static"),
		itemPickup = love.audio.newSource("asset/sound/item-pickup.wav", "static"),
		monsterBite = love.audio.newSource("asset/sound/monster-bite.wav", "static"),
		monsterWolfRoar = love.audio.newSource("asset/sound/monster-wolf-roar.wav", "static"),
		playerDeathYell = love.audio.newSource("asset/sound/player-death-yell.wav", "static"),
		spotted = love.audio.newSource("asset/sound/spotted.wav", "static"),
		trapSpring = love.audio.newSource("asset/sound/trap-spring.wav", "static")
	};
end

function State_Game:enter(previous, scenarioId)
	love.graphics.setBackgroundColor(0, 0, 0);
	local items = BumpWorld:getItems();
  for index, item in pairs(items) do
    BumpWorld:remove(item);
  end

	LightWorld:clearLights();
	LightWorld:clearBodies();

	if scenarioId == nil then
		scenarioId = "wolf";
	end

	self.inventory = {};
	self.selectedItemIndex = 1;
	self.player = Player(self, self.soundEffects);
	self.floors = self:loadFloors();
	self.items = self:spawnItems(scenarioId);
	self.pathNodes = self:loadPathfinding();
	self.monsterManager = Manager_Monster(self, self.pathNodes, self.player, self.soundEffects);
	self.monsterManager:spawnMonsters(scenarioId);
	self.usedItems = {};

	self.camera = Camera(CAMERA_START_X, CAMERA_START_Y);
	self:updateCamera(self.player.box.x, self.player.box.y);

	self.active = true;
end

function State_Game:resume()
	self.player:resetKeys();
end

function State_Game:loadFloors()
	local floors = {};

	table.insert(floors, Floor("asset/config/floor-layout/main-floor.lua", 0, 0, self.soundEffects));
	table.insert(floors, Floor("asset/config/floor-layout/second-floor.lua", FLOOR_WIDTH + FLOOR_GAP, 0, self.soundEffects));
	table.insert(floors, Floor("asset/config/floor-layout/basement.lua", 0, FLOOR_HEIGHT + FLOOR_GAP, self.soundEffects));
	table.insert(floors, Floor("asset/config/floor-layout/attic.lua", FLOOR_WIDTH + FLOOR_GAP, FLOOR_HEIGHT + FLOOR_GAP, self.soundEffects));

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
	local allPathNodes = {};
	local allFloorPathNodes = {};

	-- Add connections within floors
	for index, floor in pairs(self.floors) do
		local curFloorPathNodes = {};
		for index2, sourceNode in pairs(floor.sourceNodes) do
			table.insert(curFloorPathNodes, PathNode(index, floor, sourceNode));
		end

		for index2, pathNode in pairs(curFloorPathNodes) do
			local connectionIds = pathNode.sourceNode.properties["connections"];
			for id in string.gmatch(connectionIds, "%d+") do
				for index2, pathNodeConnection in pairs(curFloorPathNodes) do
					if tonumber(id) == pathNodeConnection.sourceNode.id then
						pathNode:addConnection(pathNodeConnection);
					end
				end
			end
		end

		table.insert(allFloorPathNodes, curFloorPathNodes);
	end

	-- Add connections between floors
	for index, floorPathNodes in pairs(allFloorPathNodes) do
		for index2, floorPathNode in pairs(floorPathNodes) do
			if floorPathNode.sourceNode.properties["multifloor"] then
				local multifloorIndex = floorPathNode.sourceNode.properties["multifloorIndex"];
				local multifloorID = floorPathNode.sourceNode.properties["multifloorID"];
				local connectedPathNodes = allFloorPathNodes[multifloorIndex];

				for index3, connectedPathNode in pairs(connectedPathNodes) do
					if multifloorID == connectedPathNode.sourceNode.id then
						floorPathNode:addConnection(connectedPathNode);
					end
				end
			end

			table.insert(allPathNodes, floorPathNode);
		end
	end

	return allPathNodes;
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

	if key == KEY_FLASHLIGHT then
    self.player:toggleFlashlight();
  end

	if key == KEY_RUN then
    self.player.runPressed = true;
  end

	if key == KEY_ITEM_LEFT then
		self:selectItem(-1);
  end

	if key == KEY_ITEM_RIGHT then
    self:selectItem(1);
  end

	if key == KEY_ITEM_USE then
    self:useItem();
  end

	if key == KEY_PAUSE then
		GameState.push(State_Pause);
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

	if button == GAMEPAD_FLASHLIGHT then
    self.player:toggleFlashlight();
  end

  if button == GAMEPAD_RUN then
    self.player.runPressed = true;
  end

	if button == GAMEPAD_ITEM_LEFT then
		self:selectItem(-1);
  end

	if button == GAMEPAD_ITEM_RIGHT then
    self:selectItem(1);
  end

	if button == GAMEPAD_ITEM_USE then
    self:useItem();
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
	elseif axis == "triggerleft" then -- L2
		if value > GAMEPAD_DEADZONE then
			self.player.runPressed = true;
		elseif value == 0 then
			self.player.runPressed = false;
		end
	elseif axis == "triggerright" then -- R2
		if value > GAMEPAD_DEADZONE then
			self.player.runPressed = true;
		elseif value == 0 then
			self.player.runPressed = false;
		end
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

	local activeUsedItems = {};
	for index, usedItem in pairs(self.usedItems) do
		usedItem:update(dt);
		if usedItem.active then
			table.insert(activeUsedItems, usedItem);
		elseif BumpWorld:hasItem(usedItem) then
			BumpWorld:remove(usedItem);
		end
	end
	self.usedItems = activeUsedItems;

	self.player:update(dt);
	self.monsterManager:update(dt);
	self:updateCamera(self.player.box.x, self.player.box.y);
	LightWorld:update(dt);
end

function State_Game:updateCamera(x, y)
	local cameraFocusX, cameraFocusY = self.camera:cameraCoords(x, y, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
	local cameraX, cameraY = self.camera:position();

	cameraX = cameraX - SCREEN_WIDTH / 2;
	cameraY = cameraY - SCREEN_HEIGHT / 2;

	if cameraFocusX < CAMERA_LEFT_BOUND then
		cameraX = x - CAMERA_LEFT_BOUND;
	end

	if cameraFocusX > CAMERA_RIGHT_BOUND then
		cameraX = x - CAMERA_RIGHT_BOUND;
	end

	if cameraFocusY < CAMERA_TOP_BOUND then
		cameraY = y - CAMERA_TOP_BOUND;
	end

	if cameraFocusY > CAMERA_BOTTOM_BOUND then
		cameraY = y - CAMERA_BOTTOM_BOUND;
	end

	local curFloor = self:getPlayerFloor();
	cameraX = math.clamp(cameraX, curFloor.origin.x, curFloor.origin.x + FLOOR_WIDTH - SCREEN_WIDTH);
	cameraY = math.clamp(cameraY, curFloor.origin.y, curFloor.origin.y + FLOOR_HEIGHT - SCREEN_HEIGHT + HUD_HEIGHT);

	cameraX = math.floor(cameraX);
	cameraY = math.floor(cameraY);

	self.camera:lookAt(cameraX + SCREEN_WIDTH / 2, cameraY + SCREEN_HEIGHT / 2);
	LightWorld:setTranslation(-cameraX * CANVAS_SCALE, -cameraY * CANVAS_SCALE);
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

	self.soundEffects.itemPickup:rewind();
	self.soundEffects.itemPickup:play();
end

function State_Game:selectItem(dir)
	local numItems = #self.inventory;

	if numItems == 0 then
		return;
	end

	self.selectedItemIndex = self.selectedItemIndex + dir;
	if self.selectedItemIndex < 1 then
		self.selectedItemIndex = numItems;
	elseif self.selectedItemIndex > numItems then
		self.selectedItemIndex = 1;
	end
end

function State_Game:useItem()
	local selectedItem = self.inventory[self.selectedItemIndex];

	if selectedItem.itemType == "meat" then
		local placedMeat = self:getPlacedItem("placed-meat");
		if placedMeat ~= nil then
			placedMeat.active = false;
		end

		table.insert(self.usedItems, Meat(self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2, self.itemHeldSpriteSheet));
	elseif selectedItem.itemType == "trap" then
		local placedMeat = self:getPlacedItem("placed-trap");
		if placedMeat ~= nil then
			placedMeat.active = false;
		end

		table.insert(self.usedItems, Trap(self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2, self.itemHeldSpriteSheet));
	elseif selectedItem.itemType == "shotgun" then
		if selectedItem.loaded then
			-- Fire Shotgun
			table.insert(
				self.usedItems,
				Shotgun_Blast(
					self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2,
					self.player.facing.x, self.player.facing.y,
					self.usedItemImages["shotgun-blast"]
				)
			);

			self.soundEffects.gunshot:rewind();
			self.soundEffects.gunshot:play();
		end
	elseif selectedItem.itemType == "shotgun_rounds" then
		-- Load Shotgun
		for index, item in pairs(self.inventory) do
			if item.itemType == "shotgun" then
				item.loaded = true;
				table.remove(self.inventory, self.selectedItemIndex);
				self.selectedItemIndex = 1;
				return;
			end
		end
	elseif selectedItem.itemType == "taser" then
		table.insert(self.usedItems, Taser(self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2, self.player.facing.x, self.player.facing.y));
	elseif selectedItem.itemType == "cellphone_dead" then
		-- Do nothing
	elseif selectedItem.itemType == "cellphone_live" then
		if self.monsterManager:areEnemiesDown() then
			self:winGame();
		end
	elseif selectedItem.itemType == "cellphone_battery" then
		-- Replace battery in cell phone
		local hasDeadPhone = false;
		for index, item in pairs(self.inventory) do
			if item.itemType == "cellphone_dead" then
				hasDeadPhone = true;
			end
		end

		if hasDeadPhone then
			local newInventory = {};
			for index, item in pairs(self.inventory) do
				if item.itemType ~= "cellphone_dead" and item.itemType ~= "cellphone_battery" then
					table.insert(newInventory, item);
				end
			end

			local newItem = Item(-1000, -1000, "cellphone_live", self.itemWorldSpriteSheet, self.itemHeldSpriteSheet);
			newItem:pickup();
			table.insert(newInventory, newItem);
			self.inventory = newInventory;
		end
	elseif selectedItem.itemType == "bucket" then
	elseif selectedItem.itemType == "fuse" then
	elseif selectedItem.itemType == "book" then
	elseif selectedItem.itemType == "cross" then
	elseif selectedItem.itemType == "stake" then
	elseif selectedItem.itemType == "knife" then
	elseif selectedItem.itemType == "music_box" then
	elseif selectedItem.itemType == "battery" then
	elseif selectedItem.itemType == "foil" then
	elseif selectedItem.itemType == "axe" then
	elseif selectedItem.itemType == "gasoline" then
	elseif selectedItem.itemType == "lighter" then
	elseif selectedItem.itemType == "crystal" then
	elseif selectedItem.itemType == "scroll" then
	end
end

function State_Game:getPlacedItem(itemType)
	for index, usedItem in pairs(self.usedItems) do
		if usedItem.type == itemType then
			return usedItem;
		end
	end

	return nil;
end

function State_Game:winGame()
	self:stopAllSounds();
	GameState.push(State_Winning);
end

function State_Game:loseGame()
	self:stopAllSounds();
	GameState.push(State_Losing);
end

function State_Game:stopAllSounds()
	for index, sound in pairs(self.soundEffects) do
		if index ~= "monsterBite" and index ~= "playerDeathYell" and index ~= "gunshot" then
			sound:stop();
		end
	end
end

function State_Game:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		if not DRAW_ENTIRE_HOUSE then
			if DRAW_LIGHTS then
				self.camera:attach(0, 0);
			else
				self.camera:attach(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
			end
		end

		if DRAW_LIGHTS then
			LightWorld:draw(function()
				self:drawGame();
			end);
		else
			self:drawGame();
		end

		if not DRAW_ENTIRE_HOUSE then
			self.camera:detach();
		end
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

	for index, placedItem in pairs(self.usedItems) do
		if placedItem.belowPlayer then
			placedItem:draw();
		end
	end

	if DRAW_PATHS then
		for index, pathNode in pairs(self.pathNodes) do
			pathNode:draw();
		end
	end

	self.player:draw();
	self.monsterManager:draw();

	for index, placedItem in pairs(self.usedItems) do
		if not placedItem.belowPlayer then
			placedItem:draw();
		end
	end
end

function State_Game:drawHUD()
	love.graphics.setColor(0, 0, 0);
	love.graphics.rectangle("fill", 0, SCREEN_HEIGHT - HUD_HEIGHT, SCREEN_WIDTH, HUD_HEIGHT);

	local y = SCREEN_HEIGHT - HUD_HEIGHT + 20;
	for index, item in pairs(self.inventory) do
		item:drawInventory((index-1) * 100 + 30, y);
		if self.selectedItemIndex == index then
			love.graphics.setColor(255, 255, 255);
			love.graphics.rectangle("line", (index-1) * 100 + 30, y, INVENTORY_ITEM_WIDTH, INVENTORY_ITEM_HEIGHT);
		end
	end
end