repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local SMX = function(tab, argstable) 
	return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function warnnotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "SmokeX Warning", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "SmokeX Info", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end

GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "SmokeX Client"
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "SmokeX Client"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "SmokeX Client"
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
infonotify("SmokeX", "Loaded Successfully!", 5)

local CustomFly = SMX("Blatant", {
	["Name"] = "CustomFly",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomFly = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
				end
			end)
		else
			pcall(function()
				ScriptSettings.CustomFly = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Uses bypasses to fly"
})

local SpamSwordSwing = SMX("Combat", {
	["Name"]  = "SpamSwordSwing",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.SpamSwordSwing = true
				while task.wait(0.01) do
					if not ScriptSettings.SpamSwordSwing == true then return end
					local sc = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
					sc:swingSwordAtMouse()
				end
			end)
		else
			pcall(function()
				ScriptSettings.SpamSwordSwing = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam swings your sword"
})

local NoClickDelay = SMX("Combat", {
	["Name"]  = "NoClickDelay",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.NoClickDelay = true
				local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
				local ItemTableFunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
				local ItemTable = debug.getupvalue(ItemTableFunc, 1)
				for i2,v2 in pairs(ItemTable) do
					if type(v2) == "table" and rawget(v2, "sword") then
						v2.sword.attackSpeed = 0.0000000000000000000000000000000000001
					end
					SwordCont.isClickingTooFast = function() return false end
				end
			end)
		else
			pcall(function()
				ScriptSettings.NoClickDelay = false
				local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
				local ItemTableFunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
				local ItemTable = debug.getupvalue(ItemTableFunc, 1)
				for i2,v2 in pairs(ItemTable) do
					if type(v2) == "table" and rawget(v2, "sword") then
						v2.sword.attackSpeed = 0.24
					end
					SwordCont.isClickingTooFast = function() return false end
				end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam swings your sword"
})

local AnimDisabler = SMX("Utility", {
	["Name"]  = "NoAnim",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnimDisabler = true
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				while task.wait(1.5) do
					if not ScriptSettings.AnimDisabler == true then return end
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Animate
					game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				end
			end)
		else
			pcall(function()
				ScriptSettings.AnimDisabler = false
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables your animation"
})

local CollectAllDrops = SMX("Utility", {
	["Name"]  = "CollectDrops",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CollectAllDrops = true
				while task.wait() do
					if not ScriptSettings.CollectAllDrops == true then return end
					for i,v in pairs(game:GetService("Workspace").ItemDrops:GetChildren()) do
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.CollectAllDrops = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Collect map drops, no working really good but i don't care"
})

local Shaders = SMX("Render", {
	["Name"] = "Shaders",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Shaders = true
				game:GetService("Lighting"):ClearAllChildren()
				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 2

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.14
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.ClockTime = 6.7
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 1000
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)

				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 4

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.3
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.TimeOfDay = "07:30:00"
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 300
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)
			end)
		else
			pcall(function()
				ScriptSettings.Shaders = false
				infonotify("Shaders", "Unable to revert changes", 5)
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool shaders, not by SmokeX"
})

local Crosshair = SMX("Render", {
	["Name"] = "Crosshair",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Crosshair = true
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = "rbxassetid://9943168532"
				mouse:GetPropertyChangedSignal("Icon"):Connect(function()
				    if not ScriptSettings.Crosshair == true then return end
				    mouse.Icon = "rbxassetid://9943168532"
				end)
			end)
		else
			pcall(function()
				ScriptSettings.Crosshair = false
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = ""
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Custom crosshair"
})

local Reinject = SMX("Utility", {
	["Name"] = "Reinject",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Reinject = true
				infonotify("Reinject", "Please disable reinject to use.", 5)
			end)
		else
			pcall(function()
				ScriptSettings.Reinject = false
				GuiLibrary["SelfDestruct"]()
				if shared.DogV4Private_AutoExec then shared.Restart_Vape() else infonotify("Reinject", "You do not have Dog V4 Reinject supported.", "5") end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Reinjects Vape"
})

local Night = SMX("Render", {
	["Name"] = "Night",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Night = true
				game:GetService("Lighting").TimeOfDay = "00:00:00"
				while task.wait(5) do
					if not ScriptSettings.Night == true then return end
					game:GetService("Lighting").TimeOfDay = "00:00:00"
				end
			end)
		else
			pcall(function()
				ScriptSettings.Night = false
				game:GetService("Lighting").TimeOfDay = "13:00:00"
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool night render"
})

local ChatCrasher = SMX("Utility", {
	["Name"] = "ChatCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ChatCrasher = true
				while task.wait() do
					if not ScriptSettings.ChatCrasher == true then return end
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼", "All")
				end
			end)
		else
			pcall(function()
				ScriptSettings.ChatCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "bye chat ;("
})

local OPAntiVoid = SMX("Utility", {
	["Name"] = "OPAntiVoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.OPAntiVoid = true
				local part = Instance.new("Part")
				part.Name = "NewVoid"
				part.Anchored = true
				part.Transparency = 1
				part.Color = Color3.fromRGB(0, 46, 255)
				part.Size = Vector3.new(5000,3,5000)
				part.Parent = game:GetService("Workspace")
				part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
				ScriptSettings.CustomAntivoid_Part = part
				part.Touched:Connect(function(v)
					if v.Parent:FindFirstChild("Humanoid") and v.Parent.Parent.Name == game:GetService("Players").LocalPlayer.Name and not v.Parent:FindFirstChild("Humanoid").Health == 0 then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.OPAntiVoid = false
				ScriptSettings.NewVoid:Destroy()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Good AntiVoid Again lmao"
})

local LandmindeAura = SMX("Blatant", {
	["Name"]  = "LandmindeAura",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.LandmindeAura = true
				while task.wait(0.15) do
					if not ScriptSettings.LandmindeAura == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							local mag = (v.Character:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Position).magnitude
							if mag > 11 then
								if not v.Team.BrickColor == game:GetService("Players").LocalPlayer.Team.BrickColor then
									if not v.Team.Name == game:GetService("Players").LocalPlayer.Team.Name then
										game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["landmineremote"]:FireServer({
											["invisibleLandmine"] = v.Character:FindFirstChild("Head")
										})
									end
								end
							end
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.LandmindeAura = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Lmao"
})

local BiMode_Blur 
local BiMode = SMX("Render", {
	["Name"]  = "BIMode",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.BiMode = true
				game:GetService("Lighting").Ambient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").TimeOfDay = "03:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").FogStart = 500
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 1
				BiMode_Blur = Instance.new("Blur")
				local blurx = BiMode_Blur
				blurx.Size = 4
				blurx.Name = game:GetService("HttpService"):GenerateGUID(true)
			end)
		else
			pcall(function()
				ScriptSettings.BiMode = false
				game:GetService("Lighting").Ambient = Color3.fromRGB(165, 165, 165)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(104, 104, 104)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(146, 190, 255)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(228, 249, 255)
				game:GetService("Lighting").TimeOfDay = "13:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(255, 255, 255)
				game:GetService("Lighting").FogStart = 0
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 0
				if BiMode_Blur then BiMode_Blur:Destroy() end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "ok"
})

local AFKFarm = SMX("Utility", {
	["Name"]  = "AFKFarm",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AFKFarm = true
				local char = game:GetService("Players").LocalPlayer.Character
				char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,99,0)
				char:FindFirstChild("Head").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("HumanoidRootPart"):Destroy()
			end)
		else
			pcall(function()
				ScriptSettings.SlowAutoWin = false
				infonotify("AFkFarm", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Be afk and wait for win lmao"
})

local AutoToxicV2 = SMX("Utility", {
	["Name"]  = "AutoToxicV2",
	["Function"] = function(callback)
		if callback then
				pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/SmokeXDev/SmokeXPubblic/main/Resources/AutoToxicV2.lua", true))()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool AutoToxicV2 By SmokeX Client"
})

local VClip = SMX("Utility", {
	["Name"]  = "VClip",
	["Function"] = function(callback)
		if callback then
			local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
			local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
			local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
			createwarning("VClip", "Success!", 1)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Why not"
})

local DisableChat = SMX("Utility", {
	["Name"]  = "ChatRemover",
	["Function"] = function(callback)
		if callback then
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				game:GetService("StarterGui"):SetCoreGuiEnabled("Chat", false)
				createwarning("ChatDisabler", "Disabled Chat!", 1)
			end
		end
	end,
	["Default"] = false,
	["HoverText"] = "ByeBye Chat"
})

local ChatRestore = SMX("Render", {
	["Name"]  = "ChatRestore",
	["Function"] = function(callback)
		if callback then
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				game:GetService("StarterGui"):SetCoreGuiEnabled("Chat", true)
				createwarning("Chat Restore", "Chat Restored!", 1)
			end
		end
	end,
	["Default"] = false,
	["HoverText"] = "Restore Chat"
})

local BedTP = SMX("World", {
	["Name"]  = "BedTP",
	["Function"] = function(callback)
		if callback then
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local ClosestBedMag = math.huge
				local ClosestBed = false
				local lplr = game.Players.LocalPlayer
				function GetNearestBedToPosition()
					for i,v in pairs(game.Workspace:GetChildren()) do
						if v.Name == "bed" and v:FindFirstChild("Covers") and v.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
							if (lplr.Character.HumanoidRootPart.Position - v.Position).Magnitude < ClosestBedMag then
								ClosestBedMag = (lplr.Character.HumanoidRootPart.Position - v.Position).Magnitude
								ClosestBed = v
							end
						end
					end
					return ClosestBed
				end
				local real = GetNearestBedToPosition().Position
				game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(real) + Vector3.new(0,5,0)
			end
		end
	end,
	["Default"] = false,
	["HoverText"] = "TP to a random bed"
})
