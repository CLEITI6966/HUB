local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()

local Window = redzlib:MakeWindow({
    Title = "CLEITI6966 HUBS",
    SubTitle = "auto kill",
    SaveFolder = "CLEITI6966 HUBS"
})

-- Criando a aba "Auto Kill Player"
local Tab3 = Window:MakeTab({"Auto Kill Player", "swords"})

-- Dropdown para selecionar jogadores
local playerList = {}
local Players = game:GetService("Players")

for _, player in ipairs(Players:GetPlayers()) do
    table.insert(playerList, player.Name)
end

local selectedPlayer = nil

Tab3:AddDropdown({
    Name = "Selecionar Jogador",
    Options = playerList,
    Callback = function(Value)
        selectedPlayer = Players:FindFirstChild(Value)
    end
})

-- Toggle para Auto Kill Player (novo)
local AutoKillEnabled = false
local speed = 300 -- Velocidade do personagem

-- Serviços do Roblox
local RunService = game:GetService("RunService")

-- Função para seguir o jogador alvo
local function followTarget(target)
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local targetChar = target.Character or target.CharacterAdded:Wait()
    local targetRootPart = targetChar:WaitForChild("HumanoidRootPart")
    
    -- Adicionando BodyVelocity para movimentação em todas as direções (X, Y, Z)
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1e4, 1e4, 1e4) -- Força total aplicada em X, Y e Z
    bodyVelocity.P = 1000 -- Potência da força
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = humanoidRootPart
    
    -- Atualizar velocidade constantemente para seguir o alvo em todas as direções
    RunService.Heartbeat:Connect(function()
        if AutoKillEnabled and target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local direction = (targetRootPart.Position - humanoidRootPart.Position).unit
            bodyVelocity.Velocity = direction * speed
        else
            bodyVelocity:Destroy() -- Destruir BodyVelocity se o jogador não estiver mais válido ou o Auto Kill for desativado
        end
    end)
end

-- Toggle para ativar o Auto Kill
Tab3:AddToggle({
    Name = "Auto Kill Player",
    Default = false,
    Callback = function(Value)
        AutoKillEnabled = Value
        if AutoKillEnabled and selectedPlayer then
            followTarget(selectedPlayer) -- Inicia a perseguição com o código novo
        else
            print("Selecione um jogador primeiro.")
        end
    end
})

-- Toggle para ver na visão do jogador selecionado
local seePlayerEnabled = false
local runConnectionView

Tab3:AddToggle({
    Name = "Ver na Visão do Jogador Selecionado",
    Default = false,
    Callback = function(Value)
        seePlayerEnabled = Value
        local Camera = workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer

        if seePlayerEnabled and selectedPlayer then
            -- Nome do jogador que queremos ver
            local targetPlayerName = selectedPlayer.Name
            local targetPlayer = Players:FindFirstChild(targetPlayerName)

            local function updateView()
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    Camera.CameraSubject = targetPlayer.Character.Humanoid
                else
                    print("Jogador não encontrado ou sem personagem.")
                end
            end

            -- Atualiza a visão continuamente
            runConnectionView = game:GetService("RunService").RenderStepped:Connect(function()
                if seePlayerEnabled then
                    updateView()
                else
                    if runConnectionView then
                        runConnectionView:Disconnect() -- Desconectar o loop se o toggle for desativado
                        runConnectionView = nil -- Limpar referência
                        Camera.CameraSubject = LocalPlayer.Character.Humanoid -- Volta a visão do jogador
                    end
                end
            end)
        else
            if runConnectionView then
                runConnectionView:Disconnect() -- Desconectar o loop se o toggle for desativado
                runConnectionView = nil -- Limpar referência
                Camera.CameraSubject = LocalPlayer.Character.Humanoid -- Volta a visão do jogador
            end
        end
    end
})

-- Botão para Fugir
Tab3:AddButton({
    Name = "Fugir",
    Callback = function()
        -- Definir serviço e variáveis
        local TweenService = game:GetService("TweenService")
        local player = Players.LocalPlayer
        local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")

        -- Criar o BodyVelocity
        local BodyVelocity = Instance.new("BodyVelocity")
        BodyVelocity.Name = "BodyVelocity"
        BodyVelocity.Parent = humanoidRootPart
        BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)

        -- Definir a velocidade de voo
        local speed = 300
        local targetPosition = Vector3.new(0, 9999999, 0)  -- Posição de destino
        local direction = (targetPosition - humanoidRootPart.Position).unit -- Direção normalizada

        -- Aplicar velocidade ao BodyVelocity
        BodyVelocity.Velocity = direction * speed

        -- Tween para mudar suavemente a posição
        local tweenInfo = TweenInfo.new((targetPosition - humanoidRootPart.Position).Magnitude / speed, Enum.EasingStyle.Linear)
        local tween = TweenService:Create(humanoidRootPart, tweenInfo, {CFrame = CFrame.new(targetPosition)})
        tween:Play()

        -- Limpar BodyVelocity quando chegar ao destino
        tween.Completed:Connect(function()
            BodyVelocity:Destroy()
        end)
    end
})

-- Criando a aba "Fast Attack"
local Tab1 = Window:MakeTab({"Fast Attack", "swords"})

-- Variáveis globais de configuração
getgenv().Config = {
    ["FastAttack"] = false,
    ["ClickAttack"] = false,
    ["FastAttackSpeed"] = 1  -- Valor padrão
}

-- Slider para ajustar a velocidade do Fast Attack
Tab1:AddSlider({
    Name = "Velocidade do Fast Attack",
    Min = 0,
    Max = 10,
    Increase = 1,
    Default = getgenv().Config['FastAttackSpeed'],
    Callback = function(Value)
        getgenv().Config['FastAttackSpeed'] = Value
    end
})

-- Função para ativar Fast Attack
local function activateFastAttack()
    local localPlayer = game.Players.LocalPlayer
    local combatFramework = localPlayer.PlayerScripts:WaitForChild("CombatFramework")

    for _, v in pairs(getreg()) do
        if typeof(v) == "function" and getfenv(v).script == combatFramework then
            for _, upvalue in pairs(debug.getupvalues(v)) do
                if typeof(upvalue) == "table" then
                    spawn(function()
                        game:GetService("RunService").RenderStepped:Connect(function()
                            if getgenv().Config['FastAttack'] then
                                pcall(function()
                                    local speedMultiplier = getgenv().Config['FastAttackSpeed']
                                    upvalue.activeController.timeToNextAttack = -0.01 / speedMultiplier  -- Regula a velocidade de ataque
                                    upvalue.activeController.attacking = false
                                    upvalue.activeController.increment = 4
                                    upvalue.activeController.blocking = false
                                    upvalue.activeController.hitboxMagnitude = 150
                                    upvalue.activeController.humanoid.AutoRotate = true
                                    upvalue.activeController.focusStart = 0
                                    upvalue.activeController.currentAttackTrack = 0
                                    sethiddenproperty(localPlayer, "SimulationRaxNerous", math.huge)
                                end)
                            end
                        end)
                    end)
                end
            end
        end
    end
end

-- Função para Click Attack
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().Config['ClickAttack'] then
            pcall(function()
                game:GetService('VirtualUser'):CaptureController()
                game:GetService('VirtualUser'):Button1Down(Vector2.new(0, 1))
            end)
        end
    end)
end)

-- Botão para INICIAR o Fast Attack
Tab1:AddButton({
    Name = "Iniciar Fast Attack",
    Callback = function()
        getgenv().Config['FastAttack'] = true
        getgenv().Config['ClickAttack'] = true
        activateFastAttack()  -- Chama a função para ativar
    end
})

-- Botão para PARAR o Fast Attack
Tab1:AddButton({
    Name = "Parar Fast Attack",
    Callback = function()
        getgenv().Config['FastAttack'] = false
        getgenv().Config['ClickAttack'] = false
    end
})

-- Exibir a interface
Window:Show()

