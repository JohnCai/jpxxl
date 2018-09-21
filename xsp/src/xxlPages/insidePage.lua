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
	["shibing"] = "zhengwu_shibing.png", --
	["liangshi"] = "zhengwu_liangshi.png",
	["shuxing"] = "zhengwu_shuxing.png"
}

--e.g. priorityArray = {"yinliang", "zhengji"}
local function shouCai_ZhengWu(priorityArray)
	priorityArray[#priorityArray+1] = "zhengji" --fall back to zhengji
	
	while true do
		local anyZhengWu = false
		for i, v in ipairs(priorityArray) do
			mSleep(500)
			
			if (clickByImage(pngTable[v])) then
				anyZhengWu = true
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
	mSleep(50)
	tap(669, 28)
end


local function enterHuaAn()
	
	--	return clickByImageWithRetry("huaan.png", 5, 2000)
	for tmpi=1,3 do
		mSleep(1000)
		x, y = findColor({0, 0, 719, 1279},
			"0|0|0x917449,1|0|0xa07c48,2|0|0x9a7848,6|0|0x4c412f,11|2|0x4d4639,15|2|0x444239,12|8|0x464034,-7|9|0x574d3b",
			95, 0, 0, 0)
		if x > -1 then
			tap(x, y)
			return true
		end
	end
	
	
	return false
	
end

local function shouCai_ZiChan()
	while true do
		mSleep(1000)
		x, y = findColor({467, 419, 633, 475},
			"0|0|0xe5b436,16|2|0xe4b133",
			95, 0, 0, 0)
		
		if x <= -1 then
			x, y = findColor({468, 763, 627, 809},
				"0|0|0xe5b436,16|2|0xe4b133",
				95, 0, 0, 0)
			if x <= -1 then
				x, y = findColor({472, 1107, 629, 1151},
					"0|0|0xe5b436,16|2|0xe4b133",
					95, 0, 0, 0)
			end
		end
		
		if (x <= -1) then
			break
		else
			tap(x,y)
		end
	end
end

local function exitHuaAn()
	mSleep(50)
	tap(669, 28)
end

function insidePage.zhengWu() --政务
	enterShiYe()
	mSleep(500)
	
	local priorityArray = {"yinliang", "shibing", "zhengji"}
	shouCai_ZhengWu(priorityArray)
	exitShiYe()
end

function insidePage.ziChan() --资产
	--swip(150,500,500,500)
	mSleep(500)
	swip(500,500,250,500)
	mSleep(500)
	
	if enterHuaAn() then
		shouCai_ZiChan()
		exitHuaAn()
	end
end















return insidePage