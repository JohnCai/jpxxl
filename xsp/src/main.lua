
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

xxl.getZhengwu().get()
xxl.getZichan().get()
xxl.getHongyan().get()



-- JSON test
--local json = bb.getJSON()