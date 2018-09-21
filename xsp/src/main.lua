local bb = require("badboy")
bb.loadutilslib()
local xxl = require("xxl")

runApp("com.jpxxl.bingniaozf")

mSleep (200)

init("com.jpxxl.bingniaozf", 0);

mSleep(1000)

local mainPage = xxl.getMainPage()
mainPage.login()
mainPage.closeNotificationWindow()




-- JSON test
--local json = bb.getJSON()