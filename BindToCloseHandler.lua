local ServerHandler = {}


sd
function ServerHandler.DATAHANDLER()
    ----[SERVICES]
local DataStorage = game:GetService("DataStoreService")
local Data = DataStorage:GetDataStore("data-v001")

-----[FUNCTIONS]
game.Players.PlayerAdded:Connect(function(Client)
	local leaderstats = Instance.new("Folder",Client)
	leaderstats.Name = "leaderstats"

	local Coins = Instance.new("IntValue",leaderstats)
	Coins.Name = "Coins"
	Coins.Value = 0

	local Dimes = Instance.new("IntValue",leaderstats)
	Dimes.Name = "Dimes"
	Dimes.Value = 0
	
	---->DataSec
	local UserId = Client.UserId
	local data = Data:GetAsync(UserId)
	local ClientsData = {
		Client.leaderstats.Coins.Value,
			Client.leaderstats.Dimes.Value
	}
	
	if data then ClientsData = data print("GETASYNC HAS INIT ") else warn("ERROR IN GETASYNC SEC") end
	
end)	
	

game.Players.PlayerRemoving:Connect(function(Client)
	local success,errormessage = pcall(function()
		local ClientsData = {
			Client.leaderstats.Coins.Value,
			Client.leaderstats.Dimes.Value
		}
	local SavedData = Data:SetAsync(Client.UserId, ClientsData)	
	end)
	
	if success then
		print("SETASYNC HAS INIT") else warn("ERROR IN SETASYNC")
	end
end)

end







function ServerHandler.BindToClose()
    local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

--This is a reserved server where players wait to be teleported to updated server without a owner.
if (game.VIPServerId ~=  "" and game.VIPServerOwnerId == 0) then
	local text = Instance.new("Message",workspace)
	text.Text = "UPDATE GOING ON"

	local waitTime = 5

	Players.PlayerAdded:Connect(function(player)
		local text = Instance.new("Message",workspace)
		text.Text = "UPDATE GOING ON"
		wait(waitTime)
		waitTime = waitTime / 2
		TeleportService:Teleport(game.PlaceId, player,nil)
	end)

	for _, player in pairs(game.Players:GetPlayers()) do
		local text = Instance.new("Message",workspace)
		text.Text = "UPDATE GOING ON"
		TeleportService:Teleport(game.PlaceId, player)
		wait(waitTime)
		waitTime = waitTime / 2
	end

else

	game:BindToClose(function()
		if(#Players:GetPlayers() == 0) then
			return
		end

		if (game:GetService("RunService"):IsStudio()) then
			return
		end

		local text = Instance.new("Message",workspace)
		text.Text = "UPDATE GOING ON"
		wait(2)
		local ReservedServerCode = TeleportService:ReserveServer(game.PlaceId)
		--This is a reserved server where players wait to get back to the game.
		for _, player in pairs(game.Players:GetPlayers() ) do
			local text = Instance.new("Message",workspace)
			text.Text = "UPDATE GOING ON"
			TeleportService:TeleportToPrivateServer(game.PlaceId,ReservedServerCode, {player},nil,nil)

		end
		Players.PlayerAdded:Connect(function(player)
			local text = Instance.new("Message",workspace)
			text.Text = "UPDATE GOING ON"
			TeleportService:TeleportToPrivateServer(game.PlaceId, ReservedServerCode, {player},nil,nil)
		end)

		while (#Players:GetPlayers() > 0 ) do
			wait(1)
		end

		--done
	end)
    warn(" BIND TO CLOSE HAS INIT")
end

end

return ServerHandler