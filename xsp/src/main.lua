
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
local insidePage = xxl.getInsidePage()

mainPage.login()
mainPage.closeNotificationWindow()

insidePage.zhengWu()
insidePage.ziChan()
xxl.getHongyan().get()



-- JSON test
--local json = bb.getJSON()