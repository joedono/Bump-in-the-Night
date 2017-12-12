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

	self.player = Player();
	self.floors = self:loadFloors();

	self.active = true;
end

function State_Game:loadFloors()
	local floors = {};

	-- table.insert(floors, Floor("asset/config/floor-layout/basement.lua"));
	table.insert(floors, Floor("asset/config/floor-layout/main-floor.lua"));
	-- table.insert(floors, Floor("asset/config/floor-layout/second-floor.lua"));
	-- table.insert(floors, Floor("asset/config/floor-layout/attic.lua"));

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

	self.player:update(dt);
end

function State_Game:draw()
	CANVAS:renderTo(function()
		love.graphics.clear();

		for index, floor in pairs(self.floors) do
			floor:draw();
		end

    self.player:draw();
  end);

  love.graphics.setColor(255, 255, 255);
  love.graphics.draw(CANVAS, CANVAS_OFFSET_X, CANVAS_OFFSET_Y, 0, CANVAS_SCALE, CANVAS_SCALE);
end