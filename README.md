# ExpandPlayers Module

## Description
The ExpandPlayers module provides a collection of functions that extend the functionality of the Roblox Players service.

## Table of Contents
- [Functions](#functions)
    - [GetPlayerByName](#getplayerbyname)
    - [TeleportPlayer](#teleportplayer)
    - [GetPlayerByUserId](#getplayerbyuserid)
    - [GetPing](#getping)
    - [GetFPS](#getfps)
    - [GetResolution](#getresolution)
    - [SetWalkspeed](#setwalkspeed)
    - [SetJumpPower](#setjumppower)
    - [GetCurrentTool](#getcurrenttool)
    - [UnequipCurrentTool](#unequipcurrenttool)
    - [EquipTool](#equiptool)
    - [CreateBackpackFolder](#createbackpackfolder)
    - [ClearBackpack](#clearbackpack)
    - [SetTeam](#setteam)
    - [GetGamepasses](#getgamepasses)
    - [HasGamepass](#hasgamepass)
    - _**[Download](#Download)**_

## Functions

### GetPlayerByName
```
function ExpandPlayers:GetPlayerByName(name: string): Player?
```
Returns the player with the given display name, or nil if no player is found.

#### Parameters
- `name: string` - The display name of the player to look for.

#### Returns
- `Player?` - The player with the given display name, or nil if no player is found.

### TeleportPlayer
```
function ExpandPlayers:TeleportPlayer(player: Player, position: Vector3): void
```
Teleports the given player to the specified position.

#### Parameters
- `player: Player` - The player to teleport.
- `position: Vector3` - The position to teleport the player to.

#### Returns
- `void`

### GetPlayerByUserId
```
function ExpandPlayers:GetPlayerByUserId(userId: number): Player?
```
Returns the player with the given UserId, or nil if no player is found.

#### Parameters
- `userId: number` - The UserId of the player to look for.

#### Returns
- `Player?` - The player with the given UserId, or nil if no player is found.

### GetPing
```
function ExpandPlayers:GetPing(player: Player): number
```
Returns the ping of the given player, or 0 if the ping cannot be found.

#### Parameters
- `player: Player` - The player to get the ping of.

#### Returns
- `number` - The ping of the given player, or 0 if the ping cannot be found.

### GetFPS
```
function ExpandPlayers:GetFPS(player: Player): number
```
Returns the FPS of the given player, or 0 if the FPS cannot be found.

#### Parameters
- `player: Player` - The player to get the FPS of.

#### Returns
- `number` - The FPS of the given player, or 0 if the FPS cannot be found.

### GetResolution
```
function ExpandPlayers:GetResolution(player: Player): Vector2
```
Returns the GUI resolution of the given player, or Vector2.new(0, 0) if the resolution cannot be found.

#### Parameters
- `player: Player` - The player to get the GUI resolution of.

#### Returns
- `Vector2` - The GUI resolution of the given player, or Vector2.new(0, 0) if the resolution cannot be found.

### SetWalkspeed
```
function ExpandPlayers:SetWalkspeed(player: Player, speed: number)
```
Sets the walkspeed of the given player.

#### Parameters
- `player: Player` - The player to set the walkspeed of.
- `speed: number` - The new walkspeed.

#### Returns
- `void`

### SetJumpPower
```
function ExpandPlayers:SetJumpPower(player: Player, power: number)
```
Sets the jump power of the given player.

#### Parameters
- `player: Player` - The player to set the jump power of.
- `power: number` - The new jump power.

#### Returns
- `void`

### CreateBackpack
```
function ExpandPlayers:CreateBackpack(player: Player)
```
Creates a new backpack for the given player.

#### Parameters
- `player: Player` - The player to create the backpack for.

#### Returns
- `void`

### CreateFolder
```
function ExpandPlayers:CreateFolder(player: Player, folderName: string)
```

Creates a new folder in the given player's backpack.

#### Parameters
- `player: Player` - The player to create the folder for.
- `folderName: string` - The name of the new folder.

#### Returns
- `void`

### GetResolution
```
function ExpandPlayers:GetResolution(player: Player): Vector2
```
Returns the GUI resolution of the given player, or Vector2.new(0, 0) if the resolution cannot be found.

#### Parameters
- `player: Player` - The player to get the GUI resolution of.

#### Returns
- `Vector2` - The GUI resolution of the given player, or Vector2.new(0, 0) if the resolution cannot be found.

### SetWalkspeed
```
function ExpandPlayers:SetWalkspeed(player: Player, speed: number)
```
Sets the walkspeed of the given player.

#### Parameters
- `player: Player` - The player to set the walkspeed of.
- `speed: number` - The new walkspeed.

#### Returns
- `void`

### SetJumpPower
```
function ExpandPlayers:SetJumpPower(player: Player, power: number)
```
Sets the jump power of the given player.

#### Parameters
- `player: Player` - The player to set the jump power of.
- `power: number` - The new jump power.

#### Returns
- `void`

### GetCurrentTool
```
function ExpandPlayers:GetCurrentTool(player: Player): Tool?
```
Returns the current tool equipped by the player, or nil if the player has no tool equipped.

#### Parameters
- `player: Player` - The player to get the current tool of.

#### Returns
- `Tool?` - The current tool equipped by the player, or nil if the player has no tool equipped.

### UnequipCurrentTool
```
function ExpandPlayers:UnequipCurrentTool(player: Player): void
```
Unequips the current tool of the player.

#### Parameters
- `player: Player` - The player to unequip the tool of.

#### Returns
- `void`

### EquipTool
```
function ExpandPlayers:EquipTool(player: Player, tool: Tool): void
```
Equips the given tool to the player.

#### Parameters
- `player: Player` - The player to equip the tool to.
- `tool: Tool` - The tool to equip.

#### Returns
- `void`

### CreateBackpackFolder
```
function ExpandPlayers:CreateBackpackFolder(player: Player, folderName: string): Folder?
```
Creates a new folder in the player's backpack and returns it.

#### Parameters
- `player: Player` - The player to create the folder for.
- `folderName: string` - The name of the new folder.

#### Returns
- `Folder?` - The new folder created.

### ClearBackpack
```
function ExpandPlayers:ClearBackpack(player: Player): void
```
Removes all tools and items from the player's backpack.

#### Parameters
- `player: Player` - The player whose backpack will be cleared.

#### Returns
- `void`

### SetTeam
```
function ExpandPlayers:SetTeam(player: Player, team: Team): void
```
Sets the team of the given player.

#### Parameters
- `player: Player` - The player to set the team of.
- `team: Team` - The new team.

#### Returns
- `void`

### GetGamepasses
```
function ExpandPlayers:GetGamepasses(player: Player): Array<GamepassInfo>
```
Returns an array of GamepassInfo objects representing the gamepasses owned by the player.

#### Parameters
- `player: Player` - The player to get the gamepasses of.

#### Returns
- `Array<GamepassInfo>` - An array of GamepassInfo objects representing the gamepasses owned by the player.

### HasGamepass
```
function ExpandPlayers:HasGamepass(player: Player, gamepassId: number): boolean
```
Returns true if the player owns the gamepass with the given ID, false otherwise.

#### Parameters
- `player: Player` - The player to check for gamepass ownership.
- `gamepassId: number` - The ID of the gamepass to check for.

#### Returns
- `boolean` - true if the player owns the gamepass with the given ID, false otherwise.
___

### Download
[ExpandedPlayers.lua|attachment](upload://vQr5lCjTZdz4nc1de6oEnsuZdJI.lua) (3.8 KB): **An ModuleScript placed in any parent you want, I'd recommend ReplicatedStorage or ServerStorage, depending on your usage of ExpandedPlayers.**

[ExampleScript.lua|attachment](upload://i891zKYBBJTIU8hnqfdtBYnZ6Ty.lua) (817 Bytes): **An example script placed in ServerScriptService. Chat commands using ExpandedPlayers**

___

Please let me know how ExpandedPlayers might be made better in the future!
