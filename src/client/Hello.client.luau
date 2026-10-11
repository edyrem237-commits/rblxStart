--!strict

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Shared = ReplicatedStorage:WaitForChild("Shared")
local Config = require(Shared:WaitForChild("Config"))

local localPlayer = Players.LocalPlayer
print(`[{Config.GameName}] Hello from the client! Local player loaded: {localPlayer.Name}`)
