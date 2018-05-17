local ResultLayer = class("ResultLayer",BaseUI)
ResultLayer.csbFile = "ResultLayer.csb"

local ShareResultLayer=require "ui.HallScene.Result.ShareResultLayer"
ResultLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
ResultLayer.tags = {
    btn_close=54,
    pic_templet=26,
    btn_details=29,
    ListView=72,
}

function ResultLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    
    

end

function ResultLayer:onCreate()

    --保持模板
    self.ui.pic_templet:retain();  
    --列表项从父节点中移除  
    self.ui.pic_templet:removeFromParent();  
    
    self:resetListViewRankList();

end

function ResultLayer:resetListViewRankList()
    
    local number =10;

    --循环创建
    for i=1,number do
    local MyList=self.ui.pic_templet:clone();
    local btn_details=MyList:getChildByName("btn_details");--按钮详情
    local label_room_number=MyList:getChildByName("label_room_number");--房间号
    local label_game_round=MyList:getChildByName("label_game_round");--局数

    local label_player1_name=MyList:getChildByName("label_player1_name");--玩家1 名字
    local label_player1_id=MyList:getChildByName("label_player1_id");--玩家1 id
    local label_player1_score=MyList:getChildByName("label_player1_score");--玩家1 分数 下同

    local label_player2_name=MyList:getChildByName("label_player2_name");
    local label_player2_id=MyList:getChildByName("label_player2_id");
    local label_player2_score=MyList:getChildByName("label_player2_score");

    local label_player3_name=MyList:getChildByName("label_player3_name");
    local label_player3_id=MyList:getChildByName("label_player3_id");
    local label_player3_score=MyList:getChildByName("label_player3_score");

    local label_player4_name=MyList:getChildByName("label_player4_name");
    local label_player4_id=MyList:getChildByName("label_player4_id");
    local label_player4_score=MyList:getChildByName("label_player4_score");

    --按钮事件
    btn_details:addTouchEventListener(function(sender, eventType)  
        if (0 == eventType)  then  
             app.HallScene:showToScene(ShareResultLayer:create());
        end 
    end)

    label_player1_name:setString("Test");
    label_player1_id:setString("88888888");
    label_player1_score:setString("+100");
    --添加模板
    self.ui.ListView:addChild(MyList);

    --循环创建结束
    end


    --释放模板
    self.ui.pic_templet:release();

    --不显示滚动条
    self.ui.ListView:setScrollBarEnabled(false);  
end





return ResultLayer