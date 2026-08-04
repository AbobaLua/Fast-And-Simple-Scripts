local LightCoding = loadstring(game:HttpGet("https://raw.githubusercontent.com/AbobaLua/LightCoding/main/Source.lua"))()
local pfiretouchinterest = LightCoding:GetFunc("pfiretouchinterest")
local gemNames = {"Diamond", "Emerald", "Ruby", "Sapphire"}
local connection = nil
local plr = game.Players.LocalPlayer
function CollectGems()
    if connection then
        connection:Disconnect()
        connection = nil
        return
    end
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        for _, gemName in ipairs(gemNames) do
            local gem = workspace:FindFirstChild(gemName)
            if gem then 
              pfiretouchinterest(plr, gem)
            end
        end
    end)
end

CollectGems()
