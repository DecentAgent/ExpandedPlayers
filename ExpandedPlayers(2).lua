--// Create a new ModuleScript and name it ExpandedPlayers

--// Define the module
local ExpandedPlayers = {}

--// Get the Players service
local Players = game:GetService("Players")
local ChatService = require(game:GetService("ServerScriptService"):WaitForChild("ChatServiceRunner"):WaitForChild("ChatService"))

--// Function to return a player by their display name
function ExpandedPlayers:GetPlayerByName(name)
	for _, player in pairs(Players:GetPlayers()) do
		if player.DisplayName == name then
			return player
		end
	end
	return nil
end

--// Function to teleport a player to a specific location
function ExpandedPlayers:TeleportPlayer(player, position)
	player.Character:MoveTo(position)
end

--// Function to return a player by their UserId
function ExpandedPlayers:GetPlayerByUserId(userId)
	return Players:GetPlayerByUserId(userId)
end

--// Function to get a player's ping
function ExpandedPlayers:GetPing(player)
	return player:FindFirstChildOfClass("NetworkPing") and player:FindFirstChildOfClass("NetworkPing").Value or 0
end

--// Function to get a player's FPS
function ExpandedPlayers:GetFPS(player)
	return player:FindFirstChildOfClass("FPS") and player:FindFirstChildOfClass("FPS").Value or 0
end

--// Function to get a player's GUI resolution
function ExpandedPlayers:GetResolution(player)
	return player:FindFirstChildOfClass("GuiResolution") and player:FindFirstChildOfClass("GuiResolution").Value or Vector2.new(0, 0)
end

--// Function to set a player's walkspeed
function ExpandedPlayers:SetWalkspeed(player, walkspeed)
	player.Character.Humanoid.WalkSpeed = walkspeed
end

--// Function to set a player's jump power
function ExpandedPlayers:SetJumpPower(player, jumpPower)
	player.Character.Humanoid.JumpPower = jumpPower
end

--// Function to get a player's current tool
function ExpandedPlayers:GetCurrentTool(player)
	return player.Character and player.Character:FindFirstChildOfClass("Tool")
end

--// Function to unequip a player's current tool
function ExpandedPlayers:UnequipCurrentTool(player)
	local tool = ExpandedPlayers:GetCurrentTool(player)
	if tool then
		player.Character:FindFirstChild("Humanoid"):UnequipTools()
	end
end

--// Function to equip a player's tool by name
function ExpandedPlayers:EquipTool(player, toolName)
	local tool = player.Backpack:FindFirstChild(toolName) or player.Character:FindFirstChild(toolName)
	if tool then
		tool.Parent = player.Character
	end
end

--// Function to create a new folder in a player's Backpack
function ExpandedPlayers:CreateBackpackFolder(player, folderName)
	local folder = Instance.new("Folder")
	folder.Name = folderName
	folder.Parent = player.Backpack
end

--// Function to remove all items from a player's Backpack
function ExpandedPlayers:ClearBackpack(player)
	for _, item in pairs(player.Backpack:GetChildren()) do
		item:Destroy()
	end
end

--// Function to change a player's team
function ExpandedPlayers:SetTeam(player, team)
	player.Team = team
end

--// Function to get a player's gamepasses
function ExpandedPlayers:GetGamepasses(player)
	--// Check if player is valid
	if not player or not player:IsA("Player") then
		warn("Invalid player provided")
		return {}
	end

	--// Get product info using pcall to handle errors
	local success, result = pcall(function()
		return Players:GetProductInfoAsync({player.UserId})
	end)
	if not success then
		warn("Error getting product info for player " .. player.Name .. ": " .. tostring(result))
		return {}
	end

	--// Check if product info is valid
	if not result or not next(result) then
		warn("No product info found for player " .. player.Name)
		return {}
	end

	--// Extract gamepasses from product info
	local gamepasses = {}
	for _, product in pairs(result) do
		if product and product["IsGamePass"] then
			table.insert(gamepasses, product["ProductId"])
		end
	end

	return gamepasses
end

--// Function to check if a player has a specific gamepass
function ExpandedPlayers:HasGamepass(player, gamepassId)
	local gamepasses = ExpandedPlayers:GetGamepasses(player)
	return table.find(gamepasses, gamepassId) ~= nil
end

--// Function to get the local player's formatted time
function ExpandedPlayers:GetLocalPlayerFormattedTime()
	local time = os.date("*t")
	local formattedTime = string.format("%02d:%02d:%02d", time.hour, time.min, time.sec)
	return formattedTime
end

--[[--// Function to get a player's height
function ExpandedPlayers:GetPlayerHeight(player)
	if not player or not player:IsA("Player") then
		error("Invalid argument: Expected Player, got ".. tostring(player), 2)
	end

	local character = player.Character
	if not character then
		return nil, "Player has no character"
	end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then
		return nil, "Character has no humanoid"
	end

	local rigType = humanoid.RigType
	local hipHeight = humanoid.HipHeight

	if rigType == Enum.HumanoidRigType.R15 then
		hipHeight = hipHeight - 0.5 * character.PrimaryPart.Size.Y
	elseif rigType == Enum.HumanoidRigType.R6 then
		hipHeight = hipHeight - character.LeftLeg.Size.Y - 0.5 * character.PrimaryPart.Size.Y
	else
		return nil, "Unsupported RigType: "..tostring(rigType)
	end

	return hipHeight
end--]]

--// Function to check if a player has played the game before
function ExpandedPlayers:HasPlayedGameBefore(player)
	local dataStore = game:GetService("DataStoreService"):GetDataStore("HasPlayedGameBefore")
	local success, hasPlayedBefore = pcall(function()
		return dataStore:GetAsync(player.UserId)
	end)
	return success and hasPlayedBefore or false
end

--// Function to kick a player with a custom message
function ExpandedPlayers:Kick(player, reason)
	player:Kick(reason)
end

return ExpandedPlayers