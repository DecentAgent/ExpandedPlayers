--// Create a new ModuleScript and name it ExpandPlayers

--// Define the module
local ExpandPlayers = {}

--// Get the Players service
local Players = game:GetService("Players")

--// Function to return a player by their display name
function ExpandPlayers:GetPlayerByName(name)
	for _, player in pairs(Players:GetPlayers()) do
		if player.DisplayName == name then
			return player
		end
	end
	return nil
end

--// Function to teleport a player to a specific location
function ExpandPlayers:TeleportPlayer(player, position)
	player.Character:MoveTo(position)
end

--// Function to return a player by their UserId
function ExpandPlayers:GetPlayerByUserId(userId)
	return Players:GetPlayerByUserId(userId)
end

--// Function to get a player's ping
function ExpandPlayers:GetPing(player)
	return player:FindFirstChildOfClass("NetworkPing") and player:FindFirstChildOfClass("NetworkPing").Value or 0
end

--// Function to get a player's FPS
function ExpandPlayers:GetFPS(player)
	return player:FindFirstChildOfClass("FPS") and player:FindFirstChildOfClass("FPS").Value or 0
end

--// Function to get a player's GUI resolution
function ExpandPlayers:GetResolution(player)
	return player:FindFirstChildOfClass("GuiResolution") and player:FindFirstChildOfClass("GuiResolution").Value or Vector2.new(0, 0)
end

--// Function to set a player's walkspeed
function ExpandPlayers:SetWalkspeed(player, walkspeed)
	player.Character.Humanoid.WalkSpeed = walkspeed
end

--// Function to set a player's jump power
function ExpandPlayers:SetJumpPower(player, jumpPower)
	player.Character.Humanoid.JumpPower = jumpPower
end

--// Function to get a player's current tool
function ExpandPlayers:GetCurrentTool(player)
	return player.Character and player.Character:FindFirstChildOfClass("Tool")
end

--// Function to unequip a player's current tool
function ExpandPlayers:UnequipCurrentTool(player)
	local tool = ExpandPlayers:GetCurrentTool(player)
	if tool then
		player.Character:FindFirstChild("Humanoid"):UnequipTools()
	end
end

--// Function to equip a player's tool by name
function ExpandPlayers:EquipTool(player, toolName)
	local tool = player.Backpack:FindFirstChild(toolName) or player.Character:FindFirstChild(toolName)
	if tool then
		tool.Parent = player.Character
	end
end

--// Function to create a new folder in a player's Backpack
function ExpandPlayers:CreateBackpackFolder(player, folderName)
	local folder = Instance.new("Folder")
	folder.Name = folderName
	folder.Parent = player.Backpack
end

--// Function to remove all items from a player's Backpack
function ExpandPlayers:ClearBackpack(player)
	for _, item in pairs(player.Backpack:GetChildren()) do
		item:Destroy()
	end
end

--// Function to change a player's team
function ExpandPlayers:SetTeam(player, team)
	player.Team = team
end

--// Function to get a player's gamepasses
function ExpandPlayers:GetGamepasses(player)
	local gamepasses = {}
	for _, product in pairs(Players:GetProductInfoAsync({player.UserId})) do
		if product["IsGamePass"] then
			table.insert(gamepasses, product["ProductId"])
		end
	end
	return gamepasses
end

--// Function to check if a player has a specific gamepass
function ExpandPlayers:HasGamepass(player, gamepassId)
	local gamepasses = ExpandPlayers:GetGamepasses(player)
	return table.find(gamepasses, gamepassId) ~= nil
end

--// Function to kick a player with a custom message
function ExpandPlayers:Kick(player, reason)
	player:Kick(reason)
end

--// Function to ban a player with a custom message
--// function ExpandPlayers:Ban(player, reason)
	--// TODO: Implement a ban system
--// end

--// Function to mute a player with a custom message
--// function ExpandPlayers:Mute(player, reason)
	--// TODO: Implement a mute system
--// end

return ExpandPlayers
