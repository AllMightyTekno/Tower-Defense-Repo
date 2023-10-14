local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local UpdateImage = game.StarterGui.CharacterScreen.GameUpdate.UpdateImage

--This is a reserved server where players wait to be teleported to updated server without a owner.
if (game.VIPServerId ~=  "" and game.VIPServerOwnerId == 0) then
	UpdateImage.Visible = true --> Display update image

	local waitTime = 5

	Players.PlayerAdded:Connect(function(player)
		UpdateImage.Visible = true --> Display update image
		wait(waitTime)
		waitTime = waitTime / 2
		TeleportService:Teleport(game.PlaceId, player,nil,UpdateImage )
	end)

	for _, player in pairs(game.Players:GetPlayers()) do
		UpdateImage.Visible = true --> Display update image
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

		UpdateImage.Visible = false --Display cannot be seen
		wait(2)
		local ReservedServerCode = TeleportService:ReserveServer(game.PlaceId)
		--This is a reserved server where players wait to get back to the game.
		for _, player in pairs(game.Players:GetPlayers() ) do
			UpdateImage.Visible = false --Display
			TeleportService:TeleportToPrivateServer(game.PlaceId,ReservedServerCode, {player},nil,nil,UpdateImage)

		end
		Players.PlayerAdded:Connect(function(player)
			UpdateImage.Visible = false --Display cannot be seen
			TeleportService:TeleportToPrivateServer(game.PlaceId, ReservedServerCode, {player},nil,nil,UpdateImage)
		end)

		while (#Players:GetPlayers() > 0 ) do
			wait(1)
		end

		--done
	end)
end