    ---THE SCRIPT IS RESPONSIBLE FOR TELLING THE MODULE WHICH ZOMBIE AND WHERE TO SPAWN IT
--SPOOK.exe
local SS = game.ServerStorage
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MobModule = require(ReplicatedStorage.Shared.MobHandlerModule)

local YellowMap = workspace.YellowMap

--YellowMap Spawning
--[Map Description]
---Map 1 Functionalitys [Rank Zombies: Normal Zombies/MAP:  Yellow Map/# of waves:10 Waves]
for waves = 1, 10 do
    task.wait(4)
    MobModule.Spawn("Zombie",1, YellowMap)
    if waves == 10 then --When Finale stage(Stage 10) reaches..
        task.wait(4)      
        MobModule.Spawn("Zombie", 1, YellowMap)
    end
task.wait(3)
print("STAGE: "..waves)
end

--Add More maps

MobModule()