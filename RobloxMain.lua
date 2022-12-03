repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

pcall(function()
getgenv().rconsoleprint = g
end) 

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

function notify(text)
    local frame = GuiLibrary["CreateNotification"]("Notification", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "SmokeX", 0)
     end
end

local AnticheatDisabler = COB("World", {
    Name = "Shaders",
    Function = function(callback) 
        if callback then

local lighting = game:GetService("Lighting")
getgenv().shaders = {}
if not shared.Check then
getgenv().oldLighting = {}
getgenv().oldLightingProp = {  
    Ambient = lighting.Ambient,
    Brightness = lighting.Brightness,
    ColorShift_Bottom = lighting.ColorShift_Bottom,
    ColorShift_Top = lighting.ColorShift_Top,
    GlobalShadows = lighting.GlobalShadows,
    OutdoorAmbient = lighting.OutdoorAmbient,
    ShadowSoftness = lighting.ShadowSoftness,
    EnvironmentDiffuseScale = lighting.EnvironmentDiffuseScale,
    EnvironmentSpecularScale = lighting.EnvironmentSpecularScale,
    ClockTime = lighting.ClockTime,
    GeographicLatitude = lighting.GeographicLatitude,
}
end
function revertshaders()
    for i,v in pairs(getgenv().oldLightingProp) do
        lighting[i] = v
    end
    for i,v in pairs(lighting:GetChildren()) do 
        if not v:IsA("BlurEffect") and v.ClassName:lower():find("effect") then 
            v.Parent = nil
        end 
    end

    for i,v in pairs(oldLighting) do 
        v.Parent = lighting
    end

    for i,v in pairs(getgenv().shaders) do 
        v.Parent = nil
    end

    sethiddenproperty(lighting, "Technology", getgenv().oldLighting["Technology"])
end


function doshaders()
for i,v in pairs(lighting:GetChildren()) do 
    if not v:IsA("BlurEffect") and v.ClassName:lower():find("effect") then 
        getgenv().oldLighting[v.Name] = v
        v.Parent = nil
    end 
    getgenv().oldLighting["Technology"] = gethiddenproperty(lighting, "Technology")
end
    local Bloom = lighting:FindFirstChild("EngoShaders_Bloom") or Instance.new("BloomEffect", lighting)
    local ColorCorrection = lighting:FindFirstChild("EngoShaders_ColorCorrection") or Instance.new("ColorCorrectionEffect", lighting)
    getgenv().shaders["Bloom"] = Bloom 
    getgenv().shaders["ColorCorrection"] = ColorCorrection
    lighting.Ambient = Color3.fromRGB(230, 164, 50)
    lighting.Brightness = 7
    lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
    lighting.ColorShift_Top = Color3.fromRGB(217, 140, 32)
    lighting.GlobalShadows = true
    lighting.OutdoorAmbient = Color3.fromRGB(102, 105, 50)
    lighting.ShadowSoftness = 0
    lighting.EnvironmentDiffuseScale = 0.05
    lighting.EnvironmentSpecularScale = 0.05
    sethiddenproperty(lighting, "Technology", Enum.Technology.ShadowMap)
    lighting.ClockTime = 9
    lighting.GeographicLatitude = 80
    Bloom.Name = "EngoShaders_Bloom"
    Bloom.Intensity = 0.1 
    Bloom.Size = 46
    Bloom.Threshold = 0.8
    ColorCorrection.Name = "EngoShaders_ColorCorrection"
    ColorCorrection.TintColor = Color3.fromRGB(244, 255, 210)
    ColorCorrection.Contrast = 0.2
    ColorCorrection.Brightness = -0.05
end

if shared.ShadersExecuted then
shared.ShadersExecuted = false
revertshaders()
else
shared.ShadersExecuted = true
doshaders()
end

shared.Check = true
        end
    end,
    Default = false,
    HoverText = "Private Shader? no"
})

local AnticheatDisabler = COB("Blatant", {
    Name = "PingFlight",
    Function = function(callback) 
        if callback then
          workspace.Gravity = 10
        else
            workspace.Gravity = 196.19999694824
        end
    end,
    Default = false,
    HoverText = "Small Distance Only"
})


		
local AnticheatDisabler = COB("World", {
    Name = "OldAntiVoid",
    Function = function(callback) 
        if callback then
            local antivoidpart = Instance.new("Part", Workspace)
            antivoidpart.Name = "AntiVoid"
            antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
            antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
            antivoidpart.Transparency = 0.4
            antivoidpart.Anchored = true
            antivoidpart.Touched:connect(function(dumbcocks)
                if dumbcocks.Parent:WaitForChild("Humanoid") and dumbcocks.Parent.Name == lplr.Name then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end,
    Default = false,
    HoverText = "Old AntiVoid recreation"
})

local BoostAirJump = {["Enabled"] = false}
BoostAirJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "BoostAirJump",
    ["Function"] = function(callback)
        if callback then
            task.spawn(function()
                repeat
                    task.wait(0.1)
                    if BoostAirJump["Enabled"] == false then break end
                    entity.character.HumanoidRootPart.Velocity = entity.character.HumanoidRootPart.Velocity + Vector3.new(0,40,0)
                until BoostAirJump["Enabled"] == false
            end)
        end
    end,
    ["HoverText"] = "SmokeX Client"
})

local AnticheatDisabler = COB("Render", {
    Name = "Ocean Lighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(0,0,255)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        end
    end,
    Default = false,
    HoverText = "Blue Themed Lighting"
})

local AnticheatDisabler = COB("Render", {
    Name = "Red Lighting",
    Function = function(callback) 
        if callback then
         game.Lighting.Ambient = Color3.fromRGB(255,0,0)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        end
    end,
    Default = false,
    HoverText = "Red Themed Lighting"
})



local AnticheatDisabler = COB("Render", {
    Name = "AestheticLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(135, 31, 219)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(135, 31, 219)
        end
    end,
    Default = false,
    HoverText = "Cool Lighting "
})

local AnticheatDisabler = COB("Render", {
    Name = "BigHead (requires rthro head)",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/sysGhost-aka-BiKode/Scripts2022/main/BigHeadV3_Unpatched", true))()
        end
    end,
    Default = false,
    HoverText = "FE BigHead"
})

local AnticheatDisabler = COB("Blatant", {
    Name = "KillAll",
    Function = function(callback) 
        if callback then
		pcall(function()
                game.Workspace.Gravity = 0
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Team == game:GetService("Players").LocalPlayer.Team and v ~= game:GetService("Players").LocalPlayer then
                        v:Destroy()
                    end
                 end
local Players = game:GetService("Players")
getgenv().Autowin = true
while getgenv().Autowin do
   for _,v in pairs(Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character.Humanoid.Health ~= 0 and v ~= Players.LocalPlayer then
           repeat
               Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
               task.wait(0.2)
           until v.Character.Humanoid.Health <= 0
       end
   end
   task.wait()
end
			end)
		else
			pcall(function()
                getgenv().Autowin = false
                game.Workspace.Gravity = 196.2
				print("disabled autowin")
			end)
		end
        
    end,
    Default = false,
    HoverText = "UPDATED requires ff disabler and killaura"
})

local AnticheatDisabler = COB("Render", {
    Name = "HalloweenLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(230, 135, 41)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(230, 135, 41)
        end
    end,
    Default = false,
    HoverText = "🎃"
})

local AnticheatDisabler = COB("Render", {
    Name = "AntiCheatCMDS",
    Function = function(callback) 
        if callback then

--// Locals
local players = game:GetService('Players')
local quotes = {"honk honk", "i steel u food", "i eat ur crops"} 
local wabbys = {"wabby weebo", "waddo wabby wabbo woaboo wop", "behbapbow bhow", "DraGdVA", "VHAvEVAa", "wabby", "weebo", "beDragFha haBha"}
local prefix = "!"
local prefixv = "smokex"
local ver = "1.0"

local function csay(tex)
    wait(0.1)
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(tex, "All")
end

--// Script
spawn(function()
    players.PlayerChatted:Connect(function(PlayerChatType, sender, message, recipient)
        if message == prefix..prefixv then
            csay(quotes[math.random(#quotes)].." -SmokeAC [SmokeAdmin "..ver.."]") 
        elseif message == prefix.."duck" then
            csay("is u that dumb? HOW DO U NOT KNOW THE DIFFERENCE BETWEEN DUCK AND YOU?!")
        elseif message == prefix.."crazydave" then
            csay(wabbys[math.random(#wabbys)])
        end
    end)
end)

csay("SmokeX Admin Loaded! 🚬 say "..prefix..prefixv.." for smoke admin comands! 🚬🚬 [SmokeAdmin "..ver.."] *or try to find secret cmds*", "All")

spawn(function()
    while wait(120) do
        csay("🚬 just a reminder to say "..prefix..prefixv.." for smoke admin 🚬🚬  [SmokeAdmin "..ver.."]", "All")
    end
end)
        end
    end,
    Default = false,
    HoverText = "Credit to smokex.site.xyz for created the script."
})

local AnticheatDisabler = COB("Render", {
    Name = "OldRoblox",
    Function = function(callback) 
        if callback then
															
if not game:IsLoaded() then
	game.Loaded:Wait()
end
wait()

--// instances
local cc = Instance.new("ColorCorrectionEffect")
local lighting = game:GetService("Lighting")

--// hd killer
local ihateu = {"DepthOfFieldEffect", "SunRaysEffect", "BloomEffect", "BlurEffect", "ColorCorrectionEffect", "Atmosphere"}
for i, v in pairs(lighting:GetChildren()) do
    for index, value in ipairs(ihateu) do
    	if v:IsA(value) then
    	   v:Destroy() 
    	end
    end
end

--// setup
cc.Parent = game.Lighting
cc.Saturation = -0.1
cc.Contrast = -0.1
lighting.GlobalShadows = false

sethiddenproperty(lighting, "Technology", Enum.Technology.Compatibility) 

settings().Rendering.QualityLevel = 7

--// load old gui
loadstring(game:HttpGet('https://raw.githubusercontent.com/specowos/lua-projects/main/small%20projects/project%3A2016/2016raw.lua',true))()
        end
    end,
    Default = false,
    HoverText = "Changes Lighting And Textures To fit the old roblox style."
})

local AnticheatDisabler = COB("Render", {
    Name = "ShrekLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(66, 207, 23)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(66, 207, 23)
        end
    end,
    Default = false,
    HoverText = "yes"
})

local AnticheatDisabler = COB("Render", {
    Name = "ChillLighting",
    Function = function(callback) 
        if callback then
    game.Lighting.Ambient = Color3.fromRGB(32, 212, 212)
            game.Lighting.OutdoorAmbient = Color3.fromRGB(32, 212, 212)
        end
    end,
    Default = false,
    HoverText = "ChillLighting"
})

local AnticheatDisabler = COB("Render", {
    Name = "Sky",
    Function = function(callback) 
        if callback then
    local Lighting = game.Lighting
local random = math.random(100000000, 999999999)
Lighting.Name = "Lighting"..random
local LightingName = "Lighting"..random
for i,v in pairs(Lighting:GetChildren()) do
	v:Destroy()
end
wait(.1)
---Instance---
local Atmosphere = Instance.new("Atmosphere")
local Sky = Instance.new("Sky")
local Bloom = Instance.new("BloomEffect")
local ColorCorrection = Instance.new("ColorCorrectionEffect")
local DepthOfField = Instance.new("DepthOfFieldEffect")
local SunRays = Instance.new("SunRaysEffect")
--------------

--Parent--
Atmosphere.Parent = game[LightingName]
Sky.Parent = game[LightingName]
Bloom.Parent = game[LightingName]
ColorCorrection.Parent = game[LightingName]
DepthOfField.Parent = game[LightingName]
SunRays.Parent = game[LightingName]
----------

--------Vibe Sky pack--------
	--Vibe Sky Pack
	game[LightingName].Sky.SkyboxBk = "rbxassetid://5084575798"
	game[LightingName].Sky.SkyboxDn = "rbxassetid://5084575916"
	game[LightingName].Sky.SkyboxFt = "rbxassetid://5103949679"
	game[LightingName].Sky.SkyboxLf = "rbxassetid://5103948542"
	game[LightingName].Sky.SkyboxRt = "rbxassetid://5103948784"
	game[LightingName].Sky.SkyboxUp = "rbxassetid://5084576400"
	game[LightingName].Sky.MoonAngularSize = 0
	game[LightingName].Sky.SunAngularSize = 0
    game[LightingName].Sky.SunTextureId = ""
    game[LightingName].Sky.MoonTextureId = ""
	game[LightingName].Brightness = 0
	game[LightingName].GlobalShadows = true
	game[LightingName].ClockTime = 17.8
	game[LightingName].GeographicLatitude = 0


	game[LightingName].Atmosphere.Density = 0.3
	game[LightingName].Atmosphere.Offset = 0.25
	game[LightingName].Atmosphere.Color = Color3.new(199, 199, 199)
	game[LightingName].Atmosphere.Decay = Color3.new(106, 112, 125)
	game[LightingName].Atmosphere.Glare = 0
	game[LightingName].Atmosphere.Haze = 0

	game[LightingName].Bloom.Enabled = true
	game[LightingName].Bloom.Intensity = 1
	game[LightingName].Bloom.Size = 24
	game[LightingName].Bloom.Threshold = 2

	game[LightingName].DepthOfField.Enabled = false
	game[LightingName].DepthOfField.FarIntensity = 0.1
	game[LightingName].DepthOfField.FocusDistance = 0.05
	game[LightingName].DepthOfField.InFocusRadius = 30
	game[LightingName].DepthOfField.NearIntensity = 0.75

	game[LightingName].SunRays.Enabled = true
	game[LightingName].SunRays.Intensity = 0.01
	game[LightingName].SunRays.Spread = 0.1
---------------------------------
        end
    end,
    Default = false,
    HoverText = "IMPORTANT! THIS WILL NOT WORK WITH WINTER THEME OR FULLBRIGHT TURN THOSE OFF!"
})

local AnticheatDisabler = COB("Utility", {
    Name = "Chat-Crasher",
    Function = function(callback) 
        if callback then
-- The effect isn't immediate, it they may take a few minutes.
-- This is a beta version, it only works in games that use the default roblox chat
while true do
    wait(1.7)
local args = {
    [1] = " ",
    [2] = "All"
}
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
end
        end
    end,
    Default = false,
    HoverText = "Risky Chat Disabler"
})

local AnticheatDisabler = COB("Blatant", {
    Name = "Infinite Jump",
    Function = function(callback) 
        if callback then
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
        end
    end,
    Default = false,
    HoverText = "Risky Inf Jump"
})


local AnticheatDisabler = COB("Render", {
    Name = "NickHider",
    Function = function(callback) 
        if callback then
         while game:IsLoaded() == false do wait() end
local fakeplr = {["Name"] = "ROBLOX", ["UserId"] = "1"}
local otherfakeplayers = {["Name"] = "ROBLOX", ["UserId"] = "1"}
local lplr = game:GetService("Players").LocalPlayer

local function plrthing(obj, property)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v ~= lplr then
            obj[property] = obj[property]:gsub(v.Name, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.UserId, otherfakeplayers["UserId"])
        else
            obj[property] = obj[property]:gsub(v.Name, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.UserId, fakeplr["UserId"])
        end
    end
end

local function newobj(v)
    if v:IsA("TextLabel") or v:IsA("TextButton") then
        plrthing(v, "Text")
        v:GetPropertyChangedSignal("Text"):connect(function()
            plrthing(v, "Text")
        end)
    end
    if v:IsA("ImageLabel") then
        plrthing(v, "Image")
        v:GetPropertyChangedSignal("Image"):connect(function()
            plrthing(v, "Image")
        end)
    end
end

for i,v in pairs(game:GetDescendants()) do
    newobj(v)
end
game.DescendantAdded:connect(newobj)
        end
    end,
    Default = false,
    HoverText = "Old Recreated Feature"
})

COB("Blatant", {
    Name = "MoonInfCustomFLY",
	HoverText = "redid",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 55
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
				 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})


COB("Blatant", {
    Name = "AnticheatBFly",
	HoverText = "Custom Flight",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 0
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

local AnticheatDisabler = COB("Render", {
    Name = "AestheticLightingV2",
    Function = function(callback) 
        if callback then
             local Lighting = game:GetService("Lighting")
local StarterGui = game:GetService("StarterGui")
local Bloom = Instance.new("BloomEffect")
local Blur = Instance.new("BlurEffect")
local ColorCor = Instance.new("ColorCorrectionEffect")
local SunRays = Instance.new("SunRaysEffect")
local Sky = Instance.new("Sky")
local Atm = Instance.new("Atmosphere")


for i, v in pairs(Lighting:GetChildren()) do
	if v then
		v:Destroy()
	end
end

Bloom.Parent = Lighting
Blur.Parent = Lighting
ColorCor.Parent = Lighting
SunRays.Parent = Lighting
Sky.Parent = Lighting
Atm.Parent = Lighting

if Vignette == true then
	local Gui = Instance.new("ScreenGui")
	Gui.Parent = StarterGui
	Gui.IgnoreGuiInset = true
	
	local ShadowFrame = Instance.new("ImageLabel")
	ShadowFrame.Parent = Gui
	ShadowFrame.AnchorPoint = Vector2.new(0.5,1)
	ShadowFrame.Position = UDim2.new(0.5,0,1,0)
	ShadowFrame.Size = UDim2.new(1,0,1.05,0)
	ShadowFrame.BackgroundTransparency = 1
	ShadowFrame.Image = "rbxassetid://4576475446"
	ShadowFrame.ImageTransparency = 0.3
	ShadowFrame.ZIndex = 10
end

Bloom.Intensity = 1
Bloom.Size = 2
Bloom.Threshold = 2

Blur.Size = 0

ColorCor.Brightness = 0.1
ColorCor.Contrast = 0
ColorCor.Saturation = -0.3
ColorCor.TintColor = Color3.fromRGB(107, 78, 173)

SunRays.Intensity = 0.03
SunRays.Spread = 0.727

Sky.SkyboxBk = "http://www.roblox.com/asset/?id=8139677359"
Sky.SkyboxDn = "http://www.roblox.com/asset/?id=8139677253"
Sky.SkyboxFt = "http://www.roblox.com/asset/?id=8139677111"
Sky.SkyboxLf = "http://www.roblox.com/asset/?id=8139676988"
Sky.SkyboxRt = "http://www.roblox.com/asset/?id=8139676842"
Sky.SkyboxUp = "http://www.roblox.com/asset/?id=8139676647"
Sky.SunAngularSize = 10

Lighting.Ambient = Color3.fromRGB(128,128,128)
Lighting.Brightness = 2
Lighting.ColorShift_Bottom = Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
Lighting.EnvironmentDiffuseScale = 0.2
Lighting.EnvironmentSpecularScale = 0.2
Lighting.GlobalShadows = false
Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
Lighting.ShadowSoftness = 0.2
Lighting.ClockTime = 14
Lighting.GeographicLatitude = 45
Lighting.ExposureCompensation = 0.5

        end
    end,
    Default = false,
    HoverText = "AestheticLightingV2"
})

local AnticheatDisabler = COB("World", {
    Name = "UltraFPSBoost",
    Function = function(callback) 
        if callback then
        local decalsyeeted = true 
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
        end
    end,
    Default = false,
    HoverText = "FPS Booster"
})

local AnticheatDisabler = COB("Blatant", {
    Name = "Infinite Yield",
    Function = function(callback) 
        if callback then
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
        end
    end,
    Default = false,
    HoverText = false
})

COB("Blatant", {
    Name = "Flightv2",
	HoverText = "v2",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 10
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

local AnticheatDisabler = COB("Blatant", {
    Name = "InfiniteJump",
    Function = function(callback) 
        if callback then
            toggled = true
				game:GetService("UserInputService").jumpRequest:Connect(function()
					if toggled == true then
						wait(jumpdelay)
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("Jumping")
						wait(0.0000003)
						game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid":ChangeState("freefall")						
					end
				end)
			else
				toggled = false
        end
    end,
    Default = false,
    HoverText = "jumps inf times"
})

local AnticheatDisabler = COB("World", {
    Name = "funny",
    Function = function(callback) 
        if callback then
        if not game:IsLoaded() then
	game.Loaded:Wait()
end
wait()

--// instances
local cc = Instance.new("ColorCorrectionEffect")
local lighting = game:GetService("Lighting")
local sbox = Instance.new("Sky")

--// coool
sbox.Parent = lighting
sbox.SkyboxBk = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxDn = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxFt = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxLf = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxRt = "http://www.roblox.com/asset/?id=9276018925"
sbox.SkyboxUp = "http://www.roblox.com/asset/?id=9276018925"

lighting.Ambient = Color3.fromRGB(128,128,128)
lighting.FogColor = Color3.fromRGB(128,128,128)
lighting.ClockTime = 14
lighting.FogEnd = 2000

for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v:IsA("BasePart") and v.Material == Enum.Material.Grass then
        v.Transparency = 0.25
        v.Color = Color3.fromRGB(125, 125, 200)
    end
end

        end
    end,
    Default = false,
    HoverText = false
})
repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
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

infonotify("SmokeX Client", "V1 Loaded!", 7)

local CustomFly = COB("Blatant", {
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
local AnticheatDisabler = COB("Utility", {
	["Name"] = "ForceFieldDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnticheatDisabler = true
                                        local function disablerFunction()
	     local lplr = game.Players.LocalPlayer
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
        repeat task.wait() until lplr.Character.Humanoid.MoveDirection ~= Vector3.zero
        task.wait(0.2)
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        workspace.Gravity = 192.6    
    end
             disablerFunction()
			end)
		else
			pcall(function()
				ScriptSettings.AnticheatDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "yes its real stfu"
})
AnticheatDisabler.CreateSlider({
    ["Name"] = "Delay",
	["Double"] = 100,
    ["Min"] = 0,
    ["Max"] = 100,
    ["Function"] = function(val)
        ScriptSettings.AnticheatDisabler_Delay = val
    end,
    ["HoverText"] = "Delay",
    ["Default"] = 0.05
})
local KitExploit = COB("Utility", {
	["Name"] = "KitExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.KitExploit = true
				local kits = {
					["Axolotl"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.axolotl["axolotl-kit"]).AxolotlKit,
					["Beast"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["beast"]["beast-util"]).BeastKit,
					["Dasher"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.dasher["dasher-kit"]).DasherKit,
					["Fisherman"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["fisherman"]["fisherman-util"]).FishermanUtil,
					["IceQueen"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["ice-queen"]["ice-queen-kit"]).IceQueenKit,
					["Santa"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.santa["santa-util"]).SantaUtil,
				}
				kits["Axolotl"]["SWIM_TO_CHARACTER_TIME"] = 0.0000000000001
				kits["Axolotl"]["ACTIVE_COOLDOWN"] = 0.0000000000001
				kits["Beast"]["WALK_SPEED_MULTIPLIER"] = 5
				kits["Beast"]["KNOCKBACK_MULTIPLIER"] = 5
				kits["Dasher"]["DASH_COOLDOWN"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME_BEFORE_CHARGING_STATE"] = 0.0000000000001
				kits["Dasher"]["TOTAL_CHARGE_TIME"] = 0.0000000000001
				kits["Fisherman"]["minigameDuration"] = 60
				kits["Fisherman"]["markerSize"] = UDim2.fromScale(0.05, 1)
				kits["Fisherman"]["totalDecaySpeedSec"] = 2
				kits["Fisherman"]["startingMarkerIncrementSpeed"] = 0.2
				kits["Fisherman"]["holdMinimumMarkerIncrementSpeed"] = 0.1
				kits["Fisherman"]["markerIncrementAmount"] = 0.025
				kits["Fisherman"]["fishZoneSize"] = UDim2.fromScale(0,5, 1)
				kits["Fisherman"]["fishZoneSpeedMultiplier"] = 5
				kits["Fisherman"]["fishZoneMoveCooldown"] = 10
				kits["Fisherman"]["fillAmount"] = 0.1
				kits["Fisherman"]["drainAmount"] = 0.0001
				kits["IceQueen"]["DAMAGE_REQUIREMENT"] = 0.0000000000001
				kits["IceQueen"]["PASSIVE_STACK_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["PROC_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["BAR_COUNT"] = 4
				kits["IceQueen"]["BASE_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["BASE_SPEED_MULTIPLIER"] = 99
				kits["IceQueen"]["BASE_SLOW_LENGHT"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["ICE_SWORD_SLOW_LENGTH"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_STUN_DURATION"] = 99
				kits["IceQueen"]["PASSIVE_EXPIRATION_TIME"] = 99
				kits["Santa"]["BOMB_DROP_DELAY"] = 0.0000000000001
				kits["Santa"]["TOTAL_BOMBS"] = 99
				kits["Santa"]["DROP_HEIGHT"] = 150
				kits["Santa"]["DROP_DELAY"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.KitExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits Axolotl, Beast, Dasher, Fisherman, IceQueen and Santa kit settings"
})
local ItemExploit = COB("Utility", {
	["Name"] = "ItemExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ItemExploit = true
				local SW = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.stopwatch["stopwatch-constants"]).StopwatchConstants
				local TB = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.twirlblade["twirlblade-util"]).TwirlbladeUtil
				local CS = require(game:GetService("ReplicatedStorage").TS.games.bedwars["charge-shield"]["charge-shield-util"]).ChargeShieldUtil
				local GH = require(game:GetService("ReplicatedStorage").TS["grappling-hook"]["grappling-hook-util"])
				local HM = require(game:GetService("ReplicatedStorage").TS.vehicle.helicopter["helicopter-missile"])
				SW["DURATION"] = 60
				SW["EFFECT_DURATION"] = 60
				TB["SPIN_DAMAGE"] = 100
				CS["CHARGE_SHIELD_COOLDOWN_SEC"] = 0.0000000000001
				CS["CHARGE_DURATION"] = 10
				CS["CHARGE_SPEED_MULTIPLIER"] = 5
				CS["MAX_HIT_DISTANCE"] = 50
				CS["MAX_HIT_ANGLE"] = 360
				CS["MAX_HIT_HEIGHT"] = 100
				CS["HIT_DAMAGE"] = 100
				CS["VERTICAL_KNOCKBACK"] = 5
				CS["HORIZONTAL_KNOCKBACK"] = 5
				GH["SPEED"] = 5000
				GH["FIRE_COOLDOWN"] = 0.0000000000001
				GH["HIT_PLAYER_COOLDOWN"] = 0.0000000000001
				GH["HIT_BLOCK_COOLDOWN"] = 0.0000000000001
				HM["MISSLE_FIRE_RATE"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.ItemExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits like 5 item settings settings"
})
local InfJump = COB("Utility", {
	["Name"] = "InfJump",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InfJump = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if not ScriptSettings.InfJump == true then return end
					if not ScriptSettings.InfJump_Alr then
					    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
					    ScriptSettings.InfJump_Alr = true
					    task.wait(0.125)
					    ScriptSettings.InfJump_Alr = false
					else
					    task.wait()
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.InfJump = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you can jump infinetly"
})
local MageAnimation = COB("Render", {
	["Name"] = "MageAnimation",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.MageAnimation = true
				local Animate = game:GetService("Players").LocalPlayer.Character.Animate
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
			end)
		else
			pcall(function()
				ScriptSettings.MageAnimation = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you get mage animation (FE)"
})
local SpamSwordSwing = COB("Combat", {
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
local NoClickDelay = COB("Combat", {
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
local AnimDisabler = COB("Utility", {
	["Name"]  = "AnimDisabler",
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
local CollectAllDrops = COB("Utility", {
	["Name"]  = "CollectAllDrops",
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
	["HoverText"] = "Collect drops"
})
local Shaders = COB("Render", {
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
	["HoverText"] = "Cool shader"
})
local Crosshair = COB("Render", {
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
local Night = COB("Render", {
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
local ChatCrasher = COB("Utility", {
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
	["HoverText"] = "cool"
})
local AntiAFK = COB("Render", {
	["Name"] = "AntiAFK",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AntiAFK = true
				local cons = getconnections or get_signal_cons
				if cons then
					for i,v in pairs(cons(game:GetService("Players").LocalPlayer.Idled)) do
						if ScriptSettings.AntiAFK == true then
							v:Disable()
							v:Disconnect()
						end
					end
				end
				assert(firesignal, "Asserted FireSignal")
				local uis = game:GetService("UserInputService")
				local runs = game:GetService("RUnService")
				uis.WindowFocusReleased:Connect(function()
					if ScriptSettings.AntiAFK == true then
						runs.Stepped:Wait()
						pcall(firesignal, uis.WindowFocused)
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.AntiAFK = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "No more AFK kicks"
})
local CustomAntivoid = COB("Utility", {
	["Name"] = "BetterAntivoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomAntivoid = true
				--repeat task.wait(0.3) until getstate() == 1
				local part = Instance.new("Part")
				part.Name = "AVOID_PART"
				part.Anchored = true
				part.Color = Color3.fromRGB(32,45,237)
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
						--[[
							local tptimes = 0
							repeat
								task.wait()
								tptimes = tptimes + 1
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame / 2
							until tptimes = 10
						]]--
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.CustomAntivoid = false
				ScriptSettings.CustomAntivoid_Part:Destroy()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "BetterAntiVoid"
})
local RagdollDisabler = COB("Utility", {
	["Name"]  = "RagdollDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.RagdollDisabler = true
				while task.wait(0.1) do
					if not ScriptSettings.RagdollDisabler == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
					task.wait(0.085)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		else
			pcall(function()
				ScriptSettings.RagdollDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you ragdoll to bypass anticheat"
})
local LandmindeAura = COB("Blatant", {
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
	["HoverText"] = "(Actually) a dumb aura i made"
})
local BiMode_Blur 
local BiMode = COB("Render", {
	["Name"]  = "BiMode",
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
local SlowAutoWin = COB("Utility", {
	["Name"]  = "SlowAutoWin",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.SlowAutoWin = true
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
				infonotify("SlowAutoWin", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "advanced hrp destroyer"
})
local InviteCrash = COB("Utility", {
	["Name"] = "InviteCrash",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InviteCrash = true
				while task.wait() do
					if not ScriptSettings.InviteCrash == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							game:GetService("ReplicatedStorage")["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].inviteToParty:FireServer({["player"] = game:GetService("Players")[v.Name],})
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.InviteCrash = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam invites other players"
})


local lplr = game:GetService("Players").LocalPlayer
local getasset = getsynasset or getcustomasset or function(location) return "rbxasset://"..location end
local playerlist = game:GetService("CoreGui"):FindFirstChild("PlayerList")
    if playerlist then
        pcall(function()
            local playerlistplayers = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
            local targetedplr = playerlistplayers:FindFirstChild("p_" .. lplr.UserId)
            if targetedplr then
                targetedplr.ChildrenFrame.NameFrame.BGFrame.OverlayFrame.PlayerIcon.Image = getasset("vape/VapeIcon.png")
            end
        end)
    end

    COB("Utility", {
        Name = "AntiSlowTp",
        Function = function(callback) 
            if callback then
                pcall(function() 
                    local HttpService = game:GetService("HttpService")
    
    local data = {}
    data.player = {}
    data.reason = reason
    data.player.name = game.Players.LocalPlayer.Name
    data.player.id = game.Players.LocalPlayer.UserId
    local json = HttpService:JSONEncode(data)
    local options2 = {}
    options2["Method"] = "POST"
    options2["Url"] = "https://lukhub.com/api/checkKey/"
    options2["Body"] = json
    options2["Headers"] = {}
    options2["Headers"]["Content-Type"] = "application/json"
    
     
    local serverResponse = http_request(options2)
                end) 
            end
        end,
        HoverText = "anti lagback"
    })

    COB("Render", {
        Name = "BallChanger",
        Function = function(callback) 
            if callback then
                pcall(function() 
                    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    
    local SPEED_MULTIPLIER = 30
    local JUMP_POWER = 60
    local JUMP_GAP = 0.3
    
    local character = game.Players.LocalPlayer.Character
    
    for i,v in ipairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
    
    local ball = character.HumanoidRootPart
    ball.Shape = Enum.PartType.Ball
    ball.Size = Vector3.new(5,5,5)
    local humanoid = character:WaitForChild("Humanoid")
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {character}
    
    local tc = RunService.RenderStepped:Connect(function(delta)
        ball.CanCollide = true
        humanoid.PlatformStand = true
        if UserInputService:GetFocusedTextBox() then return end
        if UserInputService:IsKeyDown("W") then
            ball.RotVelocity -= Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
        end
        if UserInputService:IsKeyDown("A") then
            ball.RotVelocity -= Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
        end
        if UserInputService:IsKeyDown("S") then
            ball.RotVelocity += Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
        end
        if UserInputService:IsKeyDown("D") then
            ball.RotVelocity += Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
        end
        --ball.RotVelocity = ball.RotVelocity - Vector3.new(0,ball.RotVelocity.Y/50,0)
    end)
    
    UserInputService.JumpRequest:Connect(function()
        local result = workspace:Raycast(
            ball.Position,
            Vector3.new(
                0,
                -((ball.Size.Y/2)+JUMP_GAP),
                0
            ),
            params
        )
        if result then
            ball.Velocity = ball.Velocity + Vector3.new(0,JUMP_POWER,0)
        end
    end)
    
    Camera.CameraSubject = ball
    humanoid.Died:Connect(function() tc:Disconnect() end)
                end) 
            end
        end,
        HoverText = "idk"
    })

    COB("Render", {
        Name = "WinStreakTracker",
        Function = function(callback) 
            if callback then
                pcall(function() 
                    wait(2)
    if shared.VapeExecuted then
        spawn(function()
            local players = game:GetService("Players")
            local lplr = players.LocalPlayer
            local winstreaks = Instance.new("TextLabel")
            winstreaks.TextSize = 17
            winstreaks.Name = "WinStreakTracker"
            winstreaks.TextXAlignment = Enum.TextXAlignment.Left
            winstreaks.TextYAlignment = Enum.TextYAlignment.Bottom
            winstreaks.TextColor3 = Color3.new(1, 1, 1)
            winstreaks.BackgroundTransparency = 1
            winstreaks.Text = " "
            winstreaks.Size = UDim2.new(1, 0, 1, 0)
            winstreaks.Active = false
            winstreaks.Font = Enum.Font.SourceSansBold
            winstreaks.TextStrokeTransparency = 0
            winstreaks.Parent = game.CoreGui.RobloxGui
    
            local function update()
                local str = "-- WINSTREAK TRACKER --"
                for i,v in pairs(players:GetChildren()) do
                    if v:GetAttribute("WinStreak") and v:GetAttribute("WinStreak") > 0 and v ~= lplr then
                        str = str.."\n"..(v.DisplayName or v.Name).." : "..v:GetAttribute("WinStreak")
                    end
                end
                winstreaks.Text = str
            end
    
            update()
            repeat
                wait(3)
                update()
            until true == false
        end)
    end
                end) 
            end
        end,
        HoverText = "working in lobby only"
    })


    COB("Render", {
        Name = "Shaders",
        Function = function(v)
            if v then
                game.Lighting.Ambient = Color3.fromRGB(255,0,0)
                game.Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
            else
                game.Lighting.Ambient = Color3.fromRGB(91, 91, 91)
                game.Lighting.OutdoorAmbient = Color3.fromRGB(201, 201, 201)
            end
        end
    })
    
	local AnticheatDisabler = COB("Blatant", {
		Name = "AutoWin [SKYWARS & GUN GAME]",
		Function = function(callback) 
			if callback then
				pcall(function()
                game.Workspace.Gravity = 0
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Team == game:GetService("Players").LocalPlayer.Team and v ~= game:GetService("Players").LocalPlayer then
                        v:Destroy()
                    end
                 end
local Players = game:GetService("Players")
getgenv().Autowin = true
while getgenv().Autowin do
   for _,v in pairs(Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character.Humanoid.Health ~= 0 and v ~= Players.LocalPlayer then
           repeat
               Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
               task.wait(0.2)
           until v.Character.Humanoid.Health <= 0
       end
   end
   task.wait()
end
			end)
		else
			pcall(function()
                getgenv().Autowin = false
                game.Workspace.Gravity = 196.2
				print("disabled autowin")
			end)
		end
		end,
		Default = false,
		HoverText = false
	})

	local AnticheatDisabler = COB("Blatant", {
		Name = "AutoWin",
		Function = function(callback) 
			if callback then
				infonotify("SmokeX Client", "its private users only", 5)	
			end
		end,
		Default = false,
		HoverText = false
	})
	
runcode(function()
	local function getaccessories()
		local count = 0
		if isAlive() then 
			for i,v in pairs(lplr.Character:GetChildren()) do 
				if v:IsA("Accessory") then 
					count = count + 1
				end
			end
		end
		return count
	end

	local AntiCrash = {["Enabled"] = false}
	AntiCrash = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "AntiCrash",
		["Function"] = function(callback)
			if callback then 
				local cached = {}
				game:GetService("CollectionService"):GetInstanceAddedSignal("inventory-entity"):connect(function(inv)
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end)
				for i2,inv in pairs(game:GetService("CollectionService"):GetTagged("inventory-entity")) do 
					spawn(function()
						local invitem = inv:WaitForChild("HandInvItem")
						local funny
						task.wait(0.2)
						for i,v in pairs(getconnections(invitem.Changed)) do 
							funny = v.Function
							v:Disable()
						end
						if funny then
							invitem.Changed:connect(function(item)
								if cached[inv] == nil then cached[inv] = 0 end
								if cached[inv] >= 6 then return end
								cached[inv] = cached[inv] + 1
								task.delay(1, function() cached[inv] = cached[inv] - 1 end)
								funny(item)
							end)
						end
					end)
				end
			end
		end
	})

	local Crasher = {["Enabled"] = false}
	local CrasherAutoEnable = {["Enabled"] = false}
	local oldcrash
	local oldplay
	Crasher = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "ClientCrasher",
		["Function"] = function(callback)
			if callback then
				oldcrash = bedwars["GameAnimationUtil"].playAnimation
				oldplay = bedwars["SoundManager"].playSound
				bedwars["GameAnimationUtil"].playAnimation = function(lplr, anim, ...)
					if anim == bedwars["AnimationType"].EQUIP_1 then 
						return
					end
					return oldcrash(lplr, anim, ...)
				end
				bedwars["SoundManager"].playSound = function(self, num, ...)
					if num == bedwars["SoundList"].EQUIP_DEFAULT or num == bedwars["SoundList"].EQUIP_SWORD or num == bedwars["SoundList"].EQUIP_BOW then 
						return
					end
					return oldplay(self, num, ...)
				end
				local remote = bedwars["ClientHandler"]:Get(bedwars["EquipItemRemote"])["instance"]
				local slowmode = false
				local suc 
				task.spawn(function()
					repeat
						task.wait(slowmode and 2 or 15)
						slowmode = not slowmode
					until (not Crasher["Enabled"])
				end)
				task.spawn(function()
					repeat
						task.wait(0.2)
						suc = pcall(function()
							local inv = lplr.Character.InventoryFolder.Value:GetChildren()
							local item = inv[1]
							local item2 = inv[2]
							if item then
								task.spawn(function()
									for i = 1, (slowmode and 0 or 35) do
										game:GetService("RunService").Heartbeat:Wait()
										task.spawn(function() 
											remote:InvokeServer({
												hand = item
											})
										end)
										task.spawn(function() 
											remote:InvokeServer({
												hand = item2 or false
											})
										end)
									end
								end)
							end
						end)
					until (not Crasher["Enabled"])
				end)
			else
				bedwars["GameAnimationUtil"].playAnimation = oldcrash
				bedwars["SoundManager"].playSound = oldplay
				slowmode = false
			end
		end
	})
end)

local Players = game:GetService("Players")
local lPlayer = Players.LocalPlayer

local function wsDetector(plr,hmoid,relativespeed)
    if relativespeed > 21 then
        infonotify("Detected unusual walkspeed in ..plr.DisplayName..")
    end
end

getgenv().checker = true;
while true do

wait(5)
for i,v in pairs(Players:GetPlayers()) do
    if player == lPlayer then
        continue
    end
    local Char = v.Character or v.CharacterAdded:Wait()
    local CharacterHumanoid = Char:FindFirstChildWhichIsA("Humanoid")
    CharacterHumanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(wsDetector(v,CharacterHumanoid,CharacterHumanoid.WalkSpeed))
end

Players.PlayerAdded:Connect(function(v)
    if v.Name ~= lPlayer.Name then
        local Char = v.Character or v.CharacterAdded:Wait()
        local CharacterHumanoid = Char:FindFirstChildWhichIsA("Humanoid")
        CharacterHumanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(wsDetector(v,CharacterHumanoid,CharacterHumanoid.WalkSpeed))
    end
end)
end

runcode(function()
	local funnyfly = {["Enabled"] = false}
	local flyacprogressbar
	local flyacprogressbarframe
	local flyacprogressbarframe2
	local flyacprogressbartext
	local bodyvelo
	funnyfly = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
		["Name"] = "FunnyFly",
		["Function"] = function(callback)
			if callback then 
				local starty
				local starttick = tick()
				task.spawn(function()
					local timesdone = 0
					if GuiLibrary["ObjectsThatCanBeSaved"]["SpeedModeDropdown"]["Api"]["Value"] == "CFrame" then
						repeat
							timesdone = timesdone + 1
							if entity.isAlive then
								local root = entity.character.HumanoidRootPart
								if starty == nil then 
									starty = root.Position.Y
								end
								if not bodyvelo then 
									bodyvelo = Instance.new("BodyVelocity")
									bodyvelo.MaxForce = Vector3.new(0, 1000000, 0)
									bodyvelo.Parent = root
								else
									bodyvelo.Parent = root
								end
								for i = 1, 15 do 
									task.wait(0.01)
									if (not funnyfly["Enabled"]) then break end
									bodyvelo.Velocity = Vector3.new(0, i * 0.7, 0)
								end
								if (not isnetworkowner(root)) then
									local timecalc = math.floor((tick() - starttick) * 10) / 10
									createwarning("FunnyFly", "lasted "..timecalc.."s", 5)
									break 
								end
							else
								break
							end
						until (not funnyfly["Enabled"])
					else
						createwarning("FunnyFly", "funny fly only works with cframe", 5)
					end
					if funnyfly["Enabled"] then 
						funnyfly["ToggleButton"](false)
					end
				end)
			else
				if bodyvelo then 
					bodyvelo:Destroy()
					bodyvelo = nil
				end
			end
		end
	})
end)

BoostAirJump = GuiLibrary["ObjectsThatCanBeSaved"]["BlatantWindow"]["Api"].CreateOptionsButton({
    ["Name"] = "BoostAirJump",
    ["Function"] = function(callback)
        if callback then
            task.spawn(function()
                repeat
                    task.wait(0.1)
                    if BoostAirJump["Enabled"] == false then break end
                    entity.character.HumanoidRootPart.Velocity = entity.character.HumanoidRootPart.Velocity + Vector3.new(0,40,0)
                until BoostAirJump["Enabled"] == false
            end)
        end
    end,
    ["HoverText"] = "Smoke X Client"
})

local AnticheatDisabler = COB("Render", {
    Name = "BigHead (requires rthro head)",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/sysGhost-aka-BiKode/Scripts2022/main/BigHeadV3_Unpatched", true))()
        end
    end,
    Default = false,
    HoverText = "FE BigHead"
})

local AnticheatDisabler = COB("Utility", {
	["Name"] = "AnticheatDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnticheatDisabler = true
                                        local function disablerFunction()
	     local lplr = game.Players.LocalPlayer
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
        repeat task.wait() until lplr.Character.Humanoid.MoveDirection ~= Vector3.zero
        task.wait(0.2)
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        workspace.Gravity = 192.6    
    end
             disablerFunction()
			end)
		else
			pcall(function()
				ScriptSettings.AnticheatDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "NO WAY FR"
})
AnticheatDisabler.CreateSlider({
    ["Name"] = "Delay",
	["Double"] = 100,
    ["Min"] = 0,
    ["Max"] = 100,
    ["Function"] = function(val)
        ScriptSettings.AnticheatDisabler_Delay = val
    end,
    ["HoverText"] = "Delay",
    ["Default"] = 0.05
})

	COB("Utility", {
		Name = "Bedwars_Doubles",
		Function = function(callback) 
			if callback then
				pcall(function() 
					game:GetService("ReplicatedStorage")["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].joinQueue:FireServer(table.unpack({
						[1] = {
							["queueType"] = "bedwars_to2",
						},
					}))
				end) 
			end
		end,
		HoverText = "Join bedwars doubles lol"
	})
	COB("Utility", {
		Name = "Skywars_Squads",
		Function = function(callback) 
			if callback then
				pcall(function() 
					game:GetService("ReplicatedStorage")["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].joinQueue:FireServer(table.unpack({
						[1] = {
							["queueType"] = "skywars_to4",
						},
					}))
				end) 
			end
		end,
		HoverText = "Join Skywars Squads F"
	})
	
	local RbHotbar = COB("Render", {
    Name = "Rainbow HOTBAR",
    Function = function(callback) 
        if callback then
		function SmokeRB(X) return math.acos(math.cos(X*math.pi))/math.pi end

counter = 0

while wait(0.1)do
 game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromHSV(SmokeRB(counter),1,1)
 
 counter = counter + 0.01
end
        end
    end,
    Default = false,
    HoverText = "lel, i see you like rainbow."
})

local AnticheatBypassCombatCheck = COB("Combat", {
    Name = "Combat Check",
    Function = function(callback) 
       if callback then 
				task.spawn(function()
					repeat 
						task.wait(0.1)
						if (not AnticheatBypassCombatCheck["Enabled"]) then break end
						if AnticheatBypass["Enabled"] then 
							local plrs = GetAllNearestHumanoidToPosition(true, 30, 1)
							combatcheck = #plrs > 0 and (not GuiLibrary["ObjectsThatCanBeSaved"]["LongJumpOptionsButton"]["Api"]["Enabled"]) and (not GuiLibrary["ObjectsThatCanBeSaved"]["FlyOptionsButton"]["Api"]["Enabled"])
							if combatcheck ~= changecheck then 
								if not combatcheck then 
									combatchecktick = tick() + 1
								end
								changecheck = combatcheck
							end
						end
					until (not AnticheatBypassCombatCheck["Enabled"])
				end)
			else
				combatcheck = false
			end
		end,
		Default = true,
                HoverText = "AnticheatBypass CombatCheck"
})

local EmeraldArmour = COB("Utility", {
    Name = "Emerald Stuff",
    Function = function(callback) 
        if callback then
		local lplr = game.Players.LocalPlayer

game.ReplicatedStorage.Items.emerald_sword:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_helmet:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_boots:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_chestplate:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
        end
    end,
    Default = false,
    HoverText = "Gives you emerald stuff lel."
})

local RageBladeTool = COB("Utility", {
    Name = "RageBlade?",
    Function = function(callback) 
        if callback then
		local lplr = game.Players.LocalPlayer

game.ReplicatedStorage.Items.rageblade:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
        end
    end,
    Default = false,
    HoverText = "free rageblade?!"
})

local AntiCrash = COB("World", {
    Name = "AntiCrash",
    Function = function(callback) 
        if callback then
            ScriptSettings.AntiCrash = true
            while wait(1.5) do
                if not ScriptSettings.AntiCrash == true then return end
                if game:GetService("Workspace"):GetRealPhysicsFPS() < ScriptSettings.AntiCrash_MinFps then
                    game:Shutdown()
                    boxnotify("FPS Are under minimum. Closed game.")
                end  
                if math.floor(tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())) > ScriptSettings.AntiCrash_MaxPing then
                    game:Shutdown()
		    boxnotify("Ping Are over maximum. Closed game.")
                end
            end       
        else
            ScriptSettings.AntiCrash = false
        end
    end,
    Default = false,
    HoverText = "Automatically shutdowns game when fps or ping too low/high"
})
AntiCrash.CreateSlider({
    ["Name"] = "MinFps",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Function"] = function(val)
        ScriptSettings.AntiCrash_MinFps = val
    end,
    ["HoverText"] = "Minimum fps before closing roblox",
    ["Default"] = 10
})
AntiCrash.CreateSlider({
    ["Name"] = "MaxPing",
    ["Min"] = 1000,
    ["Max"] = 100000,
    ["Function"] = function(val)
        ScriptSettings.AntiCrash_MaxPing = val
    end,
    ["HoverText"] = "Minimum fps before closing roblox",
    ["Default"] = 10
})

local ReportV3 = COB("Utility", {
    Name = "AutoReportV3",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/SmokeXDev/AutoRagePeople/main/LoadReport.lua"))()
        end
    end,
    Default = false,
    HoverText = "AutoReportV3 is cool"
})
