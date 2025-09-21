--[[  K3ngx1RIV Menu (Version: 2.1.2)  ]]

local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local TweenService=game:GetService("TweenService")
local Lighting=game:GetService("Lighting")
local RunService=game:GetService("RunService")
local SoundService=game:GetService("SoundService")
local PhysicsService=game:GetService("PhysicsService")
local LP=Players.LocalPlayer
local Camera=workspace.CurrentCamera

local DEF_BG=Color3.fromRGB(24,24,28)
local DEF_SIDE=Color3.fromRGB(35,35,42)
local DEF_CARD=Color3.fromRGB(40,40,48)
local DEF_TXT=Color3.fromRGB(235,235,240)
local C_BG=DEF_BG
local C_SIDE=DEF_SIDE
local C_CARD=DEF_CARD
local C_TXT=DEF_TXT
local C_MUT=Color3.fromRGB(170,170,178)
local C_STK=Color3.fromRGB(58,58,70)
local C_DIV=Color3.fromRGB(52,52,60)
local ACCENT=Color3.fromRGB(150,105,255)

local OLD_BG={Color3.fromRGB(24,24,28),Color3.fromRGB(30,30,36),Color3.fromRGB(35,35,42),Color3.fromRGB(40,40,48),Color3.fromRGB(50,50,60)}
local OLD_SIDE={Color3.fromRGB(35,35,42),Color3.fromRGB(44,44,54),Color3.fromRGB(58,58,70)}
local BLUES={} do local src={{10,18,28},{12,22,36},{14,26,44},{16,30,52},{18,34,60},{20,38,68},{22,42,76},{24,46,84},{26,50,92},{28,54,100},{30,60,112},{32,66,124},{34,72,136},{36,78,148},{38,84,160},{40,90,172}} for _,rgb in ipairs(src)do table.insert(BLUES,Color3.fromRGB(rgb[1],rgb[2],rgb[3])) end end
local TXT_CHOICES={Color3.fromRGB(255,255,255),Color3.fromRGB(220,220,225),Color3.fromRGB(190,190,200),Color3.fromRGB(150,150,160),Color3.fromRGB(120,120,130),Color3.fromRGB(255,0,0),Color3.fromRGB(0,200,80),Color3.fromRGB(0,170,255)}

local gui=Instance.new("ScreenGui",LP:WaitForChild("PlayerGui"));gui.Name="K3_Menu";gui.IgnoreGuiInset=true;gui.ResetOnSpawn=false;gui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
local overlay=Instance.new("ScreenGui",LP.PlayerGui);overlay.Name="K3_Overlay";overlay.IgnoreGuiInset=true;overlay.ResetOnSpawn=false;overlay.DisplayOrder=1000

local win=Instance.new("Frame",gui);win.Size=UDim2.fromScale(0.62,0.62);win.Position=UDim2.fromScale(0.19,0.19);win.BackgroundColor3=C_BG;win.BorderSizePixel=0;win.ZIndex=10;win.ClipsDescendants=true
Instance.new("UICorner",win).CornerRadius=UDim.new(0,14);local ws=Instance.new("UIStroke",win);ws.Color=C_STK;ws.Transparency=0.35
local sh=Instance.new("ImageLabel",win);sh.BackgroundTransparency=1;sh.Image="rbxassetid://5028857084";sh.ScaleType=Enum.ScaleType.Slice;sh.SliceCenter=Rect.new(24,24,276,276);sh.Size=UDim2.fromScale(1,1);sh.Position=UDim2.fromOffset(-10,-10);sh.ImageTransparency=0.35;sh.ZIndex=9

local top=Instance.new("Frame",win);top.Size=UDim2.new(1,0,0,44);top.BackgroundColor3=C_SIDE;top.BorderSizePixel=0;top.ZIndex=11
Instance.new("UICorner",top).CornerRadius=UDim.new(0,14)
local title=Instance.new("TextLabel",top);title.BackgroundTransparency=1;title.Font=Enum.Font.GothamBold;title.Text="K3ngx1RIV Menu By K3ngx1";title.TextSize=18;title.TextColor3=C_TXT;title.TextXAlignment=Enum.TextXAlignment.Left;title.Position=UDim2.fromOffset(16,0);title.Size=UDim2.new(1,-120,1,0);title.ZIndex=12
local function topBtn(off,sym,name)local b=Instance.new("TextButton",top)b.Name=name;b.Text=sym;b.Font=Enum.Font.GothamBold;b.TextColor3=C_TXT;b.TextScaled=true;b.BackgroundColor3=C_SIDE;b.BorderSizePixel=0;b.AutoButtonColor=true;b.Size=UDim2.fromOffset(24,24)b.AnchorPoint=Vector2.new(1,0.5)b.Position=UDim2.new(1,-off,0.5,0)b.ZIndex=12 return b end
local btnClose=topBtn(12,"×","Close");local btnMin=topBtn(44,"–","Min")

local side=Instance.new("Frame",win);side.BackgroundColor3=C_SIDE;side.BorderSizePixel=0;side.Position=UDim2.new(0,0,0,44);side.Size=UDim2.new(0,210,1,-44);side.ZIndex=10
Instance.new("UICorner",side).CornerRadius=UDim.new(0,14)
local spad=Instance.new("UIPadding",side)spad.PaddingTop=UDim.new(0,12)spad.PaddingLeft=UDim.new(0,12)spad.PaddingRight=UDim.new(0,12)
local sl=Instance.new("UIListLayout",side)sl.Padding=UDim.new(0,8)sl.HorizontalAlignment=Enum.HorizontalAlignment.Center

local content=Instance.new("ScrollingFrame",win);content.Name="Content";content.BackgroundColor3=C_BG;content.BorderSizePixel=0;content.Position=UDim2.new(0,210,0,44);content.Size=UDim2.new(1,-210,1,-44);content.ZIndex=10
content.ScrollBarThickness=6;content.AutomaticCanvasSize=Enum.AutomaticSize.Y;content.CanvasSize=UDim2.fromOffset(0,0)
local cpad=Instance.new("UIPadding",content)cpad.PaddingTop=UDim.new(0,14)cpad.PaddingLeft=UDim.new(0,14)cpad.PaddingRight=UDim.new(0,14)cpad.PaddingBottom=UDim.new(0,14)

local recolorLabels={}
local function trackLabel(x)table.insert(recolorLabels,x)end
local function vlist(p)local l=Instance.new("UIListLayout",p)l.Padding=UDim.new(0,10)l.SortOrder=Enum.SortOrder.LayoutOrder return l end
local function section(p,txt)local holder=Instance.new("Frame",p)holder.BackgroundTransparency=1;holder.Size=UDim2.new(1,0,0,24)
	local t=Instance.new("TextLabel",holder)t.BackgroundTransparency=1;t.Font=Enum.Font.GothamBold;t.Text=txt;t.TextSize=16;t.TextColor3=C_TXT;trackLabel(t);t.TextXAlignment=Enum.TextXAlignment.Left;t.Size=UDim2.new(1,0,1,0)
	local line=Instance.new("Frame",p)line.BackgroundColor3=C_DIV;line.BorderSizePixel=0;line.Size=UDim2.new(1,0,0,2);line.Position=UDim2.new(0,0,1,-2)end

local function makeDropdown(anchorAbs,options,onChoose)
	local dd=Instance.new("Frame",content)dd.BackgroundColor3=C_SIDE;dd.BorderSizePixel=0;dd.ZIndex=100;Instance.new("UICorner",dd).CornerRadius=UDim.new(0,8)
	local h=(#options*36)+12;dd.Size=UDim2.new(0,260,0,h);local y=6
	for _,opt in ipairs(options)do local b=Instance.new("TextButton",dd)b.Text=opt;b.Font=Enum.Font.Gotham;b.TextSize=16;b.TextColor3=C_TXT;trackLabel(b);b.BackgroundColor3=C_CARD;b.BorderSizePixel=0;b.Size=UDim2.new(1,-12,0,30);b.Position=UDim2.new(0,6,0,y)Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
		b.MouseButton1Click:Connect(function()dd:Destroy()pcall(onChoose,opt)end)y=y+36 end
	dd.Position=UDim2.new(0,anchorAbs.X,0,anchorAbs.Y+44+content.CanvasPosition.Y);return dd
end

local function cell(parent,text,rightText)
	local f=Instance.new("Frame",parent)f.BackgroundColor3=C_CARD;f.BorderSizePixel=0;f.Size=UDim2.new(1,0,0,40);f.ZIndex=10;Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)
	local st=Instance.new("UIStroke",f)st.Color=C_STK;st.Transparency=0.45
	local lbl=Instance.new("TextLabel",f)lbl.BackgroundTransparency=1;lbl.Font=Enum.Font.Gotham;lbl.Text=text;lbl.TextSize=16;lbl.TextColor3=C_TXT;trackLabel(lbl);lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Position=UDim2.fromOffset(12,0);lbl.Size=UDim2.new(0.6,0,1,0)
	if rightText then local r=Instance.new("TextLabel",f)r.Name="Right";r.BackgroundTransparency=1;r.Font=Enum.Font.GothamBold;r.Text=rightText;r.TextSize=16;r.TextColor3=C_TXT;trackLabel(r);r.TextXAlignment=Enum.TextXAlignment.Right;r.Position=UDim2.new(1,-220,0,0);r.Size=UDim2.new(0,210,1,0);r.TextTruncate=Enum.TextTruncate.AtEnd end
	local box=Instance.new("TextButton",f)box.Name="Toggle";box.Text="";box.AutoButtonColor=true;box.BackgroundColor3=C_SIDE;box.BorderSizePixel=0;box.Size=UDim2.fromOffset(34,34);box.Position=UDim2.new(1,-70,0.5,-17);box.ZIndex=11;Instance.new("UICorner",box).CornerRadius=UDim.new(0,8)
	local fill=Instance.new("Frame",box)fill.Name="Fill";fill.BackgroundColor3=ACCENT;fill.BorderSizePixel=0;fill.AnchorPoint=Vector2.new(0.5,0.5);fill.Position=UDim2.fromScale(0.5,0.5);fill.Size=UDim2.fromOffset(0,0);fill.Visible=false;fill.ZIndex=12;Instance.new("UICorner",fill).CornerRadius=UDim.new(0,8)
	return f
end

local function listCell(parent,labelText,initialRight)
	local f=Instance.new("TextButton",parent)f.BackgroundColor3=C_CARD;f.BorderSizePixel=0;f.AutoButtonColor=true;f.Size=UDim2.new(1,0,0,44);f.ZIndex=10;f.Text="";Instance.new("UICorner",f).CornerRadius=UDim.new(0,8)
	local st=Instance.new("UIStroke",f)st.Color=C_STK;st.Transparency=0.45
	local lbl=Instance.new("TextLabel",f)lbl.BackgroundTransparency=1;lbl.Font=Enum.Font.Gotham;lbl.Text=labelText;lbl.TextSize=18;lbl.TextColor3=C_TXT;trackLabel(lbl);lbl.TextXAlignment=Enum.TextXAlignment.Left;lbl.Position=UDim2.fromOffset(12,0);lbl.Size=UDim2.new(0.6,0,1,0)
	local right=Instance.new("TextLabel",f)right.Name="Right";right.BackgroundTransparency=1;right.Font=Enum.Font.GothamBold;right.Text=initialRight or "Select";right.TextSize=16;right.TextColor3=C_TXT;trackLabel(right)
	right.TextXAlignment=Enum.TextXAlignment.Right;right.Position=UDim2.new(1,-240,0,0);right.Size=UDim2.new(0,230,1,0);right.TextTruncate=Enum.TextTruncate.AtEnd
	return f,right
end

local tabFrames,currentBtn={},nil
local function makeSideButton(text)local b=Instance.new("TextButton",side)b.Text=text;b.AutoButtonColor=true;b.Font=Enum.Font.GothamMedium;b.TextSize=15;b.TextColor3=C_MUT;b.BackgroundColor3=C_SIDE;b.BorderSizePixel=0;b.Size=UDim2.new(1,0,0,36);b.ZIndex=11
	Instance.new("UICorner",b).CornerRadius=UDim.new(0,9);local st=Instance.new("UIStroke",b)st.Color=C_STK;st.Transparency=0.5
	b.MouseEnter:Connect(function()if b~=currentBtn then b.BackgroundColor3=Color3.fromRGB(44,44,54) end end)
	b.MouseLeave:Connect(function()if b~=currentBtn then b.BackgroundColor3=C_SIDE end end)return b end
local function makeTab(name)local fr=Instance.new("Frame",content)fr.Name=name;fr.BackgroundTransparency=1;fr.Visible=false;fr.Size=UDim2.fromScale(1,1);fr.ZIndex=10;vlist(fr);tabFrames[name]=fr;return fr end
local REDTXT=Color3.fromRGB(255,40,40)
local function selectTab(btn)if currentBtn then currentBtn.BackgroundColor3=C_SIDE currentBtn.TextColor3=C_MUT end;currentBtn=btn;btn.BackgroundColor3=C_BG;btn.TextColor3=REDTXT;for n,fr in pairs(tabFrames)do fr.Visible=(n==btn.Text)end end
local buttons={}for _,n in ipairs({"Credits","Main","OP","ESP","Others","Config"})do buttons[n]=makeSideButton(n)end

-- Credits
local frCredits=makeTab("Credits")
section(frCredits,"Info:")
local creditsLabel=Instance.new("TextLabel",frCredits);creditsLabel.BackgroundTransparency=1;creditsLabel.Font=Enum.Font.Gotham;creditsLabel.TextSize=16;creditsLabel.TextColor3=C_TXT;trackLabel(creditsLabel)
creditsLabel.TextXAlignment=Enum.TextXAlignment.Left;creditsLabel.TextYAlignment=Enum.TextYAlignment.Top;creditsLabel.TextWrapped=true;creditsLabel.Size=UDim2.new(1,0,0,120)
creditsLabel.Text="K3ngx1RIV Menu thanks for using it.\nBy K3ngx1RIV & Caviarfloof\nVersion: 2.1.2"

-- Main tab
local frMain=makeTab("Main");section(frMain,"Player")

local speedCell=cell(frMain,"Walk Speed","16")
local speedIn=Instance.new("TextBox",frMain);speedIn.BackgroundColor3=C_SIDE;speedIn.BorderSizePixel=0;speedIn.PlaceholderText="Value (e.g. 24)";speedIn.PlaceholderColor3=C_MUT;speedIn.TextColor3=C_TXT;speedIn.Font=Enum.Font.Gotham;speedIn.TextSize=14;speedIn.Size=UDim2.new(1,0,0,30)Instance.new("UICorner",speedIn).CornerRadius=UDim.new(0,8)

local jumpCell=cell(frMain,"Jump Power","50")
local jumpIn=Instance.new("TextBox",frMain);jumpIn.BackgroundColor3=C_SIDE;jumpIn.BorderSizePixel=0;jumpIn.PlaceholderText="Value (e.g. 60)";jumpIn.PlaceholderColor3=C_MUT;jumpIn.TextColor3=C_TXT;jumpIn.Font=Enum.Font.Gotham;jumpIn.TextSize=14;jumpIn.Size=UDim2.new(1,0,0,30)Instance.new("UICorner",jumpIn).CornerRadius=UDim.new(0,8)

local followTargetCell=cell(frMain,"Teleport Target","None")
local followRight=followTargetCell:FindFirstChild("Right")
local selectedFollowPlayer=nil
local followLoop=nil

local function openPlayersDropdown(anchor)local list={}for _,p in ipairs(Players:GetPlayers())do if p~=LP then table.insert(list,p.Name) end end;if #list==0 then table.insert(list,"No players") end
	makeDropdown(anchor,list,function(opt)if opt=="No players" then selectedFollowPlayer=nil followRight.Text="None" return end;selectedFollowPlayer=opt;followRight.Text=opt end)end
followTargetCell.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then local abs=followTargetCell.AbsolutePosition-content.AbsolutePosition;openPlayersDropdown(Vector2.new(abs.X,abs.Y)) end end)

local function hum()local ch=LP.Character or LP.CharacterAdded:Wait()return ch:FindFirstChildOfClass("Humanoid")end
local function hrp()local ch=LP.Character or LP.CharacterAdded:Wait()return ch:FindFirstChild("HumanoidRootPart")end

local onToggleMap=setmetatable({},{__mode="k"})
local function bindToggle(frame,fn)local btn=frame:FindFirstChild("Toggle")if not btn then return end onToggleMap[btn]=fn
	btn.MouseButton1Click:Connect(function()local fill=btn:FindFirstChild("Fill")local on=not fill.Visible;fill.Visible=true;local goal=on and UDim2.fromOffset(34,34) or UDim2.fromOffset(0,0)
		TweenService:Create(fill,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=goal}):Play()
		if not on then task.delay(0.13,function()if fill then fill.Visible=false end end)end
		if onToggleMap[btn] then onToggleMap[btn](on) end end)end

bindToggle(followTargetCell,function(on)if on then if selectedFollowPlayer then if followLoop then followLoop:Disconnect()followLoop=nil end
			followLoop=RunService.Heartbeat:Connect(function()local t=Players:FindFirstChild(selectedFollowPlayer)local tH=t and t.Character and t.Character:FindFirstChild("HumanoidRootPart")local me=hrp()if tH and me then me.CFrame=tH.CFrame+Vector3.new(0,2,0) end end)end
	else if followLoop then followLoop:Disconnect()followLoop=nil end end end)

bindToggle(speedCell,function(on)local h=hum()if not h then return end local n=tonumber(speedIn.Text)or 16 h.WalkSpeed=on and n or 16 end)
speedIn.FocusLost:Connect(function(e)if e then local h=hum()if h then local n=tonumber(speedIn.Text)if n then h.WalkSpeed=n end end end end)

bindToggle(jumpCell,function(on)local h=hum()if not h then return end local n=tonumber(jumpIn.Text)or 50 pcall(function()h.UseJumpPower=true end)h.JumpPower=on and n or 50 pcall(function()h.JumpHeight=on and math.clamp(n/3,2,25) or 7.2 end)end)
jumpIn.FocusLost:Connect(function(e)if e then local h=hum()if not h then return end local n=tonumber(jumpIn.Text)if not n then return end pcall(function()h.UseJumpPower=true end)h.JumpPower=n pcall(function()h.JumpHeight=math.clamp(n/3,2,25)end)end end)

-- Fly (mantido)
local flyCell=cell(frMain,"Fly (WASD/Space/Shift)","")
local flySpeedIn=Instance.new("TextBox",frMain)flySpeedIn.BackgroundColor3=C_SIDE;flySpeedIn.BorderSizePixel=0;flySpeedIn.PlaceholderText="Fly speed (e.g. 4)";flySpeedIn.PlaceholderColor3=C_MUT;flySpeedIn.TextColor3=C_TXT;flySpeedIn.Font=Enum.Font.Gotham;flySpeedIn.TextSize=14;flySpeedIn.Text="4";flySpeedIn.Size=UDim2.new(1,0,0,30)Instance.new("UICorner",flySpeedIn).CornerRadius=UDim.new(0,8)
local noclipCell=cell(frMain,"Noclip (Testing Version)","")

local flyBG,flyBV,flyConn
local function stopFly()if flyConn then flyConn:Disconnect()flyConn=nil end if flyBG then flyBG:Destroy()flyBG=nil end if flyBV then flyBV:Destroy()flyBV=nil end local h=hum()if h then h.PlatformStand=false end end
bindToggle(flyCell,function(on)stopFly()if not on then return end local root=hrp()local h=hum()if not root or not h then return end h.PlatformStand=true
	flyBG=Instance.new("BodyGyro",root)flyBG.P=9e4;flyBG.MaxTorque=Vector3.new(9e9,9e9,9e9);flyBG.CFrame=Camera.CFrame
	flyBV=Instance.new("BodyVelocity",root)flyBV.P=9e4;flyBV.MaxForce=Vector3.new(9e9,9e9,9e9);flyBV.Velocity=Vector3.new()
	flyConn=RunService.RenderStepped:Connect(function()flyBG.CFrame=Camera.CFrame local spd=tonumber(flySpeedIn.Text)or 4 local dir=Vector3.new()
		if UIS:IsKeyDown(Enum.KeyCode.W)then dir+=Camera.CFrame.LookVector end;if UIS:IsKeyDown(Enum.KeyCode.S)then dir-=Camera.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A)then dir-=Camera.CFrame.RightVector end;if UIS:IsKeyDown(Enum.KeyCode.D)then dir+=Camera.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.Space)then dir+=Vector3.new(0,1,0)end;if UIS:IsKeyDown(Enum.KeyCode.LeftShift)then dir-=Vector3.new(0,1,0)end
		if dir.Magnitude>0 then dir=dir.Unit*spd*30 else dir=Vector3.new()end;flyBV.Velocity=dir end)end)

-- >>> Noclip PRO (igual ao AimMany): atravessa ancoradas <<<
local NOGR="AM_NoClip"
pcall(function() PhysicsService:CreateCollisionGroup(NOGR) end)
for _,g in ipairs(PhysicsService:GetCollisionGroups()) do
	pcall(function()
		PhysicsService:CollisionGroupSetCollidable(NOGR,g.name,false)
		PhysicsService:CollisionGroupSetCollidable(g.name,NOGR,false)
	end)
end
local function setCharGroupAndStore(char,group)
	for _,p in ipairs(char:GetDescendants()) do
		if p:IsA("BasePart") then
			if p:GetAttribute("__am_prev_cc")==nil then p:SetAttribute("__am_prev_cc", p.CanCollide and 1 or 0) end
			PhysicsService:SetPartCollisionGroup(p,group);p.CanCollide=false
		end
	end
end
local function restoreCharCollision(char)
	for _,p in ipairs(char:GetDescendants()) do
		if p:IsA("BasePart") then
			PhysicsService:SetPartCollisionGroup(p,"Default")
			local prev=p:GetAttribute("__am_prev_cc");if prev==nil then p.CanCollide=true else p.CanCollide=(prev==1) end
			p:SetAttribute("__am_prev_cc",nil)
		end
	end
end
local noclipOn=false
local noclipLoop
bindToggle(noclipCell,function(on)
	if noclipLoop then noclipLoop:Disconnect() noclipLoop=nil end
	noclipOn=on
	if on then
		local ch=LP.Character or LP.CharacterAdded:Wait()
		setCharGroupAndStore(ch,NOGR)
		noclipLoop=RunService.Stepped:Connect(function()
			local c=LP.Character if not c then return end
			for _,p in ipairs(c:GetDescendants()) do
				if p:IsA("BasePart") then
					if p.CollisionGroup ~= NOGR then pcall(function() PhysicsService:SetPartCollisionGroup(p,NOGR) end) end
					if p.CanCollide then p.CanCollide=false end
				end
			end
		end)
	else
		local ch=LP.Character;if ch then restoreCharCollision(ch) end
	end
end)
LP.CharacterAdded:Connect(function(c) if noclipOn then task.defer(function() setCharGroupAndStore(c,NOGR) end) end end)

-- OP
local frOP=makeTab("OP");section(frOP,"FE")
local function applySkybox(idStr)local n=idStr:gsub("%D","")if n==""then return end local asset="rbxassetid://"..n local sky=Lighting:FindFirstChildOfClass("Sky")or Instance.new("Sky",Lighting)
	sky.SkyboxBk=asset sky.SkyboxDn=asset sky.SkyboxFt=asset sky.SkyboxLf=asset sky.SkyboxRt=asset sky.SkyboxUp=asset end
local skyCell=cell(frOP,"Skybox","")
local skyId=Instance.new("TextBox",frOP)skyId.BackgroundColor3=C_SIDE;skyId.BorderSizePixel=0;skyId.Text="158118263";skyId.PlaceholderText="Skybox ID";skyId.PlaceholderColor3=C_MUT;skyId.TextColor3=C_TXT;skyId.Font=Enum.Font.Gotham;skyId.TextSize=14;skyId.Size=UDim2.new(1,0,0,30)Instance.new("UICorner",skyId).CornerRadius=UDim.new(0,8)
bindToggle(skyCell,function(on)if on then applySkybox(skyId.Text)end end)

local decalCell=cell(frOP,"Decal Spam","")
local decalId=skyId:Clone()decalId.Text="158118263"decalId.Parent=frOP
local decalActive=false
local function startDecal(idStr)if decalActive then return end;decalActive=true
	task.spawn(function()local asset="rbxassetid://"..idStr:gsub("%D","")while decalActive do local my=hrp()if my then local bg=Instance.new("BillboardGui",gui)bg.Size=UDim2.fromOffset(120,120)bg.StudsOffset=Vector3.new(math.random(-4,4),math.random(2,6),math.random(-4,4))bg.AlwaysOnTop=true;bg.Adornee=my
				local img=Instance.new("ImageLabel",bg)img.BackgroundTransparency=1;img.Size=UDim2.fromScale(1,1);img.Image=asset;task.delay(1.2,function()if bg then bg:Destroy()end end)end;task.wait(0.15)end end)end
local function stopDecal()decalActive=false end
bindToggle(decalCell,function(on)if on then startDecal(decalId.Text)else stopDecal()end end)

local musicCell=cell(frOP,"Infinite Music","")
local musicId=skyId:Clone()musicId.Text="71956674693421"musicId.Parent=frOP
local song=Instance.new("Sound",SoundService)song.SoundId="";song.Volume=1;song.Looped=true
bindToggle(musicCell,function(on)if on then local n=musicId.Text:gsub("%D","")if n~=""then song.SoundId="rbxassetid://"..n song:Play()end else song:Stop()end end)

local CREATED_DECAL_TAG="K3_AllDecal"
local function addDecalOnFace(part,face,asset)local d=Instance.new("Decal",part)d.Name=CREATED_DECAL_TAG d.Face=face d.Texture=asset end
local function applyDecalAll(idStr)local n=idStr:gsub("%D","")if n==""then return end local asset="rbxassetid://"..n for _,inst in ipairs(workspace:GetDescendants())do if inst:IsA("BasePart")then for _,old in ipairs(inst:GetChildren())do if old:IsA("Decal")and old.Name==CREATED_DECAL_TAG then old:Destroy()end end for _,face in ipairs(Enum.NormalId:GetEnumItems())do addDecalOnFace(inst,face,asset)end end end end
local function clearDecalAll()for _,inst in ipairs(workspace:GetDescendants())do if inst:IsA("BasePart")then for _,old in ipairs(inst:GetChildren())do if old:IsA("Decal")and old.Name==CREATED_DECAL_TAG then old:Destroy()end end end end end
local allCell=cell(frOP,"Skybox/Decal (158118263)","")
bindToggle(allCell,function(on)if on then applySkybox("158118263")applyDecalAll("158118263")else clearDecalAll()end end)

local tpItemCell=cell(frOP,"Teleport Item","")
local teleTool
bindToggle(tpItemCell,function(on)if on then if not teleTool then teleTool=Instance.new("Tool")teleTool.Name="Teleport";teleTool.RequiresHandle=false;teleTool.Parent=LP:WaitForChild("Backpack")
			local mouse=LP:GetMouse();teleTool.Activated:Connect(function()local pos=mouse.Hit and mouse.Hit.p or (LP.Character and LP.Character:GetPivot().Position)or Vector3.new()local p=hrp()if p then p.CFrame=CFrame.new(pos+Vector3.new(0,3,0))end end)end
	else if teleTool then teleTool:Destroy()teleTool=nil end end end)

-- ESP tab
local frESP=makeTab("ESP")
section(frESP,"ESP & Aim")

local espMaster=cell(frESP,"Toggle ESP","")
local espName=cell(frESP,"Show Name","")
local espHP=cell(frESP,"Show Health","")
local espDist=cell(frESP,"Show Distance","")
local espPlayers=cell(frESP,"Include Players","")
local espNPC=cell(frESP,"Include NPCs","")

local distLabel=Instance.new("TextLabel",frESP)
distLabel.BackgroundTransparency=1;distLabel.Font=Enum.Font.Gotham;distLabel.Text="Max Distance (0 = unlimited)";distLabel.TextColor3=C_TXT;distLabel.TextSize=14;distLabel.Size=UDim2.new(1,0,0,18)
local distBox=Instance.new("TextBox",frESP)
distBox.BackgroundColor3=C_SIDE;distBox.Text="0";distBox.Font=Enum.Font.Gotham;distBox.TextColor3=C_TXT;distBox.Size=UDim2.new(1,0,0,30)
Instance.new("UICorner",distBox).CornerRadius=UDim.new(0,8)

section(frESP,"ESP Colors")
local espPlayerColor=Color3.fromRGB(150,105,255)
local espNPCColor=Color3.fromRGB(255,120,80)
local function colorRow(parent,title,setter,offsetY)
	local t=Instance.new("TextLabel",parent)
	t.BackgroundTransparency=1;t.Font=Enum.Font.GothamBold;t.Text=title;t.TextSize=14;t.TextColor3=C_TXT;t.Size=UDim2.new(1,0,0,18)
	local row=Instance.new("Frame",parent)row.BackgroundTransparency=1;row.Size=UDim2.new(1,0,0,40)
	local pal={Color3.fromRGB(150,105,255),Color3.fromRGB(0,170,255),Color3.fromRGB(80,220,120),Color3.fromRGB(255,220,60),Color3.fromRGB(255,120,80),Color3.fromRGB(255,64,128),Color3.fromRGB(200,200,210),Color3.fromRGB(140,140,150)}
	for i,c in ipairs(pal)do local b=Instance.new("TextButton",row)b.Text="" b.AutoButtonColor=true b.BackgroundColor3=c b.BorderSizePixel=0 b.Size=UDim2.fromOffset(28,28) b.Position=UDim2.fromOffset((i-1)*34,6) Instance.new("UICorner",b).CornerRadius=UDim.new(1,0) b.MouseButton1Click:Connect(function() setter(c) end) end
end
colorRow(frESP,"Player color",function(c) espPlayerColor=c end)
colorRow(frESP,"NPC color",function(c) espNPCColor=c end)

-- Aimbot (igual ao outro)
local aimbotOnCell=cell(frESP,"Aimbot ON","")
local aimTargetButton,aimRight=listCell(frESP,"Aimbot Target","Head")
local aimOn=false
local aimTargetName="Head"

local function gatherTargets(includeNPC, includePlayers)
	local list={}
	if includePlayers then
		for _,p in ipairs(Players:GetPlayers())do if p~=LP and p.Character then table.insert(list,p.Character) end end
	end
	if includeNPC then
		for _,m in ipairs(workspace:GetDescendants())do if m:IsA("Model")and m:FindFirstChildOfClass("Humanoid")and not Players:GetPlayerFromCharacter(m)then table.insert(list,m) end end
	end
	return list
end

local function nearestTarget()
	local bestPart,bestD=nil,math.huge
	for _,char in ipairs(gatherTargets(true,true))do
		local part=char:FindFirstChild(aimTargetName) or char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
		if part then
			local v,on=Camera:WorldToViewportPoint(part.Position)
			if on then local m=UIS:GetMouseLocation() local d=(Vector2.new(v.X,v.Y)-m).Magnitude if d<bestD then bestD=d bestPart=part end end
		end
	end
	return bestPart
end

local aimConn
local function setAimbot(on)
	if aimConn then aimConn:Disconnect() aimConn=nil end
	if not on then return end
	aimConn=RunService.RenderStepped:Connect(function()
		if UIS:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
			local part=nearestTarget()
			if part then local dir=(part.Position-Camera.CFrame.Position).Unit Camera.CFrame=Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position,Camera.CFrame.Position+dir),0.92) end
		end
	end)
end
bindToggle(aimbotOnCell,function(on)aimOn=on setAimbot(on)end)
aimTargetButton.MouseButton1Click:Connect(function()local abs=aimTargetButton.AbsolutePosition-content.AbsolutePosition
	makeDropdown(Vector2.new(abs.X,abs.Y),{"Head","Body","Foot"},function(opt)if opt=="Body"then aimTargetName="HumanoidRootPart"aimRight.Text="Body" elseif opt=="Foot"then aimTargetName="RightFoot"aimRight.Text="Foot" else aimTargetName="Head"aimRight.Text="Head" end end)end)

-- >>> ESP (igual ao AimMany)
local espOn=false
local wantName=false
local wantHP=false
local wantDist=false
local wantPlayers=true
local wantNPC=false
local highlights={}
local nameBoards={}

local function clearESP()
	for k,h in pairs(highlights)do if h and h.Parent then h:Destroy() end highlights[k]=nil end
	for k,g in pairs(nameBoards)do if g and g.Parent then g:Destroy() end nameBoards[k]=nil end
end
local function headOrRoot(m)return m:FindFirstChild("Head") or m:FindFirstChild("HumanoidRootPart") or m:FindFirstChildWhichIsA("BasePart") end
local function withinDistance(root) local lim=tonumber(distBox.Text) or 0 if lim<=0 then return true end local me=hrp() if not me then return true end return (root.Position-me.Position).Magnitude<=lim end

local function ensureNameBoard(model,root)
	local bg=nameBoards[model]
	if not bg then
		bg=Instance.new("BillboardGui",overlay);bg.AlwaysOnTop=true;bg.Size=UDim2.fromOffset(260,36);bg.StudsOffset=Vector3.new(0,2.6,0);bg.Adornee=root
		local t=Instance.new("TextLabel",bg);t.Name="L";t.BackgroundTransparency=1;t.Font=Enum.Font.GothamBold;t.TextSize=16;t.Text="";t.Size=UDim2.fromScale(1,1)
		nameBoards[model]=bg
	else
		bg.Adornee=root
	end
	return bg
end

local function attachHighlight(char,isPlayer)
	if not char then return end
	local h=highlights[char]
	if not h then
		h=Instance.new("Highlight");h.Adornee=char;h.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop;h.FillTransparency=1;h.OutlineTransparency=0;h.Parent=overlay;highlights[char]=h
	end
	h.OutlineColor = isPlayer and espPlayerColor or espNPCColor
end

local function scanESP()
	if not espOn then clearESP();return end
	if wantPlayers then
		for _,p in ipairs(Players:GetPlayers())do
			if p~=LP and p.Character and p.Character:FindFirstChildOfClass("Humanoid") then
				local root=headOrRoot(p.Character)
				if root and withinDistance(root) then
					attachHighlight(p.Character,true)
					local txt=""
					if wantName then txt=p.Name end
					if wantDist then local me=hrp() if me then txt=txt..string.format(" [%.0f]",(root.Position-me.Position).Magnitude) end end
					if wantHP then local hmd=p.Character:FindFirstChildOfClass("Humanoid") if hmd then txt=txt..string.format(" (%d HP)",math.floor(hmd.Health)) end end
					if wantName or wantHP or wantDist then
						local bg=ensureNameBoard(p.Character,root);local lab=bg:FindFirstChild("L")
						if lab then lab.Text=txt;lab.TextColor3=espPlayerColor end
					end
				end
			end
		end
	end
	if wantNPC then
		for _,m in ipairs(workspace:GetDescendants())do
			if m:IsA("Model") and m:FindFirstChildOfClass("Humanoid") and not Players:GetPlayerFromCharacter(m) then
				local root=headOrRoot(m)
				if root and withinDistance(root) then
					attachHighlight(m,false)
					local txt=""
					if wantName then txt=m.Name end
					if wantDist then local me=hrp() if me then txt=txt..string.format(" [%.0f]",(root.Position-me.Position).Magnitude) end end
					if wantHP then local hmd=m:FindFirstChildOfClass("Humanoid") if hmd then txt=txt..string.format(" (%d HP)",math.floor(hmd.Health)) end end
					if wantName or wantHP or wantDist then
						local bg=ensureNameBoard(m,root);local lab=bg:FindFirstChild("L")
						if lab then lab.Text=txt;lab.TextColor3=espNPCColor end
					end
				end
			end
		end
	end
end

bindToggle(espMaster,function(on)espOn=on if not on then clearESP() end end)
bindToggle(espName,function(v)wantName=v end)
bindToggle(espHP,function(v)wantHP=v end)
bindToggle(espDist,function(v)wantDist=v end)
bindToggle(espPlayers,function(v)wantPlayers=v end)
bindToggle(espNPC,function(v)wantNPC=v end)

RunService.RenderStepped:Connect(function()
	if espOn then
		scanESP()
		for model,h in pairs(highlights)do
			if h then
				local isPl = Players:GetPlayerFromCharacter(model) ~= nil
				h.OutlineColor = isPl and espPlayerColor or espNPCColor
			end
		end
	end
end)

Players.PlayerRemoving:Connect(function(p)
	if highlights[p.Character] then highlights[p.Character]:Destroy() highlights[p.Character]=nil end
	if nameBoards[p.Character] then nameBoards[p.Character]:Destroy() nameBoards[p.Character]=nil end
end)

-- Others / Config (inalterado, só créditos já mudados)
local frOthers=makeTab("Others");section(frOthers,"Work in progress");cell(frOthers,"Placeholder","")

local frConfig=makeTab("Config")
section(frConfig,"Performance")
local fogCell=cell(frConfig,"Remove Fog","")
local grassCell=cell(frConfig,"Remove Vegetation (visual)","")
local alCell=cell(frConfig,"Anti-Lag (disable env light)","")
local shadowsCell=cell(frConfig,"Remove Shadows","")

local meshButton,meshRight=listCell(frConfig,"Mesh Quality","Auto")
local meshMap={["Auto"]="Automatic",["Very high"]="Precise",["High"]="Precise",["Medium"]="Automatic",["Low"]="Performance",["Very low"]="Performance"}
local function setFidelity(part,mode)if mode=="Automatic"then part.RenderFidelity=Enum.RenderFidelity.Automatic elseif mode=="Performance"then part.RenderFidelity=Enum.RenderFidelity.Performance else part.RenderFidelity=Enum.RenderFidelity.Precise end end
local function applyMesh(humanOpt)local mode=meshMap[humanOpt]or"Automatic"for _,d in ipairs(workspace:GetDescendants())do if d:IsA("MeshPart")then setFidelity(d,mode)end end meshRight.Text=humanOpt end
meshButton.MouseButton1Click:Connect(function()local abs=meshButton.AbsolutePosition-content.AbsolutePosition
	makeDropdown(Vector2.new(abs.X,abs.Y),{"Auto","Very high","High","Medium","Low","Very low"},function(opt)applyMesh(opt)end)end)

local function setProp(o,p,v)pcall(function()o[p]=v end)end
local function getProp(o,p)local ok,v=pcall(function()return o[p] end)return ok and v or nil end
local savedBright={Brightness=getProp(Lighting,"Brightness"),Ambient=getProp(Lighting,"Ambient"),ClockTime=getProp(Lighting,"ClockTime"),ColorShift_Top=getProp(Lighting,"ColorShift_Top"),ColorShift_Bottom=getProp(Lighting,"ColorShift_Bottom"),OutdoorAmbient=getProp(Lighting,"OutdoorAmbient")}
local savedAtmos=Lighting:FindFirstChildOfClass("Atmosphere")
local effFolder=Instance.new("Folder",Lighting)effFolder.Name="_K3_Effects"
local function ensureCC()local cc=effFolder:FindFirstChildOfClass("ColorCorrectionEffect")if not cc then cc=Instance.new("ColorCorrectionEffect",effFolder)end return cc end
local function setFog(on)local atm=Lighting:FindFirstChildOfClass("Atmosphere")or Instance.new("Atmosphere",Lighting)if on then setProp(atm,"Density",0)setProp(Lighting,"FogEnd",1e6)setProp(Lighting,"FogStart",1e6)else setProp(atm,"Density",0.3)setProp(Lighting,"FogEnd",100000)setProp(Lighting,"FogStart",0)end end
local function setAntiLag(on)if on then setProp(Lighting,"EnvironmentSpecularScale",0)setProp(Lighting,"EnvironmentDiffuseScale",0)else setProp(Lighting,"EnvironmentSpecularScale",1)setProp(Lighting,"EnvironmentDiffuseScale",1)end end
local function setShadows(on)setProp(Lighting,"GlobalShadows",not on)end
local function nightVision(on)if on then local cc=ensureCC()cc.Brightness=0.15 cc.Contrast=0.1 cc.Saturation=0.05 cc.TintColor=Color3.new(1,1,1)
		setProp(Lighting,"Brightness",2.2)setProp(Lighting,"Ambient",Color3.new(1,1,1))setProp(Lighting,"OutdoorAmbient",Color3.new(1,1,1))
		setProp(Lighting,"ClockTime",14)setProp(Lighting,"ColorShift_Top",Color3.new(1,1,1))setProp(Lighting,"ColorShift_Bottom",Color3.new(1,1,1))setFog(true)
	else for k,v in pairs(savedBright)do if v~=nil then setProp(Lighting,k,v)end end if savedAtmos then savedAtmos.Parent=Lighting end local cc=effFolder:FindFirstChildOfClass("ColorCorrectionEffect")if cc then cc:Destroy()end end end
local fullbrightCell=cell(frConfig,"NightVision (Fullbright)","")
bindToggle(fogCell,setFog)bindToggle(alCell,setAntiLag)bindToggle(shadowsCell,setShadows)bindToggle(fullbrightCell,nightVision)

local _veg_on=false
local vegTouched={}
local VEG_KEYWORDS={"tree","arvore","árvore","bush","arbusto","leaf","folha","leaves","grass","grama","flower","flor","plant","planta","hedge","vine","vinha","foliage","vegetation","trunk","tronco","wood","madeira","palm","pine","oak","weed","mato","bamboo","cactus","leafy"}
local VEG_MATERIALS={[Enum.Material.Grass]=true,[Enum.Material.LeafyGrass]=true,[Enum.Material.Wood]=true,[Enum.Material.Fabric]=true}
local function looksLikeVegetation(part)if VEG_MATERIALS[part.Material]then return true end local n=(part.Name or ""):lower()for _,kw in ipairs(VEG_KEYWORDS)do if string.find(n,kw,1,true)then return true end end local p=part.Parent if p and p.Name then local pn=p.Name:lower()for _,kw in ipairs({"vegetation","foliage","trees","árvores","arvores","plants","nature","flora","grass"})do if string.find(pn,kw,1,true)then return true end end end return false end
local function hideVeg(part)if vegTouched[part]then return end vegTouched[part]={ltm=part.LocalTransparencyModifier or 0,collide=part.CanCollide}part.LocalTransparencyModifier=1;part.CanCollide=false for _,d in ipairs(part:GetDescendants())do if d:IsA("ParticleEmitter")or d:IsA("Trail")then d.Enabled=false end end end
local function showVeg(part)local old=vegTouched[part]if not old then return end part.LocalTransparencyModifier=old.ltm;part.CanCollide=old.collide;vegTouched[part]=nil end
local function applyVegetation(on)_veg_on=on if workspace.Terrain then workspace.Terrain.Decoration=not on end if on then for _,inst in ipairs(workspace:GetDescendants())do if inst:IsA("BasePart")and looksLikeVegetation(inst)then hideVeg(inst)end end else for part,_ in pairs(vegTouched)do if part and part.Parent then showVeg(part)end end end end
bindToggle(grassCell,applyVegetation)
task.spawn(function()while true do if _veg_on then for _,inst in ipairs(workspace:GetDescendants())do if inst:IsA("BasePart")and looksLikeVegetation(inst)then hideVeg(inst)end end end task.wait(1.2)end end)
LP.CharacterAdded:Connect(function()if _veg_on then task.defer(function()applyVegetation(true)end)end end)

section(frConfig,"GUI Colors")
local rowPal=Instance.new("Frame",frConfig)rowPal.BackgroundTransparency=1;rowPal.Size=UDim2.new(1,0,0,200);rowPal.ZIndex=20
local function refreshTheme()win.BackgroundColor3=C_BG;content.BackgroundColor3=C_BG;top.BackgroundColor3=C_SIDE;side.BackgroundColor3=C_SIDE end
local function uiDot(x,y,col,apply)local b=Instance.new("TextButton",rowPal)b.Text="";b.AutoButtonColor=true;b.BackgroundColor3=col;b.BorderSizePixel=0;b.Size=UDim2.fromOffset(22,22);b.Position=UDim2.fromOffset(x,y);b.ZIndex=21;Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
	b.MouseButton1Click:Connect(function()pcall(apply,col)refreshTheme()end)end
local x=0 for _,c in ipairs(OLD_BG)do uiDot(x,6,c,function(col)C_BG=col end) x=x+26 end for _,c in ipairs(BLUES)do uiDot(x,6,c,function(col)C_BG=col end) x=x+26 end
x=0 for _,c in ipairs(OLD_SIDE)do uiDot(x,40,c,function(col)C_SIDE=col end) x=x+26 end for _,c in ipairs(BLUES)do uiDot(x,40,c,function(col)C_SIDE=col end) x=x+26 end
x=0 for _,c in ipairs(OLD_BG)do uiDot(x,74,c,function(col)C_CARD=col end) x=x+26 end for _,c in ipairs(BLUES)do uiDot(x,74,c,function(col)C_CARD=col end) x=x+26 end

local resetBtn=Instance.new("TextButton",rowPal)resetBtn.Text="Reset GUI (full)";resetBtn.Font=Enum.Font.GothamBold;resetBtn.TextSize=16;resetBtn.TextColor3=C_TXT;resetBtn.BackgroundColor3=C_CARD;resetBtn.BorderSizePixel=0;resetBtn.Size=UDim2.fromOffset(160,32);resetBtn.Position=UDim2.fromOffset(0,108)Instance.new("UICorner",resetBtn).CornerRadius=UDim.new(0,8)

section(frConfig,"Text color")
local rowTxt=Instance.new("Frame",frConfig)rowTxt.BackgroundTransparency=1;rowTxt.Size=UDim2.new(1,0,0,36)
for i,c in ipairs(TXT_CHOICES)do local b=Instance.new("TextButton",rowTxt)b.Text="";b.AutoButtonColor=true;b.BackgroundColor3=c;b.BorderSizePixel=0;b.Size=UDim2.fromOffset(28,28);b.Position=UDim2.fromOffset((i-1)*34,4)Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
	b.MouseButton1Click:Connect(function()C_TXT=c;title.TextColor3=c;for _,lbl in ipairs(recolorLabels)do if lbl and lbl.Parent then lbl.TextColor3=c end end end)end

local function resetAll()
	C_BG=DEF_BG;C_SIDE=DEF_SIDE;C_CARD=DEF_CARD;C_TXT=DEF_TXT;refreshTheme();title.TextColor3=C_TXT;for _,lbl in ipairs(recolorLabels)do if lbl and lbl.Parent then lbl.TextColor3=C_TXT end end
	for _,fr in ipairs(content:GetChildren())do if fr:IsA("Frame")then for _,cellFrame in ipairs(fr:GetDescendants())do if cellFrame:IsA("TextButton") and cellFrame.Name=="Toggle" then local fill=cellFrame:FindFirstChild("Fill") if fill then fill.Visible=false fill.Size=UDim2.fromOffset(0,0) end end end end end
	if followLoop then followLoop:Disconnect()followLoop=nil end
	if flyConn then flyConn:Disconnect()flyConn=nil end if flyBG then flyBG:Destroy() flyBG=nil end if flyBV then flyBV:Destroy() flyBV=nil end local h=hum() if h then h.WalkSpeed=16 pcall(function()h.UseJumpPower=true end) h.JumpPower=50 end
	applyVegetation(false);setFog(false);setAntiLag(false);setShadows(false);nightVision(false)
	clearESP();espOn=false;wantName=false;wantHP=false;wantDist=false;wantNPC=false;wantPlayers=true;aimOn=false;setAimbot(false)
	speedIn.Text="";jumpIn.Text="";meshRight.Text="Auto";applyMesh("Auto")
end
resetBtn.MouseButton1Click:Connect(resetAll)

for _,btn in pairs(buttons)do btn.MouseButton1Click:Connect(function()selectTab(btn)end)end
selectTab(buttons["Credits"])

local dragging=false;local startPos;local dragStart
local function updateDrag(i)local d=i.Position-dragStart win.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)end
top.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=true dragStart=i.Position startPos=win.Position end end)
top.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dragging=false end end)
UIS.InputChanged:Connect(function(i)if dragging and(i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch)then updateDrag(i)end end)

local minimized=false
btnMin.MouseButton1Click:Connect(function()minimized=not minimized local target=minimized and UDim2.new(win.Size.X.Scale,win.Size.X.Offset,0,44)or UDim2.fromScale(0.62,0.62)
	TweenService:Create(win,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=target}):Play()side.Visible=not minimized content.Visible=not minimized end)
local reopen=Instance.new("TextButton",gui)reopen.Text="K3";reopen.Font=Enum.Font.GothamBold;reopen.TextSize=14;reopen.TextColor3=C_TXT;reopen.BackgroundColor3=C_SIDE;reopen.BorderSizePixel=0;reopen.Size=UDim2.fromOffset(40,40);reopen.Position=UDim2.new(0,16,1,-56);reopen.Visible=false Instance.new("UICorner",reopen).CornerRadius=UDim.new(1,0)
btnClose.MouseButton1Click:Connect(function()win.Visible=false reopen.Visible=true end)
reopen.MouseButton1Click:Connect(function()reopen.Visible=false win.Visible=true end)
