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

function xxl.getUser()
	return getlib('user', 'xxlModules.user')
end

function xxl.getZichan()
	return getlib('zichan', 'xxlModules.zichan')
end

function xxl.getHongyan()
	return getlib('hongyan', 'xxlModules.hongyan')
end

function xxl.getZhengwu()
	return getlib('zhengwu', 'xxlModules.zhengwu')
end

function xxl.getShuyuan()
	return getlib('shuyuan', 'xxlModules.shuyuan')
end

function xxl.getXunfang()
	return getlib('xunfang', 'xxlModules.xunfang')
end

function xxl.getLaofang()
	return getlib('laofang', 'xxlModules.laofang')
end

function xxl.getPagenav()
	return getlib('pagenav', 'xxlModules.pagenav')
end 

return xxl