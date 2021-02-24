---@module MoleHit
---@copyright Lilith Games, Avatar Team
---@author Yen Yuan
local MoleHit, this = ModuleUtil.New("MoleHit", ServerBase)
local totalWeights = 0

local function SelectPit(_pitList, _num)
end

---初始化函数
function MoleHit:Init()
    print("[MoleHit] Init()")
    this:DataInit()
    this:RefreashMole("ufo")
    this:RefreashMole("maze")
end

function MoleHit:DataInit()
    this.startUpdate = false
    this.RefreshList = {}
    this.pitList = {
        ufo = {},
        maze = {}
    }
    this.hitTime = {
        ufo = 0,
        maze = 0
    }
    -- 读表
    this.hitNum = {
        ufo = Config.MoleGlobalConfig.UFOPitNum.Value,
        maze = Config.MoleGlobalConfig.MazePitNum.Value
    }
end

function MoleHit:PoolInit()
    for k, v in pairs(Config.MoleConfig) do
        this.molePool[k] = MolePool:new(v.Archetype, 10, v.ID)
    end
end

function MoleHit:RefreashMole(_type)
    -- 遍历对应坑位
    for k, v in pairs(this.pitList[_type]) do
        this.molePool[_type]:Create()
    end
end

function MoleHit:InteractSEventHandler(_player, _gameId)
    if _gameId == 2 then
    end
end

--- 玩家击中地鼠事件
function MoleHit:PlayerHitEventHandler(_uid,_type, _pit)
    this:HitMoleAction(_uid,_type, _pit)
    -- 增加数量
    this.hitTime[_type] = this.hitTime[_type] + 1
    -- TODO： 广播事件
    --NetUtil.Broadcast('',this.hitTime[_type])
    -- 判断是否达到彩蛋条件
    if this.hitTime[_type] >= this.hitNum[_type] then
        this.startUpdate,this.hitTime[_type] = true,0
        this.RefreshList[_type] = {
            timer = 0
        }
        --开启对应彩蛋
    end
end

function MoleHit:HitMoleAction(_uid,_type, _pit)
    -- 打击表现
    local effect = world:CreateInstance('HitMoleEffect','Effect',_pit,_pit.Position,_pit.Rotation)
    invoke(function()
        effect:Destroy()
    end, 1)
    -- 摧毁地鼠
    this.pitList[_type][_pit]:Destroy()
end

function MoleHit:EnterMiniGameEventHandler(_player, _gameId)
    if _gameId == 2 then
    end
end

function MoleHit:Update(dt)
    if this.startUpdate then
        for k, v in pairs(this.RefreshList) do
            v.timer = v.timer + dt
            if v.timer >= Config.MoleGlobalConfig.RefreshTime.Value then
                this:RefreashMole(k)
                this.RefreshList[k] = nil
            end
        end
    end
end

return MoleHit
