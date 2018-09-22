--政务

local zhengwu = {}

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

local function exitShiYe()
	mSleep(50)
	tap(669, 28)
end

local pngTable = {
	["yinliang"] = "zhengwu_yinliang.png",
	["zhengji"] = "zhengwu_zhengji.png",
	["shibing"] = "zhengwu_shibing.png", 
	["liangshi"] = "zhengwu_liangshi.png",
	["shuxing"] = "zhengwu_shuxing.png"
}

--e.g. priorityArray = {"yinliang", "zhengji"}
local function shouCai_ZhengWu(priorityArray)
	--priorityArray[#priorityArray+1] = "zhengji" --fall back to zhengji
	
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


function zhengwu.get() 
	enterShiYe()
	mSleep(500)
	
	local priorityArray = {"yinliang", "shibing", "zhengji"}
	shouCai_ZhengWu(priorityArray)
	exitShiYe()
end

return zhengwu