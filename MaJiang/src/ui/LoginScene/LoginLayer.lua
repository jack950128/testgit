local LoginLayer = class("LoginLayer",BaseUI)
local HallLayer = require "ui.HallScene.HallLayer"
LoginLayer.csbFile = "LoginLayer.csb"
LoginLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
LoginLayer.tags = {
    btn_wechat = 4,
    loadbar=5,
}


-- 创建
function LoginLayer:onCreate()
    

end

-- 事件监听
function LoginLayer:initEvents()
    -- 开始按钮
    self.ui.btn_wechat:addClickEventListener(function ()
        local HallScene=require "ui.HallScene.HallScene";
        local scene=HallScene.new();
        app.HallScene=scene;
        --app.LoginScene:showToScene(HallLayer:create())
        cc.Director:getInstance():replaceScene(scene);
        self:remove()
    end)
end



return LoginLayer
