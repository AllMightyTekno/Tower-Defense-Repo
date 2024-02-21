    ---THE SCRIPT IS RESPONSIBLE FOR TELLING THE MODULE WHICH ZOMBIE AND WHERE TO SPAWN IT
--Carti

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MobModule = require(ReplicatedStorage.MobHandlerModule)
local YellowMap = workspace.YellowMap

--YellowMap Spawning
---Map 1 Functionalitys/Normal Zombies/ Yellow Map
for waves = 1, 10 do
    MobModule.Spawn("Zombie",20, YellowMap)
    if waves == 10 then --When Finale stage(Stage 10) reaches..
        MobModule.Spawn("Zombie", 10*3, YellowMap)      
    end
task.wait(3)
print("STAGE: "..waves)
end

--Add More maps

MobModule()