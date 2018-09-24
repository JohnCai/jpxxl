--资产
local zichan = {}

local function enterHuaAn()

	for tmpi=1,5 do
		mSleep(1000)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x917449,1|0|0xa07c48,2|0|0x9a7848,6|0|0x4c412f,11|2|0x4d4639,15|2|0x444239,12|8|0x464034,-7|9|0x574d3b",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
			return true
		end
	end
	
	
	return false
	
end

local function shouCai_ZiChan()
	local loc_count = 0
	while true do
		mSleep(500)
		--商产
		x, y = findColor({467, 419, 633, 475},
			"0|0|0xe5b436,16|2|0xe4b133",
			95, 0, 0, 0)
		
		if x <= -1 then
			--农产
			x, y = findColor({468, 763, 627, 809},
				"0|0|0xe5b436,16|2|0xe4b133",
				95, 0, 0, 0)
			if x <= -1 then
				--士兵
				x, y = findColor({472, 1107, 629, 1151},
					"0|0|0xe5b436,16|2|0xe4b133",
					95, 0, 0, 0)
			end
		end
		
		if (x <= -1) then
			break
		else
			loc_count = loc_count + 1
			tap(x,y)
		end
	end
	
	sysLogFmt('资产收菜%d次', loc_count)
end

local function exitHuaAn()
	mSleep(50)
	tap(669, 28)
end


function zichan.get() 
	if enterHuaAn() then
		shouCai_ZiChan()
		exitHuaAn()
	end
end

return zichan