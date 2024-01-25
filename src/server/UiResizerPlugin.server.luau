---//Services
local StudioService = game:GetService("StudioService")
local Players = game:GetService("Players")
--//Variables
local loggedInUsrId = StudioService:GetUserId()
local loggedInUsrName = Players:GetNameFromUserIdAsync(loggedInUsrId)

local toolbar = plugin:CreateToolbar("ResizeMe")

local PluginButton = toolbar:CreateButton("ResizeMe","ResizeIcon","rbxassetId:// ")

print(loggedInUsrId)
print(loggedInUsrName)

PluginButton.ClickableWhenViewportHidden = true

---//Functions/Processes 

local function OnMouseUi() --Handler



end

if PluginButton.Enabled == true then --Code Runner
    OnMouseUi()
end