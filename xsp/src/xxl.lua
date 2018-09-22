--小县令主模块
local xxl = {}

local function loadlib(flag, name)
	if xxl[flag] == nil then
		require(name)
		xxl[flag] = true
	end
end

local function getlib(flag, name)
	if xxl[flag] == nil then
		xxl[flag] = require(name)
	end
	
	return xxl[flag]
end

function xxl.getMainPage()
	return getlib('main', 'xxlPages.mainPage')
end

function xxl.getZichan()
	return getlib('zichan', 'xxlPages.zichan')
end

function xxl.getHongyan()
	return getlib('hongyan', 'xxlPages.hongyan')
end

function xxl.getZhengwu()
	return getlib('zhengwu', 'xxlPages.zhengwu')
end

function xxl.getShuyuan()
	return getlib('shuyuan', 'xxlPages.shuyuan')
end

function xxl.getXunfang()
	return getlib('xunfang', 'xxlPages.xunfang')
end

function xxl.getLaofang()
	return getlib('laofang', 'xxlPages.laofang')
end

return xxl