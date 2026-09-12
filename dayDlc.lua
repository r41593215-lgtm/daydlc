-- dayDlc v44.0 | part 1/2
local P=game:GetService("Players") local R=game:GetService("RunService") local U=game:GetService("UserInputService") local T=game:GetService("TweenService") local L=game:GetService("Lighting") local LP=P.LocalPlayer local C=workspace.CurrentCamera
local AC=Color3.fromRGB(140,90,255) local AC2=Color3.fromRGB(200,140,255) local AC3=Color3.fromRGB(255,150,220) local BG=Color3.fromRGB(20,16,30) local TX=Color3.fromRGB(240,240,250) local STROKE=Color3.fromRGB(45,35,70)
local IS_PC=U.KeyboardEnabled and not U.TouchEnabled
local function CC(i,r) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=i end
local pg=LP:WaitForChild("PlayerGui")
if _G.dG and _G.dG.Parent then _G.dG:Destroy() end

local function isKiller(plr)
    if plr==LP then return false end
    local char=plr.Character if not char then return false end
    if plr.Team and plr.Team.Name:lower():find("killer") then return true end
    for _,attr in ipairs({"Role","role","Team","team","Side","side"}) do local v=plr:GetAttribute(attr) or char:GetAttribute(attr) if typeof(v)=="string" and v:lower():find("killer") then return true end end
    for _,c in ipairs(char:GetChildren()) do if c:IsA("StringValue") then local n=c.Name:lower() local v=tostring(c.Value):lower() if (n:find("role") or n:find("team")) and v:find("killer") then return true end end end
    local tool=char:FindFirstChildOfClass("Tool") if tool then local tn=tool.Name:lower() if tn:find("knife") or tn:find("sword") or tn:find("weapon") or tn:find("axe") or tn:find("machete") then return true end end
    local n=plr.Name:lower() if n:find("killer") or n:find("maniac") then return true end
    return false
end

-- KEY SYSTEM
local KEY_PASSWORD="1234"
local keyOk=false
local keyGui=Instance.new("ScreenGui") keyGui.Name="dayDlc_Key" keyGui.ResetOnSpawn=false keyGui.IgnoreGuiInset=true keyGui.DisplayOrder=9999 keyGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling keyGui.Parent=pg
local keyDim=Instance.new("Frame") keyDim.Size=UDim2.new(1,0,1,0) keyDim.BackgroundColor3=Color3.fromRGB(0,0,0) keyDim.BackgroundTransparency=1 keyDim.BorderSizePixel=0 keyDim.Parent=keyGui
T:Create(keyDim,TweenInfo.new(0.4),{BackgroundTransparency=0.4}):Play()
local keyGlow=Instance.new("Frame") keyGlow.Size=UDim2.new(0,400,0,300) keyGlow.Position=UDim2.new(0.5,-200,0.5,-150) keyGlow.BackgroundColor3=AC keyGlow.BackgroundTransparency=0.72 keyGlow.BorderSizePixel=0 keyGlow.Parent=keyDim CC(keyGlow,50)
local keyGlowGrad=Instance.new("UIGradient") keyGlowGrad.Color=ColorSequence.new(AC,AC3) keyGlowGrad.Rotation=45 keyGlowGrad.Parent=keyGlow
local keyGlow2=Instance.new("Frame") keyGlow2.Size=UDim2.new(0,360,0,260) keyGlow2.Position=UDim2.new(0.5,-180,0.5,-130) keyGlow2.BackgroundColor3=AC3 keyGlow2.BackgroundTransparency=0.82 keyGlow2.BorderSizePixel=0 keyGlow2.Parent=keyDim CC(keyGlow2,48)
task.spawn(function() while keyGlow.Parent do task.wait(0.05) local t=0.5+0.5*math.sin(tick()*2) keyGlow.BackgroundTransparency=0.7+0.15*t end end)
local keyPanel=Instance.new("Frame") keyPanel.Size=UDim2.new(0,0,0,0) keyPanel.Position=UDim2.new(0.5,0,0.5,0) keyPanel.BackgroundColor3=BG keyPanel.BorderSizePixel=0 keyPanel.ZIndex=2 keyPanel.Parent=keyDim CC(keyPanel,20)
T:Create(keyPanel,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,320,0,240),Position=UDim2.new(0.5,-160,0.5,-120)}):Play()
local keyPanelGrad=Instance.new("UIGradient") keyPanelGrad.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(40,28,62)),ColorSequenceKeypoint.new(0.5,BG),ColorSequenceKeypoint.new(1,Color3.fromRGB(28,20,45))}) keyPanelGrad.Rotation=135 keyPanelGrad.Parent=keyPanel
local keyStroke=Instance.new("UIStroke") keyStroke.Color=AC keyStroke.Thickness=1.5 keyStroke.Transparency=0.3 keyStroke.Parent=keyPanel
local keyBar=Instance.new("Frame") keyBar.Size=UDim2.new(0,3,0,56) keyBar.Position=UDim2.new(0,18,0,28) keyBar.BackgroundColor3=AC keyBar.BorderSizePixel=0 keyBar.ZIndex=3 keyBar.Parent=keyPanel CC(keyBar,2)
local keyBarGrad=Instance.new("UIGradient") keyBarGrad.Color=ColorSequence.new(AC,AC2,AC3) keyBarGrad.Rotation=90 keyBarGrad.Parent=keyBar
local keyLogo=Instance.new("Frame") keyLogo.Size=UDim2.new(0,28,0,28) keyLogo.Position=UDim2.new(0,30,0,28) keyLogo.BackgroundColor3=AC keyLogo.BorderSizePixel=0 keyLogo.ZIndex=3 keyLogo.Parent=keyPanel CC(keyLogo,14)
local keyLogoGrad=Instance.new("UIGradient") keyLogoGrad.Color=ColorSequence.new(AC,AC3) keyLogoGrad.Rotation=45 keyLogoGrad.Parent=keyLogo
local keyLogoText=Instance.new("TextLabel") keyLogoText.Size=UDim2.new(1,0,1,0) keyLogoText.BackgroundTransparency=1 keyLogoText.Text="d" keyLogoText.TextColor3=Color3.new(1,1,1) keyLogoText.Font=Enum.Font.GothamBold keyLogoText.TextSize=16 keyLogoText.ZIndex=4 keyLogoText.Parent=keyLogo
local keyPulse=Instance.new("Frame") keyPulse.Size=UDim2.new(0,8,0,8) keyPulse.Position=UDim2.new(1,-26,0,32) keyPulse.BackgroundColor3=Color3.fromRGB(80,220,130) keyPulse.BorderSizePixel=0 keyPulse.ZIndex=3 keyPulse.Parent=keyPanel CC(keyPulse,4)
local keyPulseStroke=Instance.new("UIStroke") keyPulseStroke.Color=Color3.fromRGB(80,220,130) keyPulseStroke.Thickness=2 keyPulseStroke.Transparency=0.5 keyPulseStroke.Parent=keyPulse
task.spawn(function() while keyPulse.Parent do task.wait(0.05) local t=0.5+0.5*math.sin(tick()*4) keyPulse.BackgroundTransparency=t*0.7 keyPulseStroke.Transparency=0.3+t*0.7 end end)
local keyTitle=Instance.new("TextLabel") keyTitle.Size=UDim2.new(1,-70,0,22) keyTitle.Position=UDim2.new(0,66,0,28) keyTitle.BackgroundTransparency=1 keyTitle.Text="dayDlc access" keyTitle.TextColor3=TX keyTitle.TextXAlignment=Enum.TextXAlignment.Left keyTitle.Font=Enum.Font.GothamBold keyTitle.TextSize=16 keyTitle.ZIndex=3 keyTitle.Parent=keyPanel
local keySub=Instance.new("TextLabel") keySub.Size=UDim2.new(1,-70,0,14) keySub.Position=UDim2.new(0,66,0,48) keySub.BackgroundTransparency=1 keySub.Text="enter your license key" keySub.TextColor3=Color3.fromRGB(170,150,210) keySub.TextXAlignment=Enum.TextXAlignment.Left keySub.Font=Enum.Font.Gotham keySub.TextSize=10 keySub.ZIndex=3 keySub.Parent=keyPanel
local keyDiv=Instance.new("Frame") keyDiv.Size=UDim2.new(1,-36,0,1) keyDiv.Position=UDim2.new(0,18,0,72) keyDiv.BackgroundColor3=STROKE keyDiv.BorderSizePixel=0 keyDiv.ZIndex=3 keyDiv.Parent=keyPanel
local keyBox=Instance.new("TextBox") keyBox.Size=UDim2.new(1,-40,0,46) keyBox.Position=UDim2.new(0,20,0,90) keyBox.BackgroundColor3=Color3.fromRGB(15,10,25) keyBox.BorderSizePixel=0 keyBox.Text="" keyBox.PlaceholderText="••••••••" keyBox.PlaceholderColor3=Color3.fromRGB(110,90,150) keyBox.TextColor3=TX keyBox.Font=Enum.Font.GothamBold keyBox.TextSize=20 keyBox.ClearTextOnFocus=false keyBox.ZIndex=3 keyBox.Parent=keyPanel CC(keyBox,10)
local keyBoxStroke=Instance.new("UIStroke") keyBoxStroke.Color=STROKE keyBoxStroke.Thickness=1 keyBoxStroke.Parent=keyBox
if IS_PC then keyBox.Focused:Connect(function() T:Create(keyBoxStroke,TweenInfo.new(0.15),{Color=AC,Thickness=1.5}):Play() end) end
local keyBtn=Instance.new("TextButton") keyBtn.Size=UDim2.new(1,-40,0,46) keyBtn.Position=UDim2.new(0,20,0,148) keyBtn.BackgroundColor3=AC keyBtn.BorderSizePixel=0 keyBtn.Text="SIGN IN" keyBtn.TextColor3=Color3.new(1,1,1) keyBtn.Font=Enum.Font.GothamBold keyBtn.TextSize=13 keyBtn.AutoButtonColor=false keyBtn.ZIndex=3 keyBtn.Parent=keyPanel CC(keyBtn,10)
local keyBtnGrad=Instance.new("UIGradient") keyBtnGrad.Color=ColorSequence.new(AC,AC2,AC3) keyBtnGrad.Rotation=0 keyBtnGrad.Parent=keyBtn
if IS_PC then keyBtn.MouseEnter:Connect(function() T:Create(keyBtn,TweenInfo.new(0.12),{BackgroundColor3=AC2}):Play() end) keyBtn.MouseLeave:Connect(function() T:Create(keyBtn,TweenInfo.new(0.12),{BackgroundColor3=AC}):Play() end) end
local keyErr=Instance.new("TextLabel") keyErr.Size=UDim2.new(1,-40,0,16) keyErr.Position=UDim2.new(0,20,0,202) keyErr.BackgroundTransparency=1 keyErr.Text="" keyErr.TextColor3=Color3.fromRGB(255,80,80) keyErr.Font=Enum.Font.GothamMedium keyErr.TextSize=11 keyErr.TextXAlignment=Enum.TextXAlignment.Center keyErr.ZIndex=3 keyErr.Parent=keyPanel
local function closeKey()
    T:Create(keyDim,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundTransparency=1}):Play()
    T:Create(keyPanel,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0),Position=UDim2.new(0.5,0,0.5,0)}):Play()
    task.delay(0.5,function() keyGui:Destroy() end)
end
local function tryKey()
    if keyBox.Text==KEY_PASSWORD then
        keyOk=true keyBoxStroke.Color=Color3.fromRGB(80,220,130) keyStroke.Color=Color3.fromRGB(80,220,130) keyBtn.Text="WELCOME" keyBtn.BackgroundColor3=Color3.fromRGB(80,220,130)
        task.delay(0.5,closeKey)
    else
        keyErr.Text="invalid license key" keyBox.Text="" keyBoxStroke.Color=Color3.fromRGB(255,80,80) keyStroke.Color=Color3.fromRGB(255,80,80)
        task.spawn(function() for i=1,3 do T:Create(keyBox,TweenInfo.new(0.05),{Position=UDim2.new(0,14,0,90)}):Play() task.wait(0.05) T:Create(keyBox,TweenInfo.new(0.05),{Position=UDim2.new(0,26,0,90)}):Play() task.wait(0.05) end T:Create(keyBox,TweenInfo.new(0.05),{Position=UDim2.new(0,20,0,90)}):Play() end)
        task.delay(1.0,function() keyErr.Text="" keyBoxStroke.Color=STROKE keyStroke.Color=AC end)
    end
end
keyBtn.MouseButton1Click:Connect(tryKey)
keyBox.FocusLost:Connect(function(enter) if enter then tryKey() end end)
while not keyOk do task.wait(0.1) end

-- INTRO
local introGui=Instance.new("ScreenGui") introGui.Name="dayDlc_Intro" introGui.ResetOnSpawn=false introGui.IgnoreGuiInset=true introGui.DisplayOrder=3000 introGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling introGui.Parent=pg
local introBg=Instance.new("Frame") introBg.Size=UDim2.new(1,0,1,0) introBg.BackgroundColor3=Color3.fromRGB(0,0,0) introBg.BackgroundTransparency=1 introBg.BorderSizePixel=0 introBg.Parent=introGui
local introGlow=Instance.new("Frame") introGlow.Size=UDim2.new(0,600,0,600) introGlow.Position=UDim2.new(0.5,-300,0.5,-300) introGlow.BackgroundColor3=AC introGlow.BackgroundTransparency=0.88 introGlow.BorderSizePixel=0 introGlow.Parent=introBg CC(introGlow,300)
local introLogo=Instance.new("Frame") introLogo.Size=UDim2.new(0,0,0,0) introLogo.Position=UDim2.new(0.5,0,0.5,-60) introLogo.AnchorPoint=Vector2.new(0.5,0.5) introLogo.BackgroundColor3=AC introLogo.BorderSizePixel=0 introLogo.Parent=introBg CC(introLogo,40)
local introLogoGrad=Instance.new("UIGradient") introLogoGrad.Color=ColorSequence.new(AC,AC3) introLogoGrad.Rotation=45 introLogoGrad.Parent=introLogo
local introLogoText=Instance.new("TextLabel") introLogoText.Size=UDim2.new(1,0,1,0) introLogoText.BackgroundTransparency=1 introLogoText.Text="d" introLogoText.TextColor3=Color3.new(1,1,1) introLogoText.Font=Enum.Font.GothamBold introLogoText.TextSize=48 introLogoText.Parent=introLogo
local introTitle=Instance.new("TextLabel") introTitle.Size=UDim2.new(1,-40,0,44) introTitle.Position=UDim2.new(0,20,0.5,20) introTitle.BackgroundTransparency=1 introTitle.Text="dayDlc" introTitle.TextColor3=Color3.fromRGB(255,255,255) introTitle.TextSize=42 introTitle.Font=Enum.Font.GothamBold introTitle.TextXAlignment=Enum.TextXAlignment.Center introTitle.TextTransparency=1 introTitle.Parent=introBg
local introSub=Instance.new("TextLabel") introSub.Size=UDim2.new(1,-40,0,20) introSub.Position=UDim2.new(0,20,0.5,66) introSub.BackgroundTransparency=1 introSub.Text="by DayDLC Team" introSub.TextColor3=Color3.fromRGB(200,180,255) introSub.TextSize=12 introSub.Font=Enum.Font.Gotham introSub.TextXAlignment=Enum.TextXAlignment.Center introSub.TextTransparency=1 introSub.Parent=introBg
local introBarBg=Instance.new("Frame") introBarBg.Size=UDim2.new(0,200,0,2) introBarBg.Position=UDim2.new(0.5,-100,0.5,110) introBarBg.BackgroundColor3=Color3.fromRGB(40,30,60) introBarBg.BorderSizePixel=0 introBarBg.Parent=introBg CC(introBarBg,1)
local introBarFg=Instance.new("Frame") introBarFg.Size=UDim2.new(0,0,1,0) introBarFg.BackgroundColor3=AC introBarFg.BorderSizePixel=0 introBarFg.Parent=introBarBg CC(introBarFg,1)
local introBarGrad=Instance.new("UIGradient") introBarGrad.Color=ColorSequence.new(AC,AC3) introBarGrad.Parent=introBarFg
local introVer=Instance.new("TextLabel") introVer.Size=UDim2.new(1,-40,0,14) introVer.Position=UDim2.new(0,20,1,-40) introVer.BackgroundTransparency=1 introVer.Text="v44.0 · build 2026" introVer.TextColor3=Color3.fromRGB(120,100,160) introVer.TextSize=10 introVer.Font=Enum.Font.Code introVer.TextXAlignment=Enum.TextXAlignment.Center introVer.TextTransparency=1 introVer.Parent=introBg
task.spawn(function()
    task.wait(0.1)
    T:Create(introBg,TweenInfo.new(0.5),{BackgroundTransparency=0.4}):Play()
    T:Create(introLogo,TweenInfo.new(0.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,90,0,90)}):Play()
    task.wait(0.4)
    T:Create(introTitle,TweenInfo.new(0.5),{TextTransparency=0}):Play()
    task.wait(0.2)
    T:Create(introSub,TweenInfo.new(0.5),{TextTransparency=0}):Play()
    T:Create(introBarFg,TweenInfo.new(1.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(1,0,1,0)}):Play()
    task.wait(1.4)
    T:Create(introVer,TweenInfo.new(0.3),{TextTransparency=0}):Play()
    task.wait(0.4)
    T:Create(introLogo,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(0.5,0,0.5,-200),BackgroundTransparency=1}):Play()
    T:Create(introTitle,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(0,20,0.5,-40),TextTransparency=1}):Play()
    T:Create(introSub,TweenInfo.new(0.5),{TextTransparency=1}):Play()
    T:Create(introBarBg,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
    T:Create(introBarFg,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
    T:Create(introVer,TweenInfo.new(0.5),{TextTransparency=1}):Play()
    T:Create(introGlow,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
    T:Create(introBg,TweenInfo.new(0.5),{BackgroundTransparency=1}):Play()
    task.wait(0.6) introGui:Destroy()
end)

local G=Instance.new("ScreenGui") G.Name="dayDlc" G.ResetOnSpawn=false G.IgnoreGuiInset=true G.DisplayOrder=999 G.ZIndexBehavior=Enum.ZIndexBehavior.Sibling G.Parent=pg _G.dG=G
local I=Instance.new("TextButton") I.Size=UDim2.new(0,56,0,56) I.Position=UDim2.new(0,16,0,60) I.Text="d" I.TextColor3=Color3.new(1,1,1) I.TextSize=40 I.Font=Enum.Font.GothamBold I.BackgroundColor3=AC I.BorderSizePixel=0 I.AutoButtonColor=false I.Visible=false I.Parent=G CC(I,14)

local vx=workspace.CurrentCamera.ViewportSize.X
local vy=workspace.CurrentCamera.ViewportSize.Y
local W=math.min(math.floor(vx*0.92),400)
local H=math.min(math.floor(vy*0.72),480)-- dayDlc v44.1 | part 2/2
-- продолжение части 1. вставить сразу после неё.

-- Nick
local sNick=sec(V,"Visual Nick")
local nR=Instance.new("Frame")
nR.Size=UDim2.new(1,0,0,80)
nR.BackgroundColor3=Color3.fromRGB(35,25,55)
nR.BackgroundTransparency=0.3
nR.BorderSizePixel=0
nR.Parent=sNick
CC(nR,9)
local nL=Instance.new("TextLabel")
nL.Size=UDim2.new(1,0,0,14)
nL.Position=UDim2.new(0,10,0,6)
nL.Text="Custom nickname"
nL.TextColor3=Color3.fromRGB(220,200,255)
nL.TextXAlignment=Enum.TextXAlignment.Left
nL.BackgroundTransparency=1
nL.Font=Enum.Font.GothamMedium
nL.TextSize=11
nL.Parent=nR
local nI=Instance.new("TextBox")
nI.Size=UDim2.new(1,-20,0,24)
nI.Position=UDim2.new(0,10,0,24)
nI.Text=""
nI.PlaceholderText="enter nickname"
nI.TextColor3=TX
nI.PlaceholderColor3=Color3.fromRGB(140,120,180)
nI.BackgroundColor3=Color3.fromRGB(18,12,30)
nI.BorderSizePixel=0
nI.Font=Enum.Font.GothamMedium
nI.TextSize=11
nI.ClearTextOnFocus=false
nI.Parent=nR
CC(nI,6)
local aB=Instance.new("TextButton")
aB.Size=UDim2.new(0.48,0,0,22)
aB.Position=UDim2.new(0,10,0,52)
aB.Text="Apply"
aB.TextColor3=Color3.new(1,1,1)
aB.BackgroundColor3=AC
aB.BorderSizePixel=0
aB.Font=Enum.Font.GothamBold
aB.TextSize=10
aB.Parent=nR
CC(aB,5)
local rB=Instance.new("TextButton")
rB.Size=UDim2.new(0.48,0,0,22)
rB.Position=UDim2.new(0.52,0,0,52)
rB.Text="Reset"
rB.TextColor3=Color3.new(1,1,1)
rB.BackgroundColor3=Color3.fromRGB(55,42,75)
rB.BorderSizePixel=0
rB.Font=Enum.Font.GothamBold
rB.TextSize=10
rB.Parent=nR
CC(rB,5)
local nBB=nil
local lN=nil
local function dB()
    if nBB and nBB.Parent then nBB:Destroy() end
    nBB=nil
end
local function cB(t)
    dB()
    local ch=LP.Character
    if not ch then return end
    local h=ch:FindFirstChild("Head")
    if not h then return end
    local bb=Instance.new("BillboardGui")
    bb.Name="dNick"
    bb.Size=UDim2.new(0,200,0,40)
    bb.StudsOffset=Vector3.new(0,3,0)
    bb.AlwaysOnTop=true
    bb.Parent=h
    nBB=bb
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,0,1,0)
    l.BackgroundTransparency=1
    l.Text=t
    l.TextColor3=Color3.new(1,1,1)
    l.TextStrokeTransparency=0
    l.TextStrokeColor3=Color3.new(0,0,0)
    l.Font=Enum.Font.GothamBold
    l.TextSize=18
    l.Parent=bb
end
aB.MouseButton1Click:Connect(function()
    local t=nI.Text
    if t and #t>0 then lN=t cB(t) end
end)
rB.MouseButton1Click:Connect(function() dB() lN=nil end)

-- MAIN
local sMove=sec(M,"Movement")
tg(sMove,"Auto Moonwalk",false,function(v)
    moonwalkOn=v
    if v then startMoonwalk() else stopMoonwalk() end
end)
local sZ=sec(M,"360 DBD")
tg(sZ,"Enable 360 DBD",false,function(v) dbdOn=v end)
sl2(sZ,"turn snappiness x100",40,100,85,function(v) dbdSnap=v/100 end)
sl2(sZ,"boost speed",16,60,22,function(v) dbdBoost=v end)
local zInfo=Instance.new("TextLabel")
zInfo.Size=UDim2.new(1,0,0,46)
zInfo.BackgroundColor3=Color3.fromRGB(35,25,55)
zInfo.BackgroundTransparency=0.3
zInfo.BorderSizePixel=0
zInfo.Text="  360 DBD mode\n  instant turns around the killer"
zInfo.TextColor3=Color3.fromRGB(160,140,200)
zInfo.TextXAlignment=Enum.TextXAlignment.Left
zInfo.TextYAlignment=Enum.TextYAlignment.Center
zInfo.Font=Enum.Font.GothamMedium
zInfo.TextSize=10
zInfo.Parent=sZ
CC(zInfo,9)
local sWS=sec(M,"Walkspeed")
tg(sWS,"Enable Walkspeed",false,function(v)
    wsEnabled=v
    if not v then wsActive=false end
    applyWS()
end)
sl2(sWS,"Speed",16,200,50,function(v) wsSpeed=v applyWS() end)
local wsModeLbl=Instance.new("TextButton")
wsModeLbl.Size=UDim2.new(1,0,0,24)
wsModeLbl.BackgroundColor3=Color3.fromRGB(35,25,55)
wsModeLbl.BackgroundTransparency=0.3
wsModeLbl.BorderSizePixel=0
wsModeLbl.Text="  mode: TOGGLE"
wsModeLbl.TextColor3=TX
wsModeLbl.TextXAlignment=Enum.TextXAlignment.Left
wsModeLbl.Font=Enum.Font.GothamBold
wsModeLbl.TextSize=11
wsModeLbl.AutoButtonColor=false
wsModeLbl.Parent=sWS
CC(wsModeLbl,9)
wsModeLbl.MouseButton1Click:Connect(function()
    if wsMode=="toggle" then wsMode="hold"
    elseif wsMode=="hold" then wsMode="always"
    else wsMode="toggle" end
    wsModeLbl.Text="  mode: "..string.upper(wsMode)
    wsActive=false
    applyWS()
end)
local wsBindBtn=Instance.new("TextButton")
wsBindBtn.Size=UDim2.new(1,0,0,34)
wsBindBtn.BackgroundColor3=Color3.fromRGB(35,25,55)
wsBindBtn.BackgroundTransparency=0.3
wsBindBtn.BorderSizePixel=0
wsBindBtn.Text="  bind: "..wsBind.Name
wsBindBtn.TextColor3=AC
wsBindBtn.TextXAlignment=Enum.TextXAlignment.Left
wsBindBtn.Font=Enum.Font.GothamBold
wsBindBtn.TextSize=11
wsBindBtn.AutoButtonColor=false
wsBindBtn.Parent=sWS
CC(wsBindBtn,9)
wsBindBtn.MouseButton1Click:Connect(function()
    wsListening=true
    wsBindBtn.Text="  press a key..."
end)
wsRefreshBind=function() wsBindBtn.Text="  bind: "..wsBind.Name end
tg(sWS,"Mobile on-screen button",false,function(v)
    if mobBtnRef then mobBtnRef.Visible=v end
end)
local sAoe=sec(M,"Killer Attack Zone")
tg(sAoe,"Show zone",true,function(v) aoeVisible=v end)
local function aoeColRow(parent,lbl,setter)
    local r=Instance.new("Frame")
    r.Size=UDim2.new(1,0,0,38)
    r.BackgroundColor3=Color3.fromRGB(35,25,55)
    r.BackgroundTransparency=0.3
    r.BorderSizePixel=0
    r.Parent=parent
    CC(r,9)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(0.44,0,1,0)
    l.Position=UDim2.new(0,10,0,0)
    l.Text=lbl
    l.TextColor3=Color3.fromRGB(220,200,255)
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.BackgroundTransparency=1
    l.Font=Enum.Font.GothamMedium
    l.TextSize=10
    l.Parent=r
    local h=Instance.new("Frame")
    h.Size=UDim2.new(0.56,-10,1,0)
    h.Position=UDim2.new(0.44,0,0,0)
    h.BackgroundTransparency=1
    h.Parent=r
    local hl=Instance.new("UIListLayout")
    hl.FillDirection=Enum.FillDirection.Horizontal
    hl.Padding=UDim.new(0,4)
    hl.VerticalAlignment=Enum.VerticalAlignment.Center
    hl.Parent=h
    for _,c in ipairs({Color3.fromRGB(80,220,130),Color3.fromRGB(60,150,255),Color3.fromRGB(255,220,60),Color3.fromRGB(255,150,50),Color3.fromRGB(255,60,60),Color3.fromRGB(255,60,255),Color3.fromRGB(255,255,255),Color3.fromRGB(140,90,255)}) do
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(0,18,0,18)
        b.Text=""
        b.BackgroundColor3=c
        b.BorderSizePixel=0
        b.AutoButtonColor=false
        b.Parent=h
        CC(b,4)
        b.MouseButton1Click:Connect(function() setter(c) end)
    end
end
aoeColRow(sAoe,"safe color",function(c) aoeColNorm=c end)
aoeColRow(sAoe,"danger color",function(c) aoeColDanger=c end)

-- WATERMARK
local wmGui=Instance.new("ScreenGui")
wmGui.Name="dayDlc_WM"
wmGui.ResetOnSpawn=false
wmGui.IgnoreGuiInset=true
wmGui.DisplayOrder=1000
wmGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
wmGui.Parent=pg
local wmF=Instance.new("Frame")
wmF.Size=UDim2.new(0,252,0,88)
wmF.Position=UDim2.new(1,-264,0,12)
wmF.BackgroundColor3=BG
wmF.BackgroundTransparency=0.1
wmF.BorderSizePixel=0
wmF.Parent=wmGui
CC(wmF,12)
local wmS=Instance.new("UIStroke")
wmS.Color=AC
wmS.Thickness=1
wmS.Transparency=0.5
wmS.Parent=wmF
local wmAcc=Instance.new("Frame")
wmAcc.Size=UDim2.new(0,3,1,-16)
wmAcc.Position=UDim2.new(0,6,0,8)
wmAcc.BackgroundColor3=AC
wmAcc.BorderSizePixel=0
wmAcc.Parent=wmF
CC(wmAcc,2)
local wmAccG=Instance.new("UIGradient")
wmAccG.Color=ColorSequence.new(AC,AC3)
wmAccG.Rotation=90
wmAccG.Parent=wmAcc
local wmDot=Instance.new("Frame")
wmDot.Size=UDim2.new(0,6,0,6)
wmDot.Position=UDim2.new(0,18,0,14)
wmDot.BackgroundColor3=Color3.fromRGB(80,220,130)
wmDot.BorderSizePixel=0
wmDot.Parent=wmF
CC(wmDot,3)
local wmDotS=Instance.new("UIStroke")
wmDotS.Color=Color3.fromRGB(80,220,130)
wmDotS.Thickness=2
wmDotS.Transparency=0.6
wmDotS.Parent=wmDot
task.spawn(function()
    while wmDot.Parent do
        task.wait(0.05)
        local t=0.5+0.5*math.sin(tick()*3)
        wmDotS.Transparency=0.3+t*0.7
    end
end)
local wmTitle=Instance.new("TextLabel")
wmTitle.Size=UDim2.new(1,-46,0,18)
wmTitle.Position=UDim2.new(0,30,0,8)
wmTitle.BackgroundTransparency=1
wmTitle.Text="dayDlc · v44.0"
wmTitle.TextColor3=TX
wmTitle.TextXAlignment=Enum.TextXAlignment.Left
wmTitle.Font=Enum.Font.GothamBold
wmTitle.TextSize=13
wmTitle.Parent=wmF
local wmUser=Instance.new("TextLabel")
wmUser.Size=UDim2.new(1,-30,0,14)
wmUser.Position=UDim2.new(0,18,0,28)
wmUser.BackgroundTransparency=1
wmUser.Text=tostring(LP.Name)
wmUser.TextColor3=Color3.fromRGB(200,180,255)
wmUser.TextXAlignment=Enum.TextXAlignment.Left
wmUser.Font=Enum.Font.GothamMedium
wmUser.TextSize=10
wmUser.Parent=wmF
local wmDiv=Instance.new("Frame")
wmDiv.Size=UDim2.new(1,-30,0,1)
wmDiv.Position=UDim2.new(0,18,0,46)
wmDiv.BackgroundColor3=STROKE
wmDiv.BorderSizePixel=0
wmDiv.Parent=wmF
local wmFps=Instance.new("TextLabel")
wmFps.Size=UDim2.new(0.5,0,0,16)
wmFps.Position=UDim2.new(0,18,0,54)
wmFps.BackgroundTransparency=1
wmFps.Text="fps --"
wmFps.TextColor3=Color3.fromRGB(160,140,200)
wmFps.TextXAlignment=Enum.TextXAlignment.Left
wmFps.Font=Enum.Font.Code
wmFps.TextSize=11
wmFps.Parent=wmF
local wmKil=Instance.new("TextLabel")
wmKil.Size=UDim2.new(0.5,-10,0,16)
wmKil.Position=UDim2.new(0.5,0,0,54)
wmKil.BackgroundTransparency=1
wmKil.Text="killer --"
wmKil.TextColor3=Color3.fromRGB(160,140,200)
wmKil.TextXAlignment=Enum.TextXAlignment.Right
wmKil.Font=Enum.Font.Code
wmKil.TextSize=11
wmKil.Parent=wmF
local wmFpsA,wmFpsF,wmFpsV=0,0,0
R.RenderStepped:Connect(function(dt)
    wmFpsF=wmFpsF+1
    wmFpsA=wmFpsA+dt
    if wmFpsA>=0.5 then
        wmFpsV=math.floor(wmFpsF/wmFpsA+0.5)
        wmFpsF=0 wmFpsA=0
        wmFps.Text="fps "..wmFpsV
    end
    local kd=nil
    local myHrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if myHrp then
        local best=math.huge
        for _,p in ipairs(P:GetPlayers()) do
            if p~=LP and isKiller(p) and p.Character then
                local h=p.Character:FindFirstChild("HumanoidRootPart")
                if h then
                    local d=(h.Position-myHrp.Position).Magnitude
                    if d<best then best=d end
                end
            end
        end
        if best<math.huge then kd=best end
    end
    if kd then
        wmKil.Text=string.format("killer %.0f",kd)
        if kd<=10 then wmKil.TextColor3=Color3.fromRGB(255,60,60)
        elseif kd<=25 then wmKil.TextColor3=Color3.fromRGB(255,200,60)
        else wmKil.TextColor3=Color3.fromRGB(80,220,130) end
    else
        wmKil.Text="killer --"
        wmKil.TextColor3=Color3.fromRGB(160,140,200)
    end
end)

-- TABS
local tabs={{k="Main",l="⊕  MAIN"},{k="Visual",l="◎  VISUAL"},{k="Config",l="⚙  CONFIG"}}
local tB={}
for i,t in ipairs(tabs) do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-12,0,34)
    b.Text=t.l
    b.TextColor3=Color3.fromRGB(180,160,220)
    b.BackgroundColor3=Color3.fromRGB(35,25,55)
    b.BackgroundTransparency=0.5
    b.BorderSizePixel=0
    b.Font=Enum.Font.GothamBold
    b.TextSize=10
    b.TextXAlignment=Enum.TextXAlignment.Left
    b.AutoButtonColor=false
    b.Parent=sd
    CC(b,9)
    local p=Instance.new("UIPadding")
    p.PaddingLeft=UDim.new(0,10)
    p.Parent=b
    tB[t.k]=b
end
local function swT(n)
    for k,b in pairs(tB) do
        local a=(k==n)
        b.BackgroundColor3=a and AC or Color3.fromRGB(35,25,55)
        b.BackgroundTransparency=a and 0 or 0.5
        b.TextColor3=a and Color3.new(1,1,1) or Color3.fromRGB(180,160,220)
        pages[k].Visible=a
    end
end
for k,b in pairs(tB) do
    b.MouseButton1Click:Connect(function() swT(k) end)
end
swT("Main")
local sMenuBg=sec(pages["Config"],"Menu theme")
local menuThemes={
    {bg=Color3.fromRGB(20,16,30),row=Color3.fromRGB(30,22,45),stroke=Color3.fromRGB(45,35,70)},
    {bg=Color3.fromRGB(15,15,15),row=Color3.fromRGB(28,28,28),stroke=Color3.fromRGB(50,50,50)},
    {bg=Color3.fromRGB(12,18,35),row=Color3.fromRGB(22,30,55),stroke=Color3.fromRGB(40,55,90)},
    {bg=Color3.fromRGB(30,12,15),row=Color3.fromRGB(45,22,25),stroke=Color3.fromRGB(80,40,45)},
    {bg=Color3.fromRGB(15,25,18),row=Color3.fromRGB(25,40,28),stroke=Color3.fromRGB(40,65,45)}
}
local mbR=Instance.new("Frame")
mbR.Size=UDim2.new(1,0,0,42)
mbR.BackgroundColor3=Color3.fromRGB(35,25,55)
mbR.BackgroundTransparency=0.3
mbR.BorderSizePixel=0
mbR.Parent=sMenuBg
CC(mbR,9)
local mbH=Instance.new("Frame")
mbH.Size=UDim2.new(1,-16,0,22)
mbH.Position=UDim2.new(0,8,0.5,-11)
mbH.BackgroundTransparency=1
mbH.Parent=mbR
local mbHL=Instance.new("UIListLayout")
mbHL.FillDirection=Enum.FillDirection.Horizontal
mbHL.Padding=UDim.new(0,5)
mbHL.VerticalAlignment=Enum.VerticalAlignment.Center
mbHL.Parent=mbH
for _,th in ipairs(menuThemes) do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(0,22,0,22)
    b.Text=""
    b.BackgroundColor3=th.bg
    b.BorderSizePixel=2
    b.BorderColor3=th.stroke
    b.AutoButtonColor=false
    b.Parent=mbH
    CC(b,5)
    b.MouseButton1Click:Connect(function()
        w.BackgroundColor3=th.bg
        ws.Color=th.stroke
        for _,d in ipairs(w:GetDescendants()) do
            if d:IsA("Frame") and d.BackgroundColor3==Color3.fromRGB(30,22,45) then
                d.BackgroundColor3=th.row
            end
        end
    end)
end

-- Меню открытие / закрытие
local mO=false
local function opM()
    mO=true
    w.Visible=true
    w.BackgroundTransparency=1
    w.Size=UDim2.new(0,W*0.7,0,H*0.7)
    w.Position=UDim2.new(0.5,-W*0.35,0.5,-H*0.35)
    T:Create(w,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size=UDim2.new(0,W,0,H),
        Position=UDim2.new(0.5,-W/2,0.5,-H/2),
        BackgroundTransparency=0
    }):Play()
    pcall(function()
        U.MouseIconEnabled=true
        U.MouseBehavior=Enum.MouseBehavior.Default
    end)
end
local function clM()
    mO=false
    T:Create(w,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        Size=UDim2.new(0,W*0.7,0,H*0.7),
        Position=UDim2.new(0.5,-W*0.35,0.5,-H*0.35),
        BackgroundTransparency=1
    }):Play()
    task.delay(0.22,function()
        w.Visible=false
        w.BackgroundTransparency=0
    end)
end
I.MouseButton1Click:Connect(function()
    if suppressNextClickI then return end
    if mO then clM() else opM() end
end)
cb.MouseButton1Click:Connect(clM)
task.spawn(function()
    while true do
        task.wait(0.5)
        local pGui=LP:FindFirstChild("PlayerGui")
        if pGui then
            if _G.dG and not _G.dG.Parent then _G.dG.Parent=pGui end
            if wmGui and not wmGui.Parent then wmGui.Parent=pGui end
        end
    end
end)
LP.CharacterAdded:Connect(function()
    task.wait(0.6)
    local pGui=LP:FindFirstChild("PlayerGui")
    if pGui then
        if G and not G.Parent then G.Parent=pGui end
        if wmGui and not wmGui.Parent then wmGui.Parent=pGui end
        G.Enabled=true
        wmGui.Enabled=true
    end
end)
U.InputBegan:Connect(function(i,g)
    if g then return end
    if i.KeyCode==Enum.KeyCode.RightShift then
        if mO then clM() else opM() end
    end
end)

-- KILLER ATTACK ZONE
local AOE_RANGE=6
local AOE_HALF=math.rad(8)
local AOE_HEIGHT=0.02
local AOE_ARC_STEPS=24
local aoeFolder=Instance.new("Folder")
aoeFolder.Name="dayDlc_AOE"
aoeFolder.Parent=workspace
local meshPart=Instance.new("MeshPart")
meshPart.Name="aoeSector"
meshPart.Anchored=true
meshPart.CanCollide=false
meshPart.CanQuery=false
meshPart.CanTouch=false
meshPart.Material=Enum.Material.Neon
meshPart.Color=aoeColNorm
meshPart.Transparency=0.2
meshPart.CFrame=CFrame.new(0,-1000,0)
meshPart.Parent=aoeFolder
local emeshOk=false
pcall(function()
    local AS=game:GetService("AssetService")
    local emesh=AS:CreateEditableMesh()
    local vA=emesh:AddVertex(Vector3.new(0,0,0))
    local arc={}
    for i=0,AOE_ARC_STEPS do
        local t=i/AOE_ARC_STEPS
        local ang=-AOE_HALF + t*(2*AOE_HALF)
        arc[i+1]=emesh:AddVertex(Vector3.new(math.sin(ang)*AOE_RANGE,0,math.cos(ang)*AOE_RANGE))
    end
    for i=1,AOE_ARC_STEPS do
        emesh:AddTriangle(vA,arc[i],arc[i+1])
    end
    meshPart.MeshContent=Content.fromObject(emesh)
    emeshOk=true
end)
local fallbackParts={}
if not emeshOk then
    for i=1,200 do
        local b=Instance.new("Part")
        b.Shape=Enum.PartType.Ball
        b.Size=Vector3.new(0.4,AOE_HEIGHT,0.4)
        b.Anchored=true
        b.CanCollide=false
        b.CanQuery=false
        b.CanTouch=false
        b.Material=Enum.Material.Neon
        b.Color=aoeColNorm
        b.Transparency=0.3
        b.CFrame=CFrame.new(0,-1000,0)
        b.Parent=aoeFolder
        table.insert(fallbackParts,b)
    end
end
local vertexDot=Instance.new("Part")
vertexDot.Shape=Enum.PartType.Ball
vertexDot.Size=Vector3.new(0.6,0.6,0.6)
vertexDot.Anchored=true
vertexDot.CanCollide=false
vertexDot.CanQuery=false
vertexDot.CanTouch=false
vertexDot.Material=Enum.Material.Neon
vertexDot.Color=aoeColNorm
vertexDot.Transparency=0.1
vertexDot.CFrame=CFrame.new(0,-1000,0)
vertexDot.Parent=aoeFolder
task.spawn(function()
    while aoeFolder.Parent do
        task.wait(0.03)
        local pulse=0.5+0.5*math.sin(tick()*5)
        local kh=nil
        for _,p in ipairs(P:GetPlayers()) do
            if p~=LP and isKiller(p) and p.Character then
                local h=p.Character:FindFirstChild("HumanoidRootPart")
                if h then kh=h break end
            end
        end
        if not aoeVisible or not kh then
            if emeshOk then meshPart.Transparency=1 end
            vertexDot.Transparency=1
            for _,b in ipairs(fallbackParts) do b.Transparency=1 end
        else
            local kp=kh.Position
            local fy=kp.Y-2.7
            local look=kh.CFrame.LookVector
            local lf=Vector3.new(look.X,0,look.Z)
            if lf.Magnitude<0.01 then lf=Vector3.new(0,0,1) end
            lf=-lf.Unit
            local myHrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
            local inCone=false
            if myHrp then
                local toMe=myHrp.Position-kp
                local flat=Vector3.new(toMe.X,0,toMe.Z)
                local d=flat.Magnitude
                if d<=AOE_RANGE and d>0.1 then
                    local dot=lf:Dot(flat.Unit)
                    local ang=math.acos(math.clamp(dot,-1,1))
                    if ang<=AOE_HALF then inCone=true end
                end
            end
            local col=inCone and aoeColDanger or aoeColNorm
            local trans=inCone and (0.05+0.25*pulse) or 0.35
            local base=Vector3.new(kp.X,fy+0.03,kp.Z)
            if emeshOk then
                meshPart.CFrame=CFrame.lookAt(base,base+lf)
                meshPart.Color=col
                meshPart.Transparency=trans
            else
                local right=Vector3.new(lf.Z,0,-lf.X)
                local idx=0
                for r=0,12 do
                    local d=(r/12)*AOE_RANGE
                    if d<0.4 then d=0.4 end
                    local hw=d*math.tan(AOE_HALF)
                    local cols=math.max(2,math.ceil(2*hw/0.3))
                    for c=0,cols do
                        idx=idx+1
                        if idx<=#fallbackParts then
                            local lat=-hw+(c/cols)*2*hw
                            local pos=base+lf*d+right*lat
                            fallbackParts[idx].CFrame=CFrame.new(pos)
                            fallbackParts[idx].Color=col
                            fallbackParts[idx].Transparency=trans+0.05
                        end
                    end
                end
                for k=idx+1,#fallbackParts do fallbackParts[k].Transparency=1 end
            end
            vertexDot.CFrame=CFrame.new(base+Vector3.new(0,0.15,0))
            vertexDot.Color=col
            vertexDot.Transparency=inCone and (0.05+0.2*pulse) or 0.2
        end
    end
end)

-- MOBILE BTN (WS)
local mobGui=Instance.new("ScreenGui")
mobGui.Name="dayDlc_MobBtn"
mobGui.ResetOnSpawn=false
mobGui.IgnoreGuiInset=true
mobGui.DisplayOrder=500
mobGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
mobGui.Parent=pg
local mobBtn=Instance.new("TextButton")
mobBtn.Size=UDim2.new(0,72,0,72)
mobBtn.Position=UDim2.new(1,-100,0.5,-36)
mobBtn.BackgroundColor3=AC
mobBtn.BackgroundTransparency=0.15
mobBtn.BorderSizePixel=0
mobBtn.Text="WS"
mobBtn.TextColor3=Color3.new(1,1,1)
mobBtn.Font=Enum.Font.GothamBold
mobBtn.TextSize=20
mobBtn.AutoButtonColor=false
mobBtn.Visible=false
mobBtn.Parent=mobGui
CC(mobBtn,36)
mobBtnRef=mobBtn
local mobS=Instance.new("UIStroke")
mobS.Color=Color3.new(1,1,1)
mobS.Thickness=2
mobS.Transparency=0.3
mobS.Parent=mobBtn
local mobDrag=false
local mobSt=nil
local mobOr=nil
local mobMoved=false
mobBtn.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
        mobDrag=true
        mobMoved=false
        mobSt=i.Position
        mobOr=mobBtn.Position
        if wsMode=="hold" and wsEnabled then wsActive=true applyWS() end
    end
end)
mobBtn.InputChanged:Connect(function(i)
    if mobDrag and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then
        local d=i.Position-mobSt
        if d.Magnitude>6 then mobMoved=true end
        if mobMoved then
            mobBtn.Position=UDim2.new(mobOr.X.Scale,mobOr.X.Offset+d.X,mobOr.Y.Scale,mobOr.Y.Offset+d.Y)
        end
    end
end)
mobBtn.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
        if mobDrag then
            mobDrag=false
            if not mobMoved and wsEnabled and wsMode=="toggle" then
                wsActive=not wsActive
                applyWS()
            end
            if wsMode=="hold" and wsEnabled then
                wsActive=false
                applyWS()
            end
        end
    end
end)
task.spawn(function()
    while mobGui.Parent do
        task.wait(0.1)
        if mobBtn.Visible and wsEnabled then
            mobBtn.BackgroundColor3=wsActive and Color3.fromRGB(80,220,130) or AC
        end
    end
end)

print("[dayDlc] v44.1 READY")
