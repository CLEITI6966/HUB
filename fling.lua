local a=game:GetService("Players")local b=a.LocalPlayer;local c=true;b.CharacterAdded:Connect(function()c=false end)local d=Instance.new("ScreenGui")local e=Instance.new("Frame")local f=Instance.new("TextBox")local g=Instance.new("TextButton")local h=Instance.new("TextButton")d.Parent=b:WaitForChild("PlayerGui")d.ResetOnSpawn=false;e.Parent=d;e.BackgroundColor3=Color3.fromRGB(44,44,44)e.Position=UDim2.new(0.5,-100,0.5,-75)e.Size=UDim2.new(0,200,0,150)e.Active=true;e.Draggable=true;e.BorderSizePixel=0;e.BackgroundTransparency=0.1;e.BackgroundColor3=Color3.fromRGB(255,255,255)e.BorderColor3=Color3.fromRGB(0,0,0)local i=Instance.new("UICorner")i.Parent=e;f.Parent=e;f.BackgroundColor3=Color3.fromRGB(255,255,255)f.Position=UDim2.new(0.1,0,0.2,0)f.Size=UDim2.new(0.8,0,0.2,0)f.Font=Enum.Font.SourceSans;f.PlaceholderText="Digite o nome do jogador..."f.Text=""f.TextColor3=Color3.fromRGB(0,0,0)f.TextSize=14;f.BorderSizePixel=0;f.BackgroundTransparency=0.2;local j=Instance.new("UICorner")j.Parent=f;g.Parent=e;g.BackgroundColor3=Color3.fromRGB(0,170,255)g.Position=UDim2.new(0.1,0,0.5,0)g.Size=UDim2.new(0.8,0,0.4,0)g.Font=Enum.Font.SourceSans;g.Text="FLING"g.TextColor3=Color3.fromRGB(255,255,255)g.TextSize=20;g.BorderSizePixel=0;g.BackgroundTransparency=0.2;local k=Instance.new("UICorner")k.Parent=g;h.Parent=e;h.BackgroundColor3=Color3.fromRGB(255,0,0)h.Position=UDim2.new(0.85,0,0.05,0)h.Size=UDim2.new(0.1,0,0.1,0)h.Font=Enum.Font.SourceSans;h.Text="X"h.TextColor3=Color3.fromRGB(255,255,255)h.TextSize=20;h.BorderSizePixel=0;local l=Instance.new("UICorner")l.Parent=h;g.MouseEnter:Connect(function()g.BackgroundColor3=Color3.fromRGB(0,150,255)end)g.MouseLeave:Connect(function()g.BackgroundColor3=Color3.fromRGB(0,170,255)end)h.MouseButton1Click:Connect(function()d:Destroy()end)local function m(n)for o=999999999999999999999999999999999999999999999999999999999999999999999999999,math.huge do if not c then break end;if not b.Character or not b.Character.Parent then c=false;break end;local function p(q)q=q:lower()for r,s in next,a:GetPlayers()do if s~=b then if s.Name:lower():find(q)or s.DisplayName:lower():find(q)then return s end end end;return nil end;local function t(u)local v=b.Character;local w=v and v:FindFirstChildOfClass("Humanoid")local x=w and w.RootPart;local y=u.Character;local z=y and y:FindFirstChildOfClass("Humanoid")local A=z and z.RootPart;local B=y and y:FindFirstChild("Head")local C=y and y:FindFirstChildOfClass("Accessory")local D=C and C:FindFirstChild("Handle")if not x then return end;local function E(F,G,H)x.CFrame=CFrame.new(F.Position)*G*H;v:SetPrimaryPartCFrame(CFrame.new(F.Position)*G*H)x.Velocity=Vector3.new(9e7,9e7*10,9e7)x.RotVelocity=Vector3.new(9e8,9e8,9e8)end;local function I(F)local J=1000;local K=tick()local L=0;repeat if x and z then if F.Velocity.Magnitude<50 then L=L+100;E(F,CFrame.new(0,1.5,0)+z.MoveDirection*F.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(L),0,0))task.wait()E(F,CFrame.new(0,-1.5,0)+z.MoveDirection*F.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(L),0,0))task.wait()E(F,CFrame.new(2.25,1.5,-2.25)+z.MoveDirection*F.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(L),0,0))task.wait()E(F,CFrame.new(-2.25,-1.5,2.25)+z.MoveDirection*F.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(L),0,0))task.wait()else E(F,CFrame.new(0,1.5,z.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()end else break end until F.Velocity.Magnitude>500 or F.Parent~=u.Character or u.Parent~=a or not u.Character==y or w.Health<=0 or tick()>K+J end;if A and B then I(B)elseif A and not B then I(A)elseif not A and B then I(B)elseif C and D then I(D)end end;local M=p(n)if M then t(M)end;wait(1)end end;g.MouseButton1Click:Connect(function()if c then local n=f.Text;if n and n~=""then m(n)end end end)
