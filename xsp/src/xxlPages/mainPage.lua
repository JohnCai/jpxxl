local mainPage = {}

function mainPage.login()
	--尝试10次关掉实名认证
	local function closeShiMing(count, closed)
		local loc_count, loc_closed = count + 1, false
		
		local x, y = findImageInRegionFuzzy("main_nexttime.png", 95, 0, 0, 719, 1279, 0xffffff);
		if x ~= -1 then
			
			tap(x, y)
			loc_closed = true;
			
		end
		
		
		if (loc_count <= 10 and loc_closed == false) then
			setTimer(2000,closeShiMing,loc_count)
		end
		
	end
	
	setTimer(1000, closeShiMing, 0)
	
	
	local x, y = -1, -1
	while x <= -1 do
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x9c4a03,38|-3|0x8e4005,45|0|0xb06a1a",
			95, 0, 0, 0)
	end
	tap(x, y)
end

function mainPage.closeNotificationWindow()
	--关掉活动通知
	local x, y = -1, -1
	while x <= -1 do
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0xfee34b,9|-11|0xdac341,4|2|0xfee34b,-7|3|0xfee34b,-8|-8|0xfce14a",
			95, 0, 0, 0)
	end
	
	tap(x,y)
end

return mainPage