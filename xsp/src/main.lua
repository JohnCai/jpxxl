
local bb = require("badboy")
bb.loadutilslib()
local xxl = require("xxl")

local appId = "com.jpxxl.bingniaozf"

local runCount = 1

if appIsRunning(appId) == 0 then
	runApp(appId)
	mSleep(500)
end

if frontAppName() ~= appId then
	dialog("请打开九品小县令再运行该脚本！", 5);
	mSleep(3000);
	lua_exit();
end

init(appId, 0);
mSleep(1000)



local function runUser(username, pwd)
	local minute = os.date("%M", mTime()/1000)
	local hour = os.date("%H", mTime()/1000)
	--	if hour == '23' then
	--		sysLog('ok, 23')
	--    end
	
	sysLogFmt('count=%d', runCount)
	runCount = runCount + 1
	
	xxl.getUser().enterGame(username, pwd)

	mSleep(500)
	xxl.getZhengwu().get()
	
	--slowly move to right side
	for tmpi=1,3 do
		mSleep(1000)
		swip(500,500,300,500)
	end
	
	xxl.getZichan().get()
	xxl.getHongyan().get()
	
	local pagenav = xxl.getPagenav()
	pagenav.goOutside()
	
	xxl.getShuyuan().get()
	mSleep(500)
	xxl.getXunfang().get()
	mSleep(500)
	--xxl.getLaofang().get()
	
end

while true do
	runUser("1010797424", "yuwan123")
	mSleep(5*60*1000) 
end




-- JSON test
--local json = bb.getJSON()