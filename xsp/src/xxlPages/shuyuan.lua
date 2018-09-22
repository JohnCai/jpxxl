--书院
local shuyuan = {}

local function enterShuyuan()
	for tmpi=1,5 do
		mSleep(1000)
		--		x, y = findColor({0, 0, 719, 1279},
		--			"0|0|0x6b4e23,3|0|0xcaa960,4|0|0xe7c676,7|0|0xfedd88,-4|4|0x110e0d,2|5|0xdfc37f,10|5|0x140f0c,12|5|0x151210",
		--			95, 0, 0, 0)
		--		dialog(x, 0)
		--		dialog(y, 0)
		
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x961d1f,1|1|0x9f2a26,2|3|0xac6656,4|3|0xd3a798,3|12|0x6b6855,1|14|0x4e4e42,4|14|0x4c4c40,6|15|0x4c4d42",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
			return true
		end
		
		--if clickByImage('shuyuan.png') then
		--			return true
		--		end
	end
	
	return false
end

local function get()
	--一键完成
	local function tryFinish()
		mSleep(500)
		tap(650, 239) 
		mSleep(3000)
	end
	
	local function findLeftEmptyTable()
		return findColor({0, 0, 719, 1279},
			"0|0|0x583b2f,1|0|0x3d1c12,2|0|0x8c7767,3|0|0xd5cbb5,3|1|0xd6cbb5,2|1|0xb9a996,1|1|0x6f5648,0|1|0x664b3e,0|2|0x7a6354",
			95, 0, 0, 0)
	end
	
	local function findRightEmptyTable()
		return findColor({0, 0, 719, 1279},
			"0|0|0x331107,1|0|0x5b3f33,2|0|0xae9f8b,3|0|0xd3c9b3,3|1|0xd3c9b2,2|1|0xbfb29d,1|1|0x887262,0|1|0x654a3d,-1|1|0x6b5243",
			95, 0, 0, 0)
	end
	
	local function scrollDownTable()
		for tmpi=1,3 do
			mSleep(500)
			swip(360,1000,360,800)
		end
	end
	
	local function scrollAndChooseMenke()
		mSleep(500)
		
		--scroll down
		for tmpi=1,10 do
			mSleep(500)
			swip(300,800,300,600)
		end
		
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0xba9876,4|0|0x7a553b,6|0|0x6d4830,8|0|0x643f28,12|-1|0xa07d5e,15|-1|0xba9876,17|-1|0xba9876,21|-1|0xba9876",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
		end
	end
	
	tryFinish()
	local alreadyScrolledDown = false
	while true do
		mSleep(500)
		local x, y =  findLeftEmptyTable()
		if x == -1 then
			x, y = findRightEmptyTable()
		end
		
		if (x == -1 and alreadyScrolledDown == false)then
			scrollDownTable()
			alreadyScrolledDown = true
			mSleep(1000)
			x, y = findLeftEmptyTable()
			if x == -1 then
				x, y = findRightEmptyTable()
			end
		end
		
		if x == -1 then
			break
		end
		
		tap(x, y)
		scrollAndChooseMenke()
	end
	
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