local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local murdererFound = false

local function findMurderer()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local backpack = player:FindFirstChild("Backpack")
                if backpack then
                    local knife = backpack:FindFirstChild("Knife")
                    if knife then
                        murdererFound = true
                        print("Маньяк найден! Игрок: " .. player.Name)
                        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                            "Маньяк найден! Игрок: " .. player.Name, "All"
                        )
                        break
                    end
                end
            end
        end
    end

    if not murdererFound then
        print("Маньяк не найден.")
    end
end

findMurderer()
