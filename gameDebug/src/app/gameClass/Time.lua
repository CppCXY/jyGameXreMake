_ENV=namespace "game"
using_namespace "luaClass"
using_namespace "container"
---@class Time
---@field public day number
---@field public hour number
class("Time"){
	CLASS_DEBUG(false)
}


function Time:Time(day,hour)
    self.day=day
    self.hour=hour
end

local tiangan={
	["甲"]=1,
	["乙"]=2,
	["丙"]=3,
	["丁"]=4,
	["戊"]=5,
	["己"]=6,
	["庚"]=7,
	["辛"]=8,
	["壬"]=9,
	["癸"]=10,
}
local dizhi={
	["子"]=1,
	["丑"]=2,
	["寅"]=3,
	["卯"]=4,
	["辰"]=5,
	["巳"]=6,
	["午"]=7,
	["未"]=8,
	["申"]=9,
	["酉"]=10,
	["戌"]=11,
	["亥"]=12,	
}
local numTiangan={}
for key,num in pairs(tiangan) do
	numTiangan[num]=key
end
local numDizhi={}
for key,num in pairs(dizhi) do
	numDizhi[num]=key
end


local function year2Stirng(year)
	local r=math.fmod(year,10)
	r=r==0 and 10 or r
	local gan=numTiangan[r]
	local r2=math.fmod(year,12)
	r2=r2==0 and 12 or r
	local zhi=numDizhi[r2]
	return gan,zhi
end
local function mouth2String(year_gan_num,mouth)
	-- body
	local mouth_gan_num=year_gan_num*2+mouth
	local num=math.fmod(mouth_gan_num,10)
	num=num==0 and 10 or num
	local mouth_gan=numTiangan[num]
	mouth=mouth+2
	mouth=math.fmod(mouth,12)
	mouth=mouth==0 and 12 or mouth
	local mouth_zhi=numDizhi[mouth]
	return mouth_gan,mouth_zhi
end
local function day2Stirng(day)
	day=math.fmod(day,60)
	day=day==0 and 60 or day
	local r=math.fmod(day,10)
	r=r==0 and 10 or r
	local gan=numTiangan[r]
	local r2=math.fmod(day,12)
	r2=r2==0 and 12 or r
	local zhi=numDizhi[r2]
	return gan,zhi
end
local function hour2String(hour)
	return numDizhi[hour] or "空"
end

function Time:toString()
    local year=math.ceil(self.day/360)
    local mouth=math.ceil(math.ceil(self.day/30)/12)
    local year_gan,year_zhi=year2Stirng(year)
    local mouth_gan,mouth_zhi=mouth2String(tiangan[ year_gan],mouth)
    local day_gan,day_zhi=day2Stirng(self.day)
    return "江湖".. 
    year_gan..year_zhi.."年"
    ..mouth_gan..mouth_zhi.."月"
    ..day_gan..day_zhi.."日"
    ..hour2String(self.hour).."时"
end
function Time:register(time,luaf)
	if self.eventArray==nil then
		self.eventArray=set()
	end
	local alltime=self.day*12+self.hour+time.day*12+time.hour
	self.eventArray:insert({time=alltime,callBack=luaf})
end

function Time:addTime(time)
    self.day=self.day+time.day
    self.hour=self.hour+time.hour
	local day=math.floor(self.hour/12)
	self.hour=self.hour-day*12
	if self.hour==0 then
		self.hour=12
		day=day-1
	end
	self.day=self.day+day

	if self.eventArray then
		local alltime=self.day*12+self.hour
		local delArray=array()
		--不要在自己循环的时候删除自己的东西
		for event in self.eventArray:iter() do
			if alltime>event.time then
				event.callBack()
				delArray:push_back(event)
			end
		end
		for _,event in delArray:iter() do
			self.eventArray:del(event)
		end
	end
end
function Time:inTime(timeStr)
    return numDizhi[self.hour]==timeStr
end


return Time






