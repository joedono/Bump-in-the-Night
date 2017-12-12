playerCollision = function(player, other)
  if other.type == "wall" then
    return "slide";
  end

  return nil;
end