local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

local function onInputBegan(input, gameProcessed)
    if gameProcessed then
        return
    end

    if input.KeyCode == Enum.KeyCode.E then
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            local backpack = player:FindFirstChild("Backpack")
            if humanoid and humanoid.Health > 0 and backpack then
                local knife = backpack:FindFirstChild("Knife")
                if knife then
                    knife.Parent = character
                    local tool = character:FindFirstChild("Knife")
                    if tool then
                        tool:Activate()
                        wait(0.1)
                        tool:Deactivate()
                    end
                end
            end
        end
    end
end

UserInputService.InputBegan:Connect(onInputBegan)
