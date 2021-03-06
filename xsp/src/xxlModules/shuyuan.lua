--书院
local shuyuan = {}

local function enterShuyuan()
	for tmpi=1,5 do
		mSleep(1000)
		
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x961d1f,1|1|0x9f2a26,2|3|0xac6656,4|3|0xd3a798,3|12|0x6b6855,1|14|0x4e4e42,4|14|0x4c4c40,6|15|0x4c4d42",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
			return true
		end
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
	
	local function findRightEmptyTable()
		mSleep(200)
		return findColor({0, 0, 719, 1279},
			"0|0|0x6e5445,1|0|0x6e5446,1|3|0x6e5446,-1|4|0x664b3d,0|4|0x412117,3|2|0x64493c,4|2|0xb5a793,-4|1|0xd1c6b0,-6|-5|0x735a4b",
			90, 0, 0, 0)
	end
	
	local function findLeftEmptyTable()
		mSleep(200)
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
		for tmpi=1,8 do
			mSleep(500)
			swip(300,800,300,800-173)
		end
		
		mSleep(1000)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0xba9876,4|0|0x7a553b,6|0|0x6d4830,8|0|0x643f28,12|-1|0xa07d5e,15|-1|0xba9876,17|-1|0xba9876,21|-1|0xba9876",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
		end
	end
	
	tryFinish()
	local loc_count = 0
	local alreadyScrolledDown = false
	while true do
		mSleep(500)
		local x, y =  findLeftEmptyTable()
		if x == -1 then
			x, y = findRightEmptyTable()
		end
		
		if (x == -1 and alreadyScrolledDown == false) then
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
		loc_count = loc_count + 1
	end
	
	sysLogFmt('书院派遣%d个门客', loc_count)
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