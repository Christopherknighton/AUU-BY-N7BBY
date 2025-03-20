-- No Cooldown Script for An Unoriginal Universe (Vampire)
-- Works after death and maintains all animations, VFX, and audio

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Set up persistent variables
_G.NoCooldownEnabled = true
_G.AutoRespawnEnabled = true

-- Function to get current character references
local function getCharacterRefs()
    local Character = LocalPlayer.Character
    if not Character then return nil end
    
    local Humanoid = Character:FindFirstChild("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local Torso = Character:FindFirstChild("Torso")
    local Stand = Character:FindFirstChild("Stand")
    local RightArm = Character:FindFirstChild("Right Arm")
    local LeftArm = Character:FindFirstChild("Left Arm")
    local Head = Character:FindFirstChild("Head")
    local Disabled = Character:FindFirstChild("Disabled")
    
    if not (Humanoid and HumanoidRootPart and Torso and Stand and RightArm and LeftArm and Head) then
        return nil
    end
    
    return {
        Character = Character,
        Humanoid = Humanoid,
        HumanoidRootPart = HumanoidRootPart,
        Torso = Torso,
        Stand = Stand,
        RightArm = RightArm,
        LeftArm = LeftArm,
        Head = Head,
        Disabled = Disabled
    }
end

-- Override the wait function for specific delays
local originalWait = wait
getfenv().wait = function(t)
    if _G.NoCooldownEnabled and t and t > 0.5 then
        return originalWait(0.01) -- Minimal wait instead of cooldown
    else
        return originalWait(t)
    end
end

-- Function to handle all moves with no cooldown
local function executeMove(moveName)
    local refs = getCharacterRefs()
    if not refs then return end
    
    if refs.Torso.Anchored or (refs.Disabled and refs.Disabled.Value) then return end
    
    if moveName == "punch" then
        -- Alternate between right and left punch
        local isRightPunch = (math.random(1, 2) == 1)
        
        -- Force animations and effects
        local anim
        if isRightPunch then
            anim = refs.Humanoid:LoadAnimation(refs.Stand.RightPunch)
            anim:Play(0.1, 1, 1)
            ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, true)
        else
            anim = refs.Humanoid:LoadAnimation(refs.Stand.LeftPunch)
            anim:Play(0.1, 1, 1)
            ReplicatedStorage.Trail:FireServer(refs.Stand.StandLarm.Trail, true)
        end
        
        -- Play sounds
        refs.Torso.Swing:Play()
        
        -- Create hitbox function
        coroutine.resume(coroutine.create(function()
            for _ = 1, 5 do
                wait()
                if isRightPunch then
                    hito(refs.RightArm, refs.RightArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2.5, 7.5, 0.5, 0.25, refs.HumanoidRootPart.CFrame.lookVector * 20, "rbxassetid://3370684035", 0.035, Color3.new(170, 85, 255), "rbxassetid://367499850", math.random(9, 11) / 10, 2)
                else
                    hito(refs.LeftArm, refs.LeftArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2.5, 7.5, 0.5, 0.25, refs.HumanoidRootPart.CFrame.lookVector * 20, "rbxassetid://3370684035", 0.035, Color3.new(170, 85, 255), "rbxassetid://367499850", math.random(9, 11) / 10, 2)
                end
            end
        end))
        
        -- Clean up
        wait(0.2)
        if isRightPunch then
            ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, false)
        else
            ReplicatedStorage.Trail:FireServer(refs.Stand.StandLarm.Trail, false)
        end
        
    elseif moveName == "strongpunch" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.StrongPunch)
        anim:Play(0.1, 1, 1)
        
        -- Play sounds
        refs.Torso.HeavyPunch:Play()
        refs.Torso.Swing:Play()
        
        -- Fire necessary remotes
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, true)
        
        -- Create hitbox function
        coroutine.resume(coroutine.create(function()
            for _ = 1, 15 do
                wait()
                hito5(refs.RightArm, refs.RightArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2.5, 22.5, 0.5, 0.25, refs.HumanoidRootPart.CFrame.lookVector * 80, "rbxassetid://3370684035", 0.035, Color3.new(170, 85, 255), "rbxassetid://542443306", math.random(9, 11) / 11, math.random(9, 11) / 2)
            end
        end))
        
        -- Clean up
        wait(0.2)
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, false)
        
    elseif moveName == "barrage" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.Barrage)
        anim:Play(0.1, 1, 1.5)
        
        -- Play sounds
        refs.Torso.Rush:Play()
        
        -- Fire necessary remotes
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, true)
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandLarm.Trail, true)
        
        -- Create continuous damage
        coroutine.resume(coroutine.create(function()
            for i = 1, 20 do
                hito2(refs.RightArm, refs.RightArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2, 3.75, 0.05, 0.25, refs.HumanoidRootPart.CFrame.lookVector * 5, "rbxassetid://285779645", 0.5, Color3.fromRGB(177, 85, 255), "rbxassetid://542443306", math.random(9, 11) / 10, math.random(9, 11) / 35)
                hito2(refs.LeftArm, refs.LeftArm.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2, 3.75, 0.05, 0.25, refs.HumanoidRootPart.CFrame.lookVector * 5, "rbxassetid://285779645", 0.5, Color3.fromRGB(177, 85, 255), "rbxassetid://542443306", math.random(9, 11) / 10, math.random(9, 11) / 35)
                wait(0.05)
            end
            
            -- Clean up
            ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, false)
            ReplicatedStorage.Trail:FireServer(refs.Stand.StandLarm.Trail, false)
        end))
        
    elseif moveName == "spaceripperstingyeyes" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.SpaceRipper)
        anim:Play(0.1, 1, 1)
        
        -- Play sounds
        wait(0.6)
        refs.Torso.StingyEyes:Play()
        
        -- Fire necessary remotes
        ReplicatedStorage.Projectile:FireServer("SpaceRipper")
        
    elseif moveName == "bloodsuck" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.Bloodsuck)
        anim:Play(0.1, 1, 1)
        
        -- Fire necessary remotes
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, true)
        
        -- Play sounds
        wait(0.5)
        refs.Torso.Swing:Play()
        
        -- Create hitbox function
        coroutine.resume(coroutine.create(function()
            for _ = 1, 10 do
                wait()
                hito3(refs.Stand.StandRarm, 2.5, 30, 0.5, 0.25, refs.HumanoidRootPart.CFrame.lookVector * 0)
            end
        end))
        
        -- Clean up
        wait(0.2)
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, false)
        
    elseif moveName == "movement" then
        -- Play sounds
        refs.Torso.StandJumpSFX:Play()
        
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.StandJump)
        anim:Play(0.1, 1, 1)
        
        -- Fire necessary remotes
        ReplicatedStorage.Jump:FireServer(BrickColor.new("Institutional white"))
        
        -- Apply movement
        local BodyPosition = Instance.new("BodyPosition", refs.HumanoidRootPart)
        BodyPosition.maxForce = Vector3.new(100000, 100000, 100000)
        BodyPosition.Position = refs.HumanoidRootPart.CFrame * CFrame.new(0, 50, -75).Position
        game.Debris:AddItem(BodyPosition, 1)
        
    elseif moveName == "freeze" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.Lunge)
        anim:Play(0.1, 1, 1)
        
        -- Fire necessary remotes
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, true)
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandLarm.Trail, true)
        
        -- Play sounds
        refs.Torso.Voice1:Play()
        
        wait(0.5)
        refs.Torso.Swing:Play()
        
        -- Create hitbox function
        coroutine.resume(coroutine.create(function()
            for _ = 1, 15 do
                wait()
                hito4(refs.Stand.StandRarm, refs.Stand.StandRarm.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2.5, 75, 1, 0.75, refs.HumanoidRootPart.CFrame.lookVector * 50)
                hito4(refs.Stand.StandLarm, refs.Stand.StandRarm.CFrame * CFrame.new(0, 0, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2.5, 75, 1, 0.75, refs.HumanoidRootPart.CFrame.lookVector * 50)
            end
        end))
        
        -- Clean up
        wait(0.2)
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandRarm.Trail, false)
        ReplicatedStorage.Trail:FireServer(refs.Stand.StandLarm.Trail, false)
        
    elseif moveName == "block" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.Block)
        anim:Play(0.1, 1, 1)
        
        -- Fire necessary remotes
        ReplicatedStorage.Block:FireServer(true)
        
        -- Play sounds
        refs.Torso.Guard:Play()
        
        -- Auto unblock after short time
        coroutine.resume(coroutine.create(function()
            wait(0.5)
            ReplicatedStorage.Block:FireServer(false)
            anim:Stop(0.1)
        end))
        
    elseif moveName == "dodge" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.Roll)
        anim:Play()
        
        -- Play sounds
        refs.Torso.Dodge:Play()
        
        -- Fire necessary remotes
        ReplicatedStorage.Dodge:FireServer()
        
        -- Apply movement
        local moveDir
        if refs.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
            moveDir = refs.Humanoid.MoveDirection
        else
            moveDir = refs.Character.HumanoidRootPart.CFrame.LookVector * 1
        end
        
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.MaxForce = Vector3.new(100000, 0, 100000)
        BodyVelocity.P = math.huge
        BodyVelocity.Velocity = moveDir * 50
        BodyVelocity.Parent = refs.Character.HumanoidRootPart
        game.Debris:AddItem(BodyVelocity, 0.25)
        
    elseif moveName == "dash" then
        -- Force animations and effects
        local anim = refs.Humanoid:LoadAnimation(refs.Stand.Dash)
        anim:Play(0.1, 1, 1)
        
        -- Play sounds
        refs.Torso.Dash:Play()
        
        -- Fire necessary remotes
        ReplicatedStorage.Dodge:FireServer()
        
        -- Apply movement
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
        BodyVelocity.P = math.huge
        BodyVelocity.Velocity = refs.HumanoidRootPart.CFrame.lookVector * 80 + Vector3.new(0, 3.5, 0)
        BodyVelocity.Parent = refs.Character.HumanoidRootPart
        game.Debris:AddItem(BodyVelocity, 0.25)
        
        wait(0.4)
        anim:Stop()
        
    elseif moveName == "taunt" then
        local randint = math.random(1, 4)
        if randint == 1 then
            ReplicatedStorage.Taunt:FireServer(refs.Head, "rbxassetid://2553924562", 3, 1, 0)
        elseif randint == 2 then
            ReplicatedStorage.Taunt:FireServer(refs.Head, "rbxassetid://2553928874", 3, 2.355, 0)
        elseif randint == 3 then
            ReplicatedStorage.Taunt:FireServer(refs.Head, "rbxassetid://877367396", 3, 4.15, 0)
        elseif randint == 4 then
            ReplicatedStorage.Taunt:FireServer(refs.Head, "rbxassetid://3683393010", 3, 3.395, 0)
        end
        
    elseif moveName == "pose" then
        -- Force animations and effects
        local randint = math.random(1, 2)
        local anim
        if randint == 1 then
            anim = refs.Humanoid:LoadAnimation(refs.Stand.Pose1)
            anim:Play(0.1, 1, 1)
        else
            anim = refs.Humanoid:LoadAnimation(refs.Stand.Pose2)
            anim:Play(0.1, 1, 1)
        end
        
        -- Play sounds
        refs.Torso.Theme:Play()
        
        -- Fire necessary remotes
        ReplicatedStorage.Menacing:FireServer(true)
        
        -- Auto stop pose after short time
        coroutine.resume(coroutine.create(function()
            wait(5)
            refs.Torso.Theme:Stop()
            anim:Stop(0.3)
            ReplicatedStorage.Menacing:FireServer(false)
        end))
    end
end

-- Setup keybinds that persist after death
local function setupKeybinds()
    -- Create a persistent connection for key presses
    local UserInputService = game:GetService("UserInputService")
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if not _G.NoCooldownEnabled then return end
        
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            executeMove("punch")
        elseif input.UserInputType == Enum.UserInputType.Keyboard then
            local key = input.KeyCode.Name:lower()
            
            if key == "r" then
                executeMove("strongpunch")
            elseif key == "e" then
                executeMove("barrage")
            elseif key == "t" then
                executeMove("spaceripperstingyeyes")
            elseif key == "y" then
                executeMove("bloodsuck")
            elseif key == "z" then
                executeMove("movement")
            elseif key == "f" then
                executeMove("freeze")
            elseif key == "x" then
                executeMove("block")
            elseif key == "c" then
                executeMove("dodge")
            elseif key == "v" then
                executeMove("dash")
            elseif key == "n" then
                executeMove("taunt")
            elseif key == "p" then
                executeMove("pose")
            elseif key == "equals" then
                _G.NoCooldownEnabled = not _G.NoCooldownEnabled
                print("No Cooldown:", _G.NoCooldownEnabled)
            elseif key == "backquote" then
                _G.AutoRespawnEnabled = not _G.AutoRespawnEnabled
                print("Auto Respawn:", _G.AutoRespawnEnabled)
            end
        end
    end)
end

-- Auto respawn handler
local function setupAutoRespawn()
    LocalPlayer.CharacterAdded:Connect(function(character)
        print("Character respawned, reapplying vampire stand")
        
        -- Wait for game to load character
        wait(1)
        
        -- Ensure we have the vampire stand
        if LocalPlayer.Data and LocalPlayer.Data.Stand and LocalPlayer.Data.Stand.Value == 21 then
            -- Make sure we activate vampire mode
            ReplicatedStorage.Vampire:FireServer()
            
            -- Wait for Stand to load
            character:WaitForChild("Stand")
            
            print("Vampire stand loaded, script ready to use")
        else
            print("Character doesn't have vampire stand (value:", LocalPlayer.Data.Stand.Value, ")")
        end
    end)
    
    -- Auto respawn when character dies
    while wait(1) do
        if _G.AutoRespawnEnabled then
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                if character.Humanoid.Health <= 0 then
                    wait(3) -- Wait for death animation
                    local DeathGUI = LocalPlayer.PlayerGui:FindFirstChild("DeathGUI")
                    if DeathGUI and DeathGUI:FindFirstChild("Respawn") then
                        -- Simulate clicking respawn button
                        for _, button in pairs(DeathGUI:GetDescendants()) do
                            if button:IsA("TextButton") and button.Text:match("[Rr]espawn") then
                                -- Fire click event
                                for _, connection in pairs(getconnections(button.MouseButton1Click)) do
                                    connection:Fire()
                                end
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Initialize the script
local function initialize()
    print("No Cooldown Script Loaded - Using Original Keybinds")
    print("R - Strong Punch")
    print("E - Barrage")
    print("T - Space Ripper Stingy Eyes")
    print("Y - Bloodsuck")
    print("Z - Stand Jump")
    print("F - Freeze")
    print("X - Block")
    print("C - Dodge")
    print("V - Dash")
    print("N - Taunt")
    print("P - Pose")
    print("Mouse1 - Basic Punch")
    print("= - Toggle No Cooldown")
    print("` - Toggle Auto Respawn")
    
    -- Setup keybinds
    setupKeybinds()
    
    -- Setup auto respawn in a separate thread
    coroutine.wrap(setupAutoRespawn)()
    
    -- Make sure we're using vampire
    if LocalPlayer.Data and LocalPlayer.Data.Stand and LocalPlayer.Data.Stand.Value == 21 then
        ReplicatedStorage.Vampire:FireServer()
        print("Vampire mode activated")
    else
        print("Warning: You don't have the vampire stand equipped (value:", LocalPlayer.Data.Stand.Value, ")")
    end
end

-- Run the script
initialize()
