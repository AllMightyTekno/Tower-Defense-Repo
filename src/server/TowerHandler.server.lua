local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MobModule = require(ReplicatedStorage.Shared.MobHandlerModule)

--->>Module Inits

--BlackTowerInit
    MobModule.BlackTower(game.Workspace.BlackTower,15,25)