-- No Cooldown Script for The World in An Unoriginal Universe
-- This script removes cooldowns by continuously clearing cooldown attributes

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local RunService = game:GetService("RunService")

-- Main cooldown variables from the script
local cooldownVars = {
    var18_upvw = false,
    var19_upvw = false,
    var20_upvw = false,
    var21_upvw = false,
    var54_upvw = 0,
    var63_upvw = false,
    var68_upvw = false,
    var87_upvw = false,
    var99_upvw = false
}

-- All attributes that need to be removed
local cooldownAttributes = {
    "StandSummonCD",
    "BarrageCD",
    "TSTeleportCD",
    "BloodSuckCD",
    "StrongPunchCD",
    "KnifeCD",
    "VaporizationCD",
    "StandJumpCD",
    "SpaceRipperCD",
    "TimestopCD",
    "DodgeCD"
}

-- Function to remove all cooldown attributes
local function removeCooldowns()
    if not Character then return end
    
    for _, attribute in ipairs(cooldownAttributes) do
        Character:SetAttribute(attribute, nil)
    end
    
    -- Reset global cooldown states
    for var, value in pairs(cooldownVars) do
        if type(value) == "boolean" then
            _G[var] = false
        elseif type(value) == "number" then
            _G[var] = 0
        end
    end
    
    -- Reset time stop cooldown in lighting
    if game.Lighting:FindFirstChild("GlobalTSCD") then
        game.Lighting.GlobalTSCD.Value = false
    end
    
    -- Reset timestop state if needed
    if game.Lighting:FindFirstChild("TSing") then
        game.Lighting.TSing.Value = false
    end
end

-- Connect to heartbeat for continuous cooldown removal
RunService.Heartbeat:Connect(function()
    removeCooldowns()
end)

-- Handle character respawning
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    wait(1)
    removeCooldowns()
end)

-- Remote firing for instant abilities
local function hookRemotes()
    -- Hook the FireServer method to prevent cooldown setting
    local oldFireServer = Instance.new("RemoteEvent").FireServer
    hookfunction(Instance.new("RemoteEvent").FireServer, function(self, ...)
        local args = {...}
        
        -- Allow all remote calls but modify specific ones
        if self.Name == "Timestop" then
            -- Modify timestop to have no cooldown
            return oldFireServer(self, 5, "dio")
        elseif self.Name == "Stand" then
            -- Always allow stand summoning
            return oldFireServer(self, "TheWorldStand", 25, 450)
        else
            -- Allow all other remote calls
            return oldFireServer(self, ...)
        end
    end)
end

-- Try to hook remotes (might not work in all exploits)
pcall(hookRemotes)

-- Notification
local message = "The World No Cooldown Script Activated"
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Loaded",
    Text = message,
    Duration = 3
})

print("The World no cooldown script loaded successfully!")
