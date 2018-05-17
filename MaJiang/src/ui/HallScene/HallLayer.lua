local HallLayer = class("HallLayer",BaseUI)
local CreateRoomLayer = require "ui.HallScene.CreateRoom.CreateRoomLayer"
local JoinRoomLayer = require "ui.HallScene.JoinRoom.JoinRoomLayer"
local RechargeLayer = require "ui.HallScene.Recharge.RechargeLayer"
local ResultLayer = require "ui.HallScene.Result.ResultLayer"
local HelpLayer = require "ui.HallScene.Help.HelpLayer"
local NoticeLayer = require "ui.HallScene.Notice.NoticeLayer"
local ShareLayer = require "ui.HallScene.Share.ShareLayer"
local SetLayer = require "ui.HallScene.Set.SetLayer"


HallLayer.csbFile = "HallLayer.csb"
HallLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
HallLayer.tags = {
    btn_creatroom=24,
    btn_joinroom=25,
    btn_recharge=15,
    btn_result=26,
    btn_help=27,
    btn_notice=28,
    btn_share=29,
    btn_set=30,
}




-- 进入场景后执行,创建后会调用此函数,创建对象及数据
function HallLayer:onCreate()
    
end

-- 初始化对象及数据
function HallLayer:initEvents()

end

-- 事件监听
function HallLayer:eventListeners()
    
end

-- 将逻辑X,Y的坐标转化为实际X,Y的坐标
function HallLayer:positionOfStar(x, y)

end

-- 刷新地图
function HallLayer:refreshMap()

end

-- 事件监听
function HallLayer:initEvents()
    -- 大厅按钮的集合

    --创建房间
    self.ui.btn_creatroom:addClickEventListener(function ()
    app.HallScene:showToScene(CreateRoomLayer:create());
    end)

    --加入房间
    self.ui.btn_joinroom:addClickEventListener(function ()
    app.HallScene:showToScene(JoinRoomLayer:create());
    end)

    --充值
    self.ui.btn_recharge:addClickEventListener(function ()
    app.HallScene:showToScene(RechargeLayer:create());
    end)

    --战绩
    self.ui.btn_result:addClickEventListener(function ()
    app.HallScene:showToScene(ResultLayer:create());
    end)

    --帮助
    self.ui.btn_help:addClickEventListener(function ()
    app.HallScene:showToScene(HelpLayer:create());
    end)

    ----通知
    self.ui.btn_notice:addClickEventListener(function ()
    app.HallScene:showToScene(NoticeLayer:create());
    end)

    --分享
    self.ui.btn_share:addClickEventListener(function ()
    app.HallScene:showToScene(ShareLayer:create());
    end)

    --设置
    self.ui.btn_set:addClickEventListener(function ()
    app.HallScene:showToScene(SetLayer:create());
    end)


end




return HallLayer