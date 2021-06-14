---  物品管理模块：
-- @module  ItemMgr
-- @copyright Lilith Games, Avatar Team
-- @author Dead Ratman
---@module ItemMgr

local ItemMgr, this = ModuleUtil.New('ItemMgr', ClientBase)

function ItemMgr:Init()
    --print('[ItemMgr] ItemMgr:Init')
    this:NodeRef()
    this:DataInit()
end

--节点引用
function ItemMgr:NodeRef()
end

--数据变量声明
function ItemMgr:DataInit()
    this.itemInstance = {}
    for k, v in pairs(Config.Item) do
        this.itemInstance[k] = this:InstantiateItem(k)
    end
end

-- 初始化默认背包数据
function ItemMgr:InitBagData()
    local defaultItems = {
        6001,
        6002,
        6003,
        6004,
        6005,
        6006
        --7001,
        --7002,
        --7003,
        --7004,
        --7005,
        --7006
    }
    for _, v in pairs(defaultItems) do
        NetUtil.Fire_C('GetItemEvent', localPlayer, v)
    end
    if Data.Player.bag[6001] == nil and Data.Player.bag[4005] == nil then
        NetUtil.Fire_C('GetItemEvent', localPlayer, 4005)
    end
    if Data.Player.bag[6003] == nil and Data.Player.bag[4006] == nil then
        NetUtil.Fire_C('GetItemEvent', localPlayer, 4006)
    end
end

--新建背包数据
function ItemMgr:NewBagData(_id)
    if Config.Item[_id] then
        local typeConfig = Config.ItemType[Config.Item[_id].Type]
        local tempBag = {
            id = _id,
            type = Config.Item[_id].Type,
            count = 0,
            lastestTime = 0,
            isNew = true,
            isConst = typeConfig.IsConsume
        }
        Data.Player.bag[_id] = tempBag
    end
end

--实例化近战武器
function ItemMgr:Instantiate1(_id)
    return MeleeWeapon:new(Config.Item[_id], Config.Melee[_id])
end

--实例化弓箭武器
function ItemMgr:Instantiate2(_id)
    return BowWeapon:new(Config.Item[_id], Config.Bow[_id])
end

--实例化手枪道具
function ItemMgr:Instantiate3(_id)
    return PistolWeapon:new(Config.Item[_id], Config.Pistol[_id])
end

--实例化消耗型道具
function ItemMgr:Instantiate4(_id)
    return ConsumableItem:new(Config.Item[_id], Config.Consumable[_id])
end

--实例化服装型道具
function ItemMgr:Instantiate5(_id)
    return ClothingItem:new(Config.Item[_id], Config.Clothing[_id])
end

--实例化任务型道具
function ItemMgr:Instantiate6(_id)
    return TaskItem:new(Config.Item[_id], Config.Task[_id])
end

--实例化材料型道具
function ItemMgr:Instantiate7(_id)
    return MaterialItem:new(Config.Item[_id], Config.Material[_id])
end

--实例化物品
function ItemMgr:InstantiateItem(_id)
    return this['Instantiate' .. Config.Item[_id].Type](self, _id)
end

--兑换任务奖励
function ItemMgr:RedeemTaskItemReward(_id)
    this.itemInstance[_id]:GetTaskReward()
end

--获得道具
function ItemMgr:GetItemEventHandler(_id)
    -- 初始化默认背包数据
    if Data.Player.bag[_id] == nil then
        --print('[ItemMgr] 新建道具', _id)
        this:NewBagData(_id)
    end
    local typeConfig = Config.ItemType[Config.Item[_id].Type]
    if typeConfig.IsGetRepeatedly == false and Data.Player.bag[_id].count > 0 then
        --print('[ItemMgr] 已有道具', _id)
        return
    end
    Data.Player.bag[_id].count = Data.Player.bag[_id].count + 1
    GuiNoticeInfo:ShowGetItem(_id)
    SoundUtil.Play2DSE(localPlayer.UserId, 110)
    --print('[ItemMgr] 获得道具', _id)
    return
end

--移除道具
function ItemMgr:RemoveItemEventHandler(_id)
    --print('[ItemMgr] 移除道具', _id)
    Data.Player.bag[_id].count = Data.Player.bag[_id].count - 1
end

function ItemMgr:test()
    NetUtil.Fire_C('GetItemEvent', localPlayer, 2001)
    wait(.1)
    NetUtil.Fire_C('UseItemInBagEvent', localPlayer, 2001)
end

--使用在背包的道具
function ItemMgr:UseItemInBagEventHandler(_id)
    --print('[ItemMgr] 使用在背包的道具', _id)
    CloudLogUtil.UploadLog('pannel_actions', 'eqip_' .. _id .. '_use')
    this.itemInstance[_id]:UseInBag()
end

--使用在手中的道具
function ItemMgr:UseItemInHandEventHandler()
    if Data.Player.curEquipmentID ~= 0 then
        --print('[ItemMgr] 使用在手中的道具')
        this.itemInstance[Data.Player.curEquipmentID]:UseInHand()
        NetUtil.Fire_S('LeaveInteractSEvent', localPlayer, 15)
        NetUtil.Fire_C('LeaveInteractCEvent', localPlayer, 15)
    end
end

--解除当前道具
function ItemMgr:UnequipCurEquipmentEventHandler()
    if Data.Player.curEquipmentID ~= 0 then
        print('解除当前道具', Data.Player.curEquipmentID)
        this.itemInstance[Data.Player.curEquipmentID]:Unequip()
        Data.Player.curEquipmentID = 0
    end
end

--交互掉落道具
function ItemMgr:GetItemFromPoolEventHandler(_poolID, _coin, _interactID)
    if _poolID ~= 0 then
        local tempTable = {}
        for k, v in pairs(Config.ItemPool[_poolID]) do
            if Data.Player.bag[v.ItemId] and Config.ItemType[Config.Item[v.ItemId].Type].IsGetRepeatedly == false then
            else
                tempTable[k] = v
            end
        end
        local weightSum = 0
        for k, v in pairs(tempTable) do
            weightSum = weightSum + v.Weight
        end
        local randomNum = math.random(weightSum)
        local tempWeightSum = 0
        for k, v in pairs(tempTable) do
            tempWeightSum = tempWeightSum + v.Weight
            if randomNum < tempWeightSum then
                NetUtil.Fire_C('GetItemEvent', localPlayer, v.ItemId)
                break
            end
        end
    end
    if _coin and _coin ~= 0 then
        NetUtil.Fire_C('UpdateCoinEvent', localPlayer, _coin)
    end
end

--获取满足条件的任务道具
function ItemMgr:GetTaskItem(_npcID)
    local npcTable
    for k1, v1 in pairs(Data.Player.bag) do
        if Config.Item[k1] == nil then
            --! 如果长期存储里拿到的k1道具并不在Item表里，则清除长期存储
            Data.Player.bag[k1] = nil
        elseif Config.Item[k1].Type == 6 and v1.count > 0 then
            npcTable = this.itemInstance[k1].derivedData.Npc
            for k2, v2 in pairs(npcTable) do
                if v2 == _npcID then
                    return k1
                end
            end
        end
    end
    return 0
end

--获得NPC对话文本
function ItemMgr:GetNpcText(_id)
    return LanguageUtil.GetText(ItemMgr.itemInstance[_id].derivedData.NpcText)
end

--- 长期存储成功读取后
function ItemMgr:LoadPlayerDataSuccessEventHandler(_hasData)
    --print('[ItemMgr] 读取长期存储成功')
    if not _hasData then
        this:InitBagData()
    elseif Data.Player.curEquipmentID ~= 0 then
        NetUtil.Fire_C('GetItemEvent', localPlayer, Data.Player.curEquipmentID)
        Data.Player.curEquipmentID = 0
    end
    GuiControl:UpdateCoinNum(Data.Player.coin)
end

function ItemMgr:Update(dt, tt)
    if this.itemInstance[Data.Player.curEquipmentID] then
        this.itemInstance[Data.Player.curEquipmentID]:Update(dt)
    else
        GuiControl:UpdateUseBtnMask(0)
    end
end

return ItemMgr
