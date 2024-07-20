local players = game:GetService("Players")

local function highlightPlayer(player)
  local character = player.Character
  if character then
    local highlight = script.Parent:FindFirstChild("Highlight") -- Replace with your highlight object's name
    if highlight then
      local highlightClone = highlight:Clone()
      highlightClone.Parent = character
      highlightClone.Enabled = true -- Make sure highlight object is initially disabled in your workspace
      
      -- Add Interaction (Optional):
      highlightClone.Touched:Connect(function(touchingPart)
        if touchingPart.Parent:IsA("Player") then -- Player touched the highlight
          local otherPlayer = touchingPart.Parent
          -- Do something fun (e.g., teleport both players, play a sound effect)
          print(player.Name .. " touched " .. otherPlayer.Name .. "'s highlight!")
          -- Example: Teleport both players to a random location
          local randomX = math.random(-50, 50)
          local randomZ = math.random(-50, 50)
          player.Character.HumanoidRootPart.CFrame = workspace.TeleportLocations[math.random(#workspace.TeleportLocations)].CFrame
          otherPlayer.Character.HumanoidRootPart.CFrame = workspace.TeleportLocations[math.random(#workspace.TeleportLocations)].CFrame
        end
      end)
    end
  end
end

players.PlayerAdded:Connect(highlightPlayer)

for _, player in pairs(players:GetPlayers()) do
  highlightPlayer(player)
end
