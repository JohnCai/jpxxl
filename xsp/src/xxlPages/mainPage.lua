local mainPage = {}



function setting()
	mSleep(50)
	tap(69, 1019)
	mSleep(50)
end

function isInside()
	for tmpi=1,3 do
		mSleep(500)
		x, y = findByImage('nav_chufu.png')
		if x ~= -1 then
			return true
		end
	end
end

--出府
function goOutside()
	mSleep(500)
	tap(666, 30)
	mSleep(500)
end

function isOutside()
	for tmpi=1,3 do
		mSleep(500)
		x, y = findByImage('nav_huifu.png')
		if x ~= -1 then
			return true
		end
	end
end

function switch()
	mSleep(500)
	tap(520,638)
	mSleep(500)
end

function logout()
	local function switchAccount()
		x, y = findColor({14, 1125, 160, 1237},
			"0|0|0xa88860,3|1|0xdcbe80,3|3|0xe2c482,0|5|0xe2c483,0|5|0xe2c483,5|11|0x3d1a1d,3|13|0x5d3a2f,0|13|0x5d3a2f,-2|8|0xb18f5e",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
			mSleep(500)
			return true
		end
		return false
	end
	
	if isInside() then
		goOutside()
	end
	if isOutside() then
		setting()
		switch()
	end
	
	mSleep(2000)
	return switchAccount()
	
end

function login(username, pwd)
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
	tap(369, 760)
	
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
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0xfee34b,9|-11|0xdac341,4|2|0xfee34b,-7|3|0xfee34b,-8|-8|0xfce14a",
			95, 0, 0, 0)
		if x ~= -1 then
			tap(x,y)
			break
		end
	end
end

function mainPage.enterGame(username, pwd)
	logout()
	login(username, pwd)
	enterMainPage()
	closeNotificationWindow()
end

return mainPage