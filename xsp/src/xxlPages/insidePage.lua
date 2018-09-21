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


local pngTable = {
	["yinliang"] = "zhengwu_yinliang.png",
	["zhengji"] = "zhengwu_zhengji.png",
	["shibin"] = "zhengwu_shibin.png",
	["liangshi"] = "zhengwu_liangshi.png",
	["shuxing"] = "zhengwu_shuxing.png"
}

--e.g. priorityArray = {"yinliang", "zhengji"}
local function shouCai(priorityArray)
	priorityArray[#priorityArray+1] = "zhengji" --fall back to zhengji
	
	local function findZhengWuOption(option)
		local x, y = -1, -1
		local png = pngTable[option]
		if png ~= nil then
			x, y = findImageInRegionFuzzy(png, 95, 0, 0, 719, 1279, 0xffffff);
		end
		return x, y
	end
	
	while true do
		local anyZhengWu = false
		for i, v in ipairs(priorityArray) do
			mSleep(500)
			x, y = findZhengWuOption(v)
			if x ~= -1 then
				anyZhengWu = true
				tap(x, y)
				break
			end
		end
		mSleep(1000)
		if anyZhengWu == false then
			break
		end
	end
end



local function exitShiYe()
end

function insidePage.zhengWu() --政务
	enterShiYe()
	mSleep(1000)
	
	local priorityArray = {"yinliang", "zhengji"}
	shouCai(priorityArray)
	exitShiYe()
end

return insidePage