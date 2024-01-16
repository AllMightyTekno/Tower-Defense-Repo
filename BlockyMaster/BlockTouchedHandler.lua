local TS = game:GetService("TweenService")
local BlockModel = game.Workspace.BLOCK 
local Triggers = game.Workspace.Triggers:GetChildren("Base")
local TriggerGateModels = game.Workspace:FindFirstChild("Triggers")

 for _, Triggers in pairs(game.Workspace.Triggers:GetChildren()) do
	
	
BlockModel.Touched:Connect(function(hit)
		if hit and hit:IsDescendantOf(game.Workspace.Triggers) then --Checks wheter what touched the trigger is a chikld of the triggers folder
    --FIRES WHEN THE BLOCK TOUCHES THE TRIGGERS
local TouchedTrigger = hit
local ToucehdTriggerDoorModel = hit:GetAttribute("Trigger_Number")  --Get's the Attribute of the gate that's suppose to be opended by the player
			
			
			if TriggerGateModels then --If the TriggersGate Model in the Triggers model is found.
				
				for _, part in pairs(TriggerGateModels:GetDescendants()) do
					
					if part.Name == "Gate" and ToucehdTriggerDoorModel == part:GetAttribute("GateNumber") then
						
						local partOriginalPosition = part.Position
						local offset = Vector3.new(0, 0, 20) -- Adjust the offset as needed
						local newCFrame = part.CFrame * CFrame.new(offset)
						
						local OpenTween = TS:Create(part,TweenInfo.new(6), {CFrame = newCFrame})
							
						OpenTween:Play()
						part.Parent.Cross.Base.CanTouch = false
						task.wait(10)
						
						if OpenTween.Completed then --if the door's tween has finished then it tweens back to it's normal position
						
							local offset = Vector3.new(0, 0, -20) -- Adjust the offset as needed
							local newCFrame = part.CFrame * CFrame.new(offset)
							local CloseTween = TS:Create(part,TweenInfo.new(6), {CFrame = newCFrame})

							CloseTween:Play()
							if CloseTween.Completed then
								part.Parent.Cross.Base.CanTouch = true
							end
						end
						
						
					end
					
				end
				
			end
			
			
       end

   end)

end