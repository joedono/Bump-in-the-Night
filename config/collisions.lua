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
    return "cross";
  end

  if other.type == "item" then
    return "cross";
  end

  if other.type == "monster" and KILL_PLAYER then
    return "cross";
  end

  return nil;
end

monsterCollision = function(monster, other)
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
    return "cross";
  end

  if other.type == "path" then
    return "cross";
  end

  if other.type == "placed-meat" or other.type == "placed-trap" or other.type == "placed-bullets" then
    return "cross";
  end

  if other.type == "player" and KILL_PLAYER then
    return "cross";
  end

  return nil;
end

-- Says which objects should be considered when asked "Can I move from here to there?"
canMoveFilter = function(other)
  if other.type == "wall" then
    return true;
  end

  return false;
end

-- Says which objects should be considered when asked "Can I see over there?"
canSeeFilter = function(other)
  if other.type == "wall" or other.type == "door" then
    return true;
  end

  return false;
end