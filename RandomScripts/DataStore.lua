
    ----[SERVICES]
local DataStorage = game:GetService("DataStoreService")
local Data = DataStorage:GetDataStore("data-v001") --- You can change this to "data-v002" to reset every data input

-----------[CLIENT JOINS SERVER]
game.Players.PlayerAdded:Connect(function(Client)
	local leaderstats = Instance.new("Folder",Client)
	leaderstats.Name = "leaderstats"

	--Creating two stats that will appear on top of your screen.. "Coins and Dimes which are both integer values"
	local Coins = Instance.new("IntValue",leaderstats) 
	Coins.Name = "Coins"
	Coins.Value = 0

	local Dimes = Instance.new("IntValue",leaderstats)
	Dimes.Name = "Dimes"
	Dimes.Value = 0
	
	---->DataSection
	local UserId = Client.UserId
	local data = Data:GetAsync(UserId)
	local ClientsData = {
		Client.leaderstats.Coins.Value,
			Client.leaderstats.Dimes.Value
	}
	
	---Checks if data is found
	if data then ClientsData = data print("GETASYNC HAS INIT ") else warn("ERROR IN GETASYNC SEC") end
	
end)	
	

---------------[CLIENT LEAVES SERVER]
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