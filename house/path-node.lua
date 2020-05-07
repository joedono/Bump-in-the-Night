PathNode = Class {
	init = function (self, floorIndex, floor, sourceNode)
		self.id = sourceNode.id;
		self.sourceNode = sourceNode;
		self.floorIndex = floorIndex;
		self.multifloor = sourceNode.properties["multifloor"];
		self.origin = {
			x = sourceNode.x + floor.origin.x,
			y = sourceNode.y + floor.origin.y
		};
		self.light = {};

		if sourceNode.properties["multifloor"] then
			local light = Light:new(LightWorld, 80);
			light:SetColor(0, 0, 0);
			light:SetPosition(self.box.x + self.box.w / 2, self.box.y + self.box.h / 2);
			self.light = light;

			-- TODO Remove this when you find where the path nodes turn red
			-- local light = LightWorld:newLight(self.origin.x + TILE_SIZE / 2, self.origin.y + TILE_SIZE / 2, 160, 0, 0, 80);
			-- light:setVisible(false);
			-- self.light = light;
		end

		self.connections = {};
		self.type = "path";
	end
}

function PathNode:addConnection(pathNode)
	local newConnection = {
		pathNode = pathNode,
		distance = math.dist(self.origin.x, self.origin.y, pathNode.origin.x, pathNode.origin.y)
	};

	table.insert(self.connections, newConnection);
end

function PathNode:draw()
	love.graphics.setColor(0.4, 1, 0);
	love.graphics.rectangle("fill", self.origin.x, self.origin.y, PATH_NODE_SIZE, PATH_NODE_SIZE);

	love.graphics.setColor(1, 1, 1);
	for index, connection in pairs(self.connections) do
		love.graphics.line(
			self.origin.x, self.origin.y,
			connection.pathNode.origin.x + PATH_NODE_SIZE, connection.pathNode.origin.y + PATH_NODE_SIZE
		);
	end
end
