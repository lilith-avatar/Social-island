--- 人间大炮交互模块
--- @module Cannon Module
--- @copyright Lilith Games, Avatar Team
--- @author Dead Ratman
local Cannon, this = ModuleUtil.New("Cannon", ServerBase)

--- 变量声明
-- 炮筒
local barrel = nil

-- 镜头
local cam = nil

-- 炮筒内部的玩家
local insidePlayer = nil

-- 大炮的状态
local cannonState = 0

-- 人间大炮方向
local cannonDir = {
    Up = 0,
    Right = 0,
    Range = 3
}

-- 人间大炮初始角度
local cannonDefRot = EulerDegree(0, 0, 0)

-- 人间大炮旋转Tweener
local spinTweener

--- 初始化
function Cannon:Init()
    print("Cannon:Init")
    this:NodeRef()
    this:DataInit()
    this:EventBind()
end

--- 节点引用
function Cannon:NodeRef()
    barrel = world.MiniGames.Game_04_Cannon.Barrel
    cam = barrel.Cam.Camera
end

--- 数据变量初始化
function Cannon:DataInit()
    cannonDefRot = barrel.Rotation
end

--- 节点事件绑定
function Cannon:EventBind()
end

--- 进入人间大炮
function Cannon:GetOnCannon(_player)
    insidePlayer = _player
    insidePlayer.Position = barrel.InsidePoint.Position
    NetUtil.Fire_C("SetCurCamEvent", insidePlayer, cam)
    NetUtil.Fire_C("SetMiniGameGuiEvent", insidePlayer, 4, true, false)
end

--- 节点事件绑定
function Cannon:EnterMiniGameEventHandler(_player, _gameId)
    if _gameId == 4 and insidePlayer == nil then
        this:GetOnCannon(_player)
    end
end

--- 大炮发射
function Cannon:CannonFireEventHandler(_force)
    insidePlayer.Rotation = barrel.Rotation
    insidePlayer.Position = insidePlayer.Position + Vector3(0, 0.5, 0)
    insidePlayer.LinearVelocity =
        (barrel.OutsidePoint.Position - barrel.InsidePoint.Position).Normalized * (15 + 40 * _force)
    NetUtil.Fire_C("SetMiniGameGuiEvent", insidePlayer, 4, false, false)
    NetUtil.Fire_C("SetCurCamEvent", insidePlayer)
    NetUtil.Fire_C("FsmTriggerEvent", insidePlayer, "Fly")
    insidePlayer = nil
end

--- 大炮方向调整
function Cannon:SetCannonDirEventHandler(_dir)
    if _dir == "Up" then
        if cannonDir.Up < cannonDir.Range then
            cannonDir.Up = cannonDir.Up + 1
        end
    elseif _dir == "Down" then
        if cannonDir.Up > -1 * cannonDir.Range then
            cannonDir.Up = cannonDir.Up - 1
        end
    elseif _dir == "Right" then
        if cannonDir.Right < cannonDir.Range then
            cannonDir.Right = cannonDir.Right + 1
        end
    elseif _dir == "Left" then
        if cannonDir.Right > -1 * cannonDir.Range then
            cannonDir.Right = cannonDir.Right - 1
        end
    end
    this:PlaySpinTween()
end

--- 大炮旋转tween动画
function Cannon:PlaySpinTween()
    if spinTweener then
        spinTweener:Destroy()
    end
    local dirRot = cannonDefRot + EulerDegree(-10 * cannonDir.Up, 15 * cannonDir.Right, 0)
    spinTweener = Tween:TweenProperty(barrel, {Rotation = dirRot}, 1, Enum.EaseCurve.Linear)
    spinTweener:Play()
end

--- 离开人间大炮
function Cannon:LeaveCannonEventHandler(_player)
end

function Cannon:Update(dt)
    cam.Rotation = EulerDegree(cam.Rotation.x, barrel.Rotation.y, cam.Rotation.z)
end

return Cannon