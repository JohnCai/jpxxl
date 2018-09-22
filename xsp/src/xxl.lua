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

function xxl.getInsidePage()
	return getlib('inside', 'xxlPages.insidePage')
end

function xxl.getHongyan()
	return getlib('hongyan', 'xxlPages.hongyan')
end

return xxl