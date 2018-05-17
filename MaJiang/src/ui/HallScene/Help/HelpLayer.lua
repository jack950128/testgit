local HelpLayer = class("HelpLayer",BaseUI)
HelpLayer.csbFile = "HelpLayer.csb"
HelpLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
HelpLayer.tags = {
    btn_close=60,
}

function HelpLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)
end


return HelpLayer
