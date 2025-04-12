local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

-- Get necessary remotes
local remotes = {
    Slam = ReplicatedStorage.Slam,
    Damage13 = ReplicatedStorage.Damage13,
    KnockAdvanced = ReplicatedStorage.KnockAdvanced
}

-- Wait for character and stand to load
repeat wait() until LocalPlayer.Character
local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart

-- Create GUI for slam controls
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SlamLoopGUI"
screenGui.Parent = LocalPlayer.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 100)
mainFrame.Position = UDim2.new(0.8, 0, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "MEGA Slam Loop"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = mainFrame

-- Toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0.8, 0, 0, 30)
toggleButton.Position = UDim2.new(0.1, 0, 0.5, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Text = "START MEGA SLAM"
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 16
toggleButton.Parent = mainFrame

-- Status indicator
local statusLabel = Instance.new("TextLabel")
local slamLoopEnabled = false
local loopThread = nil

statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0.85, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Text = "Status: Disabled"
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 14
statusLabel.Parent = mainFrame

-- Function to execute slam on all players with MASSIVELY increased range
local function slamAllPlayers()
    -- Fire the Slam remote
    remotes.Slam:FireServer()
    
    -- Apply damage to all players regardless of distance
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            -- Apply slam damage with increasing damage values
            remotes.Damage13:FireServer(
                player.Character.Humanoid,
                100, -- Higher damage value
                0.5, -- Longer knockback duration
                Vector3.new(0, 50, 0) -- Stronger knockback direction (upward)
            )
            
            -- Knock the player
            remotes.KnockAdvanced:FireServer(player.Character.Humanoid)
            
            -- Create a fake hitbox with enormous range
            local fakeHitbox = Instance.new("Part")
            fakeHitbox.Size = Vector3.new(2000, 2000, 2000) -- 100x larger in all dimensions
            fakeHitbox.CFrame = HumanoidRootPart.CFrame
            fakeHitbox.Anchored = true
            fakeHitbox.CanCollide = false
            fakeHitbox.Transparency = 1
            fakeHitbox.Parent = workspace
            
            -- Remove the fake hitbox after a short delay
            game:GetService("Debris"):AddItem(fakeHitbox, 0.1)
            
            -- Apply additional damage to ensure everyone is affected
            for i = 1, 5 do
                remotes.Damage13:FireServer(
                    player.Character.Humanoid,
                    50,
                    0.25,
                    Vector3.new(0, 25, 0)
                )
            end
        end
    end
    
    -- Create visual effects to show the massive range
    local rangeIndicator = Instance.new("Part")
    rangeIndicator.Shape = Enum.PartType.Ball
    rangeIndicator.Size = Vector3.new(200, 200, 200) -- Visual indicator of range
    rangeIndicator.CFrame = HumanoidRootPart.CFrame
    rangeIndicator.Anchored = true
    rangeIndicator.CanCollide = false
    rangeIndicator.Transparency = 0.8
    rangeIndicator.Color = Color3.fromRGB(255, 0, 0)
    rangeIndicator.Material = Enum.Material.Neon
    rangeIndicator.Parent = workspace
    
    -- Make the indicator grow and fade
    spawn(function()
        for i = 1, 10 do
            rangeIndicator.Size = Vector3.new(200 + i*180, 200 + i*180, 200 + i*180)
            rangeIndicator.Transparency = 0.8 + (i * 0.02)
            wait(0.05)
        end
        rangeIndicator:Destroy()
    end)
end

-- Toggle the slam loop
local function toggleSlamLoop()
    slamLoopEnabled = not slamLoopEnabled
    
    if slamLoopEnabled then
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        toggleButton.Text = "STOP MEGA SLAM"
        statusLabel.Text = "Status: DESTROYING SERVER"
        
        -- Start the loop in a new thread
        loopThread = coroutine.create(function()
            while slamLoopEnabled do
                slamAllPlayers()
                wait(0.05) -- Even shorter delay between slams for maximum effectiveness
            end
        end)
        coroutine.resume(loopThread)
    else
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        toggleButton.Text = "START MEGA SLAM"
        statusLabel.Text = "Status: Disabled"
        
        -- The loop will stop on its own since slamLoopEnabled is now false
    end
end

-- Connect the toggle button
toggleButton.MouseButton1Click:Connect(toggleSlamLoop)

-- Keybind to toggle the slam loop (Press Z)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Z then
        toggleSlamLoop()
    end
end)

-- Create a special key bind for single ultra-slam (Press X)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.X then
        -- Execute a single super slam
        for i = 1, 10 do -- Do multiple slams at once for extra power
            slamAllPlayers()
            wait(0.01)
        end
    end
end)

-- Notification
local notification = Instance.new("TextLabel")
notification.Size = UDim2.new(0, 300, 0, 70)
notification.Position = UDim2.new(0.5, -150, 0, 50)
notification.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
notification.TextColor3 = Color3.fromRGB(255, 255, 255)
notification.Text = "MEGA Slam Loop Loaded! 100x RANGE!\nPress Z to toggle continuous slam\nPress X for single ultra-slam"
notification.Font = Enum.Font.SourceSansBold
notification.TextSize = 16
notification.Parent = screenGui

-- Make the notification fade away
game:GetService("Debris"):AddItem(notification, 5)

print("MEGA Slam Loop loaded! Press Z to toggle the loop or X for single ultra-slam.")
