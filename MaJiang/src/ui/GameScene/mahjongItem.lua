-- 麻将类
local mahjong = {}

-- 新建对象方法
function mahjong:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- 初始化方法
function mahjong:init(direction,character,state,...)
    self.direction = direction
    self.character = character
    self.state = state
    -- 根据传过来的参数选择显示的图片
    local path = MGameConstClient.mahjongImgPath[direction][character][state]
    self.image = ccui.ImageView:create(path)
end

-- 根据index来设置图片
function mahjong:setTexture()

end

-- 全局类方法，获取图片的宽度
function mahjong.getWidth()
    g_mahjongWidth = 0
    if (0 == g_mahjongWidth) then
        local sprite = cc.Sprite:create("")
        g_mahjongWidth = sprite:getContentSize().width
    end
    return g_mahjongWidth
end

return mahjong
