-- Простой скрипт для определения маньяка и шерифа в игре Murder Mystery 2
-- Внимание: использование этого скрипта может нарушать правила игры и привести к блокировке аккаунта

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local BillboardGuiMurderer = Instance.new("BillboardGui")
local TextLabelMurderer = Instance.new("TextLabel")
local BillboardGuiSheriff = Instance.new("BillboardGui")
local TextLabelSheriff = Instance.new("TextLabel")

local murdererFound = false
local sheriffFound = false

-- Создаем надпись для маньяка
BillboardGuiMurderer.Size = UDim2.new(5, 0, 3, 0)
BillboardGuiMurderer.StudsOffset = Vector3.new(0, 4, 0)
BillboardGuiMurderer.Adornee = nil
BillboardGuiMurderer.AlwaysOnTop = true
TextLabelMurderer.Parent = BillboardGuiMurderer
TextLabelMurderer.Size = UDim2.new(1, 0, 1, 0)
TextLabelMurderer.BackgroundTransparency = 1
TextLabelMurderer.TextColor3 = Color3.new(1, 0, 0)
TextLabelMurderer.Font = Enum.Font.SourceSansBold
TextLabelMurderer.TextScaled = true
TextLabelMurderer.Text = "МАНЬЯК"

-- Создаем надпись для шерифа
BillboardGuiSheriff.Size = UDim2.new(5, 0, 3, 0)
BillboardGuiSheriff.StudsOffset = Vector3.new(0, 4, 0)
BillboardGuiSheriff.Adornee = nil
BillboardGuiSheriff.AlwaysOnTop = true
TextLabelSheriff.Parent = BillboardGuiSheriff
TextLabelSheriff.Size = UDim2.new(1, 0, 1, 0)
TextLabelSheriff.BackgroundTransparency = 1
TextLabelSheriff.TextColor3 = Color3.new(0, 0, 1)
TextLabelSheriff.Font = Enum.Font.SourceSansBold
TextLabelSheriff.TextScaled = true
TextLabelSheriff.Text = "ШЕРИФ"

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

                        -- Помещаем надпись над маньяком
                        BillboardGuiMurderer.Adornee = character.Head
                        BillboardGuiMurderer.Parent = character.Head

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

local function findSheriff()
    for _, player in ipairs(Players:GetPlayers()) do
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local backpack = player:FindFirstChild("Backpack")
                if backpack then
                    local gun = backpack:FindFirstChild("Gun")
                    if gun then
                        sheriffFound = true
                        print("Шериф найден! Игрок: " .. player.Name)
                        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                            "Шериф найден! Игрок: " .. player.Name, "All"
                        )

                        -- Помещаем надпись над шерифом
                        BillboardGuiSheriff.Adornee =character.Head
                        BillboardGuiSheriff.Parent = character.Head

                        break
                    end
                end
            end
        end
    end

    if not sheriffFound then
        print("Шериф не найден.")
    end
end

findMurderer()
findSheriff()
