--- 埋点数据工具
--- @module CloudLogUtil
--- @copyright Lilith Games, Avatar Team
--- @author Sharif Ma
local CloudLogUtil = {}

---埋点工具初始化
---@param _gameId string 游戏的唯一ID,和服务端定好后不可以更改的,游戏开始前执行
function CloudLogUtil.Init(_gameId)
    CloudLogUtil.gameId = _gameId
end

---触发埋点相应的事件调用 CloudLogUtil.UploadLog('', '' .. )
---@param _key string 埋点的键
function CloudLogUtil.UploadLog(_key, _action, _table)
    pcall(
        function()
            --table.MergeTables({action = _action}, _table or {})
			local action = {action = _action}
			if _table then
				table.merge(action, _table)
			end
            local arg = LuaJsonUtil:encode(action)
            if localPlayer then
                TrackService.CloudLogFromClient({_key, CloudLogUtil.gameId, arg})
            else
                TrackService.CloudLogFromServer({_key, CloudLogUtil.gameId, arg})
            end
        end
    )
end

return CloudLogUtil
