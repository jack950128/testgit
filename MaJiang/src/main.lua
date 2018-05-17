DEBUG = 2
CC_USE_FRAMEWORK = true
CC_DISABLE_GLOBAL = false
CC_DESIGN_RESOLUTION = {
	width = 1334,
	height = 750,
	autoscale = "SHOW_ALL",
}
cc.FileUtils:getInstance():addSearchPath("src")
cc.FileUtils:getInstance():addSearchPath("res")
cc.FileUtils:getInstance():addSearchPath("res/ui")
require "cocos.init"
BaseUI = require "ui.BaseUI"

math.randomseed( tonumber(tostring(os.time()):reverse():sub(1, 6)))

json = cjson
app = app or {}
local function main()
	
--	local MainScene = require "scene.MainScene"
--	local scene = MainScene:new()
--    app.MainScene = scene
    local LoginScene=require "ui.LoginScene.LoginScene"
    local scene=LoginScene:new()
    app.LoginScene=scene

	if cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():replaceScene(scene)
	else
		cc.Director:getInstance():runWithScene(scene)
	end
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
	print(msg)
end
