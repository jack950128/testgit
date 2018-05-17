--加入房间 层
local JoinRoomLayer = class("JoinRoomLayer",BaseUI)
JoinRoomLayer.csbFile = "JoinRoomLayer.csb"
JoinRoomLayer.csbPosition = cc.p(0,0)
room_number={} --这是储存房间号的
-- 根据“逻辑标签”获取Cocos Studio创建的UI
JoinRoomLayer.tags = {
    btn_close=46,
    btn_pasteroom=47,
    btn_num1=48,
    btn_num2=50,
    btn_num3=51,
    btn_num4=52,
    btn_num5=53,
    btn_num6=54,
    btn_num7=55,
    btn_num8=56,
    btn_num9=57,
    btn_resume_load=58,
    btn_num0=59,
    btn_delete=60,
    pic_num_bg_1=80,
    pic_num_bg_2=81,
    pic_num_bg_3=82,
    pic_num_bg_4=83,
    pic_num_bg_5=84,
    pic_num_bg_6=85,
    text_1=31,
    text_2=41,
    text_3=42,
    text_4=99,
    text_5=100,
    text_6=101,
}

function JoinRoomLayer:initEvents()
    -- 关闭层按钮
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    -- 黏贴房号
    self.ui.btn_pasteroom:addClickEventListener(function ()
    print(#room_number)
    end)

    -- 数字1
    self.ui.btn_num1:addClickEventListener(function ()
    --小于6位可以执行函数
    if #room_number<6 then 
        table.insert(room_number,1)
        if #room_number==1 then
        self.ui.text_1:setText("1")
        elseif #room_number==2 then
        self.ui.text_2:setText("1")
        elseif #room_number==3 then
        self.ui.text_3:setText("1")
        elseif #room_number==4 then
        self.ui.text_4:setText("1")
        elseif #room_number==5 then
        self.ui.text_5:setText("1")
        elseif #room_number==6 then
        self.ui.text_6:setText("1")
        end
    end
    end)

    -- 数字2
    self.ui.btn_num2:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,2)
        if #room_number==1 then
        self.ui.text_1:setText("2")
        elseif #room_number==2 then
        self.ui.text_2:setText("2")
        elseif #room_number==3 then
        self.ui.text_3:setText("2")
        elseif #room_number==4 then
        self.ui.text_4:setText("2")
        elseif #room_number==5 then
        self.ui.text_5:setText("2")
        elseif #room_number==6 then
        self.ui.text_6:setText("2")
        end
    end
    end)

    -- 数字3
    self.ui.btn_num3:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,3)
        if #room_number==1 then
        self.ui.text_1:setText("3")
        elseif #room_number==2 then
        self.ui.text_2:setText("3")
        elseif #room_number==3 then
        self.ui.text_3:setText("3")
        elseif #room_number==4 then
        self.ui.text_4:setText("3")
        elseif #room_number==5 then
        self.ui.text_5:setText("3")
        elseif #room_number==6 then
        self.ui.text_6:setText("3")
        end
    end
    end)

    -- 数字4
    self.ui.btn_num4:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,4)
        if #room_number==1 then
        self.ui.text_1:setText("4")
        elseif #room_number==2 then
        self.ui.text_2:setText("4")
        elseif #room_number==3 then
        self.ui.text_3:setText("4")
        elseif #room_number==4 then
        self.ui.text_4:setText("4")
        elseif #room_number==5 then
        self.ui.text_5:setText("4")
        elseif #room_number==6 then
        self.ui.text_6:setText("4")
        end
    end
    end)

    -- 数字5
    self.ui.btn_num5:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,5)
        if #room_number==1 then
        self.ui.text_1:setText("5")
        elseif #room_number==2 then
        self.ui.text_2:setText("5")
        elseif #room_number==3 then
        self.ui.text_3:setText("5")
        elseif #room_number==4 then
        self.ui.text_4:setText("5")
        elseif #room_number==5 then
        self.ui.text_5:setText("5")
        elseif #room_number==6 then
        self.ui.text_6:setText("5")
        end
    end
    end)

    -- 数字6
    self.ui.btn_num6:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,6)
        if #room_number==1 then
        self.ui.text_1:setText("6")
        elseif #room_number==2 then
        self.ui.text_2:setText("6")
        elseif #room_number==3 then
        self.ui.text_3:setText("6")
        elseif #room_number==4 then
        self.ui.text_4:setText("6")
        elseif #room_number==5 then
        self.ui.text_5:setText("6")
        elseif #room_number==6 then
        self.ui.text_6:setText("6")
        end
    end
    end)

    -- 数字7
    self.ui.btn_num7:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,7)
        if #room_number==1 then
        self.ui.text_1:setText("7")
        elseif #room_number==2 then
        self.ui.text_2:setText("7")
        elseif #room_number==3 then
        self.ui.text_3:setText("7")
        elseif #room_number==4 then
        self.ui.text_4:setText("7")
        elseif #room_number==5 then
        self.ui.text_5:setText("7")
        elseif #room_number==6 then
        self.ui.text_6:setText("7")
        end
    end
    end)

    -- 数字8
    self.ui.btn_num8:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,8)
        if #room_number==1 then
        self.ui.text_1:setText("8")
        elseif #room_number==2 then
        self.ui.text_2:setText("8")
        elseif #room_number==3 then
        self.ui.text_3:setText("8")
        elseif #room_number==4 then
        self.ui.text_4:setText("8")
        elseif #room_number==5 then
        self.ui.text_5:setText("8")
        elseif #room_number==6 then
        self.ui.text_6:setText("8")
        end
    end
    end)

    -- 数字9
    self.ui.btn_num9:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,9)
        if #room_number==1 then
        self.ui.text_1:setText("9")
        elseif #room_number==2 then
        self.ui.text_2:setText("9")
        elseif #room_number==3 then
        self.ui.text_3:setText("9")
        elseif #room_number==4 then
        self.ui.text_4:setText("9")
        elseif #room_number==5 then
        self.ui.text_5:setText("9")
        elseif #room_number==6 then
        self.ui.text_6:setText("9")
        end
    end
    end)

    -- 重新输入
    self.ui.btn_resume_load:addClickEventListener(function ()
        room_number={}
        self.ui.text_1:setText("")
        self.ui.text_2:setText("")
        self.ui.text_3:setText("")
        self.ui.text_4:setText("")
        self.ui.text_5:setText("")
        self.ui.text_6:setText("")
    end)

    -- 数字0
    self.ui.btn_num0:addClickEventListener(function ()
    if #room_number<6 then 
        table.insert(room_number,0)
        if #room_number==1 then
        self.ui.text_1:setText("0")
        elseif #room_number==2 then
        self.ui.text_2:setText("0")
        elseif #room_number==3 then
        self.ui.text_3:setText("0")
        elseif #room_number==4 then
        self.ui.text_4:setText("0")
         elseif #room_number==5 then
        self.ui.text_5:setText("0")
        elseif #room_number==6 then
        self.ui.text_6:setText("0")
        end
    end
    end)

    -- 删除
    self.ui.btn_delete:addClickEventListener(function ()
    if #room_number==1 then
    self.ui.text_1:setText("")
    elseif #room_number==2 then
    self.ui.text_2:setText("")
    elseif #room_number==3 then
    self.ui.text_3:setText("")
    elseif #room_number==4 then
    self.ui.text_4:setText("")
    elseif #room_number==5 then
    self.ui.text_5:setText("")
    elseif #room_number==6 then
    self.ui.text_6:setText("")
    end
    table.remove(room_number)
    end)

end

--function JoinRoomLayer:Test(number)
--    if #room_number<6 then 
--        table.insert(room_number,number)
--    end
--    if #room_number==1 then
--    self.ui.text_1:setText(tostring(number))
--    elseif #room_number==2 then
--    self.ui.text_2:setText(tostring(number))
--    elseif #room_number==3 then
--    self.ui.text_3:setText(tostring(number))
--    elseif #room_number==4 then
--    self.ui.text_4:setText(tostring(number))
--    elseif #room_number==5 then
--    self.ui.text_5:setText(tostring(number))
--    elseif #room_number==6 then
--    self.ui.text_6:setText(tostring(number))
--    end
--end


return JoinRoomLayer