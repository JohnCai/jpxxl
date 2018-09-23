local pagenav = {}

function isInside()
	for tmpi=1,3 do
		mSleep(500)
		x, y = findByImage('nav_chufu.png')
		if x ~= -1 then
			return true
		end
	end
end

function isOutside()
	for tmpi=1,3 do
		mSleep(500)
		x, y = findByImage('nav_huifu.png')
		if x ~= -1 then
			return true
		end
	end
end

function setting()
	mSleep(50)
	tap(69, 1019)
	mSleep(50)
end

--出府
function pagenav.goOutside()
	
	mSleep(500)
	tap(666, 30)
	mSleep(500)
	
end

function pagenav.goSetting()
	if isInside() then
		pagenav.goOutside()
	end
	if isOutside() then
		setting()
		return true
	end
	
	return false
end

return pagenav