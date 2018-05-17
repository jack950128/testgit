local RechargeLayer = class("RechargeLayer",BaseUI)
RechargeLayer.csbFile = "RechargeLayer.csb"
RechargeLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
RechargeLayer.tags = {
    btn_close=37,
}

function RechargeLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)
end

return RechargeLayer