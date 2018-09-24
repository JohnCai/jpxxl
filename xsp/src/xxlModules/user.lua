local user = {}

local xxl = require("xxl")
local pagenav = xxl.getPagenav()

function switch()
	mSleep(500)
	tap(520,638)
	mSleep(500)
end

function logout()
	local function switchAccount()
		local x, y = -1, -1
		while x == -1 do
			mSleep(500)
			x, y = findColor({14, 1125, 160, 1237},
				"0|0|0xa88860,3|1|0xdcbe80,3|3|0xe2c482,0|5|0xe2c483,0|5|0xe2c483,5|11|0x3d1a1d,3|13|0x5d3a2f,0|13|0x5d3a2f,-2|8|0xb18f5e",
				95, 0, 0, 0)
		end
		tap(x, y)
		mSleep(500)
	end
	
	if pagenav.goSetting() then
		switch()
		mSleep(2000)
	end
	
	switchAccount()
	
end

function login(username, pwd)
	local x, y = -1, -1
	-- wait for login button
	for tmpi=1,10 do
		sysLogFmt('Waiting for login button %d times...', tmpi)
		mSleep(1000)
		x, y = findColor({153, 730, 563, 797},
			"0|0|0x08b75a,2|0|0xffffff,4|0|0x19bc66,3|1|0x26c06e",
			90, 0, 0, 0)
		if x ~= -1 then
			break
		end
	end
	
	if x == -1 then
		sysLog('could not find login button, hardcode here...')
		x, y  = 365, 766 --hardcode login button
	end
	
	mSleep(500)
	touchDown(1,369,618);
	mSleep(50)
	touchUp(1,369,618);
	mSleep(1000);
	inputText("#CLEAR#")
	mSleep(1000);
	inputText(username)
	
	
	mSleep(1000)
	touchDown(1,369,690);
	mSleep(50)
	touchUp(1,369,690);
	mSleep(1000);
	inputText("#CLEAR#")
	mSleep(1000);
	inputText(pwd)
	
	
	mSleep(1000)
	tap(x, y)
	
end

function enterMainPage()
	--尝试10次关掉实名认证
	local function closeShiMing(count)
		local loc_count, loc_closed = count + 1, clickByImage("main_nexttime.png")
		
		if (loc_count <= 10 and loc_closed == false) then
			setTimer(2000,closeShiMing,loc_count)
		end
		
	end
	
	setTimer(1000, closeShiMing, 0)
	
	
	--进入游戏
	local x, y = -1, -1
	while x <= -1 do
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x9c4a03,38|-3|0x8e4005,45|0|0xb06a1a",
			95, 0, 0, 0)
	end
	tap(x, y)
end

function closeNotificationWindow()
	--关掉活动通知
	local x, y = -1, -1
	for tmpi=1,10 do
		mSleep(500)
		--		x, y = findColor({0, 0, 719, 1279},
		--			"0|0|0xfee34b,9|-11|0xdac341,4|2|0xfee34b,-7|3|0xfee34b,-8|-8|0xfce14a",
		--			95, 0, 0, 0)
		x, y = findColor({609,266,710,326},
			"0|0|0xfee34b,3|-1|0xfee34b,5|-1|0xd5be3f,8|-2|0x6e5920,9|-2|0x2a1608",
			90, 0, 0, 0)
		if x ~= -1 then
			tap(x,y)
			break
		end
	end
end

function user.enterGame(username, pwd)
	logout()
	login(username, pwd)
	enterMainPage()
	closeNotificationWindow()
end

return user