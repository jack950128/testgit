
local MGameConstClient = {}

-- 麻将图片路径常量表
MGameConstClient.mahjongImgPath = {}
local direction = {"up","down","left","right"}
local character = {"tiao_","tong_","wan_"}
local state = {"stand","fall","back"}
--[[
for _,v in ipairs(direction) do
    if MGameConstClient.mahjongImgPath[v] == nil then
        MGameConstClient.mahjongImgPath[v] = {}
    end
    for _,j in ipairs(character) do
        for i=1,9 do
            print(j..i)
            if MGameConstClient.mahjongImgPath[v][j..i] == nil then
                MGameConstClient.mahjongImgPath[v][j..i] = {}
            end
            for _,k in ipairs(state) do
                if MGameConstClient.mahjongImgPath[v][j..i][k] == nil then
                    MGameConstClient.mahjongImgPath[v][j..i][k] = {}
                end
            end
        end
    end
end
]]
-- 麻将图片路径常量表  D:\Work\xuezhandaodi\mahjong_xz_front\xzdd\res\ui\resource\mahjongImg
local mahPath = "resource/mahjongImg/"
MGameConstClient.mahjongImgPath = {
    up    = {
        tiao_1 = { stand = mahPath.."bawan.png", fall = mahPath.."bawan.png", back = mahPath.."bawan.png" },
        tiao_2 = { stand = "111", fall = "", back = "" },
        tiao_3 = { stand = "111", fall = "", back = "" },
        tiao_4 = { stand = "111", fall = "", back = "" },
        tiao_5 = { stand = "111", fall = "", back = "" },
        tiao_6 = { stand = "111", fall = "", back = "" },
        tiao_7 = { stand = "111", fall = "", back = "" },
        tiao_8 = { stand = "111", fall = "", back = "" },
        tiao_9 = { stand = "111", fall = "", back = "" },
        tong_1 = { stand = mahPath.."bawan.png", fall = mahPath.."bawan.png", back = mahPath.."bawan.png" },
        wan_1  = { stand = mahPath.."bawan.png", fall = mahPath.."bawan.png", back = mahPath.."bawan.png" },
    },
}


return MGameConstClient