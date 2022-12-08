game.StarterGui:SetCore("SendNotification", {
    Title = "Creator";
    Text = "Made by SmokeXDev#8560"; 
    Duration = 20;
})
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "SmokeX Client + VapeV4";
    Text = "Pubblic Version"; 
    Duration = 20;
})
loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SmokeXDev/SmokeXPubblic/main/NewMainForRoblox.lua", true))()
