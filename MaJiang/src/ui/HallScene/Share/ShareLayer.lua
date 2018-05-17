--分享 层
local ShareLayer = class("ShareLayer",BaseUI)
ShareLayer.csbFile = "ShareLayer.csb"
ShareLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
ShareLayer.tags = {
    btn_close=69,
    btn_wechat=70,
    btn_friend=71,
}

function ShareLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    --微信分享
    self.ui.btn_wechat:addClickEventListener(function ()
         --分享
    end)

     --朋友圈分享
    self.ui.btn_friend:addClickEventListener(function ()
         --分享
    end)
end


return ShareLayer