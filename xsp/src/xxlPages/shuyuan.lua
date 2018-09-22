--书院
local shuyuan = {}

local function enterShuyuan()
	for tmpi=1,3 do
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x6b4e23,3|0|0xcaa960,4|0|0xe7c676,7|0|0xfedd88,-4|4|0x110e0d,2|5|0xdfc37f,10|5|0x140f0c,12|5|0x151210",
			95, 0, 0, 0)
		dialog(x, 0)
		dialog(y, 0)
		if x > -1 then
			
			tap(x, y)
			return true
		end
	end
	
	return false
end

local function get()
	mSleep(500)
	tap(650, 239) --click 一键完成
end

local function exitShuyuan()
	mSleep(50)
	tap(669, 28) --右上角返回
end

function shuyuan.get()
	local entered = enterShuyuan()
	if entered then
		get()
		exitShuyuan()
	end
end

return shuyuan