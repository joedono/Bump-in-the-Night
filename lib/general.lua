function string.explode(str, div)
	assert(type(str) == "string" and type(div) == "string", "invalid arguments");
	local o = {};
	while true do
		local pos1,pos2 = str:find(div);
		if not pos1 then
			o[#o+1] = str;
			break;
		end
		o[#o+1],str = str:sub(1,pos1-1),str:sub(pos2+1);
	end
	return o;
end

function math.clamp(n, low, high)
	return math.min(math.max(n, low), high)
end