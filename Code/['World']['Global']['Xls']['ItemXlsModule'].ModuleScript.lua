--- This file is generated by ava-x2l.exe,
--- Don't change it manaully.
--- @copyright Lilith Games, Project Da Vinci(Avatar Team)
--- @see https://www.projectdavinci.com/
--- @see https://github.com/endaye/avatar-ava-xls2lua
--- source file: .//ItemConfig.xlsx

local ItemXls = {
    [1001] = {
        ItemID = 1001,
        Type = 1,
        Name = 'Item_Name_1001',
        Des = 'Item_Des_1001',
        Ico = 'Ico_Sword',
        Model = 'M_Sword',
        AnimUse = 'SwordAttack',
        UseCD = 0.5,
        AttckCD = '2.0',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = 3,
        AnimState = 1,
        Offset = Vector3(0, 0, 0),
        Angle = EulerDegree(0, 0, 0),
        Range = 0.0,
        ExplosionRange = 34.0,
        HealthChange = nil,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = nil,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [2001] = {
        ItemID = 2001,
        Type = 2,
        Name = 'Item_Name_2001',
        Des = 'Item_Des_2001',
        Ico = 'Ico_Boom',
        Model = '',
        AnimUse = 'Clap',
        UseCD = 600.0,
        AttckCD = '',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = nil,
        AnimState = nil,
        Offset = nil,
        Angle = nil,
        Range = 10.0,
        ExplosionRange = nil,
        HealthChange = 100,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = nil,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [3001] = {
        ItemID = 3001,
        Type = 3,
        Name = 'Item_Name_3001',
        Des = 'Item_Des_3001',
        Ico = 'Ico_MagicStick',
        Model = '',
        AnimUse = 'TurnAround',
        UseCD = 300.0,
        AttckCD = '3.0',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = nil,
        AnimState = 6,
        Offset = nil,
        Angle = nil,
        Range = 10.0,
        ExplosionRange = 1.5,
        HealthChange = 100,
        UseAddBuff = {2, 3, 10, 4, 5, 6, 7, 8, 9},
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = 'Fire_Explosion',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = nil,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [3002] = {
        ItemID = 3002,
        Type = 3,
        Name = 'Item_Name_3002',
        Des = 'Item_Des_3002',
        Ico = 'Ico_FireBowl',
        Model = 'M_FireBowl',
        AnimUse = 'Equip',
        UseCD = 0.5,
        AttckCD = '1.0',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = nil,
        AnimState = nil,
        Offset = Vector3(0, 0, 0),
        Angle = EulerDegree(0, 0, 0),
        Range = 20.0,
        ExplosionRange = nil,
        HealthChange = nil,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = nil,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [4001] = {
        ItemID = 4001,
        Type = 4,
        Name = 'Item_Name_4001',
        Des = 'Item_Des_4001',
        Ico = 'Ico_lolipop',
        Model = '',
        AnimUse = 'Eat',
        UseCD = 600.0,
        AttckCD = '',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = nil,
        AnimState = nil,
        Offset = nil,
        Angle = nil,
        Range = nil,
        ExplosionRange = nil,
        HealthChange = nil,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = 1,
        PetId = nil,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [5001] = {
        ItemID = 5001,
        Type = 5,
        Name = 'Item_Name_5001',
        Des = 'Item_Des_5001',
        Ico = 'Ico_Card',
        Model = '',
        AnimUse = '',
        UseCD = nil,
        AttckCD = '',
        Npc = nil,
        RewardItem = nil,
        RewardGold = 200,
        NpcText = 'Item_NpcText_5001',
        SellGold = nil,
        AnimState = nil,
        Offset = nil,
        Angle = nil,
        Range = nil,
        ExplosionRange = nil,
        HealthChange = nil,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = nil,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [6001] = {
        ItemID = 6001,
        Type = 6,
        Name = 'Item_Name_6001',
        Des = 'Item_Des_6001',
        Ico = 'Ico_PigSkin',
        Model = '',
        AnimUse = '',
        UseCD = nil,
        AttckCD = '',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = 200,
        AnimState = nil,
        Offset = nil,
        Angle = nil,
        Range = nil,
        ExplosionRange = nil,
        HealthChange = nil,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = nil,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [7001] = {
        ItemID = 7001,
        Type = 7,
        Name = 'Item_Name_7001',
        Des = 'Item_Des_7001',
        Ico = 'Ico_Pet',
        Model = '',
        AnimUse = '',
        UseCD = nil,
        AttckCD = '',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = nil,
        AnimState = nil,
        Offset = nil,
        Angle = nil,
        Range = nil,
        ExplosionRange = nil,
        HealthChange = nil,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = 1,
        PetHealthIncreace = nil,
        PetAttackIncreace = nil
    },
    [8001] = {
        ItemID = 8001,
        Type = 8,
        Name = 'Item_Name_8001',
        Des = 'Item_Des_8001',
        Ico = 'Ico_Memory',
        Model = '',
        AnimUse = '',
        UseCD = nil,
        AttckCD = '',
        Npc = nil,
        RewardItem = nil,
        RewardGold = nil,
        NpcText = nil,
        SellGold = nil,
        AnimState = nil,
        Offset = nil,
        Angle = nil,
        Range = nil,
        ExplosionRange = nil,
        HealthChange = nil,
        UseAddBuff = nil,
        HitAddBuff = nil,
        HitRemoveBuff = nil,
        HitEffect = '',
        HitAnim = '',
        UseSound = '',
        HitSound = '',
        PickItemId = nil,
        PetId = nil,
        PetHealthIncreace = 5,
        PetAttackIncreace = 5
    }
}

return ItemXls
