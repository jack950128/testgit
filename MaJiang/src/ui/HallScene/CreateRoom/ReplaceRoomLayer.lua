local ReplaceRoomLayer = class("ReplaceRoomLayer",BaseUI)
local RoomInfoLayer=require("ui.HallScene.CreateRoom.RoomInfoLayer")
ReplaceRoomLayer.csbFile = "ReplaceRoomLayer.csb"
ReplaceRoomLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
ReplaceRoomLayer.tags = {
    btn_close=58,
    btn_room_info=59,
    btn_copy_room=60,
    btn_invite_friend=61,
    text1=62,
    text2=64,
    text3=65,
    text4=66,
    text5=67,
    text6=68,
    text7=69,
    text8=70,
}

function ReplaceRoomLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    --开房信息
    self.ui.btn_room_info:addClickEventListener(function ()
          app.HallScene:showToScene(RoomInfoLayer:create());
    end)

    --复制房号
    self.ui.btn_copy_room:addClickEventListener(function ()
         print("复制房号");
    end)

    --邀请好友
    self.ui.btn_invite_friend:addClickEventListener(function ()
         print("邀请好友");
    end)
end

function ReplaceRoomLayer:onCreate()
    
end


return ReplaceRoomLayer