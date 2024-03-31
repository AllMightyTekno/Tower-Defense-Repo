---//Services
local StudioService = game:GetService("StudioService")
local Players = game:GetService("Players")
local Selection = game:GetService("Selection")
local UserInputService = game:GetService("UserInputService")

--//Variables
local loggedInUsrId = StudioService:GetUserId() --UsrId who is logged in Studio 
local loggedInUsrName = Players:GetNameFromUserIdAsync(loggedInUsrId) --Name of the the usr logged in studio
local SelectedObjects = Selection:Get() --Get's an array of selected instances in roblox studio

local toolbar = plugin:CreateToolbar("ResizeMe")

local PluginButton = toolbar:CreateButton("ResizeMe","ResizeIcon","rbxassetId:// ")

PluginButton.ClickableWhenViewportHidden = true

---////CHECKS IF ALL CONNECTIONS ARE WORKING
print(loggedInUsrId)
print(loggedInUsrName)
---////CHECKS


---//Functions/Processes                    


for _, object in ipairs(SelectedObjects) do --Loops through all the Objects gotten under the selectObjects Variable 
 
    if object:IsA("Frame") then --Checks if the selected object is a frame
       local obj = object

        local initialSize = obj.Size
local function updateFrameSize(input)
    -- Get the mouse delta
    local mouseDelta = input.Delta

    -- Update the frame size based on mouse movements
    obj.Size = UDim2.new(initialSize.X.Scale, initialSize.X.Offset + mouseDelta.X, 
                           initialSize.Y.Scale, initialSize.Y.Offset + mouseDelta.Y)
end


-- Connect to the InputChanged event to capture mouse movements
UserInputService.InputChanged:Connect(function(input)
    -- Check if the input is mouse movement
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        -- Call the updateFrameSize function
        updateFrameSize(input)
    end
end)

    end

end