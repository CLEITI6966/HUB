local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local running = true

-- Criar a GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton") -- Botão de fechar

ScreenGui.Parent = Player:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Active = true
Frame.Draggable = true -- Permite que o Frame seja arrastável
Frame.BorderSizePixel = 0
Frame.BackgroundTransparency = 0.1
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)

-- Adicionar bordas arredondadas
local corner = Instance.new("UICorner")
corner.Parent = Frame

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.1, 0, 0.2, 0)
TextBox.Size = UDim2.new(0.8, 0, 0.2, 0)
TextBox.Font = Enum.Font.SourceSans
TextBox.PlaceholderText = "Digite o nome do jogador..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 14
TextBox.BorderSizePixel = 0
TextBox.BackgroundTransparency = 0.2

-- Adicionar bordas arredondadas
local textBoxCorner = Instance.new("UICorner")
textBoxCorner.Parent = TextBox

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
TextButton.Position = UDim2.new(0.1, 0, 0.5, 0)
TextButton.Size = UDim2.new(0.8, 0, 0.4, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "FLING"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 20
TextButton.BorderSizePixel = 0
TextButton.BackgroundTransparency = 0.2

-- Adicionar bordas arredondadas
local buttonCorner = Instance.new("UICorner")
buttonCorner.Parent = TextButton

-- Criar e configurar o botão de fechar
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Cor vermelha
CloseButton.Position = UDim2.new(0.85, 0, 0.05, 0) -- Posição no canto superior direito
CloseButton.Size = UDim2.new(0.1, 0, 0.1, 0) -- Tamanho do botão
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.BorderSizePixel = 0

-- Adicionar bordas arredondadas
local closeButtonCorner = Instance.new("UICorner")
closeButtonCorner.Parent = CloseButton

-- Efeitos de hover no botão
TextButton.MouseEnter:Connect(function()
    TextButton.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
end)

TextButton.MouseLeave:Connect(function()
    TextButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
end)

-- Função para fechar a GUI
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy() -- Destroi a GUI
end)

-- Função para executar a ação
local function performAction(targetName)
    for i = 999999999999999999999999999999999999999999999999999999999999999999999999999, math.huge do
        if not running then
            break
        end

        if not Player.Character or not Player.Character.Parent then
            running = false
            break
        end

        local Players = game:GetService("Players")

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
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end

            local function SFBasePart(BasePart)
                local TimeToWait = 1000
                local Time = tick()
                local Angle = 0

                repeat
                    if RootPart and THumanoid then
                        if BasePart.Velocity.Magnitude < 50 then
                            Angle = Angle + 100
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
                until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or Humanoid.Health <= 0 or tick() > Time + TimeToWait
            end

            if TRootPart and THead then
                SFBasePart(THead)
            elseif TRootPart and not THead then
                SFBasePart(TRootPart)
            elseif not TRootPart and THead then
                SFBasePart(THead)
            elseif Accessory and Handle then
                SFBasePart(Handle)
            end
        end

        local targetPlayer = GetPlayer(targetName)

        if targetPlayer then
            SkidFling(targetPlayer)
        end

        wait(0)
    end
end

-- Conectar a função do botão
TextButton.MouseButton1Click:Connect(function()
    local targetName = TextBox.Text -- Obter o nome do jogador do TextBox
    if targetName and targetName ~= "" then
        performAction(targetName) -- Chamar a função com o nome inserido
    end
end)

-- Lidar com a desconexão do personagem
Player.CharacterAdded:Connect(function()
    running = false
end)
