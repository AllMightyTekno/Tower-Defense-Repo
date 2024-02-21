    ---THE SCRIPT IS RESPONSIBLE FOR TELLING THE MODULE WHICH ZOMBIE AND WHERE TO SPAWN IT


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MobModule = require(ReplicatedStorage.MobHandlerModule)
local YellowMap = workspace.YellowMap

--YellowMap Spawning
for i=1,10 do
    MobModule.Spawn("Zombie", YellowMap)
    task.wait(5)
end

--Add More maps

MobModule()