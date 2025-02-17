local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Переменные для точек
local pointPosition = nil

-- Создаем GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local SetPointButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")
local RemovePointButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")  -- Кнопка для скрытия/показа меню

ScreenGui.Parent = player:WaitForChild("PlayerGui")
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Active = true
Frame.Draggable = true  -- Чтобы можно было перетаскивать меню

-- Кнопка для установки точки
SetPointButton.Parent = Frame
SetPointButton.Size = UDim2.new(0.3, 0, 0.3, 0)
SetPointButton.Position = UDim2.new(0, 10, 0, 10)
SetPointButton.Text = "Поставить точку"
SetPointButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SetPointButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169) -- Серый цвет

-- Кнопка для телепортации
TeleportButton.Parent = Frame
TeleportButton.Size = UDim2.new(0.3, 0, 0.3, 0)
TeleportButton.Position = UDim2.new(0, 10, 0, 50)
TeleportButton.Text = "Телепортироваться"
TeleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169) -- Серый цвет

-- Кнопка для удаления точки
RemovePointButton.Parent = Frame
RemovePointButton.Size = UDim2.new(0.3, 0, 0.3, 0)
RemovePointButton.Position = UDim2.new(0, 10, 0, 90)
RemovePointButton.Text = "Убрать точку"
RemovePointButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RemovePointButton.BackgroundColor3 = Color3.fromRGB(169, 169, 169) -- Серый цвет

-- Кнопка для закрытия меню
CloseButton.Parent = Frame
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- Кнопка для скрытия/показа меню
ToggleButton.Parent = ScreenGui
ToggleButton.Size = UDim2.new(0, 30, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.Text = "+"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

-- Ставим точку
SetPointButton.MouseButton1Click:Connect(function()
    pointPosition = humanoidRootPart.Position
    print("Точка установлена!")
end)

-- Телепортируемся к точке
TeleportButton.MouseButton1Click:Connect(function()
    if pointPosition then
        humanoidRootPart.CFrame = CFrame.new(pointPosition)
        print("Телепортировались к точке!")
    else
        print("Точка не установлена!")
    end
end)

-- Убираем точку
RemovePointButton.MouseButton1Click:Connect(function()
    pointPosition = nil
    print("Точка убрана!")
end)

-- Закрытие меню
CloseButton.MouseButton1Click:Connect(function()
    Frame.Visible = false
    ToggleButton.Text = "+"
end)

-- Открытие/закрытие меню
ToggleButton.MouseButton1Click:Connect(function()
    if Frame.Visible then
        Frame.Visible = false
        ToggleButton.Text = "+"
    else
        Frame.Visible = true
        ToggleButton.Text = "-"
    end
end)

-- Чтобы меню не пропадало при смерти, сделаем его часть PlayerGui
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Обработчик для того, чтобы меню не пропадало при респавне
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    -- Убедимся, что меню всегда будет показываться
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end)
