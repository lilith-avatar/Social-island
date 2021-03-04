--- 游戏客户端数据同步
--- @module Client Sync Data, Client-side
--- @copyright Lilith Games, Avatar Team
--- @author Yuancheng Zhang
local ClientDataSync = {}

-- Localize global vars
local FrameworkConfig, MetaData = FrameworkConfig, MetaData

-- 客户端私有数据
local rawDataGlobal = {}
local rawDataPlayer = {}

--- 打印数据同步日志
local PrintLog = FrameworkConfig.DebugMode and function(...)
        print('[DataSync][Client]', ...)
    end or function()
    end

--! 初始化

--- 数据初始化
function ClientDataSync.Init()
    print('[DataSync][Client] Init()')
    InitEventsAndListeners()
    InitDataDefines()
end

--- 初始化事件和绑定Handler
function InitEventsAndListeners()
    if localPlayer.C_Event == nil then
        world:CreateObject('FolderObject', 'S_Event', localPlayer)
    end
    world:CreateObject('CustomEvent', 'DataSyncS2CEvent', localPlayer.C_Event)
    localPlayer.C_Event.DataSyncS2CEvent:Connect(DataSyncS2CEventHandler)
end

--- 校验数据定义
function InitDataDefines()
    --* 客户端全局数据
    Data.Global = Data.Global or MetaData.New(rawDataGlobal, MetaData.Enum.GLOBAL, MetaData.Enum.CLIENT)
    -- TODO: 客户端玩家数据
    Data.Player = {}
end

--- 开始同步
function ClientDataSync.Start()
    MetaData.Sync = true
end

--! Event handler

--- 数据同步事件Handler
function DataSyncS2CEventHandler(_path, _value)
    if not MetaData.Sync then
        return
    end

    PrintLog(string.format('收到 player = %s, _path = %s, _value = %s', localPlayer, _path, table.dump(_value)))
    if string.startswith(_path, MetaData.Enum.GLOBAL) then
        --* 收到服务器数据
        MetaData.Set(rawDataGlobal, _path, MetaData.Enum.CLIENT, _value)
    elseif string.startswith(_path, MetaData.Enum.PLAYER) then
        -- TODO: Player数据
    else
        error(
            string.format(
                '[DataSync][Server] _path错误 _player = %s, _path = %s, _value = %s',
                localPlayer,
                _path,
                table.dump(_value)
            )
        )
    end
end

return ClientDataSync
