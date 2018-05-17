--开房信息 层
local RoomInfoLayer = class("RoomInfoLayer",BaseUI)
RoomInfoLayer.csbFile = "RoomInfoLayer.csb"
local OpenRoomListLayer=require("ui.HallScene.CreateRoom.OpenRoomListLayer")
RoomInfoLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
RoomInfoLayer.tags = {
    btn_close=160,
    pic_templet=164,
    ListView=162,
    label_time1=165,
    label_time2=218,
    label_room_number=166,
    label_player_number=167,
    btn_copy_number=168,
    btn_invite_friend=169,
    btn_join_room=211,
    pic_smallbg=210,
    label_game_round=212,
    label_game_time=213,
    label_game_fanshu=214,
    label_game_playways=215,
    label_game_type=216,
    label_base_score=217,
    btn_room_list=219,
}

function RoomInfoLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    --开房清单
    self.ui.btn_room_list:addClickEventListener(function ()
         app.HallScene:showToScene(OpenRoomListLayer:create());
    end)
end

function RoomInfoLayer:onCreate()
    --保持模板
    self.ui.pic_templet:retain();  
    --列表项从父节点中移除  
    self.ui.pic_templet:removeFromParent();  

    self:resetListViewRankList();
end

function RoomInfoLayer:resetListViewRankList()
    local number=6;

    for i=1,number do
    local MyList=self.ui.pic_templet:clone();
    --获取内容
    local label_time1=MyList:getChildByName("label_time1");
    local label_time2=MyList:getChildByName("label_time2");
    local label_room_number=MyList:getChildByName("label_room_number");
    local label_player_number=MyList:getChildByName("label_player_number");
    local btn_copy_number=MyList:getChildByName("btn_copy_number");
    local btn_invite_friend=MyList:getChildByName("btn_invite_friend");
    local btn_join_room=MyList:getChildByName("btn_join_room");
    --先获取小背景，后获取内容
    local pic_smallbg=MyList:getChildByName("pic_smallbg");

    local label_game_round=pic_smallbg:getChildByName("label_game_round");
    local label_game_time=pic_smallbg:getChildByName("label_game_time");
    local label_game_fanshu=pic_smallbg:getChildByName("label_game_fanshu");
    local label_game_playways=pic_smallbg:getChildByName("label_game_playways");
    local label_game_type=pic_smallbg:getChildByName("label_game_type");
    local label_base_score=pic_smallbg:getChildByName("label_base_score");


    
    --按钮 加入房间
    if(false) then --人数满了就禁用按钮
        btn_join_room:setEnabled(false);
    else
     btn_join_room:addTouchEventListener(function(sender, eventType)  
         if (0 == eventType)  then  
                print("加入房间");
           end 
     end)
    end



    --按钮 复制房号
    btn_copy_number:addTouchEventListener(function(sender, eventType)  
        if (0 == eventType)  then  
             print("复制房号");
        end 
    end)
    --按钮 邀请好友
    btn_invite_friend:addTouchEventListener(function(sender, eventType)  
        if (0 == eventType)  then  
             print("邀请好友");
        end 
    end)


    label_time1:setString("2018年5月16号");
    label_time1:setString("23:59:59");
    label_room_number:setString("房间号：989898");
    label_game_round:setString("局数8局");
    
    --添加模板
    self.ui.ListView:addChild(MyList);

    --循环创建结束
    end

    --释放模板
    self.ui.pic_templet:release();
end


return RoomInfoLayer