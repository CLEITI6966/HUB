local a=game:GetService("Players")local b=a.LocalPlayer;local c=true;local d=Instance.new("ScreenGui")local e=Instance.new("Frame")local f=Instance.new("TextBox")local g=Instance.new("TextButton")local h=Instance.new("TextButton")d.Parent=b:WaitForChild("PlayerGui")d.ResetOnSpawn=false;e.Parent=d;e.BackgroundColor3=Color3.fromRGB(44,44,44)e.Position=UDim2.new(0.5,-100,0.5,-75)e.Size=UDim2.new(0,200,0,150)e.Active=true;e.Draggable=true;e.BorderSizePixel=0;e.BackgroundTransparency=0.1;e.BackgroundColor3=Color3.fromRGB(255,255,255)e.BorderColor3=Color3.fromRGB(0,0,0)local i=Instance.new("UICorner")i.Parent=e;f.Parent=e;f.BackgroundColor3=Color3.fromRGB(255,255,255)f.Position=UDim2.new(0.1,0,0.2,0)f.Size=UDim2.new(0.8,0,0.2,0)f.Font=Enum.Font.SourceSans;f.PlaceholderText="Digite o nome do jogador..."f.Text=""f.TextColor3=Color3.fromRGB(0,0,0)f.TextSize=14;f.BorderSizePixel=0;f.BackgroundTransparency=0.2;local j=Instance.new("UICorner")j.Parent=f;g.Parent=e;g.BackgroundColor3=Color3.fromRGB(0,170,255)g.Position=UDim2.new(0.1,0,0.5,0)g.Size=UDim2.new(0.8,0,0.4,0)g.Font=Enum.Font.SourceSans;g.Text="FLING"g.TextColor3=Color3.fromRGB(255,255,255)g.TextSize=20;g.BorderSizePixel=0;g.BackgroundTransparency=0.2;local k=Instance.new("UICorner")k.Parent=g;h.Parent=e;h.BackgroundColor3=Color3.fromRGB(255,0,0)h.Position=UDim2.new(0.85,0,0.05,0)h.Size=UDim2.new(0.1,0,0.1,0)h.Text="X"h.Font=Enum.Font.SourceSans;h.TextColor3=Color3.fromRGB(255,255,255)h.TextSize=24;h.BorderSizePixel=0;h.BackgroundTransparency=0.2;g.MouseEnter:Connect(function()g.BackgroundColor3=Color3.fromRGB(0,150,255)end)g.MouseLeave:Connect(function()g.BackgroundColor3=Color3.fromRGB(0,170,255)end)h.MouseEnter:Connect(function()h.BackgroundColor3=Color3.fromRGB(200,0,0)end)h.MouseLeave:Connect(function()h.BackgroundColor3=Color3.fromRGB(255,0,0)end)h.MouseButton1Click:Connect(function()d:Destroy()end)b.CharacterAdded:Connect(function()c=false end)local function l(m)m=m:lower()for n,o in next,a:GetPlayers()do if o~=b then if o.Name:lower():find(m)or o.DisplayName:lower():find(m)then return o end end end;return nil end;local function p(q)local r=b.Character;local s=r and r:FindFirstChildOfClass("Humanoid")local t=s and s.RootPart;local u=q.Character;local v=u and u:FindFirstChildOfClass("Humanoid")local w=v and v.RootPart;local x=u and u:FindFirstChild("Head")local y=u and u:FindFirstChildOfClass("Accessory")local z=y and y:FindFirstChild("Handle")if not t then return end;local function A(B,C,D)t.CFrame=CFrame.new(B.Position)*C*D;r:SetPrimaryPartCFrame(CFrame.new(B.Position)*C*D)t.Velocity=Vector3.new(9e7,9e7*10,9e7)t.RotVelocity=Vector3.new(9e8,9e8,9e8)end;local function E(B)local F=1000;local G=tick()local H=0;for I=1,999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999 do if t and v then if B.Velocity.Magnitude<50 then H=H+100;A(B,CFrame.new(0,1.5,0)+v.MoveDirection*B.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(H),0,0))task.wait()A(B,CFrame.new(0,-1.5,0)+v.MoveDirection*B.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(H),0,0))task.wait()A(B,CFrame.new(2.25,1.5,-2.25)+v.MoveDirection*B.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(H),0,0))task.wait()A(B,CFrame.new(-2.25,-1.5,2.25)+v.MoveDirection*B.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(H),0,0))task.wait()else A(B,CFrame.new(0,1.5,v.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()end else break end end end;if w and x then E(x)elseif w and not x then E(w)elseif not w and x then E(x)elseif y and z then E(z)end end;g.MouseButton1Click:Connect(function()local J=f.Text;local K=l(J)if K then p(K)else print("Jogador não encontrado!")end end)
