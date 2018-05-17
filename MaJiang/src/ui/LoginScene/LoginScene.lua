local LoginLayer = require "ui.LoginScene.LoginLayer"
local LoginScene=class("LoginScene",cc.Scene)

function LoginScene:ctor()

	self.rootLayer = cc.Layer:create():addTo(self)
	self.Layer = cc.Layer:create():addTo(self)
	self:switchMain()
end

function LoginScene:showToScene( ui )
	print("showToScene",ui,ui.__cname)
	ui:addTo(self.Layer)
	if ui.__cname == "BaseUI" then
		-- self.layerStack:push(ui)
	end
end

function LoginScene:switchMain()
	
	self.Layer:removeAllChildren()
	self.LoginLayer = LoginLayer:create()
	self:showToScene(self.LoginLayer)

end


return LoginScene
