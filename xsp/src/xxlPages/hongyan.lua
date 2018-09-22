local hongyan = {}

function hongyan.get()
	
end

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
	tap(176, 1248) --check一键
	mSleep(200)
	tap(580, 1220)
end

local function exitHongyan()
	mSleep(50)
	tap(669, 28)
end

return hongyan