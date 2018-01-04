Player = Class {
  init = function (self, parent)
    self.parent = parent;
    self.image = love.graphics.newImage("asset/image/player.png");

    self.box = {
      x = PLAYER_INITIAL_DIMENSIONS.x,
      y = PLAYER_INITIAL_DIMENSIONS.y,
      w = PLAYER_INITIAL_DIMENSIONS.w,
      h = PLAYER_INITIAL_DIMENSIONS.h
    };
    self.velocity = { x = 0, y = 0 };
    self.gamepadVelocity = { x = 0, y = 0 };
    self.facing = { x = 0, y = 0 };
    self.flashlightFacing = { x = 0, y = 0 };

    BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

    self.flashLight = LightWorld:newLight(0, 0, 255, 255, 255, 400);
		self.flashLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
		self.flashLight:setDirection(math.pi);
		self.flashLight:setAngle(math.pi * 1/3);

		self.ambientLight = LightWorld:newLight(0, 0, 50, 50, 50, 200);
		self.ambientLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);

    self:resetKeys();

    self.active = true;
    self.type = "player";
  end
}

function Player:resetKeys()
  self.leftPressed = false;
  self.rightPressed = false;
  self.upPressed = false;
  self.downPressed = false;

  self.leftLightPressed = false;
  self.rightLightPressed = false;
  self.upLightPressed = false;
  self.downLightPressed = false;

  self.runPressed = false;
  self.gamepadVelocity = { x = 0, y = 0 };
end

function Player:toggleFlashlight()
end

function Player:update(dt)
  if not self.active then
    return;
  end

  self:updateVelocity();
  self:updateRotation();
  self:updatePosition(dt);
  self:updateLights();
end

function Player:updateVelocity()
  local vx = 0;
  local vy = 0;

  if self.leftPressed or self.rightPressed or self.upPressed or self.downPressed then
    if self.leftPressed then
      vx = vx - 1;
    end

    if self.rightPressed then
      vx = vx + 1;
    end

    if self.upPressed then
      vy = vy - 1;
    end

    if self.downPressed then
      vy = vy + 1;
    end
  else
    vx = self.gamepadVelocity.x;
    vy = self.gamepadVelocity.y;

    if math.dist(0, 0, vx, vy) < GAMEPAD_DEADZONE then
      vx = 0;
      vy = 0;
    end
  end

  if vx ~= 0 or vy ~= 0 then
    vx, vy = math.normalize(vx, vy);
  end

  if self.runPressed then
    self.velocity.x = vx * PLAYER_RUN_SPEED;
    self.velocity.y = vy * PLAYER_RUN_SPEED;
  else
    self.velocity.x = vx * PLAYER_WALK_SPEED;
    self.velocity.y = vy * PLAYER_WALK_SPEED;
  end
end

function Player:updateRotation()
  if self.velocity.x ~= 0 or self.velocity.y ~= 0 then
    local fx, fy = math.normalize(self.velocity.x, self.velocity.y);
    self.facing.x = fx;
    self.facing.y = fy;
  end
end

function Player:updatePosition(dt)
  local warped = false;
  local dx = self.box.x + self.velocity.x * dt;
  local dy = self.box.y + self.velocity.y * dt;

  local actualX, actualY, cols, len = BumpWorld:move(self, dx, dy, playerCollision);

  for i = 1, len do
    local col = cols[i];
    if col.other.type == "door" then
      if not col.other.isOpen then
        col.other:open();
      end
    end

    if col.other.type == "portal" then
      self:moveThroughPortal(col.other);
      warped = true;
    end

    if col.other.type == "item" then
      self.parent:pickupItem(col.other);
    end
  end

  if not warped then
    self.box.x = actualX;
    self.box.y = actualY;
  end
end

function Player:updateLights()
  if self.leftLightPressed or self.rightLightPressed or self.upLightPressed or self.downLightPressed then
    local lx = 0;
    local ly = 0;

    if self.leftLightPressed then
      lx = lx - 1;
    end

    if self.rightLightPressed then
      lx = lx + 1;
    end

    if self.upLightPressed then
      ly = ly - 1;
    end

    if self.downLightPressed then
      ly = ly + 1;
    end

    self.flashlightFacing.x = lx;
    self.flashlightFacing.y = ly;
  end

  if (self.flashlightFacing.x ~= 0 or self.flashlightFacing.y ~= 0) and
    math.dist(0, 0, self.flashlightFacing.x, self.flashlightFacing.y) > GAMEPAD_DEADZONE then
    local facing = math.angle(0, 0, self.flashlightFacing.y, self.flashlightFacing.x);
    if facing < 0 then
      facing = facing + math.pi * 2;
    end

    self.flashLight:setDirection(facing);
  end

  self.flashLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
  self.ambientLight:setPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
end

function Player:moveThroughPortal(portal)
  local dx = portal.properties.dx;
  local dy = portal.properties.dy;
  local room = self.parent.floors[portal.properties.room]

  dx = dx + room.origin.x;
  dy = dy + room.origin.y;

  self.box.x = dx;
  self.box.y = dy;
  BumpWorld:update(self, dx, dy);
end

function Player:draw()
  love.graphics.setColor(255, 255, 255);

  local facing = math.angle(0, 0, self.facing.y, self.facing.x);
  if facing < 0 then
    facing = facing + math.pi * 2;
  end

	love.graphics.draw(
		self.image,
		self.box.x + self.box.w / 2,
		self.box.y + self.box.h / 2,
		facing,
    PLAYER_SCALE,
    PLAYER_SCALE,
		PLAYER_IMAGE_WIDTH / 2,
		PLAYER_IMAGE_HEIGHT / 2
	);
end