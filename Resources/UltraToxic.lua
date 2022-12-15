local choosePlayer = false
local chosenPlayer = ""



local Taunts = { --add as many as you wish
  "You're bad at the game bro.",
   "Imagine Not Being Able To Exploit",
  "I'm your dad so if you try to talk to me you're stupid.",
  "Ez.",
  "L.",
  "bozo.",
  "L Bozo.",
  "Reported.",
  "SmokeX Client on Top!",
  "smokex.site.xyz",
  "Bozo Crying?",
  "why are you so bad?",
  "...................you bad ..................",
  "I think you're stupid dude it's obvious.",
  "Lol, do you think I answer you in chat?",
  "Your Mom Under My Bed Sheet.",
  "I aim to be the most highly targeted person in this server.",
  "Dude you are so bad...",
  "Stop playing ROBLOX Because you are bad",
  "I programmed a chat bot to start arguments with people and its totally working.",
  "Turn off your computer",
  "I am smart",
  "Skills dont matter",
  "IM REPORTING.",
  "SmokeX Client on Top!",
  "smokex.site.xyz",
}

local Remote = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest

local function Insult()
   local players = game.Players:GetChildren()
   local howManyPlayers = #players
   
   local ran = math.random(1,howManyPlayers)
   local chosenOne = players[ran]
   local chance = math.random(1,20)
   
   if choosePlayer == true then
       Remote:FireServer(chosenPlayer.." " ..Taunts[math.random(1,#Taunts)],"All")
   elseif chance <= 5 then
       Remote:FireServer(chosenOne.Name.." " ..Taunts[math.random(1,#Taunts)],"All")
   else
       Remote:FireServer(Taunts[math.random(1,#Taunts)],"All")
   end
end
   
local randTime = math.random(5,15)

while true and wait(randTime) do
   Insult()
end
