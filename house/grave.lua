Grave = Class {
  init = function(self, x, y, w, h, imageStore)
    self.buriedImage = imageStore.buriedGrave;
    self.dugImage = imageStore.dugGrave;
    self.corpseImage = imageStore.corpseGrave;
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

    if self.burnTimer <= 0 then
      -- TODO win game
    end
  end
end

function Grave:dig(dt)
  if self.digTimer > 0 then
    self.digTimer = self.digTimer - dt;
  end
end

function Grave:setFire()
  if not self.hasCorpse or self.digTimer > 0 then
    return;
  end

  self.isBurning = true;
end

function Grave:draw()
  love.graphics.setColor(255, 255, 255);

  if self.isBurning then
    -- TODO draw fire animation
  elseif self.digTimer > 0 then
    love.graphics.draw(self.buriedImage, self.box.x, self.box.y);
  elseif self.hasCorpse then
    love.graphics.draw(self.corpseImage, self.box.x, self.box.y);
  else
    love.graphics.draw(self.dugImage, self.box.x, self.box.y);
  end
end