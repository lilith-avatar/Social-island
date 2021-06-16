--- 玩家动作状态机控制器
-- @module  PlayerActController
-- @copyright Lilith Games, Avatar Team
-- @author Dead Ratman
local PlayerActController = class('PlayerActController', ControllerBase)

function PlayerActController:initialize(_stateMachineNode, _folder)
    print('PlayerActController:initialize()')
    ControllerBase.initialize(self, _stateMachineNode, _folder)
    self.triggers = {}
    for k, v in pairs(self.states) do
        self.triggers[k] = false
    end
    self.stopInfo = {
        footIndex = 2,
        footDis = 0,
        speed = 0
    }
end

function PlayerActController:CallTrigger(_stateName)
    if self.triggers[_stateName] == false then
        self.triggers[_stateName] = true
    end
end

function PlayerActController:ResetTrigger()
    for k, v in pairs(self.states) do
        self.triggers[k] = false
    end
end

--获取停步时哪只脚在前以及双脚间距
function PlayerActController:GetStopInfo()
    local lToe = localPlayer.Avatar.Bone_L_Toe0
    local rToe = localPlayer.Avatar.Bone_R_Toe0
    local toeDir = Vector2(lToe.Position.x - rToe.Position.x, lToe.Position.z - rToe.Position.z)
    local fDir = Vector2(localPlayer.Avatar.Forward.x, localPlayer.Avatar.Forward.z)
    self.stopInfo.footIndex = (Vector2.Angle(toeDir, fDir) < 90) and 2 or 1
    self.stopInfo.footDis = Vector2(lToe.Position.x - rToe.Position.x, lToe.Position.z - rToe.Position.z).Magnitude
    return self.stopInfo.footIndex == 2, self.stopInfo.footDis
end

--切换状态
function PlayerActController:Switch(_state)
    if _state and self.curState ~= _state then
        self.lastState = self.curState
        self.curState = _state
        self.machine:GotoState(self.statesInMachine[_state.stateName])
        self:ResetTrigger()
    end
end

function PlayerActController:Update(dt)
    ControllerBase.Update(self, dt)
    if localPlayer.Velocity.Magnitude > 0 then
        self.stopInfo.speed = localPlayer.Velocity.Magnitude
    end
end

return PlayerActController