local HallLayer = require "ui.HallScene.HallLayer"
local HallScene = class("HallScene",cc.Scene)

function HallScene:ctor()

	--self.rootLayer = cc.Layer:create():addTo(self)
	self.Layer = cc.Layer:create():addTo(self)
	self:switchMain()
end

function HallScene:showToScene( ui )
	print("showToScene",ui,ui.__cname)
	ui:addTo(self.Layer)
	if ui.__cname == "BaseUI" then
		-- self.layerStack:push(ui)
	end
end

function HallScene:switchMain()
	
	--self.Layer:removeAllChildren()
	self.HallLayer = HallLayer:create()
	self:showToScene(self.HallLayer)

end

return HallScene