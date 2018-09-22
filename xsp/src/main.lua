
local bb = require("badboy")
bb.loadutilslib()
local xxl = require("xxl")

local appId = "com.jpxxl.bingniaozf"

flag = appIsRunning(appId);
if flag == 1 then
	closeApp(appId)
	mSleep(1000)
end

runApp(appId)

mSleep (200)

init(appId, 0);

mSleep(1000)

local mainPage = xxl.getMainPage()

mainPage.login()
mainPage.closeNotificationWindow()

--xxl.getZhengwu().get()

----slowly move to right side
--for tmpi=1,6 do
--	mSleep(1000)
--	swip(500,500,400,500)
--end

--xxl.getZichan().get()
--xxl.getHongyan().get()

--出府
mSleep(500)
tap(666, 30)
mSleep(500)

xxl.getShuyuan().get()



-- JSON test
--local json = bb.getJSON()