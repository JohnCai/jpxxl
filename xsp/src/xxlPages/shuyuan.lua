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
	mSleep(500)
	tap(650, 239) --click 一键完成
	mSleep(5000)
	
	while true do
		mSleep(500)
		emptyTableFound = clickByImage('shuyuan_empty_table.png')
		if emptyTableFound == false then
			break
		end
		mSleep(500)
		
		--scroll down
		for tmpi=1,10 do
			mSleep(500)
			swip(300,800,300,600)
		end
		
		mSleep(500)
		--clickByImage('shuyuan_send.png')
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0xba9876,4|0|0x7a553b,6|0|0x6d4830,8|0|0x643f28,12|-1|0xa07d5e,15|-1|0xba9876,17|-1|0xba9876,21|-1|0xba9876",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
		end
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