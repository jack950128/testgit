local GameLayer = class("GameLayer",BaseUI)

GameLayer.csbFile = "HallLayer.csb"
GameLayer.csbPosition = cc.p(0,0)
-- 根据“逻辑标签”获取Cocos Studio创建的UI
GameLayer.tags = {

}


local path = "src/ui/mainscene/"

-- 进入场景后执行,创建后会调用此函数,创建对象及数据
function GameLayer:onCreate()

end

-- 初始化对象及数据
function GameLayer:initEvents()

end

-- 事件监听
function GameLayer:eventListeners()

end

-- 将逻辑X,Y的坐标转化为实际X,Y的坐标
function GameLayer:positionOfStar(x, y)

end

-- 刷新地图
function GameLayer:refreshMap()

end




return GameLayer