local insidePage = {}

local function enterShiYe() --师爷
	local x, y = -1, -1
	while x <= -1 do
		mSleep(500)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0xc5c1d0,15|0|0xa09dad,2|17|0xbab6c3,-1|77|0xa6a2b2,25|55|0x605c62",
			95, 0, 0, 0)
	end
	tap(x, y)
end

local function shouCai()
	x, y = findImageInRegionFuzzy("zhengwu_zhengji.png", 95, 0, 0, 719, 1279, 0xffffff);
	if x ~= -1  and y ~= -1 then       
		tap(x,y)
	else                               --如果没找到符合条件的
		dialog("没找到 ╮（╯▽╰）╭",0);
	end
end

local function exitShiYe()
end

function insidePage.zhengWu() --政务
	enterShiYe()
	mSleep(1000)
	shouCai()
	exitShiYe()
end

return insidePage