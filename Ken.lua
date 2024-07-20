local runService = game:GetService("RunService")

local targetCharacter = workspace:FindFirstChild("TargetCharacter") -- Replace with your target object

runService.Heartbeat:Connect(function()
  if targetCharacter then
    local flingForce = Vector3.new(0, 10, 0) -- Adjust force for desired effect
    local flingTarget = targetCharacter.Torso -- Adjust body part for visual effect
    flingTarget.ApplyImpulse(flingTarget.CFrame.upVector * flingForce) -- Apply simulated impulse
  end
end)
