local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local running = false
local isFlinging = false

-- Criar a GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox1 = Instance.new("TextBox")
local TextBox2 = Instance.new("TextBox")
local TextBox3 = Instance.new("TextBox")
local TextBox4 = Instance.new("TextBox")
local TextBox5 = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
Frame.Position = UDim2.new(0.5, -150, 0.5, -150)
Frame.Size = UDim2.new(0, 300, 0, 300)
Frame.Active = true
Frame.Draggable = true
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.1
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)

local corner = Instance.new("UICorner")
corner.Parent = Frame

local function CreateTextBox(YPosition)
    local TextBox = Instance.new("TextBox")
    TextBox.Parent = Frame
    TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.Position = UDim2.new(0.1, 0, YPosition, 0)
    TextBox.Size = UDim2.new(0.8, 0, 0.1, 0)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.PlaceholderText = "Digite o nome do jogador..."
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    TextBox.TextSize = 14
    TextBox.BorderSizePixel = 0
    TextBox.BackgroundTransparency = 0.2

    local textBoxCorner = Instance.new("UICorner")
    textBoxCorner.Parent = TextBox
    
    return TextBox
end

TextBox1 = CreateTextBox(0.1)
TextBox2 = CreateTextBox(0.25)
TextBox3 = CreateTextBox(0.4)
TextBox4 = CreateTextBox(0.55)
TextBox5 = CreateTextBox(0.7)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
TextButton.Position = UDim2.new(0.1, 0, 0.85, 0)
TextButton.Size = UDim2.new(0.8, 0, 0.1, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "FLING"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 20
TextButton.BorderSizePixel = 0
TextButton.BackgroundTransparency = 0.2

local buttonCorner = Instance.new("UICorner")
buttonCorner.Parent = TextButton

CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0.05, 0)
CloseButton.Size = UDim2.new(0.05, 0, 0.05, 0)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.BorderSizePixel = 0

local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.Parent = CloseButton

TextButton.MouseEnter:Connect(function()
    TextButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
end)

TextButton.MouseLeave:Connect(function()
    TextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Interromper o loop quando o personagem é reiniciado
Player.CharacterAdded:Connect(function()
    running = false
    isFlinging = false
end)

local function GetPlayer(Name)
    Name = Name:lower()
    for _, x in next, Players:GetPlayers() do
        if x ~= Player then
            if x.Name:lower():find(Name) or x.DisplayName:lower():find(Name) then
                return x
            end
        end
    end
    return nil
end

local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and TCharacter:FindFirstChild("HumanoidRootPart")
    local THead = TCharacter and TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")

    if not RootPart then return end

    local function FPos(BasePart, Pos, Ang)
        if BasePart and BasePart:IsA("BasePart") then
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
    end

    local function SFBasePart(BasePart)
        local TimeToWait = 2
        local Time = tick()
        local Angle = 0

        repeat
            if not running or not isFlinging then
                break
            end

            if not TargetPlayer.Character or not TargetPlayer.Character:FindFirstChildOfClass("Humanoid") or not Player.Character then
                break
            end

            if RootPart and THumanoid then
                if BasePart and BasePart:IsA("BasePart") and BasePart.Velocity.Magnitude < 90 then
                    Angle = Angle + 20
                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()
                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()
                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()
                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()
                else
                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                end
            else
                break
            end
        until BasePart.Velocity.Magnitude > 40 or not BasePart.Parent or not TargetPlayer.Character or Humanoid.Health <= 0 or tick() > Time + TimeToWait
    end

    if TRootPart and THead then
        SFBasePart(THead)
    elseif TRootPart then
        SFBasePart(TRootPart)
    elseif Accessory and Handle then
        SFBasePart(Handle)
    end
end

local function performAction()
    running = true
    isFlinging = true
    while running do
        local targetNames = {TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text}
        for _, targetName in ipairs(targetNames) do
            if targetName and targetName ~= "" then
                local targetPlayer = GetPlayer(targetName)
                if targetPlayer then
                    -- Inicia o fling para o jogador alvo
                    SkidFling(targetPlayer)
                end
            end
        end
        wait(0.4) -- Pequena pausa para evitar sobrecarga
    end
    isFlinging = false
end

TextButton.MouseButton1Click:Connect(function()
    if not running then
        performAction()
    else
        running = false
        isFlinging = false
    end
end)
