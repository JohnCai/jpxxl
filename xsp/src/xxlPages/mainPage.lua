local mainPage = {}

function mainPage.login()
	x, y = -1, -1
	while x <= -1 do
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x9c4a03,38|-3|0x8e4005,45|0|0xb06a1a",
			95, 0, 0, 0)
	end
	tap(x, y)
end

function mainPage.closeNotificationWindow()
	x, y = -1, -1
	while x <= -1 do
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
		"0|0|0xfee34b,9|-11|0xdac341,4|2|0xfee34b,-7|3|0xfee34b,-8|-8|0xfce14a",
		95, 0, 0, 0)
	end
	
	tap(x,y)
end

return mainPage