Floor = Class {
  init = function (self, layoutFile)
    self.source = love.filesystem.load(layoutFile)();
  end
}

function Floor:draw()

end