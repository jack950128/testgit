local ResultLayer = class("ResultLayer",BaseUI)
ResultLayer.csbFile = "ResultLayer.csb"

local ShareResultLayer=require "ui.HallScene.Result.ShareResultLayer"
ResultLayer.csbPosition = cc.p(0,0)
-- ���ݡ��߼���ǩ����ȡCocos Studio������UI
ResultLayer.tags = {
    btn_close=54,
    pic_templet=26,
    btn_details=29,
    ListView=72,
}

function ResultLayer:initEvents()
    -- �رղ㰴ť
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    
    

end

function ResultLayer:onCreate()

    --����ģ��
    self.ui.pic_templet:retain();  
    --�б���Ӹ��ڵ����Ƴ�  
    self.ui.pic_templet:removeFromParent();  
    
    self:resetListViewRankList();

end

function ResultLayer:resetListViewRankList()
    
    local number =10;

    --ѭ������
    for i=1,number do
    local MyList=self.ui.pic_templet:clone();
    local btn_details=MyList:getChildByName("btn_details");--��ť����
    local label_room_number=MyList:getChildByName("label_room_number");--�����
    local label_game_round=MyList:getChildByName("label_game_round");--����

    local label_player1_name=MyList:getChildByName("label_player1_name");--���1 ����
    local label_player1_id=MyList:getChildByName("label_player1_id");--���1 id
    local label_player1_score=MyList:getChildByName("label_player1_score");--���1 ���� ��ͬ

    local label_player2_name=MyList:getChildByName("label_player2_name");
    local label_player2_id=MyList:getChildByName("label_player2_id");
    local label_player2_score=MyList:getChildByName("label_player2_score");

    local label_player3_name=MyList:getChildByName("label_player3_name");
    local label_player3_id=MyList:getChildByName("label_player3_id");
    local label_player3_score=MyList:getChildByName("label_player3_score");

    local label_player4_name=MyList:getChildByName("label_player4_name");
    local label_player4_id=MyList:getChildByName("label_player4_id");
    local label_player4_score=MyList:getChildByName("label_player4_score");

    --��ť�¼�
    btn_details:addTouchEventListener(function(sender, eventType)  
        if (0 == eventType)  then  
             app.HallScene:showToScene(ShareResultLayer:create());
        end 
    end)

    label_player1_name:setString("Test");
    label_player1_id:setString("88888888");
    label_player1_score:setString("+100");
    --���ģ��
    self.ui.ListView:addChild(MyList);

    --ѭ����������
    end


    --�ͷ�ģ��
    self.ui.pic_templet:release();

    --����ʾ������
    self.ui.ListView:setScrollBarEnabled(false);  
end





return ResultLayer