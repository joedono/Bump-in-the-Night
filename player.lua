PLAYER_IMAGE = love.graphics.newImage("asset/image/player.png");
PLAYER_SPEED = 100;
PLAYER_RUN_SPEED = 200;
FLASHLIGHT_TURN_SPEED = 3;

UP_KEY = "w";
DOWN_KEY = "s";
LEFT_KEY = "a";
RIGHT_KEY = "d";

UP_LIGHT_KEY = "up";
DOWN_LIGHT_KEY = "down";
LEFT_LIGHT_KEY = "left";
RIGHT_LIGHT_KEY = "right";

FLASHLIGHT_TOGGLE_KEY = " ";
RUN_KEY = "lshift";

Player = Class {
	init = function(self, startX, startY)
		self.x = startX;
		self.y = startY;
		self.w = 20;
		self.h = 20;
		self.r = 0;
		self.canMove = true;
		self.bType = "player";
		
		Bump_World:add(self, self.x, self.y, self.w, self.h);
		
		self.flashLight = Light_World:newLight(0, 0, 255, 255, 255, 200);
		self.flashLight:setPosition(self.x + self.w / 2, self.y + self.h / 2);
		self.flashLight:setDirection(math.pi);
		self.flashLight:setAngle(math.pi * 1/2);
		
		self.ambientLight = Light_World:newLight(0, 0, 50, 50, 50, 100);
		self.ambientLight:setPosition(self.x + self.w / 2, self.y + self.h / 2);
	end
};

function Player.playerBumpFilter(other)
	if(other.bType == "portal") then
		return "cross";
	elseif(other.bType == "wall") then
		return "slide";
	elseif(other.bType == "door") then
		if(other.isOpen) then
			return nil;
		else
			return "touch";
		end
	elseif(other.bType == "item") then
		return "cross";
	end
	
	return nil;
end

function Player:keypressed(key, unicode)
	if(key == FLASHLIGHT_TOGGLE_KEY) then
		self.flashLight:setVisible(not self.flashLight.visible);
	end
end

function Player:update(dt, hudManager)
	local portal = self:updatePosition(dt, hudManager);
	self:updateLights(dt);
	
	return portal;
end

function Player:updatePosition(dt, hudManager)
	local portal = nil;
	local dx, dy = 0, 0;
	local updateR = false;
	
	if(self.canMove) then
		if(love.keyboard.isDown(UP_KEY)) then dy = dy - 1; end
		if(love.keyboard.isDown(DOWN_KEY)) then dy = dy + 1; end
		if(love.keyboard.isDown(LEFT_KEY)) then dx = dx - 1; end
		if(love.keyboard.isDown(RIGHT_KEY)) then dx = dx + 1; end
		
		dx, dy = Vector.normalize(dx, dy);
		
		if(dx ~= 0 or dy ~= 0) then
			self.r = Vector.angleTo(dx, dy);
			
			if(self.r < 0) then
				self.r = self.r + math.pi * 2;
			end
		end
		
		local goalX, goalY = self.x, self.y;
		
		if(love.keyboard.isDown(RUN_KEY)) then
			goalX = self.x + (dx * PLAYER_RUN_SPEED * dt);
			goalY = self.y + (dy * PLAYER_RUN_SPEED * dt);
		else
			goalX = self.x + (dx * PLAYER_SPEED * dt);
			goalY = self.y + (dy * PLAYER_SPEED * dt);
		end
		
		local actualX, actualY, cols, len = Bump_World:move(self, goalX, goalY, Player.playerBumpFilter);
		
		for i = 1, len do
			local col = cols[i];
			if(col.other.bType == "door") then
				if(not col.other.isOpen) then
					col.other:open();
				end
			elseif(col.other.bType == "portal") then
				portal = col.other.dest;
			elseif(col.other.bType == "item") then
				col.other:destroy();
				hudManager:pickupItem(col.other);
			end
		end
		
		self.x = actualX;
		self.y = actualY;
		
		return portal;
	end
end

function Player:updateLights(dt)
	local dx, dy = 0, 0;
	
	if(love.keyboard.isDown(UP_LIGHT_KEY)) then dy = dy - 1; end
	if(love.keyboard.isDown(DOWN_LIGHT_KEY)) then dy = dy + 1; end
	if(love.keyboard.isDown(LEFT_LIGHT_KEY)) then dx = dx - 1; end
	if(love.keyboard.isDown(RIGHT_LIGHT_KEY)) then dx = dx + 1; end
	
	if(dx ~= 0 or dy ~= 0) then
		local flashAngle = Vector.angleTo(dx, dy);
		
		if(flashAngle < 0) then
			flashAngle = flashAngle + math.pi * 2;
		end
		
		if(math.abs(flashAngle - self.flashLight.direction) < 0.15) then
			-- Do nothing to flashAngle
		else
			-- Determine which circular direction will get to the goal the fastest
			local positiveSearch = self.flashLight.direction;
			local negativeSearch = self.flashLight.direction;
			local finalDirection = 0;
			
			while(math.abs(positiveSearch - flashAngle) > 0.15 and math.abs(negativeSearch - flashAngle) > 0.15) do
				positiveSearch = positiveSearch + 0.1;
				negativeSearch = negativeSearch - 0.1;
				
				if(positiveSearch > math.pi * 2) then
					positiveSearch = positiveSearch - math.pi * 2;
				end
				
				if(negativeSearch < 0) then
					negativeSearch = negativeSearch + math.pi * 2;
				end
			end
			
			if(math.abs(positiveSearch - flashAngle) < 0.15) then
				finalDirection = FLASHLIGHT_TURN_SPEED * dt;
			elseif(math.abs(negativeSearch - flashAngle) < 0.15) then
				finalDirection = -FLASHLIGHT_TURN_SPEED * dt;
			end
			
			flashAngle = self.flashLight.direction + finalDirection;
		end
		
		if(flashAngle > math.pi * 2) then
			flashAngle = flashAngle - math.pi * 2;
		end
		
		if(flashAngle < 0) then
			flashAngle = flashAngle + math.pi * 2;
		end
		
		self.flashLight:setDirection(flashAngle);
	elseif(not self.flashLight.visible) then
		local flashAngle = self.r;
		
		if(flashAngle < 0) then
			flashAngle = flashAngle + math.pi * 2;
		end
		
		self.flashLight:setDirection(flashAngle);
	end
	
	self.flashLight:setPosition(self.x + self.w / 2, self.y + self.h / 2);
	self.ambientLight:setPosition(self.x + self.w / 2, self.y + self.h / 2);
end

function Player:move(dx, dy)
	Bump_World:update(self, dx, dy);
	self.x = dx;
	self.y = dy;
end

function Player:setFacing(facing)
	self.r = facing;
	self.flashLight:setDirection(facing);
end

function Player:draw()
	love.graphics.setColor(255, 255, 255);
	love.graphics.draw(
		PLAYER_IMAGE,
		self.x + self.w / 2,
		self.y + self.h / 2,
		self.r, 1, 1,
		self.w / 2,
		self.h / 2
	);
end