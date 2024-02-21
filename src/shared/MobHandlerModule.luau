----///VARIABLES
local SS = game:GetService("ServerStorage")

local mob = {}

---///FUNCTIONS

function mob.Move(mob, map)
local Humanoid = mob:WaitForChild("Humanoid")
local waypoints = map.Waypoints

for waypoint = 1, #waypoints:GetChildren() do --This increments one evertime..#waypoints gets how many waypoints are in the folder
  Humanoid:MoveTo(waypoints[waypoint].Position)
  Humanoid.MoveToFinished:Wait()
end
Humanoid.Parent:Destroy()
end


function mob.Spawn(name,qty , map) --Im setting 2 parameters the type of zombie and where it spawns
    local MobExist = SS.Mobs:FindFirstChild("Zombie")
    if MobExist then
        for i=1, qty do
               --Move into workspace
        local newMob = MobExist:Clone()
        newMob.HumanoidRootPart.CFrame = map.Start.CFrame --Start is the name of the Start part in the workspace
        newMob.Parent = workspace
        coroutine.wrap(mob.Move)(newMob,map) --This makes it so that the other functions run at the same time 
        end
        
    else
        --else if it doesnt exist do something
        warn("REQUESTED MOB DOES NOT EXIST.. ")
    end
end



return mob