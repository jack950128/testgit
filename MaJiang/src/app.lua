--[[
    全局变量，常量存放到这里
    接口调整，测试调整，等等都放在这里
]]

app = app or {}

-- 空函数占位符,CallFunc用
function app.doNothing()
	
end

-- 全局变量存放到这里
-- 通用函数
MUtility = require "utility.Utility"

-- 全局常量存放到这里
MGameConstClient = require "const.GameConstClient"