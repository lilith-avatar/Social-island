local TwoHandedSwordWalk = class("TwoHandedSwordWalk", PlayerActState)

function TwoHandedSwordWalk:OnEnter()
    PlayerActState.OnEnter(self)
    localPlayer.Avatar:PlayAnimation("TwoHandedSwordWalk", 4, 1, 0.1, true, true, 1)
    --localPlayer.Avatar:PlayAnimation("TwoHandedSwordWalk", 3, 1, 0.1, true, true, 1)
end

function TwoHandedSwordWalk:OnUpdate(dt)
    PlayerActState.OnUpdate(self, dt)
    FsmMgr.playerActFsm:TriggerMonitor({"Idle","SwimIdle", "TwoHandedSwordAttack1", "BowIdle"})
    self:IdleMonitor("TwoHandedSword")
    self:RunMonitor("TwoHandedSword")
    self:JumpMonitor("TwoHandedSword")
end

function TwoHandedSwordWalk:OnLeave()
    PlayerActState.OnLeave(self)
end

return TwoHandedSwordWalk