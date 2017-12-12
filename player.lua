Player = Class {
  init = function (self)
    self.image = love.graphics.newImage("asset/image/player.png");

    self.box = PLAYER_INITIAL_DIMENSIONS;
    self.velocity = { x = 0, y = 0 };
    self.facing = { x = 0, y = 0 };

    BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

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
  self.runPressed = false;
end

function Player:update(dt)
  if not self.active then
    return;
  end

  self:updateVelocity();
  self:updateRotation();
  self:updatePosition(dt);
end

function Player:updateVelocity()
  local vx = 0;
  local vy = 0;

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
  local dx = self.box.x + self.velocity.x * dt;
  local dy = self.box.y + self.velocity.y * dt;

  local actualX, actualY, cols, len = BumpWorld:move(self, dx, dy, playerCollision);

  self.box.x = actualX;
  self.box.y = actualY;
end

function Player:draw()
  love.graphics.setColor(255, 255, 255);

  local facing = math.angle(0, 0, self.facing.y, self.facing.x);
  if(facing < 0) then
    facing = facing + math.pi * 2;
  end

	love.graphics.draw(
		self.image,
		self.box.x + self.box.w / 2,
		self.box.y + self.box.h / 2,
		facing, 1, 1,
		self.box.w / 2,
		self.box.h / 2
	);
end