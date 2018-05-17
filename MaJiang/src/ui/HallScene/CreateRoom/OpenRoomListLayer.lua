local OpenRoomListLayer = class("OpenRoomListLayer",BaseUI)
OpenRoomListLayer.csbFile = "OpenRoomListLayer.csb"
OpenRoomListLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
OpenRoomListLayer.tags = {
    btn_close=110,
    pic_templet=112,
    ListView=111,
    label_time=137,
    label_roomnum=138,
    label_player1=139,
    label_player2=140,
    label_player3=141,
    label_player4=142,
    pic_smallbg=143,
    label_game_round=144,
    label_game_time=145,
    label_game_fanshu=146,
    label_game_playways=147,
    label_game_type=148,
    label_base_score=149,
}

function OpenRoomListLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)
end

function OpenRoomListLayer:onCreate()
    --保持模板
    self.ui.pic_templet:retain();  
    --列表项从父节点中移除  
    self.ui.pic_templet:removeFromParent();  

    self:resetListViewRankList();
end

function OpenRoomListLayer:resetListViewRankList()
    local number=10;

    for i=1,number do
    local MyList=self.ui.pic_templet:clone();
    --获取内容
    local label_time=MyList:getChildByName("label_time");
    local label_roomnum=MyList:getChildByName("label_roomnum");
    local label_player1=MyList:getChildByName("label_player1");
    local label_player2=MyList:getChildByName("label_player2");
    local label_player3=MyList:getChildByName("label_player3");
    local label_player4=MyList:getChildByName("label_player4");
    --先获取小背景，后获取内容
    local pic_smallbg=MyList:getChildByName("pic_smallbg");

    local label_game_round=pic_smallbg:getChildByName("label_game_round");
    local label_game_time=pic_smallbg:getChildByName("label_game_time");
    local label_game_fanshu=pic_smallbg:getChildByName("label_game_fanshu");
    local label_game_playways=pic_smallbg:getChildByName("label_game_playways");
    local label_game_type=pic_smallbg:getChildByName("label_game_type");
    local label_base_score=pic_smallbg:getChildByName("label_base_score");


  

    label_time:setString("2018/05/01  23:59:59");
    label_roomnum:setString("房间号：989898");
    
    --添加模板
    self.ui.ListView:addChild(MyList);

    --循环创建结束
    end

    --释放模板
    self.ui.pic_templet:release();
end

return OpenRoomListLayer
