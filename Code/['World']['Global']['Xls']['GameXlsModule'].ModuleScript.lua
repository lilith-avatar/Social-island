--- This file is generated by ava-x2l.exe,
--- Don't change it manaully.
--- @copyright Lilith Games, Project Da Vinci(Avatar Team)
--- @see https://www.projectdavinci.com/
--- @see https://github.com/endaye/avatar-ava-xls2lua
--- source file: ./Table/Game.xls

local GameXls = {
    [1000] = {
        ID = 1000,
        Name = '五子棋',
        GameMaxNum = 2,
        Icon = 'UI/Picture/Ico_Game_Gobang',
        Des = '建议人数\n2人',
        Enable = true,
        WorldTable = 'G_Table_Wood_World',
        WorldSeat = 'World_Seat',
        WorldTableRadius = 1.8,
        PlayerTable = 'Table_GoBang',
        Focus = Vector3(0, 4.3, 0),
        PreCreate = {{ Id = 100001, Position = Vector3(1.25, 0, 1.25) }, { Id = 100002, Position = Vector3(-1.25, 0, -1.25) }},
        PreCreateStack = {},
        HandCard = {},
        OutLine =     {
        {Color = Color(255,43,103,255), Width = 10},
        {Color = Color(255,80,80,255), Width = 10},
    },
        Area = {3.4, 3.4}
    },
    [1001] = {
        ID = 1001,
        Name = '扑克',
        GameMaxNum = 4,
        Icon = '',
        Des = '建议人数\n2-4人',
        Enable = false,
        WorldTable = 'G_Table_Wood_World',
        WorldSeat = 'World_Seat',
        WorldTableRadius = 1.8,
        PlayerTable = 'G_Table_Wood_Default',
        Focus = Vector3(0, 4.3, 0),
        PreCreate = {},
        PreCreateStack = {
    { Position = Vector3(0, 0, 0.45), Units = { 10001, 10002, 10003, 10004, 10005, 10006, 10007, 10008, 10009 } }
},
        HandCard =  {
  { Position = Vector3(-0.0023, 4.3498, -1.3867), Rotation = EulerDegree(0, 0, 0)},
  {  Position = Vector3(-1.3851, 4.3498, 0.0009), Rotation = EulerDegree(0, 90, 0)},
  { Position = Vector3(-0.0023, 4.3498, 1.3782), Rotation = EulerDegree(0, 180, 0)},
  { Position = Vector3(1.3884, 4.3498, -0.0237), Rotation = EulerDegree(0, 270, 0)}
 },
        OutLine =     {
        {Color = Color(255,0,0,180), Width = 10},
        {Color = Color(0,255,0,180), Width = 10},
        {Color = Color(0,0,255,180), Width = 10},
        {Color = Color(100,100,100,180), Width = 10},
    },
        Area = {3.4, 3.4}
    },
    [1002] = {
        ID = 1002,
        Name = '围棋',
        GameMaxNum = 2,
        Icon = 'UI/Picture/Ico_Game_Go',
        Des = '建议人数\n2人',
        Enable = true,
        WorldTable = 'G_Table_Wood_World',
        WorldSeat = 'World_Seat',
        WorldTableRadius = 1.8,
        PlayerTable = 'Table_Go',
        Focus = Vector3(0, 4.3, 0),
        PreCreate = {{ Id = 100001, Position = Vector3(1.3, 0, 1.3) }, { Id = 100002, Position = Vector3(-1.4, 0, -1.4) }},
        PreCreateStack = {},
        HandCard = {},
        OutLine =     {
        {Color = Color(255,43,103,255), Width = 10},
        {Color = Color(255,80,80,255), Width = 10},
    },
        Area = {3.4, 3.4}
    }
}

return GameXls