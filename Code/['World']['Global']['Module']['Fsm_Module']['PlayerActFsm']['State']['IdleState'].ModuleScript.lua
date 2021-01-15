local IdleState = class("IdleState", PlayerActState)

function IdleState:OnEnter()
    PlayerActState.OnEnter(self)
    localPlayer:MoveTowards(Vector2.Zero)
    localPlayer.GravityScale = 2
    localPlayer.Avatar:PlayAnimation("Idle", 2, 1, 0.1, true, true, 1)
    localPlayer.Avatar:PlayAnimation("Idle", 3, 1, 0.1, true, true, 1)
end

function IdleState:OnUpdate(dt)
    PlayerActState.OnUpdate(self, dt)
    FsmMgr.playerActFsm:TriggerMonitor({"Walk", "Jump", "SwimIdle", "Fly", "BowIdle"})
    self:MoveMonitor()
    self:JumpMonitor()
end

function IdleState:OnLeave()
    PlayerActState.OnLeave(self)
end

return IdleState