local a=loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/RedzLibV5/main/Source.Lua"))()local b=a:MakeWindow({Title="CLEITI6966 HUBS",SubTitle="by CLEITI6966",SaveFolder="CLEITI6966 HUBS"})local c=b:MakeTab({"Inicio","rbxassetid://10723407389"})c:AddTextBox({Name="Inserir Nome para RolePlay",PlaceholderText="Digite o nome para RolePlay",Callback=function(d)local e={[1]="RolePlayName",[2]=d}game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(e))end})c:AddTextBox({Name="Inserir Nome para bio",PlaceholderText="Digite o nome para bio",Callback=function(d)local e={[1]="RolePlayBio",[2]=d}game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(e))end})local function f(g,h)local i="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"local j=""local k=math.random(g,h)for l=1,k do local m=math.random(1,#i)j=j..i:sub(m,m)end;return j end;local function n(o,p)local q=false;local r;c:AddToggle({Name=o,Default=false,Callback=function(s)if s then q=true;r=spawn(function()while q do local j=f(4,12)local e={[1]=p,[2]=j}game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(e))wait(0000)end end)else q=false;if r then r:Disconnect()end end end})end;n("Girar Nome Aleatório RP","RolePlayName")n("Girar Nome Aleatório bio","RolePlayBio")local function t(o,p)local u=false;local v;c:AddToggle({Name=o,Default=false,Callback=function(s)local w=game:GetService("ReplicatedStorage")local x=w.RE:FindFirstChild("1RPNam1eColo1r")local y={Color3.new(1,0,0),Color3.new(0,1,0),Color3.new(0,0,1),Color3.new(0,1,1),Color3.new(1,0,1),Color3.new(1,1,0),Color3.new(1,1,1),Color3.new(0,0,0)}if s then u=true;v=spawn(function()while u do for z,A in ipairs(y)do local e={[1]=p,[2]=A}x:FireServer(unpack(e))wait(0.25)end end end)else u=false;if v then v:Disconnect()end end end})end;t("Nome Colorido RP","PickingRPNameColor")t("Nome Colorido bio","PickingRPBioColor")local B=b:MakeTab({"Casas","rbxassetid://10723407389"})B:AddDropdown({Name="Pegar Permissão",Options={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37"},Default="1",Callback=function(C)local D=tonumber(C)if D then local e={[1]="GivePermissionLoopToServer",[2]=game:GetService("Players").LocalPlayer,[3]=D}game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(e))end end})local E=b:MakeTab({"Itens","rbxassetid://10709769841"})E:AddButton({Name="Pegar Sofá",Callback=function()local e={[1]="PickingTools",[2]="Couch"}game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(e))end})local F=b:MakeTab({"Trollar","rbxassetid://10709781460"})F:AddButton({Name="loopfling by cleiti6966",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/CLEITI6966/HUB/refs/heads/main/fling.lua"))()end})F:AddButton({Name="Vira uma Formiguinha",Callback=function()local e={[1]="CharacterSizeDown",[2]=4}game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(e))end})F:AddButton({Name="Resetar Personagem",Callback=function()local e={[1]="CharacterSizeUp",[2]=1}game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(e))end})F:AddButton({Name="LOOPFLING 5 PLAYERS BY CLEITI6966 [TEST]",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/CLEITI6966/HUB/refs/heads/main/fling%205%20players.lua"))()end})local G=b:MakeTab({"Jogadores","rbxassetid://10734920149"})local function H()local I={}for z,J in ipairs(game.Players:GetPlayers())do if J~=game.Players.LocalPlayer then table.insert(I,J.Name)end end;return I end;local K=G:AddDropdown({Name="Selecionar Jogador",Options=H(),Default="",Callback=function(C)_G.selectedPlayer=C end})G:AddButton({Name="Teleportar para Jogador",Callback=function()local J=game.Players:FindFirstChild(_G.selectedPlayer)if J and J.Character and J.Character:FindFirstChild("HumanoidRootPart")then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=J.Character.HumanoidRootPart.CFrame else warn("Jogador não encontrado ou não está disponível.")end end})local L=false;local M;G:AddToggle({Name="Loop Teleportar para Jogador",Default=false,Callback=function(s)L=s;if s then M=game:GetService("RunService").Heartbeat:Connect(function()local J=game.Players:FindFirstChild(_G.selectedPlayer)if J and J.Character and J.Character:FindFirstChild("HumanoidRootPart")and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=J.Character.HumanoidRootPart.CFrame end end)else if M then M:Disconnect()end end end})local N=false;local O;G:AddToggle({Name="Ver Jogador",Default=false,Callback=function(s)local J=game.Players:FindFirstChild(_G.selectedPlayer)if J and J.Character and J.Character:FindFirstChild("HumanoidRootPart")then if s then O=workspace.CurrentCamera;workspace.CurrentCamera.CameraSubject=J.Character.Humanoid;N=true else workspace.CurrentCamera.CameraSubject=game.Players.LocalPlayer.Character.Humanoid;N=false end else warn("Jogador não encontrado ou não está disponível.")end end})G:AddButton({Name="Reiniciar Dropdown",Callback=function()local P=H()K:Refresh(P,true)end})local Q=b:MakeTab({"Outros","rbxassetid://10734950309"})Q:AddButton({Name="Fly Mobile/PC",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/CLEITI6966/HUB/refs/heads/main/fly.lua"))()end})Q:AddButton({Name="VFly Mobile",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/CLEITI6966/HUB/refs/heads/main/vfly.lua"))()end})b:Init()
