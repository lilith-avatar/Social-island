--- This file is generated by ava-x2l.exe,
--- Don't change it manaully.
--- @copyright Lilith Games, Project Da Vinci(Avatar Team)
--- @see Official Website: https://www.projectdavinci.com/
--- @see Dev Framework: https://github.com/lilith-avatar/avatar-ava
--- @see X2L Tool: https://github.com/lilith-avatar/avatar-ava-xls2lua
--- source file: .//ItemNew.xlsm

local ItemTypeXls = {
    [1] = {
        Type = 1,
        Name = '近战',
        FsmMode = 'IdleState',
        IsStack = false,
        IsGetRepeatedly = false,
        IsUseable = true,
        IsConsume = false,
        IsEquip = true,
        BgColor = 'Img_SL_B_B',
        SColor = 'Img_SL_B'
    },
    [2] = {
        Type = 2,
        Name = '弓箭',
        FsmMode = 'BowIdleState',
        IsStack = false,
        IsGetRepeatedly = false,
        IsUseable = true,
        IsConsume = false,
        IsEquip = true,
        BgColor = 'Img_SL_B_B',
        SColor = 'Img_SL_B'
    },
    [3] = {
        Type = 3,
        Name = '手枪',
        FsmMode = 'PistolIdleState',
        IsStack = false,
        IsGetRepeatedly = false,
        IsUseable = true,
        IsConsume = false,
        IsEquip = true,
        BgColor = 'Img_SL_B_B',
        SColor = 'Img_SL_B'
    },
    [4] = {
        Type = 4,
        Name = '消耗品',
        FsmMode = 'IdleState',
        IsStack = true,
        IsGetRepeatedly = true,
        IsUseable = true,
        IsConsume = true,
        IsEquip = true,
        BgColor = 'Img_SL_B_O',
        SColor = 'Img_SL_O'
    },
    [5] = {
        Type = 5,
        Name = '服装',
        FsmMode = '',
        IsStack = false,
        IsGetRepeatedly = false,
        IsUseable = true,
        IsConsume = false,
        IsEquip = true,
        BgColor = 'Img_SL_B_P',
        SColor = 'Img_SL_P'
    },
    [6] = {
        Type = 6,
        Name = '任务物品',
        FsmMode = '',
        IsStack = false,
        IsGetRepeatedly = false,
        IsUseable = false,
        IsConsume = false,
        IsEquip = false,
        BgColor = 'Img_SL_B_SP',
        SColor = 'Img_SL_SP'
    },
    [7] = {
        Type = 7,
        Name = '材料',
        FsmMode = '',
        IsStack = true,
        IsGetRepeatedly = true,
        IsUseable = true,
        IsConsume = true,
        IsEquip = false,
        BgColor = 'Img_SL_B_G',
        SColor = 'Img_SL_G'
    }
}

return ItemTypeXls
