local SetLayer = class("SetLayer",BaseUI)
SetLayer.csbFile = "SetLayer.csb"
SetLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
SetLayer.tags = {
    btn_close=51,
}

function SetLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)
end

return SetLayer
