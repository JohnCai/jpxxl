--牢房
local laofang = {}

local function enterLaofang()
	for tmpi=1,5 do
		mSleep(1000)
		
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x614442,3|0|0x372724,6|0|0x90837e,5|2|0x1e1f14,4|3|0x333d2f,0|3|0x6a534d,-1|3|0x634239,-4|4|0x735b4d,-8|1|0xaf9c8c",
			95, 0, 0, 0)
		
		if x > -1 then
			tap(x, y)
			return true
		end
	end
	
	return false
end

local function get()
	local function checkOneClickBox() --一键教育
		mSleep(500)
		tap(656, 1116)
	end
	
	local function confirm()
		mSleep(500)
		tap(366, 536)
	end
	
	local function jiaoyu()
		mSleep(500)
		tap(366, 800)
	end
	
	confirm()
	mSleep(2000)
	checkOneClickBox()
	for tmpi=1,9 do --todo
		mSleep(3000)
		jiaoyu()
		mSleep(5000)
		confirm()
	end
	
end

local function exitLaofang()
	mSleep(50)
	tap(669, 28) --右上角返回
end

function laofang.get()
	local entered = enterLaofang()
	if entered then
		get()
		exitLaofang()
	end
end

return laofang