function string.explode(str, div)
	assert(type(str) == "string" and type(div) == "string", "invalid arguments")
	local o = {}
	while true do
		local pos1,pos2 = str:find(div)
		if not pos1 then
			o[#o+1] = str
			break
		end
		o[#o+1],str = str:sub(1,pos1-1),str:sub(pos2+1)
	end
	return o
end

function math.round(num, idp)
	local mult = 10^(idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

-- Averages an arbitrary number of angles (in radians).
function math.averageAngles(...)
	local x,y = 0,0
	for i=1,select('#',...) do local a= select(i,...) x, y = x+math.cos(a), y+math.sin(a) end
	return math.atan2(y, x)
end

-- Returns the distance between two points.
function math.dist(x1,y1, x2,y2) return ((x2-x1)^2+(y2-y1)^2)^0.5 end

-- Returns the angle between two points.
function math.angle(x1,y1, x2,y2) return math.atan2(x2-x1, y2-y1) end

-- Returns the closest multiple of 'size' (defaulting to 10).
function math.multiple(n, size) size = size or 10 return math.round(n/size)*size end

-- Clamps a number to within a certain range.
function math.clamp(n, low, high) return math.min(math.max(low, n), high) end

-- Linear interpolation between two numbers.
function lerp(a,b,t) return a+(b-a)*t end

-- Cosine interpolation between two numbers.
function cerp(a,b,t) local f=(1-math.cos(t*math.pi))*.5 return a*(1-f)+b*f end

-- Normalize two numbers.
function math.normalize(x,y) local l=(x*x+y*y)^.5 if l==0 then return 0,0,0 else return x/l,y/l,l end end

-- Returns 'n' rounded to the nearest 'deci'th (defaulting whole numbers).
function math.round(n, deci) deci = 10^(deci or 0) return math.floor(n*deci+.5)/deci end

-- Randomly returns either -1 or 1.
function math.rsign() return math.random(2) == 2 and 1 or -1 end

-- Returns 1 if number is positive, -1 if it's negative, or 0 if it's 0.
function math.sign(n) return n>0 and 1 or n<0 and -1 or 0 end

-- Checks if two lines intersect (or line segments if seg is true)
-- Lines are given as four numbers (two coordinates)
function findIntersect(l1p1x,l1p1y, l1p2x,l1p2y, l2p1x,l2p1y, l2p2x,l2p2y, seg1, seg2)
	local a1,b1,a2,b2 = l1p2y-l1p1y, l1p1x-l1p2x, l2p2y-l2p1y, l2p1x-l2p2x
	local c1,c2 = a1*l1p1x+b1*l1p1y, a2*l2p1x+b2*l2p1y
	local det,x,y = a1*b2 - a2*b1
	if det==0 then return false, "The lines are parallel." end
	x,y = (b2*c1-b1*c2)/det, (a1*c2-a2*c1)/det
	if seg1 or seg2 then
		local min,max = math.min, math.max
		if seg1 and not (min(l1p1x,l1p2x) <= x and x <= max(l1p1x,l1p2x) and min(l1p1y,l1p2y) <= y and y <= max(l1p1y,l1p2y)) or
			seg2 and not (min(l2p1x,l2p2x) <= x and x <= max(l2p1x,l2p2x) and min(l2p1y,l2p2y) <= y and y <= max(l2p1y,l2p2y)) then
			return false, "The lines don't intersect."
		end
	end
	return x,y
end

function gradualTurn(startAngle, endAngle, turnSpeed, dt)
	if endAngle > math.pi * 2 then
		endAngle = endAngle - math.pi * 2;
	elseif endAngle < 0 then
		endAngle = endAngle + math.pi * 2;
	end

	if startAngle > math.pi * 2 then
		startAngle = startAngle - math.pi * 2;
	elseif startAngle < 0 then
		startAngle = startAngle + math.pi * 2;
	end

	local nextAngle = endAngle;

	if math.abs(endAngle - startAngle) < 0.15 then
		nextAngle = startAngle;
	else
		-- Determine which circular direction will get to the goal the fastest
		local positiveSearch = startAngle;
		local negativeSearch = startAngle;
		local finalDirection = 0;

		while math.abs(positiveSearch - endAngle) > 0.15 and math.abs(negativeSearch - endAngle) > 0.15 do
			positiveSearch = positiveSearch + 0.1;
			negativeSearch = negativeSearch - 0.1;

			if positiveSearch > math.pi * 2 then
				positiveSearch = positiveSearch - math.pi * 2;
			end

			if negativeSearch < 0 then
				negativeSearch = negativeSearch + math.pi * 2;
			end
		end

		if math.abs(positiveSearch - endAngle) < 0.15 then
			finalDirection = turnSpeed * dt;
		elseif math.abs(negativeSearch - endAngle) < 0.15 then
			finalDirection = -turnSpeed * dt;
		end

		nextAngle = startAngle + finalDirection;
	end

	return nextAngle;
end