local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
task.wait(3)
local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera
local playerGui = lp:WaitForChild("PlayerGui")
local character = lp.Character or lp.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")
local aimEnabled = false
local TargetAnimations = {
  Mahoraga = "rbxassetid://138852224035589",
  Todo = "rbxassetid://94720627091769"
}
local aimTimer = 0
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AimToggleGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui
local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "StatusLabel" 
statusLabel.Size = UDim2.new(0, 150, 0, 40)
statusLabel.Position = UDim2.new(1, -160, 1, -50)
statusLabel.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
statusLabel.BackgroundTransparency = 0.7
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextSize = 14
statusLabel.Text = ""
statusLabel.BorderSizePixel = 0 
statusLabel.Parent = screenGui 
statusLabel.Visible = false
local corner = Instance.new("UICorner") 
corner.CornerRadius = UDim.new(0, 8) 
corner.Parent = statusLabel
humanoid.AnimationPlayed:Connect(function(track)
  if track.Animation.AnimationId == TargetAnimations.Todo or track.Animation.AnimationId == TargetAnimations.Mahoraga then
    wait(0.8)
    aimEnabled = true
    aimTimer = 0
    statusLabel.Visible = true
    statusLabel.Text = "🎯 Aim Active (1.8s)"
    print("animation detected - aim on for 1.8s")
  end
end)
RunService.Heartbeat:Connect(function()
  if aimEnabled then
    aimTimer = aimTimer + (1/60)
    local timer = (3 - aimTimer)
    statusLabel.Text = "🎯 Aim Active (" .. tonumber(string.format("%.2f", timer)) .. "s)"
    if aimTimer >= 1.8 then
      aimEnabled = false
      statusLabel.Visible = false
      aimTimer = 0
    end
  end
if not aimEnabled then return end
local character = lp.Character
if not character or not character:FindFirstChild("HumanoidRootPart") then return end
hrp = character.HumanoidRootPart
local targetPos = camera.CFrame.Position + camera.CFrame.LookVector * 70 
hrp.CFrame = CFrame.lookAt(hrp.Position, targetPos)
end)
lp.CharacterAdded:Connect(function(newChar)
  character = newChar
  hrp = newChar:WaitForChild("HumanoidRootPart")
  humanoid = newChar:WaitForChild("Humanoid") 
  aimEnabled = false 
  aimTimer = 0
  statusLabel.Visible = false
  humanoid.AnimationPlayed:Connect(function(track)
    local animId = track.Animation.AminationId
    if aminId == TargetAnimations.Todo or animId == TargetAnimations.Mahoraga then 
      aimEnabled = true 
      aimTimer = 0 
      statusLabel.Visible = true
      statusLabel.Text = "🎯 Aim Active (1.8s)" 
      print("animation detected - aim on for 1.8s")
    end
  end)
end)