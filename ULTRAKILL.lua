-- Decompiler will be improved soon!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2025-03-16 16:44:53
-- Luau version 6, Types version 3
-- Time taken: 0.014193 seconds

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Damage_upvr = ReplicatedStorage.Damage
local Anchor_upvr = ReplicatedStorage.Anchor
local Taunt_upvr = ReplicatedStorage.Taunt
local Transparency_upvr = ReplicatedStorage.Transparency
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
repeat
	task.wait(0.2)
until not LocalPlayer_upvr.Character or LocalPlayer_upvr.Character.Humanoid
local Character_upvr = LocalPlayer_upvr.Character
local Humanoid_upvr = Character_upvr.Humanoid
local HumanoidRootPart_upvr_2 = Character_upvr.HumanoidRootPart
mouse = LocalPlayer_upvr:GetMouse() -- Setting global
cam = workspace.CurrentCamera -- Setting global
local MobileStuff_upvr = LocalPlayer_upvr.PlayerGui.MobileStuff
ReplicatedStorage.v1Standless:FireServer()
local var13_upvw = false
local var14_upvw = false
local Head_upvr = Character_upvr.Head
local Torso_upvr = Character_upvr.Torso
local Right_Arm_upvr = Character_upvr["Right Arm"]
local Left_Arm_upvr = Character_upvr["Left Arm"]
local Right_Leg_upvr = Character_upvr["Right Leg"]
local Left_Leg_upvr = Character_upvr["Left Leg"]
local Stand_upvr = Character_upvr:WaitForChild("Stand")
local Disabled_upvr = Character_upvr:WaitForChild("Disabled")
local tbl_upvr = {}
for _, v in pairs(Stand_upvr:GetChildren()) do
	if v:IsA("Animation") then
		tbl_upvr[v.Name] = Humanoid_upvr:LoadAnimation(v)
	end
end
local Swing_upvr = Torso_upvr.Swing
local Guard_upvr = Torso_upvr.Guard
local RageTheme_upvr = Torso_upvr.RageTheme
local Blood_upvr = Right_Arm_upvr.Blood
local Block_upvr = ReplicatedStorage.Block
function block() -- Line 75
	--[[ Upvalues[6]:
		[1]: var13_upvw (read and write)
		[2]: MobileStuff_upvr (readonly)
		[3]: tbl_upvr (readonly)
		[4]: Block_upvr (readonly)
		[5]: Guard_upvr (readonly)
		[6]: Humanoid_upvr (readonly)
	]]
	if var13_upvw == true then
	else
		var13_upvw = true
		local var32_upvw = true
		local function _(arg1) -- Line 79
			--[[ Upvalues[1]:
				[1]: var32_upvw (read and write)
			]]
			if arg1 == 'x' then
				var32_upvw = false
			end
		end
		MobileStuff_upvr.X.MouseButton1Down:Connect(function() -- Line 84
			--[[ Upvalues[1]:
				[1]: var32_upvw (read and write)
			]]
			var32_upvw = false
		end)
		tbl_upvr.Block:Play(0.1, 1, 1)
		Block_upvr:FireServer(true)
		Guard_upvr:Play()
		Humanoid_upvr.JumpPower = 0
		repeat
			wait()
		until var32_upvw == false
		Block_upvr:FireServer(false)
		tbl_upvr.Block:Stop(0.1)
		Humanoid_upvr.JumpPower = 55
		var13_upvw = false
	end
end
local var35_upvw = false
local GlockStandless_upvr = ReplicatedStorage.GlockStandless
local GunShoot_upvr = Torso_upvr.GunShoot
function gun() -- Line 100
	--[[ Upvalues[10]:
		[1]: var13_upvw (read and write)
		[2]: var35_upvw (read and write)
		[3]: Transparency_upvr (readonly)
		[4]: Character_upvr (readonly)
		[5]: tbl_upvr (readonly)
		[6]: Humanoid_upvr (readonly)
		[7]: Guard_upvr (readonly)
		[8]: GlockStandless_upvr (readonly)
		[9]: GunShoot_upvr (readonly)
		[10]: var14_upvw (read and write)
	]]
	if var13_upvw == true then
	else
		if var35_upvw == true then return end
		var35_upvw = true
		var13_upvw = true
		Transparency_upvr:FireServer(Character_upvr.Glock, 0)
		tbl_upvr.GUN:Play(0.1, 1, 1)
		Humanoid_upvr.WalkSpeed = 0
		Guard_upvr:Play()
		wait(0.3)
		GlockStandless_upvr:FireServer()
		GunShoot_upvr:Play()
		wait(0.7)
		Transparency_upvr:FireServer(Character_upvr.Glock, 1)
		var13_upvw = false
		if var14_upvw == false then
			Humanoid_upvr.WalkSpeed = 35
		else
			Humanoid_upvr.WalkSpeed = 35
		end
		wait(2)
		var35_upvw = false
	end
end
local var38_upvw = false
local var39_upvw = 0
local HumanoidRootPart_upvr = Character_upvr.HumanoidRootPart
function punch(arg1) -- Line 125
	--[[ Upvalues[9]:
		[1]: var38_upvw (read and write)
		[2]: var13_upvw (read and write)
		[3]: var39_upvw (read and write)
		[4]: Swing_upvr (readonly)
		[5]: Humanoid_upvr (readonly)
		[6]: tbl_upvr (readonly)
		[7]: HumanoidRootPart_upvr (readonly)
		[8]: HumanoidRootPart_upvr_2 (readonly)
		[9]: Character_upvr (readonly)
	]]
	if var38_upvw then
	else
		if var13_upvw == true then return end
		var13_upvw = true
		var39_upvw += 1
		Swing_upvr:Play()
		Humanoid_upvr.JumpPower = 0
		tbl_upvr["Punch"..tostring(var39_upvw)]:Play(0.1, 1, 1)
		task.wait(0.2)
		if var39_upvw < 5 then
			hito(HumanoidRootPart_upvr, HumanoidRootPart_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 6, 35, 0.25, 0.15, HumanoidRootPart_upvr_2.CFrame.lookVector * 10, "rbxassetid://8595977193", 0.075, Color3.new(255, 255, 255), "rbxassetid://135809342988703", math.random(9, 11) / 10, 4)
		else
			hito2(HumanoidRootPart_upvr, HumanoidRootPart_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 7, 45, 0.25, 0.15, Character_upvr.HumanoidRootPart.CFrame.lookVector * 65 + Vector3.new(0, 30, 0), "rbxassetid://8595977193", 0.075, Color3.new(255, 255, 255), "rbxassetid://135809342988703", math.random(9, 11) / 10, 4)
		end
		task.wait(0.25)
		Humanoid_upvr.JumpPower = 55
		task.spawn(function() -- Line 148
			--[[ Upvalues[2]:
				[1]: var39_upvw (copied, read and write)
				[2]: var38_upvw (copied, read and write)
			]]
			-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
			local function _() -- Line 149, Named "ResetM1"
				--[[ Upvalues[2]:
					[1]: var39_upvw (copied, read and write)
					[2]: var38_upvw (copied, read and write)
				]]
				var39_upvw = 0
				var38_upvw = true
				task.delay(1, function() -- Line 152
					--[[ Upvalues[1]:
						[1]: var38_upvw (copied, read and write)
					]]
					var38_upvw = false
				end)
			end
			-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [29] 23. Error Block 10 start (CF ANALYSIS FAILED)
			var39_upvw = 0
			var38_upvw = true
			task.delay(1, function() -- Line 152
				--[[ Upvalues[1]:
					[1]: var38_upvw (copied, read and write)
				]]
				var38_upvw = false
			end)
			do
				return
			end
			-- KONSTANTERROR: [29] 23. Error Block 10 end (CF ANALYSIS FAILED)
			-- KONSTANTERROR: [40] 33. Error Block 11 start (CF ANALYSIS FAILED)
			var39_upvw = 0
			var38_upvw = true
			task.delay(1, function() -- Line 152
				--[[ Upvalues[1]:
					[1]: var38_upvw (copied, read and write)
				]]
				var38_upvw = false
			end)
			-- KONSTANTERROR: [40] 33. Error Block 11 end (CF ANALYSIS FAILED)
		end)
		var13_upvw = false
	end
end
local var45_upvw = false
local Spin_upvr = Torso_upvr.Spin
function abdstrongpunch() -- Line 178
	--[[ Upvalues[7]:
		[1]: var13_upvw (read and write)
		[2]: var45_upvw (read and write)
		[3]: Spin_upvr (readonly)
		[4]: Right_Arm_upvr (readonly)
		[5]: tbl_upvr (readonly)
		[6]: Right_Leg_upvr (readonly)
		[7]: Character_upvr (readonly)
	]]
	if var13_upvw == true then
	else
		if var45_upvw == true then return end
		var13_upvw = true
		var45_upvw = true
		Spin_upvr:Play()
		Right_Arm_upvr:WaitForChild("EnableFling"):FireServer()
		tbl_upvr.Barrage:Play()
		coroutine.resume(coroutine.create(function() -- Line 189
			--[[ Upvalues[2]:
				[1]: Right_Leg_upvr (copied, readonly)
				[2]: Character_upvr (copied, readonly)
			]]
			for _ = 1, 2 do
				wait()
				hito(Right_Leg_upvr, Right_Leg_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 3, 125, 0.075, 0.075, Character_upvr.HumanoidRootPart.CFrame.lookVector * 10, "rbxassetid://8595977193", 0.075, Color3.new(255, 255, 255), "rbxassetid://4427232788", math.random(9, 11) / 10, 4)
			end
		end))
		wait(0.325)
		coroutine.resume(coroutine.create(function() -- Line 196
			--[[ Upvalues[2]:
				[1]: Right_Leg_upvr (copied, readonly)
				[2]: Character_upvr (copied, readonly)
			]]
			for _ = 1, 2 do
				wait()
				hito(Right_Leg_upvr, Right_Leg_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 3, 125, 0.075, 0.075, Character_upvr.HumanoidRootPart.CFrame.lookVector * 10, "rbxassetid://8595977193", 0.075, Color3.new(255, 255, 255), "rbxassetid://4427232788", math.random(9, 11) / 10, 4)
			end
		end))
		wait(0.342)
		coroutine.resume(coroutine.create(function() -- Line 204
			--[[ Upvalues[2]:
				[1]: Right_Leg_upvr (copied, readonly)
				[2]: Character_upvr (copied, readonly)
			]]
			for _ = 1, 2 do
				wait()
				hito2(Right_Leg_upvr, Right_Leg_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 3, 125, 0.25, 0.15, Character_upvr.HumanoidRootPart.CFrame.lookVector * 45 + Vector3.new(0, 0.30000, 0), "rbxassetid://8595977193", 0.075, Color3.new(255, 255, 255), "rbxassetid://4427232788", math.random(9, 11) / 10, 4)
			end
		end))
		wait(0.25)
		var13_upvw = false
		wait(10)
		var45_upvw = false
	end
end
local var53_upvw = false
local Slide_upvr = Torso_upvr.Slide
local Sparks_upvr = Left_Leg_upvr.Sparks
local Sparking_upvr = Left_Leg_upvr.Sparking
local var57_upvw = 0
function dash() -- Line 219
	--[[ Upvalues[11]:
		[1]: var13_upvw (read and write)
		[2]: var53_upvw (read and write)
		[3]: MobileStuff_upvr (readonly)
		[4]: tbl_upvr (readonly)
		[5]: Slide_upvr (readonly)
		[6]: HumanoidRootPart_upvr_2 (readonly)
		[7]: LocalPlayer_upvr (readonly)
		[8]: Transparency_upvr (readonly)
		[9]: Sparks_upvr (readonly)
		[10]: Sparking_upvr (readonly)
		[11]: var57_upvw (read and write)
	]]
	if var13_upvw == true then
	else
		if var53_upvw == true then return end
		local var58_upvw = true
		local function _(arg1) -- Line 223
			--[[ Upvalues[1]:
				[1]: var58_upvw (read and write)
			]]
			if arg1 == 'z' then
				var58_upvw = false
			end
		end
		MobileStuff_upvr.Z.MouseButton1Up:Connect(function() -- Line 228
			--[[ Upvalues[1]:
				[1]: var58_upvw (read and write)
			]]
			var58_upvw = false
		end)
		var13_upvw = true
		var53_upvw = true
		tbl_upvr.Sprint:Play()
		Slide_upvr:Play()
		local BodyVelocity_2 = Instance.new("BodyVelocity", HumanoidRootPart_upvr_2)
		BodyVelocity_2.MaxForce = Vector3.new(1000000, 0, 1000000)
		BodyVelocity_2.P = math.huge
		LocalPlayer_upvr.Character.HumanoidRootPart.Running.Volume = 0
		BodyVelocity_2.Velocity = HumanoidRootPart_upvr_2.CFrame.lookVector * 55
		Transparency_upvr:FireServer(Sparks_upvr, true)
		Transparency_upvr:FireServer(Sparking_upvr, true)
		repeat
			task.wait(0.01)
			var57_upvw += 1
			BodyVelocity_2.P = math.huge
			BodyVelocity_2.Velocity = HumanoidRootPart_upvr_2.CFrame.lookVector * 60
		until var58_upvw == false and var57_upvw == 99999999
		tbl_upvr.Sprint:Stop()
		BodyVelocity_2:Destroy()
		Slide_upvr:Stop()
		Transparency_upvr:FireServer(Sparks_upvr, false)
		Transparency_upvr:FireServer(Sparking_upvr, false)
		LocalPlayer_upvr.Character.HumanoidRootPart.Running.Volume = 5
		var57_upvw = 0
		var13_upvw = false
		wait(15)
		var53_upvw = false
	end
end
local var62_upvw = false
local PlayerStrongPunch_upvr = ReplicatedStorage.PlayerStrongPunch
function rhkick() -- Line 262
	--[[ Upvalues[7]:
		[1]: var13_upvw (read and write)
		[2]: var62_upvw (read and write)
		[3]: Swing_upvr (readonly)
		[4]: tbl_upvr (readonly)
		[5]: PlayerStrongPunch_upvr (readonly)
		[6]: Right_Leg_upvr (readonly)
		[7]: Character_upvr (readonly)
	]]
	if var13_upvw == true then
	else
		if var62_upvw == true then return end
		var13_upvw = true
		var62_upvw = true
		Swing_upvr:Play()
		tbl_upvr.Kick:Play(0.1, 1, 0.9)
		wait(0.5)
		PlayerStrongPunch_upvr:FireServer(Vector3.new(1, 0.5, 1), Vector3.new(0.30000, 0.15000, 0.30000), BrickColor.new("Institutional white"))
		coroutine.resume(coroutine.create(function() -- Line 271
			--[[ Upvalues[2]:
				[1]: Right_Leg_upvr (copied, readonly)
				[2]: Character_upvr (copied, readonly)
			]]
			for _ = 1, 5 do
				wait()
				hito2(Right_Leg_upvr, Right_Leg_upvr.CFrame * CFrame.new(0, -1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 6, 72.5, 0.25, 0.15, Character_upvr.HumanoidRootPart.CFrame.lookVector * 20, "rbxassetid://8595977193", 0.075, Color3.new(255, 255, 255), "rbxassetid://8595977193", math.random(9, 11) / 10, math.random(9, 11) / 35)
			end
		end))
		wait(0.65)
		var13_upvw = false
		wait(6.5)
		var62_upvw = false
	end
end
local var66_upvw = false
function awaken() -- Line 283
	--[[ Upvalues[8]:
		[1]: var13_upvw (read and write)
		[2]: var66_upvw (read and write)
		[3]: var14_upvw (read and write)
		[4]: tbl_upvr (readonly)
		[5]: RageTheme_upvr (readonly)
		[6]: Humanoid_upvr (readonly)
		[7]: Transparency_upvr (readonly)
		[8]: Stand_upvr (readonly)
	]]
	if var13_upvw == true then
	else
		if var66_upvw == true then return end
		var66_upvw = true
		var14_upvw = true
		tbl_upvr.RageMode:Play()
		RageTheme_upvr:Play()
		Humanoid_upvr.WalkSpeed = 0
		task.wait(0.95)
		task.spawn(function() -- Line 292
			--[[ Upvalues[2]:
				[1]: Transparency_upvr (copied, readonly)
				[2]: Stand_upvr (copied, readonly)
			]]
			Transparency_upvr:FireServer(Stand_upvr.StandTorso.XD.Aura, true)
			Transparency_upvr:FireServer(Stand_upvr.StandTorso.XD.Aura2, true)
			Transparency_upvr:FireServer(Stand_upvr.StandLarm.Arm.Enable, true)
			Transparency_upvr:FireServer(Stand_upvr.StandLarm.Arm.Enable2, true)
			Transparency_upvr:FireServer(Stand_upvr.StandLarm.Arm.Enable3, true)
			Transparency_upvr:FireServer(Stand_upvr.StandLarm.Arm.Enable4, true)
			Transparency_upvr:FireServer(Stand_upvr.StandLarm.Arm.Enable5, true)
			Transparency_upvr:FireServer(Stand_upvr.StandRarm.Arm.Enable, true)
			Transparency_upvr:FireServer(Stand_upvr.StandRarm.Arm.Enable2, true)
			Transparency_upvr:FireServer(Stand_upvr.StandRarm.Arm.Enable3, true)
			Transparency_upvr:FireServer(Stand_upvr.StandRarm.Arm.Enable4, true)
			Transparency_upvr:FireServer(Stand_upvr.StandRarm.Arm.Enable5, true)
			task.wait()
		end)
		wait(tbl_upvr.RageMode.Length)
		tbl_upvr.RageMode:Stop()
		Humanoid_upvr.WalkSpeed = 36
	end
end
dodgecooldown = false -- Setting global
maxdodges = 3 -- Setting global
local var68_upvw = 0
local Dodge_upvr = ReplicatedStorage.Dodge
function dodge() -- Line 315
	--[[ Upvalues[9]:
		[1]: var13_upvw (read and write)
		[2]: var68_upvw (read and write)
		[3]: Humanoid_upvr (readonly)
		[4]: Character_upvr (readonly)
		[5]: tbl_upvr (readonly)
		[6]: Torso_upvr (readonly)
		[7]: Dodge_upvr (readonly)
		[8]: var14_upvw (read and write)
		[9]: HumanoidRootPart_upvr_2 (readonly)
	]]
	local var70
	if var13_upvw == true then
	else
		if dodgecooldown == true then return end
		var13_upvw = true
		dodgecooldown = true -- Setting global
		var68_upvw += 1
		var70 = nil
		if Humanoid_upvr.MoveDirection ~= Vector3.new(0, 0, 0) then
			var70 = Humanoid_upvr.MoveDirection
		else
			var70 = Character_upvr.HumanoidRootPart.CFrame.LookVector * 1
		end
		local Magnitude_2 = (Character_upvr.HumanoidRootPart.CFrame.LookVector * -1 - var70).Magnitude
		local Magnitude = (Character_upvr.HumanoidRootPart.CFrame.LookVector * 1 - var70).Magnitude
		local tbl = {}
		table.insert(tbl, Magnitude_2)
		table.insert(tbl, Magnitude)
		local minimum = math.min(table.unpack(tbl))
		if minimum == Magnitude_2 then
		end
		if minimum == Magnitude then
		end
		tbl_upvr.Roll:Play()
		Torso_upvr.Dodge:Play()
		Dodge_upvr:FireServer()
		if var14_upvw == false then
			local BodyVelocity_3 = Instance.new("BodyVelocity", HumanoidRootPart_upvr_2)
			BodyVelocity_3.MaxForce = Vector3.new(1000000, 0, 1000000)
			BodyVelocity_3.P = math.huge
			BodyVelocity_3.Velocity = var70 * 90
			game.Debris:AddItem(BodyVelocity_3, 0.35)
		else
			local BodyVelocity = Instance.new("BodyVelocity", HumanoidRootPart_upvr_2)
			BodyVelocity.MaxForce = Vector3.new(100000, 0, 100000)
			BodyVelocity.P = math.huge
			BodyVelocity.Velocity = var70 * 125
			game.Debris:AddItem(BodyVelocity, 0.25)
		end
		if var68_upvw < maxdodges then
			wait(0.4)
			var13_upvw = false
			dodgecooldown = false -- Setting global
			return
		end
		var13_upvw = false
		wait(5)
		var68_upvw = 0
		dodgecooldown = false -- Setting global
	end
end
local var77_upvw = false
local Theme_upvr = Torso_upvr.Theme
local Menacing_upvr = ReplicatedStorage.Menacing
function posefunc() -- Line 371
	--[[ Upvalues[8]:
		[1]: var13_upvw (read and write)
		[2]: var77_upvw (read and write)
		[3]: Humanoid_upvr (readonly)
		[4]: tbl_upvr (readonly)
		[5]: var14_upvw (read and write)
		[6]: RageTheme_upvr (readonly)
		[7]: Theme_upvr (readonly)
		[8]: Menacing_upvr (readonly)
	]]
	-- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 start (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [3] 3. Error Block 2 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [9] 7. Error Block 17 start (CF ANALYSIS FAILED)
	var13_upvw = true
	Humanoid_upvr.WalkSpeed = 0
	Humanoid_upvr.JumpPower = 0
	tbl_upvr.Pose2:Play(0.3, 1, 1)
	if var14_upvw == true then
		RageTheme_upvr:Stop()
	end
	Theme_upvr:Play()
	var77_upvw = true
	Menacing_upvr:FireServer(true)
	do
		return
	end
	-- KONSTANTERROR: [9] 7. Error Block 17 end (CF ANALYSIS FAILED)
	-- KONSTANTERROR: [47] 37. Error Block 22 start (CF ANALYSIS FAILED)
	if var77_upvw == true then
		tbl_upvr.Pose2:Stop(0.3)
		Theme_upvr:Stop()
		if var14_upvw == true then
			RageTheme_upvr:Play()
		end
		if var14_upvw == false then
			Humanoid_upvr.WalkSpeed = 35
			Humanoid_upvr.JumpPower = 55
		else
			Humanoid_upvr.WalkSpeed = 35
			Humanoid_upvr.JumpPower = 55
		end
		var13_upvw = false
		var77_upvw = false
		Menacing_upvr:FireServer(false)
	end
	-- KONSTANTERROR: [47] 37. Error Block 22 end (CF ANALYSIS FAILED)
end
local var80_upvw = false
function taunt() -- Line 404
	--[[ Upvalues[3]:
		[1]: var80_upvw (read and write)
		[2]: Taunt_upvr (readonly)
		[3]: Head_upvr (readonly)
	]]
	if var80_upvw == true then
	else
		Taunt_upvr:FireServer(Head_upvr, "rbxassetid://18789959665", 4, 0.05, 0)
	end
end
mouse.Button1Down:connect(function() -- Line 409
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		if game:GetService("UserInputService").TouchEnabled then return end
		punch()
	end
end)
mouse.KeyDown:connect(function(arg1) -- Line 416
	--[[ Upvalues[3]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
		[3]: Humanoid_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		if arg1 == 'e' then
			abdstrongpunch()
		end
		if arg1 == 'y' then
			rhkick()
		end
		if arg1 == 'g' and Humanoid_upvr.Health <= Humanoid_upvr.MaxHealth * 0.3 then
			awaken()
		end
		if arg1 == 'z' then
			dash()
		end
		if arg1 == 'x' then
			block()
		end
		if arg1 == 'c' then
			dodge()
		end
		if arg1 == 'p' then
			posefunc()
		end
		if arg1 == 'n' then
			taunt()
		end
	end
end)
MobileStuff_upvr.Pose.MouseButton1Click:Connect(function() -- Line 448
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		posefunc()
	end
end)
MobileStuff_upvr.M1.MouseButton1Click:Connect(function() -- Line 453
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		punch()
	end
end)
MobileStuff_upvr.E.MouseButton1Click:Connect(function() -- Line 458
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		abdstrongpunch()
	end
end)
MobileStuff_upvr.T.MouseButton1Click:Connect(function() -- Line 464
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		gun()
	end
end)
MobileStuff_upvr.Y.MouseButton1Click:Connect(function() -- Line 469
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		rhkick()
	end
end)
MobileStuff_upvr.H.MouseButton1Click:Connect(function() -- Line 474
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		awaken()
	end
end)
MobileStuff_upvr.Z.MouseButton1Click:Connect(function() -- Line 479
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		dash()
	end
end)
MobileStuff_upvr.X.MouseButton1Click:Connect(function() -- Line 484
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		block()
	end
end)
MobileStuff_upvr.C.MouseButton1Click:Connect(function() -- Line 489
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Disabled_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		if Disabled_upvr.Value == true then return end
		dodge()
	end
end)
local Heal2_upvr = ReplicatedStorage.Heal2
function heal(arg1, arg2, arg3, arg4, arg5) -- Line 495
	--[[ Upvalues[2]:
		[1]: Torso_upvr (readonly)
		[2]: Heal2_upvr (readonly)
	]]
	if Torso_upvr.Anchored == true then
	else
		Heal2_upvr:FireServer(arg1, arg2, arg3, arg4, arg5)
	end
end
function hito(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13) -- Line 500
	--[[ Upvalues[5]:
		[1]: Character_upvr (readonly)
		[2]: Torso_upvr (readonly)
		[3]: Transparency_upvr (readonly)
		[4]: Blood_upvr (readonly)
		[5]: Damage_upvr (readonly)
	]]
	for _, v_2 in pairs(workspace:GetChildren()) do
		if arg1.Anchored == true then return end
		if v_2:FindFirstChild("Humanoid") and v_2:FindFirstChild("HumanoidRootPart") and v_2 ~= Character_upvr and (v_2:FindFirstChild("HumanoidRootPart").Position - arg1.Position).magnitude < arg3 and v_2:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
			if arg1.Anchored then return end
			heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 15, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 0)
			Transparency_upvr:FireServer(Blood_upvr, true)
			Damage_upvr:FireServer(v_2:FindFirstChild("Humanoid"), arg2, arg4, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
			local StringValue = Instance.new("StringValue", v_2:FindFirstChild("HumanoidRootPart"))
			StringValue.Name = "alabo"
			game.Debris:AddItem(StringValue, arg5)
			wait(0.15)
			Transparency_upvr:FireServer(Blood_upvr, false)
		end
	end
end
local Knock_upvr = ReplicatedStorage.Knock
function hito2(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13) -- Line 522
	--[[ Upvalues[6]:
		[1]: Character_upvr (readonly)
		[2]: Torso_upvr (readonly)
		[3]: Transparency_upvr (readonly)
		[4]: Blood_upvr (readonly)
		[5]: Damage_upvr (readonly)
		[6]: Knock_upvr (readonly)
	]]
	for _, v_3 in pairs(workspace:GetChildren()) do
		if arg1.Anchored == true then return end
		if v_3:FindFirstChild("Humanoid") and v_3:FindFirstChild("HumanoidRootPart") and v_3 ~= Character_upvr and (v_3:FindFirstChild("HumanoidRootPart").Position - arg1.Position).magnitude < arg3 and v_3:FindFirstChild("HumanoidRootPart"):FindFirstChild("alabo") == nil then
			if arg1.Anchored then return end
			local Humanoid = v_3:FindFirstChild("Humanoid")
			heal(Torso_upvr.CFrame * CFrame.new(0, 1, 0) * CFrame.new(math.random(-0.25, 0.25), math.random(-0.25, 0.25), math.random(-0.25, 0.25)), 25, "rbxassetid://1202656211", math.random(9, 11) / 7.5, math.random(9, 11) / 0)
			Transparency_upvr:FireServer(Blood_upvr, true)
			Damage_upvr:FireServer(Humanoid, arg2, arg4, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13)
			Knock_upvr:FireServer(Humanoid)
			local StringValue_2 = Instance.new("StringValue", v_3:FindFirstChild("HumanoidRootPart"))
			StringValue_2.Name = "alabo"
			game.Debris:AddItem(StringValue_2, arg5)
			wait(0.15)
			Transparency_upvr:FireServer(Blood_upvr, false)
		end
	end
end
game.Lighting.TS.Changed:Connect(function() -- Line 545
	--[[ Upvalues[7]:
		[1]: Anchor_upvr (readonly)
		[2]: Torso_upvr (readonly)
		[3]: Right_Arm_upvr (readonly)
		[4]: Left_Arm_upvr (readonly)
		[5]: Right_Leg_upvr (readonly)
		[6]: Left_Leg_upvr (readonly)
		[7]: Head_upvr (readonly)
	]]
	if game.Lighting.TS.Value == true then
		Anchor_upvr:FireServer(Torso_upvr, true)
		Anchor_upvr:FireServer(Right_Arm_upvr, true)
		Anchor_upvr:FireServer(Left_Arm_upvr, true)
		Anchor_upvr:FireServer(Right_Leg_upvr, true)
		Anchor_upvr:FireServer(Left_Leg_upvr, true)
		Anchor_upvr:FireServer(Head_upvr, true)
	elseif game.Lighting.TS.Value == false then
		Anchor_upvr:FireServer(Torso_upvr, false)
		Anchor_upvr:FireServer(Right_Arm_upvr, false)
		Anchor_upvr:FireServer(Left_Arm_upvr, false)
		Anchor_upvr:FireServer(Right_Leg_upvr, false)
		Anchor_upvr:FireServer(Left_Leg_upvr, false)
		Anchor_upvr:FireServer(Head_upvr, false)
	end
end)
if game.Lighting.TS.Value == true then
	Anchor_upvr:FireServer(Torso_upvr, true)
	Anchor_upvr:FireServer(Right_Arm_upvr, true)
	Anchor_upvr:FireServer(Left_Arm_upvr, true)
	Anchor_upvr:FireServer(Right_Leg_upvr, true)
	Anchor_upvr:FireServer(Left_Leg_upvr, true)
	Anchor_upvr:FireServer(Head_upvr, true)
end
game.Lighting.MC.Changed:Connect(function() -- Line 573
	--[[ Upvalues[8]:
		[1]: LocalPlayer_upvr (readonly)
		[2]: Anchor_upvr (readonly)
		[3]: Torso_upvr (readonly)
		[4]: Right_Arm_upvr (readonly)
		[5]: Left_Arm_upvr (readonly)
		[6]: Right_Leg_upvr (readonly)
		[7]: Left_Leg_upvr (readonly)
		[8]: Head_upvr (readonly)
	]]
	if game.Lighting.MC.Value == true then
		LocalPlayer_upvr.PlayerGui:WaitForChild("Mindcrash").Enabled = true
		Anchor_upvr:FireServer(Torso_upvr, true)
		Anchor_upvr:FireServer(Right_Arm_upvr, true)
		Anchor_upvr:FireServer(Left_Arm_upvr, true)
		Anchor_upvr:FireServer(Right_Leg_upvr, true)
		Anchor_upvr:FireServer(Left_Leg_upvr, true)
		Anchor_upvr:FireServer(Head_upvr, true)
	elseif game.Lighting.MC.Value == false then
		LocalPlayer_upvr.PlayerGui:WaitForChild("Mindcrash").Enabled = false
		Anchor_upvr:FireServer(Torso_upvr, false)
		Anchor_upvr:FireServer(Right_Arm_upvr, false)
		Anchor_upvr:FireServer(Left_Arm_upvr, false)
		Anchor_upvr:FireServer(Right_Leg_upvr, false)
		Anchor_upvr:FireServer(Left_Leg_upvr, false)
		Anchor_upvr:FireServer(Head_upvr, false)
	end
end)
if game.Lighting.MC.Value == true then
	LocalPlayer_upvr.PlayerGui:WaitForChild("Mindcrash").Enabled = true
	Anchor_upvr:FireServer(Torso_upvr, true)
	Anchor_upvr:FireServer(Right_Arm_upvr, true)
	Anchor_upvr:FireServer(Left_Arm_upvr, true)
	Anchor_upvr:FireServer(Right_Leg_upvr, true)
	Anchor_upvr:FireServer(Left_Leg_upvr, true)
	Anchor_upvr:FireServer(Head_upvr, true)
end
local Death_upvr = ReplicatedStorage.Death
Humanoid_upvr.HealthChanged:connect(function() -- Line 608
	--[[ Upvalues[3]:
		[1]: Humanoid_upvr (readonly)
		[2]: LocalPlayer_upvr (readonly)
		[3]: Death_upvr (readonly)
	]]
	if Humanoid_upvr.Health < 1 then
		LocalPlayer_upvr.PlayerGui:WaitForChild("DeathGUI").Enabled = true
		Humanoid_upvr:SetStateEnabled(3, false)
		Humanoid_upvr:SetStateEnabled(15, false)
		Death_upvr:FireServer(false)
	end
end)
local Knocked_upvr = ReplicatedStorage.Knocked
local GetUp_upvr = ReplicatedStorage.GetUp
ReplicatedStorage.KnockClient.OnClientEvent:connect(function(arg1) -- Line 618
	--[[ Upvalues[3]:
		[1]: Knocked_upvr (readonly)
		[2]: Humanoid_upvr (readonly)
		[3]: GetUp_upvr (readonly)
	]]
	Knocked_upvr:FireServer()
	Humanoid_upvr:SetStateEnabled(3, false)
	wait(1.25)
	if 1 <= Humanoid_upvr.Health then
		GetUp_upvr:FireServer()
		Humanoid_upvr:SetStateEnabled(3, true)
	end
end)
Taunt_upvr.OnClientEvent:Connect(function() -- Line 628
	--[[ Upvalues[1]:
		[1]: var80_upvw (read and write)
	]]
	var80_upvw = false
end)
