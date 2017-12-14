playerCollision = function(player, other)
  if other.type == "wall" then
    return "slide";
  end

  if other.type == "door" then
		if other.isOpen then
			return nil;
		else
			return "touch";
		end
  end

  if other.type == "portal" then
    return "touch";
  end

  return nil;
end