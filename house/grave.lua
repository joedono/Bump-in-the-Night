Grave = Class {
  init = function(self, parentStateGame, x, y, w, h, imageStore)
    self.parentStateGame = parentStateGame;
    self.buriedImage = imageStore.buriedGrave;
    self.dugImage = imageStore.dugGrave;
    self.corpseImage = imageStore.corpseGrave;
    self.burningFireImage = imageStore.burningFire;

    local grid = Anim8.newGrid(32, 32, self.burningFireImage:getWidth(), self.burningFireImage:getHeight());
		self.burningFireAnimation = Anim8.newAnimation(grid("1-3", 1), 0.1);

    self.box = {
      x = x,
      y = y,
      w = GRAVE_WIDTH,
      h = GRAVE_HEIGHT
    };

    BumpWorld:add(self, self.box.x, self.box.y, self.box.w, self.box.h);

    self.digTimer = GRAVE_DIG_TIMER;
    self.burnTimer = GRAVE_BURN_TIMER;
    self.hasCorpse = false;
    self.isBurning = false;

    self.type = "grave";
    self.active = true;
  end
};

function Grave:update(dt)
  if self.isBurning then
    self.burnTimer = self.burnTimer - dt;
    self.burningFireAnimation:update(dt);

    if self.burnTimer <= 0 then
      self.parentStateGame:winGame();
    end
  end
end

function Grave:dig(dt)
  if self.digTimer > 0 then
    self.digTimer = self.digTimer - dt;
    return true;
  end

  return false;
end

function Grave:setFire()
  if not self.hasCorpse or self.digTimer > 0 or self.isBurning then
    return;
  end

  self.isBurning = true;

  local ambientLight = Light:new(LightWorld, 50);
  ambientLight:SetColor(1, 0.5, 0.2);
  ambientLight:SetPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
end

function Grave:draw()
  love.graphics.setColor(1, 1, 1);

  if self.isBurning then
    love.graphics.draw(self.corpseImage, self.box.x + GRAVE_OFFSET_X, self.box.y + GRAVE_OFFSET_Y);
    self.burningFireAnimation:draw(self.burningFireImage, self.box.x - 8, self.box.y - 16, 0, 1.5, 1.5);
  elseif self.digTimer > 0 then
    love.graphics.draw(self.buriedImage, self.box.x + GRAVE_OFFSET_X, self.box.y + GRAVE_OFFSET_Y);
  elseif self.hasCorpse then
    love.graphics.draw(self.corpseImage, self.box.x + GRAVE_OFFSET_X, self.box.y + GRAVE_OFFSET_Y);
  else
    love.graphics.draw(self.dugImage, self.box.x + GRAVE_OFFSET_X, self.box.y + GRAVE_OFFSET_Y);
  end

  if DRAW_BOXES then
    love.graphics.setColor(1, 0, 0, 0.5);
    love.graphics.rectangle("fill", self.box.x, self.box.y, self.box.w, self.box.h);
  end
end
