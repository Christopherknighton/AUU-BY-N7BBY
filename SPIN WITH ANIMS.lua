-- No Cooldown Script for Spin in An Unoriginal Universe
-- This script removes cooldowns and allows infinite spam of abilities with animations

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local Torso = Character:WaitForChild("Torso")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Remote events
local Damage = ReplicatedStorage.Damage
local Anchor = ReplicatedStorage.Anchor
local Trail = ReplicatedStorage.Trail
local Knock = ReplicatedStorage.Knock
local Transparency = ReplicatedStorage.Transparency
local Taunt = ReplicatedStorage.Taunt
local Projectile = ReplicatedStorage.Projectile
local Block = ReplicatedStorage.Block
local Dodge = ReplicatedStorage.Dodge
local Jump = ReplicatedStorage.Jump
local PlayerStrongPunch = ReplicatedStorage.PlayerStrongPunch
local SunlightYellow = ReplicatedStorage.SunlightYellow
local SpinUnravel = ReplicatedStorage.SpinUnravel

-- Set up variables
local var14_upvw = false
local var27_upvw = false
local var34_upvw = false
local var41_upvw = false
local var46_upvw = false
local var50_upvw = false
local var53_upvw = false
local var55_upvw = false
local var58_upvw = false
local var71_upvw = false
_G.dodgecooldown = false

-- Wait for Stand to load
local Stand = Character:WaitForChild("Stand")

-- Load animations
local Animations = {}
for _, anim in pairs(Stand:GetChildren()) do
    if anim:IsA("Animation") then
        Animations[anim.Name] = Humanoid:LoadAnimation(anim)
    end
end

-- Get sound effects
local SwingSound = Torso:FindFirstChild("Swing")
local HamonSound = Torso:FindFirstChild("Hamon")
local ThrowSound = Torso:FindFirstChild("Throw")
local StandJumpSFX = Torso:FindFirstChild("StandJumpSFX")
local GuardSound = Torso:FindFirstChild("Guard")
local DodgeSound = Torso:FindFirstChild("Dodge")

-- Function to continuously reset cooldowns
local function resetCooldowns()
    var14_upvw = false
    var27_upvw = false
    var34_upvw = false
    var41_upvw = false
    var46_upvw = false
    var50_upvw = false
    var53_upvw = false
    var55_upvw = false
    var58_upvw = false
    var71_upvw = false
    _G.dodgecooldown = false
    
    -- Remove any cooldown attributes
    for _, attribute in pairs(Character:GetAttributes()) do
        if string.find(attribute, "CD") then
            Character:SetAttribute(attribute, nil)
        end
    end
end

-- Ability functions
local function block()
    if var14_upvw == true then return end
    
    var14_upvw = true
    var27_upvw = true
    
    if Animations.Block then
        Animations.Block:Play(0.1, 1, 1)
    end
    
    Block:FireServer(true)
    
    if GuardSound then
        GuardSound:Play()
    end
    
    Humanoid.JumpPower = 0
    
    -- Keep block active for a short time then release
    wait(0.5)
    
    Block:FireServer(false)
    
    if Animations.Block then
        Animations.Block:Stop(0.1)
    end
    
    Humanoid.JumpPower = 50
    var14_upvw = false
    var27_upvw = false
end

local function punch()
    if var14_upvw == true then return end
    
    var14_upvw = true
    
    if SwingSound then
        SwingSound:Play()
    end
    
    local RightArm = Character:WaitForChild("Right Arm")
    local LeftArm = Character:WaitForChild("Left Arm")
    
    if var34_upvw == false then
        var34_upvw = true
        
        if Animations.RightPunch then
            Animations.RightPunch:Play(0.1, 1, 1)
        end
        
        Trail:FireServer(Stand.StandRarm.Trail, true)
        
        wait(0.1)
        
        for _ = 1, 5 do
            local hitboxCFrame = RightArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25))
            Damage:FireServer(nil, hitboxCFrame, 10, 0.5, 0.25, HumanoidRootPart.CFrame.lookVector * 10, "rbxassetid://3370684035", 0.035, Color3.new(255, 255, 0), "rbxassetid://367499850", math.random(9, 11) / 10, 2)
            wait(0.01)
        end
        
        Trail:FireServer(Stand.StandRarm.Trail, false)
    else
        var34_upvw = false
        
        if Animations.LeftPunch then
            Animations.LeftPunch:Play(0.1, 1, 1)
        end
        
        Trail:FireServer(Stand.StandLarm.Trail, true)
        
        wait(0.1)
        
        for _ = 1, 5 do
            local hitboxCFrame = LeftArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25))
            Damage:FireServer(nil, hitboxCFrame, 10, 0.5, 0.25, HumanoidRootPart.CFrame.lookVector * 10, "rbxassetid://3370684035", 0.035, Color3.new(255, 255, 0), "rbxassetid://367499850", math.random(9, 11) / 10, 2)
            wait(0.01)
        end
        
        Trail:FireServer(Stand.StandLarm.Trail, false)
    end
    
    wait(0.2)
    var14_upvw = false
end

local function movement()
    if var14_upvw == true or var41_upvw == true then return end
    
    var41_upvw = true
    var14_upvw = true
    
    if StandJumpSFX then
        StandJumpSFX:Play()
    end
    
    if Animations.StandJump then
        Animations.StandJump:Play(0.1, 1, 1)
    end
    
    Jump:FireServer(BrickColor.new("Institutional white"))
    
    local bodyPosition = Instance.new("BodyPosition", HumanoidRootPart)
    bodyPosition.MaxForce = Vector3.new(100000, 100000, 100000)
    bodyPosition.Position = HumanoidRootPart.CFrame * CFrame.new(0, 50, -75).Position
    game.Debris:AddItem(bodyPosition, 1)
    
    wait(1)
    var14_upvw = false
    wait(0.5)
    var41_upvw = false
end

local function sendochop()
    if var14_upvw == true or var46_upvw == true then return end
    
    var14_upvw = true
    var46_upvw = true
    
    local RightArm = Character:WaitForChild("Right Arm")
    
    Trail:FireServer(Stand.StandRarm.Trail, true)
    Transparency:FireServer(Stand.StandRarm, 0.5)
    
    if Animations.SendoChop then
        Animations.SendoChop:Play(0.1, 1, 1)
    end
    
    if HamonSound then
        HamonSound:Play()
    end
    
    wait(0.3)
    
    if SwingSound then
        SwingSound:Play()
    end
    
    for _ = 1, 15 do
        local hitboxCFrame = RightArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25))
        Damage:FireServer(nil, hitboxCFrame, 32.5, 0.5, 0.25, HumanoidRootPart.CFrame.lookVector * 40, "rbxassetid://3370684035", 0.035, Color3.new(255, 255, 0), "rbxassetid://542443306", math.random(9, 11) / 11, math.random(9, 11) / 2)
        wait(0.01)
    end
    
    wait(0.3)
    
    Trail:FireServer(Stand.StandRarm.Trail, false)
    Transparency:FireServer(Stand.StandRarm, 1)
    
    var14_upvw = false
    wait(0.2)
    var46_upvw = false
end

local function ballthrow()
    if var14_upvw == true or var50_upvw == true then return end
    
    var14_upvw = true
    var50_upvw = true
    
    Humanoid.JumpPower = 0
    
    if Animations.Throw then
        Animations.Throw:Play()
    end
    
    if ThrowSound then
        ThrowSound:Play()
    end
    
    wait(0.3)
    Projectile:FireServer("SteelBall")
    
    wait(0.2)
    
    if Animations.Throw then
        Animations.Throw:Stop()
    end
    
    Humanoid.JumpPower = 50
    var14_upvw = false
    wait(0.2)
    var50_upvw = false
end

local function ballthrow2()
    if var14_upvw == true or var53_upvw == true then return end
    
    var14_upvw = true
    var53_upvw = true
    
    Humanoid.JumpPower = 0
    
    if Animations.Throw2 then
        Animations.Throw2:Play()
    end
    
    if ThrowSound then
        ThrowSound:Play()
    end
    
    wait(0.3)
    Projectile:FireServer("SteelBall")
    
    wait(0.2)
    
    if Animations.Throw2 then
        Animations.Throw2:Stop()
    end
    
    Humanoid.JumpPower = 50
    var14_upvw = false
    wait(0.2)
    var53_upvw = false
end

local function spinoverdrive()
    if var14_upvw == true or var55_upvw == true then return end
    
    var14_upvw = true
    var55_upvw = true
    
    Humanoid.JumpPower = 0
    
    if HamonSound then
        HamonSound:Play()
    end
    
    if ThrowSound then
        ThrowSound:Play()
    end
    
    if Animations.SpinOverdrive then
        Animations.SpinOverdrive:Play()
    end
    
    wait(0.2)
    
    for i = 1, 5 do
        Projectile:FireServer("SteelBall")
        wait(0.1)
    end
    
    wait(0.2)
    
    if Animations.Throw2 then
        Animations.Throw2:Stop()
    end
    
    Humanoid.JumpPower = 50
    var14_upvw = false
    wait(0.5)
    var55_upvw = false
end

local function scarletoverdrive()
    if var14_upvw == true or var58_upvw == true then return end
    
    var14_upvw = true
    var58_upvw = true
    
    local LeftArm = Character:WaitForChild("Left Arm")
    
    -- Enable trail and make arm visible
    Trail:FireServer(Stand.StandLarm.RedTrail, true)
    Transparency:FireServer(Stand.StandLarm, 0.5)
    
    -- Play animation and sound
    if Animations.ScarletOverdrive then
        Animations.ScarletOverdrive:Play(0.1, 1, 1)
    end
    
    if HamonSound then
        HamonSound:Play()
    end
    
    wait(0.5)
    
    if SwingSound then
        SwingSound:Play()
    end
    
    -- Visual effect
    PlayerStrongPunch:FireServer(Vector3.new(1, 0.5, 1), Vector3.new(0.30000, 0.15000, 0.30000), BrickColor.new("Lime green"))
    
    -- Deal damage
    for _ = 1, 15 do
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (player.Character.HumanoidRootPart.Position - LeftArm.Position).Magnitude
                if distance < 10 then
                    SpinUnravel:FireServer(player.Character.Humanoid, LeftArm.CFrame, 30, 0.75, 0.25, HumanoidRootPart.CFrame.lookVector * 60, 0.085, "rbxassetid://541909983", math.random(9, 11) / 7, math.random(9, 11) / 2)
                    Knock:FireServer(player.Character.Humanoid)
                end
            end
        end
        
        -- Also apply damage to workspace NPCs
        for _, v in pairs(workspace:GetChildren()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= Character then
                local distance = (v.HumanoidRootPart.Position - LeftArm.Position).Magnitude
                if distance < 10 then
                    SpinUnravel:FireServer(v.Humanoid, LeftArm.CFrame, 30, 0.75, 0.25, HumanoidRootPart.CFrame.lookVector * 60, 0.085, "rbxassetid://541909983", math.random(9, 11) / 7, math.random(9, 11) / 2)
                    Knock:FireServer(v.Humanoid)
                end
            end
        end
        
        wait(0.01)
    end
    
    wait(0.3)
    
    -- Cleanup
    Trail:FireServer(Stand.StandLarm.RedTrail, false)
    Transparency:FireServer(Stand.StandLarm, 1)
    
    var14_upvw = false
    wait(0.2)
    var58_upvw = false
end

local function dodge()
    if var14_upvw == true or _G.dodgecooldown == true then return end
    
    var14_upvw = true
    _G.dodgecooldown = true
    
    local direction
    if Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
        direction = Humanoid.MoveDirection
    else
        direction = Character.HumanoidRootPart.CFrame.LookVector * 1
    end
    
    if Animations.Roll then
        Animations.Roll:Play()
    end
    
    if DodgeSound then
        DodgeSound:Play()
    end
    
    Dodge:FireServer()
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(100000, 0, 100000)
    bodyVelocity.P = math.huge
    bodyVelocity.Velocity = direction * 50
    bodyVelocity.Parent = Character.HumanoidRootPart
    game.Debris:AddItem(bodyVelocity, 0.25)
    
    wait(0.4)
    var14_upvw = false
    wait(0.1)
    _G.dodgecooldown = false
end

local function taunt()
    if var71_upvw == true then return end
    
    var71_upvw = true
    Taunt:FireServer(Character.Head, "rbxassetid://5204641096", 2, 10, 0)
    wait(0.2)
    var71_upvw = false
end

-- Key bindings
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Q then
        sendochop()
    elseif input.KeyCode == Enum.KeyCode.E then
        ballthrow2()
    elseif input.KeyCode == Enum.KeyCode.R then
        ballthrow()
    elseif input.KeyCode == Enum.KeyCode.T then
        scarletoverdrive()
    elseif input.KeyCode == Enum.KeyCode.F then
        spinoverdrive()
    elseif input.KeyCode == Enum.KeyCode.X then
        block()
    elseif input.KeyCode == Enum.KeyCode.C then
        dodge()
    elseif input.KeyCode == Enum.KeyCode.Z then
        movement()
    elseif input.KeyCode == Enum.KeyCode.N then
        taunt()
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 and not UserInputService.TouchEnabled then
        punch()
    end
end)

-- Run continuous cooldown reset
RunService.Heartbeat:Connect(resetCooldowns)

-- Handle character respawning
Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = Character:WaitForChild("Humanoid")
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    Torso = Character:WaitForChild("Torso")
    
    -- Wait for Stand to load
    Stand = Character:WaitForChild("Stand")
    
    -- Reload animations
    Animations = {}
    for _, anim in pairs(Stand:GetChildren()) do
        if anim:IsA("Animation") then
            Animations[anim.Name] = Humanoid:LoadAnimation(anim)
        end
    end
    
    -- Get sound effects
    SwingSound = Torso:FindFirstChild("Swing")
    HamonSound = Torso:FindFirstChild("Hamon")
    ThrowSound = Torso:FindFirstChild("Throw")
    StandJumpSFX = Torso:FindFirstChild("StandJumpSFX")
    GuardSound = Torso:FindFirstChild("Guard")
    DodgeSound = Torso:FindFirstChild("Dodge")
    
    wait(1)
    resetCooldowns()
end)

-- Hook the SetAttribute method to prevent cooldowns from being set
local oldSetAttribute = nil
oldSetAttribute = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if method == "SetAttribute" then
        local attributeName = args[1]
        -- Prevent setting cooldown attributes
        if typeof(attributeName) == "string" and attributeName:find("CD") then
            return nil -- Don't set the cooldown attribute
        end
    end
    
    return oldSetAttribute(self, ...)
end)

-- Notification
local message = "Spin No Cooldown Script Activated"
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script Loaded",
    Text = message,
    Duration = 3
})

print("Spin no cooldown script loaded successfully!")
print("Use keys Q, E, R, T, F, X, C, Z, N and Left Mouse Button for abilities")
