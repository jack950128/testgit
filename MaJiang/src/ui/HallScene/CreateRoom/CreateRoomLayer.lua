--创建房间 层
local CreateRoomLayer = class("CreateRoomLayer",BaseUI)
local ReplaceRoomLayer = require "ui.HallScene.CreateRoom.ReplaceRoomLayer"
CreateRoomLayer.csbFile = "CreateRoomLayer.csb"
CreateRoomLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
CreateRoomLayer.tags = {
    btn_close=121,
    btn_cancel=34,
    btn_confirm=35,
    btn_substitute=36,
    check1=41,
    text1=102,
    check2=42,
    text2=104,
    check3=85,
    text3=105,
    check4=86,
    text4=106,
    check5=87,
    text5=107,
    check6=88,
    text6=108,
    check7=89,
    text7=109,
    check8=90,
    text8=110,
    check9=91,
    text9=111,
    check10=92,
    text10=112,
    check11=93,
    text11=113,
    check12=94,
    text12=114,
    check13=95,
    text13=115,
    check14=96,
    text14=116,
    check15=97,
    text15=117,
    check16=98,
    text16=118,
    check17=99,
    text17=119,
    check18=101,
    text18=120,
}

function CreateRoomLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    --取消
    self.ui.btn_cancel:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    --确认
    self.ui.btn_confirm:addClickEventListener(function ()
        --进入房间
    end)

    --替人开房
    self.ui.btn_substitute:addClickEventListener(function ()
         app.HallScene:showToScene(ReplaceRoomLayer:create());
    end)

    --局数 4局
    self.ui.check1:addClickEventListener(function ()
    self.ui.check2:setSelected(false);
       if( self.ui.check1:getSelectedState()==true) then 
            self.ui.check1.setEnabled(false)
       end
    end)

    --局数 8局
    self.ui.check2:addClickEventListener(function ()
    self.ui.check1:setSelected(false);
    if( self.ui.check2:getSelectedState()==true) then 
            self.ui.check2.setEnabled(false)
       end
    end)

    --支付 房主支付
    self.ui.check3:addClickEventListener(function ()
    self.ui.check4:setSelected(false);
       if( self.ui.check3:getSelectedState()==true) then 
            self.ui.check3.setEnabled(false)
       end
    end)
    --支付 AA支付
    self.ui.check4:addClickEventListener(function ()
    self.ui.check3:setSelected(false);
    if( self.ui.check4:getSelectedState()==true) then 
            self.ui.check4.setEnabled(false)
       end
    end)

    --底分 1分
    self.ui.check5:addClickEventListener(function ()
    self.ui.check6:setSelected(false);
    self.ui.check7:setSelected(false);
    self.ui.check8:setSelected(false);
    self.ui.check9:setSelected(false);
       if( self.ui.check5:getSelectedState()==true) then 
            self.ui.check5.setEnabled(false)
       end
    end)
    --底分 2分
    self.ui.check6:addClickEventListener(function ()
    self.ui.check5:setSelected(false);
    self.ui.check7:setSelected(false);
    self.ui.check8:setSelected(false);
    self.ui.check9:setSelected(false);
       if( self.ui.check6:getSelectedState()==true) then 
            self.ui.check6.setEnabled(false)
       end
    end)
    --底分 3分
     self.ui.check7:addClickEventListener(function ()
    self.ui.check5:setSelected(false);
    self.ui.check6:setSelected(false);
    self.ui.check8:setSelected(false);
    self.ui.check9:setSelected(false);
       if( self.ui.check7:getSelectedState()==true) then 
            self.ui.check7.setEnabled(false)
       end
    end)
    --底分 4分
    self.ui.check8:addClickEventListener(function ()
    self.ui.check5:setSelected(false);
    self.ui.check6:setSelected(false);
    self.ui.check7:setSelected(false);
    self.ui.check9:setSelected(false);
       if( self.ui.check8:getSelectedState()==true) then 
            self.ui.check8.setEnabled(false)
       end
    end)
    --底分 5分
    self.ui.check9:addClickEventListener(function ()
    self.ui.check5:setSelected(false);
    self.ui.check6:setSelected(false);
    self.ui.check7:setSelected(false);
    self.ui.check8:setSelected(false);
       if( self.ui.check9:getSelectedState()==true) then 
            self.ui.check9.setEnabled(false)
       end
    end)

    --出牌 20秒
    self.ui.check10:addClickEventListener(function ()
    self.ui.check11:setSelected(false);
    self.ui.check12:setSelected(false);
       if( self.ui.check10:getSelectedState()==true) then 
            self.ui.check10.setEnabled(false)
       end
    end)
    --出牌 60秒
    self.ui.check11:addClickEventListener(function ()
    self.ui.check10:setSelected(false);
    self.ui.check12:setSelected(false);
       if( self.ui.check11:getSelectedState()==true) then 
            self.ui.check11.setEnabled(false)
       end
    end)
    --出牌 无限制
    self.ui.check12:addClickEventListener(function ()
    self.ui.check10:setSelected(false);
    self.ui.check11:setSelected(false);
       if( self.ui.check12:getSelectedState()==true) then 
            self.ui.check12.setEnabled(false)
       end
    end)

    --封顶 2番
    self.ui.check13:addClickEventListener(function ()
    self.ui.check14:setSelected(false);
    self.ui.check15:setSelected(false);
       if( self.ui.check13:getSelectedState()==true) then 
            self.ui.check13.setEnabled(false)
       end
    end)
    --封顶 3番
    self.ui.check14:addClickEventListener(function ()
    self.ui.check13:setSelected(false);
    self.ui.check15:setSelected(false);
       if( self.ui.check14:getSelectedState()==true) then 
            self.ui.check14.setEnabled(false)
       end
    end)
    --封顶 4番
    self.ui.check15:addClickEventListener(function ()
    self.ui.check13:setSelected(false);
    self.ui.check14:setSelected(false);
       if( self.ui.check15:getSelectedState()==true) then 
            self.ui.check15.setEnabled(false)
       end
    end)

    --玩法 自摸加底
    self.ui.check16:addClickEventListener(function ()

    end)
    --玩法 点杠花
    self.ui.check17:addClickEventListener(function ()

    end)
    --选择 换三张
    self.ui.check18:addClickEventListener(function ()

    end)
end


return CreateRoomLayer