local NoticeLayer = class("NoticeLayer",BaseUI)
NoticeLayer.csbFile = "NoticeLayer.csb"
NoticeLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
NoticeLayer.tags = {
    CheckBox_1=75,
     CheckBox_2=78,
      CheckBox_3=79,
       CheckBox_4=80,
       btn_close=81,
       ListView_1=275,
       ListView_2=277,
       ListView_3=279,
       ListView_4=281,
}

function NoticeLayer:initEvents()
    --点击CheckBox1，其他三个关闭，以下相同
    self.ui.CheckBox_1:addClickEventListener(function ()
    self.ui.CheckBox_2:setSelected(false);
    self.ui.CheckBox_3:setSelected(false);
    self.ui.CheckBox_4:setSelected(false);

    self.ui.ListView_1:setVisible(true);
    self.ui.ListView_2:setVisible(false);
    self.ui.ListView_3:setVisible(false);
    self.ui.ListView_4:setVisible(false);
       if( self.ui.CheckBox_1:getSelectedState()==true) then 
            self.ui.CheckBox_1.setEnabled(false)
       end
    end)

    --点击CheckBox_2
    self.ui.CheckBox_2:addClickEventListener(function ()
    self.ui.CheckBox_1:setSelected(false);
    self.ui.CheckBox_3:setSelected(false);
    self.ui.CheckBox_4:setSelected(false);

    self.ui.ListView_1:setVisible(false);
    self.ui.ListView_2:setVisible(true);
    self.ui.ListView_3:setVisible(false);
    self.ui.ListView_4:setVisible(false);
    if( self.ui.CheckBox_2:getSelectedState()==true) then 
            self.ui.CheckBox_2.setEnabled(false)
       end
    end)

    --点击CheckBox_3
    self.ui.CheckBox_3:addClickEventListener(function ()
    self.ui.CheckBox_1:setSelected(false);
    self.ui.CheckBox_2:setSelected(false);
    self.ui.CheckBox_4:setSelected(false);

    self.ui.ListView_1:setVisible(false);
    self.ui.ListView_2:setVisible(false);
    self.ui.ListView_3:setVisible(true);
    self.ui.ListView_4:setVisible(false);
    if( self.ui.CheckBox_3:getSelectedState()==true) then 
            self.ui.CheckBox_3.setEnabled(false)
       end
    end)

    --点击CheckBox_4
    self.ui.CheckBox_4:addClickEventListener(function ()
    self.ui.CheckBox_1:setSelected(false);
    self.ui.CheckBox_2:setSelected(false);
    self.ui.CheckBox_3:setSelected(false);

    self.ui.ListView_1:setVisible(false);
    self.ui.ListView_2:setVisible(false);
    self.ui.ListView_3:setVisible(false);
    self.ui.ListView_4:setVisible(true);
    if( self.ui.CheckBox_4:getSelectedState()==true) then 
            self.ui.CheckBox_4.setEnabled(false)
       end
    end)

    self.ui.btn_close:addClickEventListener(function ()
        self:removeAllChildren();
    end)
end

function NoticeLayer:onCreate()
    self.ui.ListView_2:setVisible(false);
    self.ui.ListView_3:setVisible(false);
    self.ui.ListView_4:setVisible(false);
end

return NoticeLayer