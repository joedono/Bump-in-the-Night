require "monster/manager-monster";

require "house/floor";
require "house/item";
require "house/path-node";
require "house/player";

require "used-items/axe";
require "used-items/blood-pool";
require "used-items/bucket-water";
require "used-items/lighter";
require "used-items/meat";
require "used-items/salt";
require "used-items/shotgun-blast";
require "used-items/shovel-dig";
require "used-items/stake-stab";
require "used-items/taser-blast";
require "used-items/trap";

State_Game = {};

function State_Game:init()
	BumpWorld = Bump.newWorld(32);
	LightWorld = Light({
		ambient = { MASTER_BRIGHTNESS, MASTER_BRIGHTNESS, MASTER_BRIGHTNESS },
		shadowBlur = 3.0
	});

	self.itemWorldSpriteSheet = love.image.newImageData('asset/image/world_inventory.png');
	self.itemHeldSpriteSheet = love.image.newImageData('asset/image/held_inventory.png');

	self.imageStore = {
		shotgunBlast = love.graphics.newImage("asset/image/used-items/shotgun-blast.png"),
		taserBlast = love.graphics.newImage("asset/image/used-items/taser-blast.png"),
		waterSplash = love.graphics.newImage("asset/image/used-items/water-splash.png"),
		stakeStab = love.graphics.newImage("asset/image/used-items/stake-stab.png"),
		burningFire = love.graphics.newImage("asset/image/fire.png"),
		buriedGrave = love.graphics.newImage("asset/image/grave/grave-buried.png"),
		dugGrave = love.graphics.newImage("asset/image/grave/grave-dug.png"),
		corpseGrave = love.graphics.newImage("asset/image/grave/grave-corpse.png")
	};

	local waterSplashGrid = Anim8.newGrid(61, 32, self.imageStore.waterSplash:getWidth(), self.imageStore.waterSplash:getHeight());

	self.usedItemAnimations = {
		waterSplash = Anim8.newAnimation(waterSplashGrid("1-4", "1-2"), 0.05)
	};

	self.soundEffects = {
		doorClose = love.audio.newSource("asset/sound/door-close.wav", "static"),
		doorOpen = love.audio.newSource("asset/sound/door-open.wav", "static"),
		footstepsRun = love.audio.newSource("asset/sound/footsteps-run.wav", "static"),
		footstepsWalk = love.audio.newSource("asset/sound/footsteps-walk.wav", "static"),
		gunshot = love.audio.newSource("asset/sound/gunshot.wav", "static"),
		humanAttackYell = love.audio.newSource("asset/sound/human-attack-yell.wav", "static"),
		itemPickup = love.audio.newSource("asset/sound/item-pickup.wav", "static"),
		knifeStab = love.audio.newSource("asset/sound/knife-stab.wav", "static"),
		monsterBite = love.audio.newSource("asset/sound/monster-bite.wav", "static"),
		monsterWolfRoar = love.audio.newSource("asset/sound/monster-wolf-roar.wav", "static"),
		monsterPantherRoar = love.audio.newSource("asset/sound/monster-wolf-roar.wav", "static"),
		monsterVampireLaugh = love.audio.newSource("asset/sound/evil-laugh.wav", "static"),
		phoneRing = love.audio.newSource("asset/sound/phone-ring.wav", "static"),
		playerDeathYell = love.audio.newSource("asset/sound/player-death-yell.wav", "static"),
		playerFreeze = love.audio.newSource("asset/sound/player-freeze.wav", "static"),
		playerFrozen = love.audio.newSource("asset/sound/white-noise.wav", "static"),
		policeSiren = love.audio.newSource("asset/sound/police-siren.wav", "static"),
		spotted = love.audio.newSource("asset/sound/spotted.wav", "static"),
		stakeStab = love.audio.newSource("asset/sound/stake-stab.wav", "static"),
		taser = love.audio.newSource("asset/sound/taser.wav", "static"),
		trapSpring = love.audio.newSource("asset/sound/trap-spring.wav", "static"),
		waterSplash = love.audio.newSource("asset/sound/water-splash.wav", "static"),
		bookRead = love.audio.newSource("asset/sound/book-reading.wav", "static"),
		ghostKill = love.audio.newSource("asset/sound/ghost-kill.wav", "static"),
		ghostApproach = love.audio.newSource("asset/sound/ghost-approach.wav", "static"),
		shovelDigFail = love.audio.newSource("asset/sound/shovel-dig-fail.wav", "static"),
		shovelDig = love.audio.newSource("asset/sound/shovel-dig.wav", "static"),
		useLighter = love.audio.newSource("asset/sound/lighter.wav", "static"),
		rayGun = love.audio.newSource("asset/sound/ray-gun.wav", "static"),
		rayGunImpact = love.audio.newSource("asset/sound/ray-gun-impact.wav", "static"),
		musicBox = love.audio.newSource("asset/sound/music-box.ogg", "static")
	};

	self.soundEffects.phoneRing:setLooping(true);
	self.soundEffects.policeSiren:setLooping(true);
	self.soundEffects.playerFrozen:setLooping(true);
	self.soundEffects.bookRead:setLooping(true);
	self.soundEffects.ghostApproach:setLooping(true);
	self.soundEffects.shovelDigFail:setLooping(true);
	self.soundEffects.shovelDig:setLooping(true);

	self.callPoliceSoundTimer = Timer.new();
	self.policeTimerFont = love.graphics.newFont(24);

	self.alienShader = love.graphics.newShader("asset/shader/rainbow.glsl");
end

function State_Game:enter(previous, scenarioId)
	love.graphics.setBackgroundColor(0, 0, 0);
	LightWorld:refreshScreenSize(SCREEN_WIDTH * CANVAS_SCALE * 2, SCREEN_HEIGHT * CANVAS_SCALE * 2);
	LightWorld:setScale(CANVAS_SCALE);

	local items = BumpWorld:getItems();
	for index, item in pairs(items) do
		BumpWorld:remove(item);
	end

	LightWorld:clearLights();
	LightWorld:clearBodies();

	for index, sound in pairs(self.soundEffects) do
		sound:setVolume(MASTER_VOLUME);
	end

	PLAY_SOUNDS = true;
	self.soundEffects.playerFrozen:setVolume(0.3 * MASTER_VOLUME);

	if scenarioId == nil then
		scenarioId = "alien";
	end

	self.scenarioId = scenarioId;
	self.inventory = {};
	self.selectedItemIndex = 1;
	self.floors = self:loadFloors();

	local limits = {};
	for index, floor in pairs(self.floors) do
		table.insert(limits, floor:getLimits());
	end

	local playerStartFloor = self.floors[2];
	local playerSpawnPoint = playerStartFloor.spawns[love.math.random(#playerStartFloor.spawns)];

	self.globalTime = 0;
	self.playerFrozen = 0;
	self.playerMindTimer = PLAYER_MIND_SANE_TIMER;
	self.playerMindMuddled = false;
	self.playerMindMuddleEffect = false;
	self.player = Player(self, playerSpawnPoint, playerStartFloor.origin, self.soundEffects);

	self.items = self:spawnItems(scenarioId);
	self.pathNodes = self:loadPathfinding();
	self.monsterManager = Manager_Monster(self, self.pathNodes, limits, self.player, self.soundEffects);
	self.monsterManager:spawnMonsters(scenarioId);
	self.usedItems = {};
	self.calledPolice = false;
	self.policeTimer = POLICE_TIMER;
	self.heatTurnedOn = false;
	self.taserTimer = 0;
	self.bookBanishmentTimer = BOOK_BANISHMENT_TIMER;
	self.musicBoxBanishmentTimer = MUSIC_BOX_BANISHMENT_TIMER;

	if self.scenarioId == "ghost" then
		self:buryCorpse();
	end

	self.camera = Camera(CAMERA_START_X, CAMERA_START_Y);
	self:updateCamera(self.player.box.x, self.player.box.y);

	self.isPlayerReadingBook = false;
	self.isPlayerPlayingMusicBox = false;
	self.isPlayerShovelling = false;

	self.active = true;
end

function State_Game:resume()
	self.player:resetKeys();
end

function State_Game:loadFloors()
	local floors = {};

	table.insert(floors, Floor(self, "config/floor-layout/main-floor.lua", 1, 0, 0, self.scenarioId, self.soundEffects, self.imageStore));
	table.insert(floors, Floor(self, "config/floor-layout/second-floor.lua", 2, FLOOR_WIDTH + FLOOR_GAP, 0, self.scenarioId, self.soundEffects, self.imageStore));
	table.insert(floors, Floor(self, "config/floor-layout/basement.lua", 3, 0, FLOOR_HEIGHT + FLOOR_GAP, self.scenarioId, self.soundEffects, self.imageStore));
	table.insert(floors, Floor(self, "config/floor-layout/attic.lua", 4, FLOOR_WIDTH + FLOOR_GAP, FLOOR_HEIGHT + FLOOR_GAP, self.scenarioId, self.soundEffects, self.imageStore));

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

	if self.playerFrozen > 0 then
		-- Player has been frozen by a vampire
		if key == KEY_LEFT or key == KEY_RIGHT or key == KEY_UP or key == KEY_DOWN then
			self.playerFrozen = self.playerFrozen - 1;

			if key == KEY_LEFT then
				self.player.facing.x = -1;
			end

			if key == KEY_RIGHT then
				self.player.facing.x = 1;
			end

			if key == KEY_UP then
				self.player.facing.y = -1;
			end

			if key == KEY_DOWN then
				self.player.facing.y = 1;
			end
		end
	else
		self:unfreezePlayer();
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

	if key == KEY_ITEM_USE then
		self:stopUsingItem();
	end
end

function State_Game:gamepadpressed(joystick, button)
	if not self.active then
		return;
	end

	if self.playerFrozen > 0 then
		-- Player has been frozen by a vampire
		if button == GAMEPAD_LEFT or button == GAMEPAD_RIGHT or button == GAMEPAD_UP or button == GAMEPAD_DOWN then
			self.playerFrozen = self.playerFrozen - 1;

			if button == GAMEPAD_LEFT then
				self.player.facing.x = -1;
			end

			if button == GAMEPAD_RIGHT then
				self.player.facing.x = 1;
			end

			if button == GAMEPAD_UP then
				self.player.facing.y = -1;
			end

			if button == GAMEPAD_DOWN then
				self.player.facing.y = 1;
			end
		end
	else
		self:unfreezePlayer();
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

	if button == GAMEPAD_ITEM_USE then
		self:stopUsingItem();
	end
end

function State_Game:gamepadaxis(joystick, axis, value)
	if self.playerFrozen > 0 then
		-- Player has been frozen by a vampire
		if axis == "leftx" or axis == "lefty" then
			self.playerFrozen = self.playerFrozen - 0.3;

			if axis == "leftx" then -- X Movement
				self.player.facing.x = value;
			end

			if axis == "lefty" then -- Y Movement
				self.player.facing.y = value;
			end
		end
	else
		self:unfreezePlayer();
		if axis == "leftx" then -- X Movement
			self.player.gamepadVelocity.x = value;
		end

		if axis == "lefty" then -- Y Movement
			self.player.gamepadVelocity.y = value;
		end
	end

	if axis == "rightx" then -- X Flashlight
		self.player.flashlightFacing.x = value;
	end

	if axis == "righty" then -- Y Flashlight
		self.player.flashlightFacing.y = value;
	end

	if axis == "triggerleft" then -- L2
		if value > GAMEPAD_DEADZONE then
			self.player.runPressed = true;
		elseif value == 0 then
			self.player.runPressed = false;
		end
	end

	if axis == "triggerright" then -- R2
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

	if self.scenarioId == "burglar" or self.scenarioId == "arsonist" or self.scenarioId == "killer" then
		self:updateSpecialPolice(dt);
	elseif self.scenarioId == "ghost" then
		self:updateSpecialGhost(dt);
	elseif self.scenarioId == "alien" then
		self:updateSpecialAlien(dt);
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

function State_Game:updateSpecialPolice(dt)
	if self.calledPolice then
		self.callPoliceSoundTimer:update(dt);
		self.policeTimer = self.policeTimer - dt;
		if self.policeTimer <= 0 then
			self.policeTimer = 0;
			self:winGame();
		end
	end

	if self.taserTimer > 0 then
		self.taserTimer = self.taserTimer - dt;
	end
end

function State_Game:updateSpecialGhost(dt)
	if self.isPlayerReadingBook then
		self.bookBanishmentTimer = self.bookBanishmentTimer - dt;
		if self.bookBanishmentTimer <= 0 then
			self:winGame();
		end
	end
end

function State_Game:updateSpecialAlien(dt)
	if self.isPlayerPlayingMusicBox then
		self.musicBoxBanishmentTimer = self.musicBoxBanishmentTimer - dt;
		if self.musicBoxBanishmentTimer <= 0 then
			self:winGame();
		end
	end

	self.globalTime = self.globalTime + dt;
	if self.globalTime > 500 then
		self.globalTime = self.globalTime - 500;
	end

	self.alienShader:send("iGlobalTime", self.globalTime);

	if self.playerMindTimer > 0 then
		self.playerMindTimer = self.playerMindTimer - dt;

		if self.playerMindTimer < PLAYER_MIND_MUDDLE_TIMER / 5 and not self.playerMindMuddled then
			-- TODO Ramp up to becoming muddled
		end
	elseif self.playerMindTimer <= 0 then
		if self.playerMindMuddled or self.playerMindMuddleEffect then
			-- Go from insane to sane
			self.playerMindMuddled = false;
			self.playerMindMuddleEffect = false;
			self.playerMindTimer = PLAYER_MIND_SANE_TIMER;
		else
			-- Go from sane to insane
			self.playerMindMuddleEffect = true;
			self.playerMindTimer = PLAYER_MIND_MUDDLE_TIMER;

			if not self:playerHasItem("foil") then
				self.playerMindMuddled = true;
			end
		end
	end
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

	if item.itemType == "foil" then
		self.playerMindTimer = PLAYER_MIND_SANE_TIMER;
		self.playerMindMuddled = false;
		self.playerMindMuddleEffect = false;
	end
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

	if selectedItem == nil then
		return;
	end

	if selectedItem.itemType == "meat" then
		local placedMeat = self:getPlacedItem("placed-meat");
		if placedMeat ~= nil then
			placedMeat.active = false;
		end

		table.insert(self.usedItems, Meat(self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2, self.itemHeldSpriteSheet));
		self.player:useItem();
	elseif selectedItem.itemType == "trap" then
		local placedMeat = self:getPlacedItem("placed-trap");
		if placedMeat ~= nil then
			placedMeat.active = false;
		end

		self.player:useItem();
		table.insert(self.usedItems, Trap(self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2, self.itemHeldSpriteSheet));
	elseif selectedItem.itemType == "shotgun" then
		if selectedItem.loaded then
			self.soundEffects.gunshot:rewind();
			self.soundEffects.gunshot:play();
			self.player:useItem();
			table.insert(
				self.usedItems,
				Shotgun_Blast(
					self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2,
					self.player.facing.x, self.player.facing.y,
					self.imageStore.shotgunBlast
				)
			);
		end
	elseif selectedItem.itemType == "shotgun_rounds" then
		local item = self:playerHasItem("shotgun");
		if item ~= nil then
			item.loaded = true;
			table.remove(self.inventory, self.selectedItemIndex);
			self.selectedItemIndex = 1;
			return;
		end
	elseif selectedItem.itemType == "taser" then
		if self.taserTimer <= 0 then
			self.taserTimer = TASER_TIMER;
			self.soundEffects.taser:rewind();
			self.soundEffects.taser:play();
			self.player:useItem();
			table.insert(
				self.usedItems,
				Taser_Blast(
					self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2,
					self.player.facing.x, self.player.facing.y,
					self.imageStore.taserBlast
				)
			);
		end
	elseif selectedItem.itemType == "cellphone_dead" then
		-- Do nothing
	elseif selectedItem.itemType == "cellphone_live" then
		self:callPolice();
	elseif selectedItem.itemType == "cellphone_battery" then
		-- Replace battery in cell phone
		local cellphoneDead = self:playerHasItem("cellphone_dead");
		if cellphoneDead ~= nil then
			local newInventory = {};
			local newItem = Item(-1000, -1000, "cellphone_live", self.itemWorldSpriteSheet, self.itemHeldSpriteSheet);
			newItem:pickup();
			table.insert(newInventory, newItem);

			-- Delete the dead cellphone and the battery from inventory
			for index, item in pairs(self.inventory) do
				if item.itemType ~= "cellphone_battery" and item.itemType ~= "cellphone_dead" then
					table.insert(newInventory, item);
				end
			end

			self.inventory = newInventory;
			self.selectedItemIndex = 1;
		end
	elseif selectedItem.itemType == "bucket" then
		self.soundEffects.waterSplash:rewind();
		self.soundEffects.waterSplash:play();
		self.player:useItem();
		table.insert(
			self.usedItems,
			Bucket_Water(
				self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2,
				self.player.facing.x, self.player.facing.y,
				self.imageStore.waterSplash,
				self.usedItemAnimations.waterSplash:clone()
			)
		);
	elseif selectedItem.itemType == "book" then
		self.isPlayerReadingBook = true;
		self.soundEffects.bookRead:play();
	elseif selectedItem.itemType == "cross" then
		-- Do nothing
	elseif selectedItem.itemType == "stake" then
		self.soundEffects.stakeStab:rewind();
		self.soundEffects.stakeStab:play();
		self.player:useItem();
		table.insert(
			self.usedItems,
			Stake_Stab(
				self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2,
				self.player.facing.x, self.player.facing.y,
				self.imageStore.stakeStab
			)
		);
	elseif selectedItem.itemType == "shovel" then
		self.isPlayerShovelling = true;
		self.player:useItem();
		table.insert(
			self.usedItems,
			Shovel_Dig(
				self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2,
				self.player.facing.x, self.player.facing.y,
				self.soundEffects
			)
		);
	elseif selectedItem.itemType == "knife" then
	elseif selectedItem.itemType == "music_box" then
		self.isPlayerPlayingMusicBox = true;
		self.soundEffects.musicBox:play();
	elseif selectedItem.itemType == "music_box_dead" then
		-- Do nothing
	elseif selectedItem.itemType == "music_box_battery" then
		-- Replace battery in music box
		local cellphoneDead = self:playerHasItem("music_box_dead");
		if cellphoneDead ~= nil then
			local newInventory = {};
			local newItem = Item(-1000, -1000, "music_box", self.itemWorldSpriteSheet, self.itemHeldSpriteSheet);
			newItem:pickup();
			table.insert(newInventory, newItem);

			-- Delete the dead music box and the battery from inventory
			for index, item in pairs(self.inventory) do
				if item.itemType ~= "music_box_battery" and item.itemType ~= "music_box_dead" then
					table.insert(newInventory, item);
				end
			end

			self.inventory = newInventory;
			self.selectedItemIndex = 1;
		end
	elseif selectedItem.itemType == "foil" then
		-- Do nothing
	elseif selectedItem.itemType == "axe" then
	elseif selectedItem.itemType == "gasoline" then
	elseif selectedItem.itemType == "lighter" then
		self.soundEffects.useLighter:rewind();
		self.soundEffects.useLighter:play();
		self.player:useItem();
		table.insert(
			self.usedItems,
			Lighter(
				self.player.box.x + self.player.box.w / 2, self.player.box.y + self.player.box.h / 2,
				self.player.facing.x, self.player.facing.y
			)
		);
	elseif selectedItem.itemType == "crystal" then
	elseif selectedItem.itemType == "scroll" then
	end
end

function State_Game:stopUsingItem()
	-- Book
	self.isPlayerReadingBook = false;
	self.soundEffects.bookRead:stop();

	-- Music Box
	self.isPlayerPlayingMusicBox = false;
	self.soundEffects.musicBox:stop();

	-- Shovel
	self.isPlayerShovelling = false;
	self.soundEffects.shovelDigFail:stop();
	self.soundEffects.shovelDig:stop();
	for index, item in pairs(self.usedItems) do
		if item.type == "placed-shovel-dig" then
			item.active = false;
		end
	end
end

function State_Game:isPlayerUsingItem(item)
	if item == "book" then
		return self.isPlayerReadingBook;
	end

	if item == "music_box" then
		return self.isPlayerPlayingMusicBox;
	end

	if item == "shovel" then
		return self.isPlayerShovelling;
	end

	return false;
end

function State_Game:playerHasItem(itemType)
	for index, item in pairs(self.inventory) do
		if item.itemType == itemType then
			return item;
		end
	end

	return nil;
end

function State_Game:getPlacedItem(itemType)
	for index, usedItem in pairs(self.usedItems) do
		if usedItem.type == itemType then
			return usedItem;
		end
	end

	return nil;
end

function State_Game:hasPlayerCalledPolice()
	return self.calledPolice;
end

function State_Game:freezePlayer()
	self.soundEffects.playerFreeze:rewind();
	self.soundEffects.playerFreeze:play();
	self.soundEffects.playerFrozen:rewind();
	self.soundEffects.playerFrozen:play();

	if FREEZE_PLAYER then
		self.player:resetKeys();
		self.playerFrozen = PLAYER_FREEZE_TIMER;
	end
end

function State_Game:unfreezePlayer()
	if self.soundEffects.playerFrozen:isPlaying() then
		self.soundEffects.playerFrozen:stop();
	end
end

function State_Game:callPolice()
	self.calledPolice = true;
	self.callPoliceSoundTimer:script(function(wait)
		self.soundEffects.phoneRing:play();
		wait(5);
		self.soundEffects.phoneRing:stop();
		self.soundEffects.policeSiren:play();
	end);
end

function State_Game:buryCorpse()
	local graves = {};

	for index, floor in pairs(self.floors) do
		for index2, grave in pairs(floor.graves) do
			table.insert(graves, grave);
		end
	end

	local occupiedGrave = graves[love.math.random(#graves)];
	occupiedGrave.hasCorpse = true;
end

function State_Game:winGame()
	if not SCENARIO_COMPLETED[self.scenarioId] then
		SCENARIO_COMPLETED[self.scenarioId] = true;
		saveGame();
	end

	self:stopAllSounds();
	GameState.push(State_Winning);
end

function State_Game:loseGame()
	self:stopAllSounds();
	GameState.push(State_Losing);
end

function State_Game:stopAllSounds()
	PLAY_SOUNDS = false;

	local continuousSounds = {
		["monsterBite"] = true,
		["knifeStab"] = true,
		["playerDeathYell"] = true,
		["gunshot"] = true,
		["stakeStab"] = true,
		["ghostKill"] = true
	};

	for index, sound in pairs(self.soundEffects) do
		if not continuousSounds[index] then
			sound:stop();
		end
	end

	self.callPoliceSoundTimer:clear();
end

function State_Game:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();
		if not DRAW_ENTIRE_HOUSE then
			self.camera:attach(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, true);
		end

		if DRAW_RAINBOW_SHADER and self.playerMindMuddleEffect then
			love.graphics.setShader(self.alienShader);
		end

		if DRAW_LIGHTS then
			LightWorld:draw(function()
				self:drawGame();
			end);
		else
			self:drawGame();
		end

		if DRAW_RAINBOW_SHADER and self.playerMindMuddleEffect then
			love.graphics.setShader();
		end

		self:drawSpecial();

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

function State_Game:drawSpecial()
	self.monsterManager:drawSpecial();
end

function State_Game:drawHUD()
	love.graphics.setColor(0, 0, 0);
	love.graphics.rectangle("fill", 0, SCREEN_HEIGHT - HUD_HEIGHT, SCREEN_WIDTH, HUD_HEIGHT);

	local y = SCREEN_HEIGHT - HUD_HEIGHT + 20;
	for index, item in pairs(self.inventory) do
		local x = (index-1) * 100 + 30;
		item:drawInventory(x, y);

		if item.itemType == "taser" and self.taserTimer > 0 then
			love.graphics.setColor(255, 255, 255);
			love.graphics.rectangle("fill", x, y - 10, 60, 6);
			love.graphics.setColor(0, 0, 0);
			love.graphics.rectangle("fill", x + 1, y - 9, 58 * (TASER_TIMER - self.taserTimer) / TASER_TIMER, 4);
		end

		if item.itemType == "book" and self.bookBanishmentTimer < BOOK_BANISHMENT_TIMER then
			love.graphics.setColor(255, 255, 255);
			love.graphics.rectangle("fill", x, y - 10, 60, 6);
			love.graphics.setColor(0, 0, 0);
			love.graphics.rectangle("fill", x + 1, y - 9, 58 * (BOOK_BANISHMENT_TIMER - self.bookBanishmentTimer) / BOOK_BANISHMENT_TIMER, 4);
		end

		if item.itemType == "music_box" and self.musicBoxBanishmentTimer < MUSIC_BOX_BANISHMENT_TIMER then
			love.graphics.setColor(255, 255, 255);
			love.graphics.rectangle("fill", x, y - 10, 60, 6);
			love.graphics.setColor(0, 0, 0);
			love.graphics.rectangle("fill", x + 1, y - 9, 58 * (MUSIC_BOX_BANISHMENT_TIMER - self.musicBoxBanishmentTimer) / MUSIC_BOX_BANISHMENT_TIMER, 4);
		end

		if self.selectedItemIndex == index then
			love.graphics.setColor(255, 255, 255);
			love.graphics.rectangle("line", (index-1) * 100 + 30, y, INVENTORY_ITEM_WIDTH, INVENTORY_ITEM_HEIGHT);
		end
	end

	if self.calledPolice then
		love.graphics.setColor(255, 255, 255);
		love.graphics.setFont(self.policeTimerFont);
		love.graphics.print("Police will arrive in " .. string.format("%.2f", self.policeTimer), SCREEN_WIDTH - 350, y + 15, 0, 1, 1);
	end
end