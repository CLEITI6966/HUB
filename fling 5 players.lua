local a=game:GetService("Players")local b=a.LocalPlayer;local c=false;local d=Instance.new("ScreenGui")local e=Instance.new("Frame")local f=Instance.new("TextBox")local g=Instance.new("TextBox")local h=Instance.new("TextBox")local i=Instance.new("TextBox")local j=Instance.new("TextBox")local k=Instance.new("TextButton")local l=Instance.new("TextButton")d.Parent=b:WaitForChild("PlayerGui")d.ResetOnSpawn=false;e.Parent=d;e.BackgroundColor3=Color3.fromRGB(44,44,44)e.Position=UDim2.new(0.5,-150,0.5,-150)e.Size=UDim2.new(0,300,0,300)e.Active=true;e.Draggable=true;e.BorderSizePixel=0;e.BackgroundTransparency=0.1;e.BackgroundColor3=Color3.fromRGB(255,255,255)e.BorderColor3=Color3.fromRGB(0,0,0)local m=Instance.new("UICorner")m.Parent=e;local function n(o)local p=Instance.new("TextBox")p.Parent=e;p.BackgroundColor3=Color3.fromRGB(255,255,255)p.Position=UDim2.new(0.1,0,o,0)p.Size=UDim2.new(0.8,0,0.1,0)p.Font=Enum.Font.SourceSans;p.PlaceholderText="Digite o nome do jogador..."p.Text=""p.TextColor3=Color3.fromRGB(0,0,0)p.TextSize=14;p.BorderSizePixel=0;p.BackgroundTransparency=0.2;local q=Instance.new("UICorner")q.Parent=p;return p end;f=n(0.1)g=n(0.25)h=n(0.4)i=n(0.55)j=n(0.7)k.Parent=e;k.BackgroundColor3=Color3.fromRGB(0,170,255)k.Position=UDim2.new(0.1,0,0.85,0)k.Size=UDim2.new(0.8,0,0.1,0)k.Font=Enum.Font.SourceSans;k.Text="FLING"k.TextColor3=Color3.fromRGB(255,255,255)k.TextSize=20;k.BorderSizePixel=0;k.BackgroundTransparency=0.2;local r=Instance.new("UICorner")r.Parent=k;l.Parent=e;l.BackgroundColor3=Color3.fromRGB(255,0,0)l.Position=UDim2.new(0.9,0,0.05,0)l.Size=UDim2.new(0.05,0,0.05,0)l.Font=Enum.Font.SourceSans;l.Text="X"l.TextColor3=Color3.fromRGB(255,255,255)l.TextSize=20;l.BorderSizePixel=0;local s=Instance.new("UICorner")s.Parent=l;k.MouseEnter:Connect(function()k.BackgroundColor3=Color3.fromRGB(0,150,255)end)k.MouseLeave:Connect(function()k.BackgroundColor3=Color3.fromRGB(0,170,255)end)l.MouseButton1Click:Connect(function()d:Destroy()end)b.CharacterAdded:Connect(function()c=false end)local function t(u)u=u:lower()for v,w in next,a:GetPlayers()do if w~=b then if w.Name:lower():find(u)or w.DisplayName:lower():find(u)then return w end end end;return nil end;local function x(y)local z=b.Character;local A=z and z:FindFirstChildOfClass("Humanoid")local B=A and A.RootPart;local C=y.Character;local D=C and C:FindFirstChildOfClass("Humanoid")local E=D and D.RootPart;local F=C and C:FindFirstChild("Head")local G=C and C:FindFirstChildOfClass("Accessory")local H=G and G:FindFirstChild("Handle")if not B then return end;local function I(J,K,L)B.CFrame=CFrame.new(J.Position)*K*L;z:SetPrimaryPartCFrame(CFrame.new(J.Position)*K*L)B.Velocity=Vector3.new(9e7,9e7*10,9e7)B.RotVelocity=Vector3.new(9e8,9e8,9e8)end;local function M(J)local N=2;local O=tick()local P=0;repeat if B and D then if J.Velocity.Magnitude<50 then P=P+100;I(J,CFrame.new(0,1.5,0)+D.MoveDirection*J.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(P),0,0))task.wait()I(J,CFrame.new(0,-1.5,0)+D.MoveDirection*J.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(P),0,0))task.wait()I(J,CFrame.new(2.25,1.5,-2.25)+D.MoveDirection*J.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(P),0,0))task.wait()I(J,CFrame.new(-2.25,-1.5,2.25)+D.MoveDirection*J.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(P),0,0))task.wait()else I(J,CFrame.new(0,1.5,D.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()end else break end until J.Velocity.Magnitude>100 or J.Parent~=y.Character or y.Parent~=a or not y.Character==C or A.Health<=0 or tick()>O+N end;if E and F then M(F)elseif E and not F then M(E)elseif not E and F then M(F)elseif G and H then M(H)end end;local function Q()c=true;while c do local R={f.Text,g.Text,h.Text,i.Text,j.Text}for v,S in ipairs(R)do if S and S~=""then local T=t(S)if T then x(T)end end end;wait(0)end end;k.MouseButton1Click:Connect(function()if not c then Q()else c=false end end)
