--寻访
local xunfang = {}

local function enterXunfang()
	for tmpi=1,5 do
		mSleep(1000)
		
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x382f20,4|0|0x383127,3|2|0x535149,-2|3|0x392b2b,-9|3|0x6d6938,-9|4|0x71744d,-5|4|0x443825,4|4|0xb3b0a4,12|4|0xaca594",
			95, 0, 0, 0)
		
		if x > -1 then
			tap(x, y)
			return true
		end
	end
	
	return false
end

local function get()
	local function checkOneClickBox()
		mSleep(500)
		tap(160, 1239)
	end
	
	local function doClick()
		mSleep(500)
		x, y = findColor({509, 1208, 672, 1259},
			"0|0|0x74513c,1|1|0x906d52,1|1|0x906d52,1|4|0x401c11,3|1|0xb79572,3|0|0xba9876,3|0|0xba9876,3|-4|0x6f4d3a,0|-4|0x2e0a02",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
			sysLogFmt('一键寻访%d次', 1)
			mSleep(3000)
		else
			sysLogFmt('一键寻访%d次', 0)
		end
	end
	
	
	checkOneClickBox()
	doClick()
	
end

local function exitXunfang()
	mSleep(50)
	tap(669, 28) --右上角返回
end

function xunfang.get()
	local entered = enterXunfang()
	if entered then
		get()
		exitXunfang()
	end
end

return xunfang