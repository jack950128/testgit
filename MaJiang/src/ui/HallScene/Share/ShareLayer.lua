--���� ��
local ShareLayer = class("ShareLayer",BaseUI)
ShareLayer.csbFile = "ShareLayer.csb"
ShareLayer.csbPosition = cc.p(0,0)
-- ���ݡ��߼���ǩ����ȡCocos Studio������UI
ShareLayer.tags = {
    btn_close=69,
    btn_wechat=70,
    btn_friend=71,
}

function ShareLayer:initEvents()
    -- �رղ㰴ť
    self.ui.btn_close:addClickEventListener(function ()
         self:removeAllChildren();
    end)

    --΢�ŷ���
    self.ui.btn_wechat:addClickEventListener(function ()
         --����
    end)

     --����Ȧ����
    self.ui.btn_friend:addClickEventListener(function ()
         --����
    end)
end


return ShareLayer