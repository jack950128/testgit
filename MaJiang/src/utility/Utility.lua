local MUtility = {}

function MUtility.isAndroid()
	if cc.Application:getInstance():getTargetPlatform() == cc.PLATFORM_OS_ANDROID then
		return true
	end
	return false
end
function MUtility.isIos()
	return device.platform == "ios"
end

function MUtility.isWindows()
	return cc.Application:getInstance():getTargetPlatform() == 0
end


function MUtility.getPlatformName()
	return device.platform
end

function MUtility.getMonthDays( month )
	local tmp = {
		[1] = 31,
		[2] = 28,
		[3] = 31,
		[4] = 30,
		[5] = 31,
		[6] = 30,
		[7] = 31,
		[8] = 31,
		[9] = 30,
		[10] = 31,
		[11] = 30,
		[12] = 31,
	}
	local tt = os.date("*t",MSys.getServerTime())
	if MUtility.isLeapYear(tt.year) then
		tmp[2] = 29
	end
	return tmp[month]
end

function MUtility.isLeapYear( year )
	if( year % 4 == 0 and year % 100 ~= 0 ) or year % 400 == 0 then
		return true
	end
	return false
end

--时间戳转成时间字符串
function MUtility.getFormatedDateTime( timeStamp )
	local ttt = os.date("%Y-%m-%d %H:%M:%S", timeStamp )
	return ttt
end

function MUtility.getDayFirstTimeStampByTS( ttimestamp )
	local sts = MUtility.getFormatedDateTime(ttimestamp)
	local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
	local tyear, tmonth, tday, thour, tminut, tscend = string.match(sts, pattern)
	local temp = {year = tyear, month = tmonth, day = tday, hour = 0, min = 0, sec = 1, isdst = false}
	return os.time(temp)
end

--获取当天的最后一秒时间戳
function MUtility.getDayLastTimeStamp( tdatetime )
	if tdatetime == "0000-00-00 00:00:00" then
		return 0
	end
	local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
	local tyear, tmonth, tday, thour, tminut, tscend = string.match(tdatetime, pattern)
	local temp = {year = tyear, month = tmonth, day = tday, hour = 23, min = 59, sec = 59, isdst = false}
	return os.time(temp)
end

--获取第二天的时间戳
function MUtility.getTomorrowFirstTimeStamp( tdatetime )
	local sts = MUtility.getFormatedDateTime(tdatetime)
	if sts == "0000-00-00 00:00:00" then
		return 0
	end
	local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
	local tyear, tmonth, tday, thour, tminut, tscend = string.match(sts, pattern)
	local temp = {year = tyear, month = tmonth, day = tday+1, hour = 0, min = 0, sec = 0, isdst = false}
	return os.time(temp)
end

--获取当天的最后一秒时间戳
function MUtility.getDayLastTimeStampByTS( ttimestamp )
	local sts = MUtility.getFormatedDateTime(ttimestamp)
	return MUtility.getDayLastTimeStamp( sts )
end

-- 根据时间戳算出那天的最后一秒
function MUtility.getStampLastTime( stamp )
	local t = os.date("*t",stamp)
	local temp = { year = t.year, month = t.month, day = t.day, hour = 23, min = 59, sec = 59, isdst = false}
	return os.time(temp)
end


--注意： 把服务器发过来的 datetime 转换成本地的 datetime
function MUtility.serverDateTimeTurnToLocalDataTime( tdatetime )
	local localst = MUtility.dateTimeTurnToTimeStamp( tdatetime )
	return MUtility.getFormatedDateTime( localst )
end

--时间字符串转成时间戳
--注意警告，传入的时间字符串只能是服务器的时间串，不能传入本地的， 处理的服务器和客户端在不同的时区问题
function MUtility.dateTimeTurnToTimeStamp( tdatetime )
	if tdatetime == "0000-00-00 00:00:00" then
		return 0
	end
	local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
	local tyear, tmonth, tday, thour, tminut, tscend = string.match(tdatetime, pattern)
	local temp = {year = tyear, month = tmonth, day = tday, hour = thour, min = tminut, sec = tscend, isdst = false}
	
	local localtimest = os.time(temp)
	localtimest = localtimest + MSys.GetServerZoneDiffSec()-----已经处理时区不同问题
	return localtimest
end

--本地的时间字符串转时间戳
function MUtility.localDateTimeTurnToTimeStamp( tdatetime )
	if tdatetime == "0000-00-00 00:00:00" then
		return 0
	end
	local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
	local tyear, tmonth, tday, thour, tminut, tscend = string.match(tdatetime, pattern)
	local temp = {year = tyear, month = tmonth, day = tday, hour = thour, min = tminut, sec = tscend}--, isdst = false --注意夏时令的问题，跟随系统的设置走
	
	local localtimest = os.time(temp)
	return localtimest
end



function MUtility.timeBetweenTarget(target)
	local date = os.date("*t")
	local hour = date.hour
	local min = date.min
	local sec = date.sec
	local time1 = date.hour*3600 + min*60 + sec
	local time2 = target*3600
	local interval = time1 - time2
	if interval < 0 then
		interval = -interval
	else
		interval = 24*3600 - interval
	end
	local rewardTime = {}
	rewardTime.hour = math.floor(interval/3600)
	rewardTime.min = math.floor( (interval%3600)/60 )
	rewardTime.sec = interval - 3600*rewardTime.hour - 60*rewardTime.min
	return rewardTime
end


-- 是否在两个小时之间
function MUtility.isBetweenHour( hour1, hour2 )
	local stime = os.date("*t", MSys.getServerTime())
	local hour = stime.hour
	if hour >= hour1 and hour < hour2 then
		return true
	end
	return false
end


-- 秒数转成时，分，秒
function MUtility.intervalToTime( interval )
	-- local time = {}
	local time = interval
	local day = math.floor(time/86400)
	time = time - day*86400
	local hour = math.floor(time/3600)
	time = time - hour*3600
	local min = math.floor( time/60 )
	time = time - min*60
	local sec = time
	local rewardTime = {}
	rewardTime.day = day
	rewardTime.hour = hour
	rewardTime.min = min
	rewardTime.sec = sec
	return rewardTime
end

-- 获得指定小时数的时间戳
function MUtility.getHourTimeStamp(targetHour)
	local tdatetime = os.date("*t")
	local temp = {year = tdatetime.year, month = tdatetime.month, day = tdatetime.day, hour = targetHour, min = 0, sec = 0}--, isdst = false --注意夏时令的问题，跟随系统的设置走
	
	local localtimest = os.time(temp)
	return localtimest
end

function MUtility.getDayFromDateTime( tdatetime )
	local pattern = "(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)"
	local tyear, tmonth, tday, thour, tminut, tscend = string.match(tdatetime, pattern)
	local temp = {}
	temp.year = tyear
	temp.month = tmonth
	temp.day = tday
	return temp
end

-- 这个函数会根据时区转换时间只能传入服务端的时间字符串
function MUtility.isNotToday( lastDate )
	local function isOneTrue( bool1,bool2,bool3 )
		return bool1 or bool2 or bool3
	end
	-- print("lastDatelastDate",lastDate)
	lastDate = MUtility.serverDateTimeTurnToLocalDataTime(lastDate)
	-- print("lastDatelastDate turn",lastDate)
	local t = os.date("*t",MSys.getServerTime())
	local curYear = tonumber(t.year)
	local curMonth = tonumber(t.month)
	local curDay = tonumber(t.day)
	local lastDataTime = MUtility.getDayFromDateTime(lastDate)
	local lastYear = tonumber(lastDataTime.year)
	local lastMonth = tonumber(lastDataTime.month)
	local lastDay = tonumber(lastDataTime.day)
	return isOneTrue((lastYear ~= curYear),(lastMonth ~= curMonth),(lastDay ~= curDay))
end

--用服务器的时间戳比较
function MUtility.isNotTodayByServerSt( tserverSt )
	local function isOneTrue( bool1,bool2,bool3 )
		return bool1 or bool2 or bool3
	end

	local tser = os.date("*t",tserverSt)
	local t = os.date("*t",MSys.getServerTime())

	local curYear = tonumber(t.year)
	local curMonth = tonumber(t.month)
	local curDay = tonumber(t.day)

	local lastYear = tonumber(tser.year)
	local lastMonth = tonumber(tser.month)
	local lastDay = tonumber(tser.day)
	return isOneTrue((lastYear ~= curYear),(lastMonth ~= curMonth),(lastDay ~= curDay))
end

function MUtility.getUTF8Len( str )
	local tab = MUtility.getStringUTF8(str)
	return #tab
end
function MUtility.getStringUTF8( str )
	local tab = {}
	for uchar in string.gfind(str, "[%z\1-\127\194-\244][\128-\191]*") do
		tab[#tab+1] = uchar
	end
	return tab
end


--获取时间戳，到现在的天数
--时间戳时间 除以 3600 * 24 获得1970/1/1到现在的天数会有问题，时间差8个小时
-- 17016 * 3600 * 24 得到的时间戳是2016/8/3 8:0:0 不是0点
function MUtility.getDays( tst )
	----这里有坑hack一下
	tst = MUtility.getDayFirstTimeStampByTS( tst ) + 12 *3600
	
	local tdays = tst / ( 3600 * 24 )
	tdays = math.floor( tdays )
	return tdays
end

--验证手机号
function MUtility.isPhoneNumber( tstr )
	if tstr == nil then
		return false
	end

	local tpartten = "1[34578]%d%d%d%d%d%d%d%d%d"
	local matchstr = tstr:match( tpartten )
	if matchstr ~= tstr then
		return false
	end
	return true
end

-- 过滤卡牌模板表
-- 品质,技能颜色,门派
-- 返回的是模板表array
function MUtility.filterCard( quality, skillColor, race , name , weapon)
	local function isSkillColor( sid )
		local colors = MTemplate.getCardSkillById(sid).color
		return colors[skillColor] ~= nil
	end
	local tmp = {}

	if quality == nil then
		tmp = MTemplate.template_card_com
	else
		for k,v in pairs(MTemplate.template_card_com) do
			if quality == v.quality then
				table.insert(tmp,v)
			end
		end
	end

	local tmp2 = {}
	if skillColor == nil then
		tmp2 = tmp
	else
		for k,v in pairs(tmp) do
			if isSkillColor(v.skill) then
				table.insert(tmp2,v)
			end
		end
	end

	local tmp3 = {}
	if race == nil then
		tmp3 = tmp2
	else
		for k,v in pairs(tmp2) do
			if race == v.race then
				table.insert(tmp3,v)
			end
		end
	end

	local tmp4 = {}
	if name == nil or name=="" or name == " " then
		tmp4 = tmp3
	else
		for k,v in pairs(tmp3) do
			local index = string.find(v.name,name)
		--	print("tmp4 try match",v.name,name)
			if index ~= nil then
			--	print("find at ",index)
				table.insert(tmp4,v)
			else
			--	print("not find")
			end
		end
	end

	local tmp5 = {}
	if weapon == nil then
		tmp5 = tmp4
	else
		for k,v in pairs(tmp4) do
			if weapon == v.weapon then
				table.insert(tmp5, v)
			end
			
		end
	end

	return tmp5
end


function MUtility.checkName( name, len )
	len = len or 6
	if name == nil or name == "" then
		app.gameScene:showTip("内容不能为空")
		return false
	end


	local tab = MUtility.getStringUTF8(name)
	local first = tab[1]
	local last = tab[#tab]
	if first == " " then
		app.gameScene:showTip("内容不能以空格开始")
		return false
	end
	if last == " " then
		app.gameScene:showTip("内容不能以空格结尾")
		return false
	end
	if #tab > len then
		app.gameScene:showTip("内容太长了！")
		return false
	end

	local filter = {
			"'",
			"\"",
			"`",
			"\b",
			"\n",
			"\r",
			"\t",
			"\\",
			"\\\\%",
			"\\_",
	}
	for k,v in pairs(filter) do
		local pos1,pos2 = string.find(name, v)
		if pos1 ~= nil then
			app.gameScene:showTip("内容含有非法字符，请重新输入！")
			return false
		end
	end
	local _, flag = MDiskey.checkWord(name)

	if flag == true then
		app.gameScene:showTip("内容含有敏感字符，请重新输入！")
		return false
	end
	return true
end

-- 是否是下一天刷新时间
-- 改成12点
function MUtility.isNextDayRefreshTime( stamp )

	local function isOneTrue( bool1,bool2,bool3 )
		return bool1 or bool2 or bool3
	end
	local serverTime = math.floor(MSys.getServerTime())
	local t = os.date("*t",serverTime)

	local curYear = t.year
	local curMonth = t.month
	local curDay = t.day
	local lastDataTime = os.date("*t",stamp)
	local lastYear = lastDataTime.year
	local lastMonth = lastDataTime.month
	local lastDay = lastDataTime.day
	return isOneTrue((lastYear ~= curYear),(lastMonth ~= curMonth),(lastDay ~= curDay))
end

-- 下一个礼拜天的时间戳
function MUtility.getSundayWeeHours( ts )
	-- wday
	-- 星期天是1，星期一2，3,4,5,6,7
	local time = os.date("*t",ts)
	if time.wday == 1 then
		local temp = { year = time.year, month = time.month, day = time.day, hour = 0, min = 0, sec = 0, isdst = false }
		return os.time(temp)
	else
		ts = ts or MSys.getServerTime()
		return MUtility.getSundayWeeHours(ts+(7 - time.wday + 1)*86400)
	end
end



function MUtility.split(s, p)
	local rt= {}
	while true do
		local pos,endP = string.find(s, p)
		if not pos then
			rt[#rt + 1] = s
			break
		end
		local subStr = string.sub(s, 1, pos - 1)
		rt[#rt + 1] = subStr
		s = string.sub(s, endP + 1)
	end
	return rt
end

function MUtility.getVersionXYZ( version )
	local tmp = MUtility.split(version,"%.")
	return tonumber(tmp[1]),tonumber(tmp[2]),tonumber(tmp[3])
end

function MUtility.compareVersion( new, cur )
	local new = { MUtility.getVersionXYZ(new) }
	local cur = { MUtility.getVersionXYZ(cur) }

	for i=1,3 do
		if new[i] > cur[i] then
			return 1
		elseif new[i] < cur[i] then
			return -1
		end
	end
	return 0
end
-- print(MUtility.compareVersion("1.1.1","1.1.1"))


return MUtility