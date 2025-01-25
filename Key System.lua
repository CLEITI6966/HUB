local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Player = game.Players.LocalPlayer

local Window = OrionLib:MakeWindow({
	Name = "Key System",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "KeySystem",
	IntroText = "Verificando Chave..."
})

getgenv().Key = "CLEITI6966 6I3V1J3Z8ZM7VXB O PIOR"
getgenv().KeyInput = "" -- Variável para a chave inserida

local Tab = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddTextbox({
	Name = "Insira a Chave",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		getgenv().KeyInput = Value
	end
})

Tab:AddButton({
	Name = "Verificar Chave",
	Callback = function()
		if getgenv().KeyInput == getgenv().Key then
			OrionLib:MakeNotification({
				Name = "Sucesso!",
				Content = "Chave correta! Script carregado.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			wait(1)
			OrionLib:Destroy()
			wait(0.3)
			loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub'))()
		else
			OrionLib:MakeNotification({
				Name = "Erro!",
				Content = "Chave incorreta, tente novamente.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end
	end
})

OrionLib:Init()
