
local bb = require("badboy")
local json = bb.getJSON()
bb.loadutilslib()
local xxl = require("xxl")

local ret, results = showUI("ui.json")
if (ret == 0) then
	lua_exit()
end

--local uiconfigs


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
	--	local minute = os.date("%M", mTime()/1000)
	--	local hour = os.date("%H", mTime()/1000)
	--	sysLog(tonumber(minute))
	--	sysLog(tonumber(hour))
	
	sysLogFmt('运行次数：%d', runCount)
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

setSysConfig("isLogFile","1")
while true do
	for tmpi=1,2 do
		username = results[string.format("username%d",tmpi)]
		password = results[string.format("password%d",tmpi)]
		ignoremenke  = results[string.format("ignoremenke%d",tmpi)]
		if (username ~= nil and password ~= nil and string.len(username) > 0 and string.len(password) > 0) then
			runUser(username, password)
			mSleep(2000)
		end
	end
	
	mSleep(60*60*1000)
end




-- JSON test
--local json = bb.getJSON()