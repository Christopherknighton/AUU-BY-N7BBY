-- The World Over Heaven Script (No Cooldown Version)
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local Damage3_upvr = ReplicatedStorage_upvr.Damage3
local Transparency_upvr = ReplicatedStorage_upvr.Transparency
local StrongPunch_upvr = ReplicatedStorage_upvr.StrongPunch
local Anchor_upvr = ReplicatedStorage_upvr.Anchor
local Trail_upvr = ReplicatedStorage_upvr.Trail
local THTrail_upvr = ReplicatedStorage_upvr.THTrail
local Taunt_upvr = ReplicatedStorage_upvr.Taunt
local KnockAdvanced_upvr = ReplicatedStorage_upvr.KnockAdvanced
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
repeat
    wait()
until not LocalPlayer_upvr.Character or LocalPlayer_upvr.Character.Humanoid
local Character_upvr = LocalPlayer_upvr.Character
local Humanoid_7_upvr = Character_upvr.Humanoid
mouse = LocalPlayer_upvr:GetMouse() -- Setting global
cam = workspace.CurrentCamera -- Setting global
local MobileStuff_upvr = LocalPlayer_upvr.PlayerGui.MobileStuff

-- Force stand replacement
ReplicatedStorage_upvr.Stand:FireServer("TheWorldOverHeavenStand", 10, 625)
local var14_upvw = false
local var15_upvw = false
local Disabled_upvr = Character_upvr:WaitForChild("Disabled")
local Stand_upvr = Character_upvr:WaitForChild("Stand")
local StandHumanoidRootPart_upvr = Stand_upvr:WaitForChild("StandHumanoidRootPart")
local Stand_Head_upvr = Stand_upvr:WaitForChild("Stand Head")
local Stand_Torso_upvr = Stand_upvr:WaitForChild("Stand Torso")
local Stand_Right_Arm_upvr = Stand_upvr:WaitForChild("Stand Right Arm")
local Stand_Left_Arm_upvr = Stand_upvr:WaitForChild("Stand Left Arm")
local Stand_Right_Leg_upvr = Stand_upvr:WaitForChild("Stand Right Leg")
local Stand_Left_Leg_upvr = Stand_upvr:WaitForChild("Stand Left Leg")
local Head_upvr = Character_upvr.Head
local Torso_upvr = Character_upvr.Torso
local Right_Arm_upvr = Character_upvr["Right Arm"]
local Left_Arm_upvr = Character_upvr["Left Arm"]
local Right_Leg_upvr = Character_upvr["Right Leg"]
local Left_Leg_upvr = Character_upvr["Left Leg"]
local any_LoadAnimation_result1_upvr_11 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.AttackPose)
local Punch_upvr = StandHumanoidRootPart_upvr.Punch
local HeavyPunch_upvr = StandHumanoidRootPart_upvr.HeavyPunch
local Overwritten_upvr = StandHumanoidRootPart_upvr.Overwritten
local StandAppear_upvr = StandHumanoidRootPart_upvr.StandAppear
local var36_upvw = false
local any_LoadAnimation_result1_upvr_14 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.Nothing)
local any_LoadAnimation_result1_upvr_17 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.Idle)

-- Stand Appear (Q key)
function standappear(arg1)
    if var14_upvw == true then return end
    var36_upvw = true
    if var15_upvw == false then
        var15_upvw = true
        any_LoadAnimation_result1_upvr_14:Stop()
        any_LoadAnimation_result1_upvr_17:Play(0.2, 1, 1)
        StandAppear_upvr:Play()
        for i_7, v_7 in pairs(arg1:GetDescendants()) do
            if v_7:GetAttribute("SummonParts") ~= nil and v_7:GetAttribute("SummonParts") == true then
                if v_7:IsA("BasePart") then
                    Transparency_upvr:FireServer(v_7, 0)
                end
                if v_7:IsA("Decal") then
                    Transparency_upvr:FireServer(v_7, 0)
                end
                if v_7:IsA("ParticleEmitter") then
                    THTrail_upvr:FireServer(v_7, true)
                end
                if v_7:IsA("Trail") then
                    THTrail_upvr:FireServer(v_7, true)
                end
            end
        end
    elseif var15_upvw == true then
        var15_upvw = false
        any_LoadAnimation_result1_upvr_17:Stop()
        i_7 = 1
        v_7 = 1
        any_LoadAnimation_result1_upvr_14:Play(0.2, i_7, v_7)
        for _, v_9 in pairs(arg1:GetDescendants()) do
            if v_9:GetAttribute("SummonParts") ~= nil and v_9:GetAttribute("SummonParts") == true then
                if v_9:IsA("BasePart") then
                    Transparency_upvr:FireServer(v_9, 1)
                end
                if v_9:IsA("Decal") then
                    Transparency_upvr:FireServer(v_9, 1)
                end
                if v_9:IsA("ParticleEmitter") then
                    THTrail_upvr:FireServer(v_9, false)
                end
                if v_9:IsA("Trail") then
                    THTrail_upvr:FireServer(v_9, false)
                end
            end
        end
    end
    var36_upvw = false
end

local var49_upvw = false
local Rush_upvr = StandHumanoidRootPart_upvr.Rush
local any_LoadAnimation_result1_upvr_8 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.PunchBarrage)
local Effect_upvr = ReplicatedStorage_upvr.Effect
local var53_upvw = 0
local any_LoadAnimation_result1_upvr = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.KickBarrage)

-- Barrage (E key)
function barrage()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    var49_upvw = true
    Rush_upvr:Play()
    any_LoadAnimation_result1_upvr_11:Play()
    Humanoid_7_upvr.JumpPower = 50
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, true)
    Trail_upvr:FireServer(Stand_Left_Arm_upvr.Trail, true)
    any_LoadAnimation_result1_upvr_8:Play(0.1, 1, 2.25)
    Effect_upvr:FireServer(true)
    
    repeat
        var53_upvw += 0.5
        hito(Stand_Right_Arm_upvr, Stand_Right_Arm_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 3, 2.5, 0.05, 0.25, StandHumanoidRootPart_upvr.CFrame.lookVector * 2.5, 0.075, "rbxassetid://3041190784", math.random(9, 11) / 10, math.random(9, 11) / 50)
        wait(0.05)
        hito(Stand_Left_Arm_upvr, Stand_Left_Arm_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 3, 2.5, 0.05, 0.25, StandHumanoidRootPart_upvr.CFrame.lookVector * 2.5, 0.075, "rbxassetid://3041190784", math.random(9, 11) / 10, math.random(9, 11) / 50)
        wait(0.05)
    until var15_upvw == false or Disabled_upvr.Value == true
    
    var53_upvw = 0
    Effect_upvr:FireServer(false)
    Rush_upvr:Stop()
    any_LoadAnimation_result1_upvr_11:Stop()
    any_LoadAnimation_result1_upvr_8:Stop(0.1)
    any_LoadAnimation_result1_upvr:Stop(0.1)
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, false)
    Trail_upvr:FireServer(Stand_Left_Arm_upvr.Trail, false)
    Trail_upvr:FireServer(Stand_Right_Leg_upvr.Trail, false)
    Humanoid_7_upvr.JumpPower = 50
    var14_upvw = false
    var49_upvw = false
end

local any_LoadAnimation_result1_upvr_7 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.Block)
local Block_upvr = ReplicatedStorage_upvr.Block
local Guard_upvr = StandHumanoidRootPart_upvr.Guard

-- Block (X key)
function block()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
        return
    end
    
    var14_upvw = true
    local var58_upvw = true
    
    local function _(arg1)
        if arg1 == 'x' then
            var58_upvw = false
        end
    end
    
    MobileStuff_upvr.X.MouseButton1Up:Connect(function()
        var58_upvw = false
    end)
    
    Humanoid_7_upvr.JumpPower = 0
    any_LoadAnimation_result1_upvr_7:Play(0.1, 1, 1)
    Block_upvr:FireServer(true)
    Guard_upvr:Play()
    any_LoadAnimation_result1_upvr_11:Play()
    
    repeat
        wait()
    until var58_upvw == false
    
    Block_upvr:FireServer(false)
    any_LoadAnimation_result1_upvr_7:Stop(0.1)
    var14_upvw = false
    Humanoid_7_upvr.JumpPower = 50
    any_LoadAnimation_result1_upvr_11:Stop()
end

local var61_upvw = false
local any_LoadAnimation_result1_upvr_2 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.RightPunch)
local any_LoadAnimation_result1_upvr_9 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.LeftPunch)

-- Punch (M1 / Left Click)
function punch()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    Punch_upvr:Play()
    any_LoadAnimation_result1_upvr_11:Play()
    Humanoid_7_upvr.JumpPower = 0
    
    if var61_upvw == false then
        var61_upvw = true
        any_LoadAnimation_result1_upvr_2:Play(0.1, 1, 1)
        Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, true)
        wait(0.2)
        coroutine.resume(coroutine.create(function()
            for _ = 1, 5 do
                wait()
                hito2(Stand_Right_Arm_upvr, Stand_Right_Arm_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2.5, 15, 0.5, 0.25, StandHumanoidRootPart_upvr.CFrame.lookVector * 10, 0.075, "rbxassetid://3041190784", math.random(9, 11) / 10, math.random(9, 11) / 25)
            end
        end))
    elseif var61_upvw == true then
        var61_upvw = false
        any_LoadAnimation_result1_upvr_9:Play(0.1, 1, 1)
        Trail_upvr:FireServer(Stand_Left_Arm_upvr.Trail, true)
        wait(0.2)
        coroutine.resume(coroutine.create(function()
            for _ = 1, 5 do
                wait()
                hito2(Stand_Left_Arm_upvr, Stand_Left_Arm_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 2.5, 15, 0.5, 0.25, StandHumanoidRootPart_upvr.CFrame.lookVector * 10, 0.075, "rbxassetid://3041190784", math.random(9, 11) / 10, math.random(9, 11) / 25)
            end
        end))
    end
    
    wait(0.3)
    any_LoadAnimation_result1_upvr_11:Stop()
    var14_upvw = false
    Humanoid_7_upvr.JumpPower = 50
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, false)
    Trail_upvr:FireServer(Stand_Left_Arm_upvr.Trail, false)
end

local any_LoadAnimation_result1_upvr_15 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.StrongPunch)

-- Strong Punch (R key)
function strongpunch()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    HeavyPunch_upvr:Play()
    any_LoadAnimation_result1_upvr_15:Play(0.1, 1, 1)
    any_LoadAnimation_result1_upvr_11:Play()
    Humanoid_7_upvr.JumpPower = 0
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, true)
    wait(0.5)
    StrongPunch_upvr:FireServer(Vector3.new(1, 0.5, 1), Vector3.new(0.30000, 0.15000, 0.30000), BrickColor.new("Institutional white"))
    
    coroutine.resume(coroutine.create(function()
        for _ = 1, 15 do
            wait()
            hito3(Stand_Right_Arm_upvr, Stand_Right_Arm_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 3, 47.5, 0.75, 0.25, StandHumanoidRootPart_upvr.CFrame.lookVector * 50, 0.25, "rbxassetid://3041190784", math.random(9, 11) / 10, math.random(9, 11) / 35)
        end
    end))
    
    wait(0.65)
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, false)
    any_LoadAnimation_result1_upvr_11:Stop()
    Humanoid_7_upvr.JumpPower = 50
    var14_upvw = false
end

local any_LoadAnimation_result1_upvr_12 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.Overwrite)

-- Overwrite (T key)
function overwrite()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    Overwritten_upvr:Play()
    Humanoid_7_upvr.JumpPower = 0
    any_LoadAnimation_result1_upvr_12:Play(0.1, 1, 1)
    any_LoadAnimation_result1_upvr_11:Play()
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, true)
    wait(1.5)
    StrongPunch_upvr:FireServer(Vector3.new(1, 0.5, 1), Vector3.new(0.30000, 0.15000, 0.30000), BrickColor.new("Institutional white"))
    
    coroutine.resume(coroutine.create(function()
        for _ = 1, 15 do
            wait()
            hito4(Stand_Right_Arm_upvr, Stand_Right_Arm_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 3.5, 87.5, 0.75, 0.25, StandHumanoidRootPart_upvr.CFrame.lookVector * 50, 0.25, "rbxassetid://1202656211", math.random(9, 11) / 10, math.random(9, 11) / 35)
        end
    end))
    
    wait(0.65)
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, false)
    any_LoadAnimation_result1_upvr_11:Stop()
    Humanoid_7_upvr.JumpPower = 50
    var14_upvw = false
end

local any_LoadAnimation_result1_upvr_10 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.Slam)
local Slam_upvr = ReplicatedStorage_upvr.Slam

-- Slam (H key)
function slam()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    Overwritten_upvr:Play()
    Humanoid_7_upvr.JumpPower = 0
    Humanoid_7_upvr.WalkSpeed = 4
    any_LoadAnimation_result1_upvr_10:Play(0.1, 1, 1)
    any_LoadAnimation_result1_upvr_11:Play()
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, true)
    wait(1.5)
    Slam_upvr:FireServer()
    hito5(StandHumanoidRootPart_upvr, 22.5, 62.5, 0.75, 0.25, Vector3.new(0, 75, 0))
    wait(0.65)
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, false)
    any_LoadAnimation_result1_upvr_11:Stop()
    var14_upvw = false
    Humanoid_7_upvr.JumpPower = 50
    Humanoid_7_upvr.WalkSpeed = 16
end

local any_LoadAnimation_result1_upvr_16 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.HealOverwrite)

-- Heal Overwrite (Y key)
function healoverwrite()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    HeavyPunch_upvr:Play()
    any_LoadAnimation_result1_upvr_11:Play()
    Humanoid_7_upvr.JumpPower = 0
    any_LoadAnimation_result1_upvr_16:Play(0.1, 1, 1)
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, true)
    wait(0.6)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 45, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    var14_upvw = false
    Humanoid_7_upvr.JumpPower = 50
    Trail_upvr:FireServer(Stand_Right_Arm_upvr.Trail, false)
    any_LoadAnimation_result1_upvr_11:Stop()
    wait(1)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 40, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.1)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 35, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.2)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 30, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.3)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 25, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.4)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 20, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.5)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 15, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.6)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 10, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.7)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 5, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
    wait(1.8)
    heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 1, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 35)
end

local any_LoadAnimation_result1_upvr_6 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.KnifeThrow)

-- Knife Throw (V key)
function knifethrow()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    any_LoadAnimation_result1_upvr_6:Play(0.1, 1, 1)
    Humanoid_7_upvr.JumpPower = 0
    Transparency_upvr:FireServer(Character_upvr.HoldOHKnife.FakeKnife, 0)
    wait(0.5)
    ReplicatedStorage_upvr.Projectile:FireServer("OHKnife")
    Punch_upvr:Play()
    Transparency_upvr:FireServer(Character_upvr.HoldOHKnife.FakeKnife, 1)
    wait(0.5)
    var14_upvw = false
    Humanoid_7_upvr.JumpPower = 50
end

local any_LoadAnimation_result1_upvr_5 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.StandJump)
local StandJumpSFX_upvr = StandHumanoidRootPart_upvr.StandJumpSFX
local Jump_upvr = ReplicatedStorage_upvr.Jump
local HumanoidRootPart_upvr = Character_upvr.HumanoidRootPart

-- Movement / Stand Jump (Z key)
function movement()
    if var14_upvw == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    any_LoadAnimation_result1_upvr_5:Play(0.1, 1, 1)
    StandJumpSFX_upvr:Play()
    Jump_upvr:FireServer(BrickColor.new("Institutional white"))
    local BodyPosition = Instance.new("BodyPosition", HumanoidRootPart_upvr)
    BodyPosition.maxForce = Vector3.new(100000, 100000, 100000)
    BodyPosition.Position = HumanoidRootPart_upvr.CFrame * CFrame.new(0, 75, -100).Position
    game.Debris:AddItem(BodyPosition, 1)
    wait(1)
    var14_upvw = false
end

local any_LoadAnimation_result1_upvr_13 = Humanoid_7_upvr:LoadAnimation(StandHumanoidRootPart_upvr.TS)
local Timestop_upvr = ReplicatedStorage_upvr.Timestop

-- Time Stop (F key)
function timestop()
    if var14_upvw == true then return end
    if game.Lighting.TS.Value == true then return end
    if game.Lighting.TSing.Value == true then return end
    
    if var15_upvw == false then
        standappear(Stand_upvr)
    end
    
    var14_upvw = true
    any_LoadAnimation_result1_upvr_13:Play(0
