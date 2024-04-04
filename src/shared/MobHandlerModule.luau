----/// VARIABLES
local ServerStorage = game:GetService("ServerStorage")

local mob = {}

----------------------------------
----|    Public functions	 |----
----------------------------------

--[Mop Movement]
function mob.Move(mob: Model, map: Path?)
    local Humanoid = mob:WaitForChild("Humanoid")
    local waypoints = map.Waypoints

    for waypoint = 1, #waypoints:GetChildren() do --This increments one evertime..#waypoints gets how many waypoints are in the folder
        Humanoid:MoveTo(waypoints[waypoint].Position)
        Humanoid.MoveToFinished:Wait()
    end

    Humanoid.Parent:Destroy()
end

--[Mob spawning]
function mob.Spawn(name: string?, qty: number, map: Path) --Im setting 2 parameters the type of zombie and where it spawns
    local MobExist = ServerStorage.Mobs:FindFirstChild("Zombie")
    if not MobExist then warn("REQUESTED MOB DOES NOT EXIST.. ") return end

    for i = 1, qty do
         --Move into workspace
        local newMob = MobExist:Clone()
        newMob.HumanoidRootPart.CFrame = map.Start.CFrame --Start is the name of the Start part in the workspace
        newMob.Parent = workspace.Mobs
        coroutine.wrap(mob.Move)(newMob, map) --This makes it so that the other functions run at the same time 
    end
    
end

--[Tower Spawning]
function mob.BlackTower(Tower: Model, Radius: number?, Dmg: number)

    while true do
        for _, Mobs in (workspace.Mobs:GetChildren()) do
            local distance = (Tower.Position - Mobs.HumanoidRootPart.Position).Magnitude --Distance btw the mob's Root Part and the Tower Position
            local Target = Mobs

            if distance <= Radius then
                Target.Humanoid.Health = Target.Humanoid.Health -25
                print(Mobs)
                print(distance)  
                task.wait(1)
            else
                warn("AWAITING TARGET")
            end
        end

       task.wait(1)
    end
end

return mob