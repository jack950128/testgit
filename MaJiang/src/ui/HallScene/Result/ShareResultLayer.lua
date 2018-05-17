local ShareResultLayer = class("ShareResultLayer",BaseUI)
ShareResultLayer.csbFile = "ShareResultLayer.csb"
local ShareLayer = require "ui.HallScene.Share.ShareLayer"
ShareResultLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
ShareResultLayer.tags = {
    btn_close=189,
    btn_share=190,
    btn_back=191,
}

function ShareResultLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    -- 后退按钮
    self.ui.btn_back:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    -- 分享按钮
    self.ui.btn_share:addClickEventListener(function ()
          app.HallScene:showToScene(ShareLayer:create());
    end)
end

function ShareResultLayer:onCreate()

end

return ShareResultLayer
