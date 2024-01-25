---//Services
local StudioService = game:GetService("StudioService")
local Players = game:GetService("Players")
local Selection = game:GetService("Selection")
local UserInputService = game:GetService("UserInputService")

--//Variables
local loggedInUsrId = StudioService:GetUserId()
local loggedInUsrName = Players:GetNameFromUserIdAsync(loggedInUsrId)
local SelectedObjects = Selection:Get()

local toolbar = plugin:CreateToolbar("ResizeMe")

local PluginButton = toolbar:CreateButton("ResizeMe","ResizeIcon","rbxassetId:// ")

PluginButton.ClickableWhenViewportHidden = true

---////CHECKS
print(loggedInUsrId)
print(loggedInUsrName)
---////CHECKS

---//Functions/Processes 
for _, object in pairs(SelectedObjects) do

    local frame = object
    local initialSize = frame.Size

    if object:IsA("Frame") then
local function updateFrameSize(input)
    -- Get the mouse delta
    local mouseDelta = input.Delta

    -- Update the frame size based on mouse movements
    frame.Size = UDim2.new(initialSize.X.Scale, initialSize.X.Offset + mouseDelta.X, 
                           initialSize.Y.Scale, initialSize.Y.Offset + mouseDelta.Y,
                           initialSize.Z.Scale, initialSize.Z.Offset + mouseDelta.Z)
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