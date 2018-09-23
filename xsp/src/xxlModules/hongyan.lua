--红颜
local hongyan = {}

local function enterHongyan()
	for tmpi=1,10 do
		mSleep(1000)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0xe0d9db,5|0|0xa79b8e,11|-1|0xd2c8be,19|-1|0xdbbfae,26|-1|0x976b5b,26|3|0xa77b68,15|12|0xcaa594,6|12|0x745628,-3|12|0xaa9a86",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
			return true
		end
	end
	
	return false
	
end

local function get()
	mSleep(500)
	tap(176, 1248) --check一键传唤
	mSleep(200)
	
	--click 一键传唤， 不要click恢复精力
	--tap(580, 1220)
	x, y = findColor({506, 1197, 646, 1239},
		"0|0|0xfcf4d3,5|0|0x643e2a,10|0|0xb55b20,17|0|0x8f4c1f",
		95, 0, 0, 0)
	if x > -1 then
		tap(x,y)
		mSleep(3000)
		tap(300, 900) --click anywhere to confirm
	end
end

local function exitHongyan()
	mSleep(500)
	tap(669, 28)
end

function hongyan.get()
	local entered = enterHongyan()
	if entered then
		get()
		exitHongyan()
	end
	
	return entered
end

return hongyan