-- dayDlc v44.1 | part 1/2
local P=game:GetService("Players")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local T=game:GetService("TweenService")
local L=game:GetService("Lighting")
local LP=P.LocalPlayer
local C=workspace.CurrentCamera
local AC=Color3.fromRGB(140,90,255)
local AC2=Color3.fromRGB(200,140,255)
local AC3=Color3.fromRGB(255,150,220)
local BG=Color3.fromRGB(20,16,30)
local TX=Color3.fromRGB(240,240,250)
local STROKE=Color3.fromRGB(45,35,70)
local IS_PC=U.KeyboardEnabled and not U.TouchEnabled
local function CC(i,r) local c=Instance.new("UICorner") c.CornerRadius=UDim.new(0,r or 8) c.Parent=i end
local pg=LP:WaitForChild("PlayerGui")
if _G.dG and _G.dG.Parent then _G.dG:Destroy() end

local function isKiller(plr)
    if plr==LP then return false end
    local char=plr.Character if not char then return false end
    if plr.Team and plr.Team.Name:lower():find("killer") then return true end
    for _,attr in ipairs({"Role","role","Team","team","Side","side"}) do
        local v=plr:GetAttribute(attr) or char:GetAttribute(attr)
        if typeof(v)=="string" and v:lower():find("killer") then return true end
    end
    for _,c in ipairs(char:GetChildren()) do
        if c:IsA("StringValue") then
            local n=c.Name:lower() local v=tostring(c.Value):lower()
            if (n:find("role") or n:find("team")) and v:find("killer") then return true end
        end
    end
    local tool=char:FindFirstChildOfClass("Tool")
    if tool then
        local tn=tool.Name:lower()
        if tn:find("knife") or tn:find("sword") or tn:find("weapon") or tn:find("axe") or tn:find("machete") then return true end
    end
    local n=plr.Name:lower()
    if n:find("killer") or n:find("maniac") then return true end
    return false
end

-- KEY SYSTEM
local KEY_PASSWORD="1234"
local keyOk=false
local keyGui=Instance.new("ScreenGui")
keyGui.Name="dayDlc_Key"
keyGui.ResetOnSpawn=false
keyGui.IgnoreGuiInset=true
keyGui.DisplayOrder=9999
keyGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
keyGui.Parent=pg
local keyDim=Instance.new("Frame")
keyDim.Size=UDim2.new(1,0,1,0)
keyDim.BackgroundColor3=Color3.fromRGB(0,0,0)
keyDim.BackgroundTransparency=1
keyDim.BorderSizePixel=0
keyDim.Parent=keyGui
T:Create(keyDim,TweenInfo.new(0.4),{BackgroundTransparency=0.4}):Play()
local keyGlow=Instance.new("Frame")
keyGlow.Size=UDim2.new(0,400,0,300)
keyGlow.Position=UDim2.new(0.5,-200,0.5,-150)
keyGlow.BackgroundColor3=AC
keyGlow.BackgroundTransparency=0.72
keyGlow.BorderSizePixel=0
keyGlow.Parent=keyDim
CC(keyGlow,50)
local keyGlowGrad=Instance.new("UIGradient")
keyGlowGrad.Color=ColorSequence.new(AC,AC3)
keyGlowGrad.Rotation=45
keyGlowGrad.Parent=keyGlow
local keyGlow2=Instance.new("Frame")
keyGlow2.Size=UDim2.new(0,360,0,260)
keyGlow2.Position=UDim2.new(0.5,-180,0.5,-130)
keyGlow2.BackgroundColor3=AC3
keyGlow2.BackgroundTransparency=0.82
keyGlow2.BorderSizePixel=0
keyGlow2.Parent=keyDim
CC(keyGlow2,48)
task.spawn(function()
    while keyGlow.Parent do
        task.wait(0.05)
        local t=0.5+0.5*math.sin(tick()*2)
        keyGlow.BackgroundTransparency=0.7+0.15*t
    end
end)
local keyPanel=Instance.new("Frame")
keyPanel.Size=UDim2.new(0,0,0,0)
keyPanel.Position=UDim2.new(0.5,0,0.5,0)
keyPanel.BackgroundColor3=BG
keyPanel.BorderSizePixel=0
keyPanel.ZIndex=2
keyPanel.Parent=keyDim
CC(keyPanel,20)
T:Create(keyPanel,TweenInfo.new(0.45,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,320,0,240),Position=UDim2.new(0.5,-160,0.5,-120)}):Play()
local keyPanelGrad=Instance.new("UIGradient")
keyPanelGrad.Color=ColorSequence.new({
    ColorSequenceKeypoint.new(0,Color3.fromRGB(40,28,62)),
    ColorSequenceKeypoint.new(0.5,BG),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(28,20,45))
})
keyPanelGrad.Rotation=135
keyPanelGrad.Parent=keyPanel
local keyStroke=Instance.new("UIStroke")
keyStroke.Color=AC
keyStroke.Thickness=1.5
keyStroke.Transparency=0.3
keyStroke.Parent=keyPanel
local keyBar=Instance.new("Frame")
keyBar.Size=UDim2.new(0,3,0,56)
keyBar.Position=UDim2.new(0,18,0,28)
keyBar.BackgroundColor3=AC
keyBar.BorderSizePixel=0
keyBar.ZIndex=3
keyBar.Parent=keyPanel
CC(keyBar,2)
local keyBarGrad=Instance.new("UIGradient")
keyBarGrad.Color=ColorSequence.new(AC,AC2,AC3)
keyBarGrad.Rotation=90
keyBarGrad.Parent=keyBar
local keyLogo=Instance.new("Frame")
keyLogo.Size=UDim2.new(0,28,0,28)
keyLogo.Position=UDim2.new(0,30,0,28)
keyLogo.BackgroundColor3=AC
keyLogo.BorderSizePixel=0
keyLogo.ZIndex=3
keyLogo.Parent=keyPanel
CC(keyLogo,14)
local keyLogoGrad=Instance.new("UIGradient")
keyLogoGrad.Color=ColorSequence.new(AC,AC3)
keyLogoGrad.Rotation=45
keyLogoGrad.Parent=keyLogo
local keyLogoText=Instance.new("TextLabel")
keyLogoText.Size=UDim2.new(1,0,1,0)
keyLogoText.BackgroundTransparency=1
keyLogoText.Text="d"
keyLogoText.TextColor3=Color3.new(1,1,1)
keyLogoText.Font=Enum.Font.GothamBold
keyLogoText.TextSize=16
keyLogoText.ZIndex=4
keyLogoText.Parent=keyLogo
local keyPulse=Instance.new("Frame")
keyPulse.Size=UDim2.new(0,8,0,8)
keyPulse.Position=UDim2.new(1,-26,0,32)
keyPulse.BackgroundColor3=Color3.fromRGB(80,220,130)
keyPulse.BorderSizePixel=0
keyPulse.ZIndex=3
keyPulse.Parent=keyPanel
CC(keyPulse,4)
local keyPulseStroke=Instance.new("UIStroke")
keyPulseStroke.Color=Color3.fromRGB(80,220,130)
keyPulseStroke.Thickness=2
keyPulseStroke.Transparency=0.5
keyPulseStroke.Parent=keyPulse
task.spawn(function()
    while keyPulse.Parent do
        task.wait(0.05)
        local t=0.5+0.5*math.sin(tick()*4)
        keyPulse.BackgroundTransparency=t*0.7
        keyPulseStroke.Transparency=0.3+t*0.7
    end
end)
local keyTitle=Instance.new("TextLabel")
keyTitle.Size=UDim2.new(1,-70,0,22)
keyTitle.Position=UDim2.new(0,66,0,28)
keyTitle.BackgroundTransparency=1
keyTitle.Text="dayDlc access"
keyTitle.TextColor3=TX
keyTitle.TextXAlignment=Enum.TextXAlignment.Left
keyTitle.Font=Enum.Font.GothamBold
keyTitle.TextSize=16
keyTitle.ZIndex=3
keyTitle.Parent=keyPanel
local keySub=Instance.new("TextLabel")
keySub.Size=UDim2.new(1,-70,0,14)
keySub.Position=UDim2.new(0,66,0,48)
keySub.BackgroundTransparency=1
keySub.Text="enter your license key"
keySub.TextColor3=Color3.fromRGB(170,150,210)
keySub.TextXAlignment=Enum.TextXAlignment.Left
keySub.Font=Enum.Font.Gotham
keySub.TextSize=10
keySub.ZIndex=3
keySub.Parent=keyPanel
local keyDiv=Instance.new("Frame")
keyDiv.Size=UDim2.new(1,-36,0,1)
keyDiv.Position=UDim2.new(0,18,0,72)
keyDiv.BackgroundColor3=STROKE
keyDiv.BorderSizePixel=0
keyDiv.ZIndex=3
keyDiv.Parent=keyPanel
local keyBox=Instance.new("TextBox")
keyBox.Size=UDim2.new(1,-40,0,46)
keyBox.Position=UDim2.new(0,20,0,90)
keyBox.BackgroundColor3=Color3.fromRGB(15,10,25)
keyBox.BorderSizePixel=0
keyBox.Text=""
keyBox.PlaceholderText="••••••••"
keyBox.PlaceholderColor3=Color3.fromRGB(110,90,150)
keyBox.TextColor3=TX
keyBox.Font=Enum.Font.GothamBold
keyBox.TextSize=20
keyBox.ClearTextOnFocus=false
keyBox.ZIndex=3
keyBox.Parent=keyPanel
CC(keyBox,10)
local keyBoxStroke=Instance.new("UIStroke")
keyBoxStroke.Color=STROKE
keyBoxStroke.Thickness=1
keyBoxStroke.Parent=keyBox
if IS_PC then
    keyBox.Focused:Connect(function()
        T:Create(keyBoxStroke,TweenInfo.new(0.15),{Color=AC,Thickness=1.5}):Play()
    end)
end
local keyBtn=Instance.new("TextButton")
keyBtn.Size=UDim2.new(1,-40,0,46)
keyBtn.Position=UDim2.new(0,20,0,148)
keyBtn.BackgroundColor3=AC
keyBtn.BorderSizePixel=0
keyBtn.Text="SIGN IN"
keyBtn.TextColor3=Color3.new(1,1,1)
keyBtn.Font=Enum.Font.GothamBold
keyBtn.TextSize=13
keyBtn.AutoButtonColor=false
keyBtn.ZIndex=3
keyBtn.Parent=keyPanel
CC(keyBtn,10)
local keyBtnGrad=Instance.new("UIGradient")
keyBtnGrad.Color=ColorSequence.new(AC,AC2,AC3)
keyBtnGrad.Rotation=0
keyBtnGrad.Parent=keyBtn
if IS_PC then
    keyBtn.MouseEnter:Connect(function()
        T:Create(keyBtn,TweenInfo.new(0.12),{BackgroundColor3=AC2}):Play()
    end)
    keyBtn.MouseLeave:Connect(function()
        T:Create(keyBtn,TweenInfo.new(0.12),{BackgroundColor3=AC}):Play()
    end)
end
local keyErr=Instance.new("TextLabel")
keyErr.Size=UDim2.new(1,-40,0,16)
keyErr.Position=UDim2.new(0,20,0,202)
keyErr.BackgroundTransparency=1
keyErr.Text=""
keyErr.TextColor3=Color3.fromRGB(255,80,80)
keyErr.Font=Enum.Font.GothamMedium
keyErr.TextSize=11
keyErr.TextXAlignment=Enum.TextXAlignment.Center
keyErr.ZIndex=3
keyErr.Parent=keyPanel
local function closeKey()
    T:Create(keyDim,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundTransparency=1}):Play()
    T:Create(keyPanel,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0),Position=UDim2.new(0.5,0,0.5,0)}):Play()
    task.delay(0.5,function() keyGui:Destroy() end)
end
local function tryKey()
    if keyBox.Text==KEY_PASSWORD then
        keyOk=true
        keyBoxStroke.Color=Color3.fromRGB(80,220,130)
        keyStroke.Color=Color3.fromRGB(80,220,130)
        keyBtn.Text="WELCOME"
        keyBtn.BackgroundColor3=Color3.fromRGB(80,220,130)
        task.delay(0.5,closeKey)
    else
        keyErr.Text="invalid license key"
        keyBox.Text=""
        keyBoxStroke.Color=Color3.fromRGB(255,80,80)
        keyStroke.Color=Color3.fromRGB(255,80,80)
        task.spawn(function()
            for i=1,3 do
                T:Create(keyBox,TweenInfo.new(0.05),{Position=UDim2.new(0,14,0,90)}):Play()
                task.wait(0.05)
                T:Create(keyBox,TweenInfo.new(0.05),{Position=UDim2.new(0,26,0,90)}):Play()
                task.wait(0.05)
            end
            T:Create(keyBox,TweenInfo.new(0.05),{Position=UDim2.new(0,20,0,90)}):Play()
        end)
        task.delay(1.0,function()
            keyErr.Text=""
            keyBoxStroke.Color=STROKE
            keyStroke.Color=AC
        end)
    end
end
keyBtn.MouseButton1Click:Connect(tryKey)
keyBox.FocusLost:Connect(function(enter) if enter then tryKey() end end)
while not keyOk do task.wait(0.1) end

-- INTRO
local introGui=Instance.new("ScreenGui")
introGui.Name="dayDlc_Intro"
introGui.ResetOnSpawn=false
introGui.IgnoreGuiInset=true
introGui.DisplayOrder=3000
introGui.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
introGui.Parent=pg
local introBg=Instance.new("Frame")
introBg.Size=UDim2.new(1,0,1,0)
introBg.BackgroundColor3=Color3.fromRGB(0,0,0)
introBg.BackgroundTransparency=1
introBg.BorderSizePixel=0
introBg.Parent=introGui
local introGlow=Instance.new("Frame")
introGlow.Size=UDim2.new(0,600,0,600)
introGlow.Position=UDim2.new(0.5,-300,0.5,-300)
introGlow.BackgroundColor3=AC
introGlow.BackgroundTransparency=0.88
introGlow.BorderSizePixel=0
introGlow.Parent=introBg
CC(introGlow,300)
local introLogo=Instance.new("Frame")
introLogo.Size=UDim2.new(0,0,0,0)
introLogo.Position=UDim2.new(0.5,0,0.5,-60)
introLogo.AnchorPoint=Vector2.new(0.5,0.5)
introLogo.BackgroundColor3=AC
introLogo.BorderSizePixel=0
introLogo.Parent=introBg
CC(introLogo,40)
local introLogoGrad=Instance.new("UIGradient")
introLogoGrad.Color=ColorSequence.new(AC,AC3)
introLogoGrad.Rotation=45
introLogoGrad.Parent=introLogo
local introLogoText=Instance.new("TextLabel")
introLogoText.Size=UDim2.new(1,0,1,0)
introLogoText.BackgroundTransparency=1
introLogoText.Text="d"
introLogoText.TextColor3=Color3.new(1,1,1)
introLogoText.Font=Enum.Font.GothamBold
introLogoText.TextSize=48
introLogoText.Parent=introLogo
local introTitle=Instance.new("TextLabel")
introTitle.Size=UDim2.new(1,-40,0,44)
introTitle.Position=UDim2.new(0,20,0.5,20)
introTitle.BackgroundTransparency=1
introTitle.Text="dayDlc"
introTitle.TextColor3=Color3.fromRGB(255,255,255)
introTitle.TextSize=42
introTitle.Font=Enum.Font.GothamBold
introTitle.TextXAlignment=Enum.TextXAlignment.Center
introTitle.TextTransparency=1
introTitle.Parent=introBg
local introSub=Instance.new("TextLabel")
introSub.Size=UDim2.new(1,-40,0,20)
introSub.Position=UDim2.new(0,20,0.5,66)
introSub.BackgroundTransparency=1
introSub.Text="by DayDLC Team"
introSub.TextColor3=Color3.fromRGB(200,180,255)
introSub.TextSize=12
introSub.Font=Enum.Font.Gotham
introSub.TextXAlignment=Enum.TextXAlignment.Center
introSub.TextTransparency=1
introSub.Parent=introBg
local introBarBg=Instance.new("Frame")
introBarBg.Size=UDim2.new(0,200,0,2)
introBarBg.Position=UDim2.new(0.5,-100,0.5,110)
introBarBg.BackgroundColor3=Color3.fromRGB(40,30,60)
introBarBg.BorderSizePixel=0
introBarBg.Parent=introBg
CC(introBarBg,1)
local introBarFg=Instance.new("Frame")
introBarFg.Size=UDim2.new(0,0,1,0)
introBarFg.BackgroundColor3=AC
introBarFg.BorderSizePixel=0
introBarFg.Parent=introBarBg
CC(introBarFg,1)
local introBarGrad=Instance.new("UIGradient")
introBarGrad.Color=ColorSequence.new(AC,AC3)
introBarGrad.Parent=introBarFg
local introVer=Instance.new("TextLabel")
introVer.Size=UDim2.new(1,-40,0,14)
introVer.Position=UDim2.new(0,20,1,-40)
introVer.BackgroundTransparency=1
introVer.Text="v44.0 · build 2026"
introVer.TextColor3=Color3.fromRGB(120,100,160)
introVer.TextSize=10
introVer.Font=Enum.Font.Code
introVer.TextXAlignment=Enum.TextXAlignment.Center
introVer.TextTransparency=1
introVer.Parent=introBg
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
    task.wait(0.6)
    introGui:Destroy()
end)

-- MAIN GUI
local G=Instance.new("ScreenGui")
G.Name="dayDlc"
G.ResetOnSpawn=false
G.IgnoreGuiInset=true
G.DisplayOrder=999
G.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
G.Parent=pg
_G.dG=G

-- кнопка "d" (видна на мобиле, драг)
local suppressNextClickI=false
local I=Instance.new("TextButton")
I.Size=UDim2.new(0,64,0,64)
I.Position=UDim2.new(0,16,0,60)
I.Text="d"
I.TextColor3=Color3.new(1,1,1)
I.TextSize=40
I.Font=Enum.Font.GothamBold
I.BackgroundColor3=AC
I.BorderSizePixel=0
I.AutoButtonColor=false
I.Active=true
I.Visible=true
I.Parent=G
CC(I,14)
do
    local dragI=false local dragStartI=nil local dragOriginI=nil local movedI=false
    I.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then
            dragI=true movedI=false dragStartI=input.Position dragOriginI=I.Position
        end
    end)
    I.InputChanged:Connect(function(input)
        if not dragI then return end
        if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseMovement then
            local d=input.Position-dragStartI
            if d.Magnitude>8 then movedI=true end
            if movedI then
                I.Position=UDim2.new(dragOriginI.X.Scale,dragOriginI.X.Offset+d.X,dragOriginI.Y.Scale,dragOriginI.Y.Offset+d.Y)
            end
        end
    end)
    I.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then
            if dragI and movedI then
                suppressNextClickI=true
                task.delay(0.08,function() suppressNextClickI=false end)
            end
            dragI=false
        end
    end)
end

local vx=workspace.CurrentCamera.ViewportSize.X
local vy=workspace.CurrentCamera.ViewportSize.Y
local W=math.min(math.floor(vx*0.92),400)
local H=math.min(math.floor(vy*0.72),480)
local w=Instance.new("Frame")
w.Size=UDim2.new(0,W,0,H)
w.Position=UDim2.new(0.5,-W/2,0.5,-H/2)
w.BackgroundColor3=BG
w.BorderSizePixel=0
w.Visible=false
w.ClipsDescendants=true
w.Parent=G
CC(w,20)
local wGlow=Instance.new("Frame")
wGlow.Size=UDim2.new(1,8,1,8)
wGlow.Position=UDim2.new(0,-4,0,-4)
wGlow.BackgroundColor3=AC
wGlow.BackgroundTransparency=0.88
wGlow.BorderSizePixel=0
wGlow.ZIndex=0
wGlow.Parent=w
CC(wGlow,24)
local wGlowGrad=Instance.new("UIGradient")
wGlowGrad.Color=ColorSequence.new(AC,AC3)
wGlowGrad.Rotation=45
wGlowGrad.Parent=wGlow
local ws=Instance.new("UIStroke")
ws.Color=AC
ws.Thickness=1.2
ws.Transparency=0.4
ws.Parent=w
local wGrad=Instance.new("UIGradient")
wGrad.Color=ColorSequence.new({
    ColorSequenceKeypoint.new(0,Color3.fromRGB(40,28,60)),
    ColorSequenceKeypoint.new(0.5,BG),
    ColorSequenceKeypoint.new(1,Color3.fromRGB(26,20,42))
})
wGrad.Rotation=135
wGrad.Parent=w
local hd=Instance.new("Frame")
hd.Size=UDim2.new(1,0,0,52)
hd.BackgroundColor3=Color3.fromRGB(30,22,48)
hd.BackgroundTransparency=0.15
hd.BorderSizePixel=0
hd.ZIndex=2
hd.Parent=w
CC(hd,20)
local hdMask=Instance.new("Frame")
hdMask.Size=UDim2.new(1,0,0,20)
hdMask.Position=UDim2.new(0,0,1,-18)
hdMask.BackgroundColor3=Color3.fromRGB(30,22,48)
hdMask.BackgroundTransparency=0.15
hdMask.BorderSizePixel=0
hdMask.ZIndex=3
hdMask.Parent=hd
local hdLine=Instance.new("Frame")
hdLine.Size=UDim2.new(1,0,0,1)
hdLine.Position=UDim2.new(0,0,1,-1)
hdLine.BackgroundColor3=AC
hdLine.BorderSizePixel=0
hdLine.ZIndex=4
hdLine.Parent=hd
local hdLineGrad=Instance.new("UIGradient")
hdLineGrad.Color=ColorSequence.new(AC,AC2,AC3,AC2,AC)
hdLineGrad.Parent=hdLine
local ha=Instance.new("Frame")
ha.Size=UDim2.new(0,3,0,32)
ha.Position=UDim2.new(0,14,0.5,-16)
ha.BackgroundColor3=AC
ha.BorderSizePixel=0
ha.ZIndex=4
ha.Parent=hd
CC(ha,2)
local haGrad=Instance.new("UIGradient")
haGrad.Color=ColorSequence.new(AC,AC3)
haGrad.Rotation=90
haGrad.Parent=ha
local hLogo=Instance.new("Frame")
hLogo.Size=UDim2.new(0,30,0,30)
hLogo.Position=UDim2.new(0,26,0.5,-15)
hLogo.BackgroundColor3=AC
hLogo.BorderSizePixel=0
hLogo.ZIndex=4
hLogo.Parent=hd
CC(hLogo,15)
local hLogoGrad=Instance.new("UIGradient")
hLogoGrad.Color=ColorSequence.new(AC,AC3)
hLogoGrad.Rotation=45
hLogoGrad.Parent=hLogo
local hLogoText=Instance.new("TextLabel")
hLogoText.Size=UDim2.new(1,0,1,0)
hLogoText.BackgroundTransparency=1
hLogoText.Text="d"
hLogoText.TextColor3=Color3.new(1,1,1)
hLogoText.Font=Enum.Font.GothamBold
hLogoText.TextSize=17
hLogoText.ZIndex=5
hLogoText.Parent=hLogo
local ht=Instance.new("TextLabel")
ht.Size=UDim2.new(1,-100,0,16)
ht.Position=UDim2.new(0,66,0,11)
ht.Text="dayDlc"
ht.TextColor3=TX
ht.BackgroundTransparency=1
ht.TextXAlignment=Enum.TextXAlignment.Left
ht.Font=Enum.Font.GothamBold
ht.TextSize=15
ht.ZIndex=4
ht.Parent=hd
local htSub=Instance.new("TextLabel")
htSub.Size=UDim2.new(1,-100,0,14)
htSub.Position=UDim2.new(0,66,0,29)
htSub.Text="v44 · helper"
htSub.TextColor3=Color3.fromRGB(160,140,200)
htSub.BackgroundTransparency=1
htSub.TextXAlignment=Enum.TextXAlignment.Left
htSub.Font=Enum.Font.Gotham
htSub.TextSize=10
htSub.ZIndex=4
htSub.Parent=hd
local cb=Instance.new("TextButton")
cb.Size=UDim2.new(0,30,0,30)
cb.Position=UDim2.new(1,-42,0.5,-15)
cb.Text="✕"
cb.TextColor3=Color3.fromRGB(200,200,210)
cb.BackgroundColor3=Color3.fromRGB(48,35,68)
cb.BorderSizePixel=0
cb.Font=Enum.Font.GothamBold
cb.TextSize=13
cb.AutoButtonColor=false
cb.ZIndex=4
cb.Parent=hd
CC(cb,10)
if IS_PC then
    cb.MouseEnter:Connect(function()
        T:Create(cb,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(220,60,80)}):Play()
    end)
    cb.MouseLeave:Connect(function()
        T:Create(cb,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(48,35,68)}):Play()
    end)
end
local dgw,ds,ws0=false,nil,nil
hd.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
        dgw=true ds=i.Position ws0=w.Position
    end
end)
hd.InputChanged:Connect(function(i)
    if dgw and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then
        local d=i.Position-ds
        w.Position=UDim2.new(ws0.X.Scale,ws0.X.Offset+d.X,ws0.Y.Scale,ws0.Y.Offset+d.Y)
    end
end)
hd.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dgw=false end
end)
local sd=Instance.new("Frame")
sd.Size=UDim2.new(0,116,1,-70)
sd.Position=UDim2.new(0,10,0,62)
sd.BackgroundColor3=Color3.fromRGB(22,16,36)
sd.BackgroundTransparency=0.4
sd.BorderSizePixel=0
sd.ZIndex=2
sd.Parent=w
CC(sd,14)
local sl=Instance.new("UIListLayout")
sl.Padding=UDim.new(0,4)
sl.HorizontalAlignment=Enum.HorizontalAlignment.Center
sl.Parent=sd
local slPad=Instance.new("UIPadding")
slPad.PaddingTop=UDim.new(0,8)
slPad.Parent=sd
local ct=Instance.new("Frame")
ct.Size=UDim2.new(1,-140,1,-70)
ct.Position=UDim2.new(0,132,0,62)
ct.BackgroundTransparency=1
ct.ZIndex=2
ct.Parent=w
local pages={}
local function mkP(n)
    local sf=Instance.new("ScrollingFrame")
    sf.Size=UDim2.new(1,0,1,0)
    sf.BackgroundTransparency=1
    sf.BorderSizePixel=0
    sf.ScrollBarThickness=3
    sf.ScrollBarImageColor3=AC
    sf.ScrollBarImageTransparency=0.5
    sf.Visible=false
    sf.Active=true
    sf.Parent=ct
    local ll=Instance.new("UIListLayout")
    ll.Padding=UDim.new(0,7)
    ll.Parent=sf
    ll:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        sf.CanvasSize=UDim2.new(0,0,0,ll.AbsoluteContentSize.Y+14)
    end)
    local dg,dy,sy=false,0,0
    sf.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
            dg=true dy=i.Position.Y sy=sf.CanvasPosition.Y
        end
    end)
    sf.InputChanged:Connect(function(i)
        if dg and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then
            local n=sy-(i.Position.Y-dy)
            local mx=math.max(0,sf.AbsoluteCanvasSize.Y-sf.AbsoluteSize.Y)
            sf.CanvasPosition=Vector2.new(0,math.clamp(n,0,mx))
        end
    end)
    sf.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dg=false end
    end)
    pages[n]=sf
end
mkP("Main"); mkP("Visual"); mkP("Config")
local function sec(p,t)
    local wrap=Instance.new("Frame")
    wrap.Size=UDim2.new(1,0,0,24)
    wrap.BackgroundTransparency=1
    wrap.Parent=p
    local lay=Instance.new("UIListLayout")
    lay.Padding=UDim.new(0,5)
    lay.Parent=wrap
    local head=Instance.new("TextButton")
    head.Size=UDim2.new(1,0,0,24)
    head.Text=""
    head.BackgroundTransparency=1
    head.AutoButtonColor=false
    head.Parent=wrap
    local a=Instance.new("Frame")
    a.Size=UDim2.new(0,3,0.55,0)
    a.Position=UDim2.new(0,2,0.225,0)
    a.BackgroundColor3=AC
    a.BorderSizePixel=0
    a.Parent=head
    CC(a,2)
    local arrow=Instance.new("TextLabel")
    arrow.Size=UDim2.new(0,12,1,0)
    arrow.Position=UDim2.new(0,10,0,0)
    arrow.Text="▸"
    arrow.TextColor3=AC2
    arrow.BackgroundTransparency=1
    arrow.Font=Enum.Font.GothamBold
    arrow.TextSize=12
    arrow.TextXAlignment=Enum.TextXAlignment.Left
    arrow.Parent=head
    local lbl=Instance.new("TextLabel")
    lbl.Size=UDim2.new(1,-24,1,0)
    lbl.Position=UDim2.new(0,24,0,0)
    lbl.Text=t:upper()
    lbl.TextColor3=Color3.fromRGB(200,180,255)
    lbl.TextXAlignment=Enum.TextXAlignment.Left
    lbl.BackgroundTransparency=1
    lbl.Font=Enum.Font.GothamBold
    lbl.TextSize=10
    lbl.Parent=head
    local body=Instance.new("Frame")
    body.Size=UDim2.new(1,0,0,0)
    body.BackgroundTransparency=1
    body.Visible=false
    body.Parent=wrap
    local bLay=Instance.new("UIListLayout")
    bLay.Padding=UDim.new(0,6)
    bLay.Parent=body
    bLay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        body.Size=UDim2.new(1,0,0,bLay.AbsoluteContentSize.Y)
        wrap.Size=UDim2.new(1,0,0,body.Visible and (24+bLay.AbsoluteContentSize.Y+6) or 24)
    end)
    head.MouseButton1Click:Connect(function()
        body.Visible=not body.Visible
        arrow.Text=body.Visible and "▾" or "▸"
        wrap.Size=UDim2.new(1,0,0,body.Visible and (24+body.AbsoluteSize.Y+6) or 24)
    end)
    return body
end
local function tg(p,t,d,fn)
    local r=Instance.new("TextButton")
    r.Size=UDim2.new(1,0,0,34)
    r.Text=""
    r.BackgroundColor3=Color3.fromRGB(35,25,55)
    r.BackgroundTransparency=0.3
    r.BorderSizePixel=0
    r.AutoButtonColor=false
    r.Parent=p
    CC(r,9)
    local stk=Instance.new("UIStroke")
    stk.Color=STROKE
    stk.Thickness=1
    stk.Transparency=0.6
    stk.Parent=r
    local pi=Instance.new("Frame")
    pi.Size=UDim2.new(0,18,0,18)
    pi.Position=UDim2.new(0,10,0.5,-9)
    pi.BackgroundColor3=d and AC or Color3.fromRGB(55,42,75)
    pi.BorderSizePixel=0
    pi.Parent=r
    CC(pi,9)
    local dt=Instance.new("Frame")
    dt.Size=UDim2.new(0,9,0,9)
    dt.AnchorPoint=Vector2.new(0.5,0.5)
    dt.Position=UDim2.new(0.5,0,0.5,0)
    dt.BackgroundColor3=Color3.new(1,1,1)
    dt.BorderSizePixel=0
    dt.Visible=d
    dt.Parent=pi
    CC(dt,5)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-36,1,0)
    l.Position=UDim2.new(0,36,0,0)
    l.Text=t
    l.TextColor3=TX
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.BackgroundTransparency=1
    l.Font=Enum.Font.GothamMedium
    l.TextSize=11
    l.Parent=r
    local s=d
    r.MouseButton1Click:Connect(function()
        s=not s
        pi.BackgroundColor3=s and AC or Color3.fromRGB(55,42,75)
        dt.Visible=s
        if fn then fn(s) end
    end)
end
local function sl2(p,t,mn,mx,d,fn)
    local r=Instance.new("Frame")
    r.Size=UDim2.new(1,0,0,52)
    r.BackgroundColor3=Color3.fromRGB(35,25,55)
    r.BackgroundTransparency=0.3
    r.BorderSizePixel=0
    r.Parent=p
    CC(r,9)
    local stk=Instance.new("UIStroke")
    stk.Color=STROKE
    stk.Thickness=1
    stk.Transparency=0.6
    stk.Parent=r
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(1,-70,0,16)
    l.Position=UDim2.new(0,10,0,6)
    l.Text=t
    l.TextColor3=Color3.fromRGB(220,200,255)
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.BackgroundTransparency=1
    l.Font=Enum.Font.GothamMedium
    l.TextSize=11
    l.Parent=r
    local v=Instance.new("TextLabel")
    v.Size=UDim2.new(0,48,0,18)
    v.Position=UDim2.new(1,-58,0,5)
    v.BackgroundColor3=Color3.fromRGB(18,12,30)
    v.Text=tostring(d)
    v.TextColor3=TX
    v.Font=Enum.Font.GothamBold
    v.TextSize=10
    v.Parent=r
    CC(v,5)
    local tr=Instance.new("Frame")
    tr.Size=UDim2.new(1,-20,0,6)
    tr.Position=UDim2.new(0,10,0,36)
    tr.BackgroundColor3=Color3.fromRGB(55,42,75)
    tr.BorderSizePixel=0
    tr.Parent=r
    CC(tr,3)
    local f=Instance.new("Frame")
    f.Size=UDim2.new((d-mn)/(mx-mn),0,1,0)
    f.BackgroundColor3=AC
    f.BorderSizePixel=0
    f.Parent=tr
    CC(f,3)
    local k=Instance.new("Frame")
    k.Size=UDim2.new(0,13,0,13)
    k.AnchorPoint=Vector2.new(0.5,0.5)
    k.Position=UDim2.new(f.Size.X.Scale,0,0.5,0)
    k.BackgroundColor3=Color3.new(1,1,1)
    k.BorderSizePixel=0
    k.Parent=tr
    CC(k,7)
    local val=d
    local function up(i)
        local rl=math.clamp((i.Position.X-tr.AbsolutePosition.X)/tr.AbsoluteSize.X,0,1)
        val=math.floor(mn+rl*(mx-mn))
        f.Size=UDim2.new(rl,0,1,0)
        k.Position=UDim2.new(rl,0,0.5,0)
        v.Text=tostring(val)
        if fn then fn(val) end
    end
    local dg=false
    tr.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then
            dg=true up(i)
        end
    end)
    tr.InputChanged:Connect(function(i)
        if dg and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then up(i) end
    end)
    tr.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dg=false end
    end)
end
local V=pages["Visual"]
local M=pages["Main"]
local O={B=L.Brightness,A=L.Ambient,OA=L.OutdoorAmbient,CT=L.ClockTime,E=L.ExposureCompensation,FE=L.FogEnd,FS=L.FogStart,FC=L.FogColor}

-- MOONWALK
local moonwalkOn=false
local moonwalkConn=nil
local function stopMoonwalk()
    if moonwalkConn then pcall(function() moonwalkConn:Disconnect() end) moonwalkConn=nil end
    local ch=LP.Character
    if ch then
        local hum=ch:FindFirstChildOfClass("Humanoid")
        if hum then hum.AutoRotate=true end
    end
end
local function startMoonwalk()
    stopMoonwalk()
    local ch=LP.Character
    if not ch then return end
    local hrp=ch:FindFirstChild("HumanoidRootPart")
    local hum=ch:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    hum.AutoRotate=false
    local swayPhase=0
    moonwalkConn=R.RenderStepped:Connect(function(dt)
        if not hrp or not hrp.Parent then return end
        if not hum or not hum.Parent then return end
        local md=hum.MoveDirection
        if md.Magnitude>0.05 then
            swayPhase=swayPhase+dt*6
            local pos=hrp.Position
            local perp=Vector3.new(-md.Z,0,md.X)
            if perp.Magnitude>0.01 then perp=perp.Unit else perp=Vector3.new(0,0,0) end
            local swayOff=perp*math.sin(swayPhase)*0.35
            local yawSway=CFrame.Angles(0,math.rad(14)*math.sin(swayPhase),0)
            local look=CFrame.lookAt(Vector3.zero,-md)
            local rot=CFrame.new(0,0,0,look.RightVector.X,look.RightVector.Y,look.RightVector.Z,look.UpVector.X,look.UpVector.Y,look.UpVector.Z,look.LookVector.X*-1,look.LookVector.Y*-1,look.LookVector.Z*-1)
            hrp.CFrame=CFrame.new(pos+swayOff)*rot*yawSway
        else
            swayPhase=0
        end
    end)
end
LP.CharacterAdded:Connect(function() task.wait(0.6) if moonwalkOn then startMoonwalk() end end)

-- WALKSPEED
local wsEnabled=false
local wsSpeed=50
local wsMode="toggle"
local wsActive=false
local wsBind=Enum.KeyCode.Two
local wsListening=false
local wsRefreshBind=function() end
local mobBtnRef=nil
local function applyWS()
    local ch=LP.Character
    if not ch then return end
    local hum=ch:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if wsEnabled and (wsActive or wsMode=="always") then
        hum.WalkSpeed=wsSpeed
    else
        hum.WalkSpeed=16
    end
end
local function hookWS(hum)
    if not hum then return end
    if hum:GetAttribute("dWSHooked") then return end
    hum:SetAttribute("dWSHooked",true)
    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if wsEnabled and (wsActive or wsMode=="always") and math.abs(hum.WalkSpeed-wsSpeed)>0.5 then
            hum.WalkSpeed=wsSpeed
        end
    end)
end
LP.CharacterAdded:Connect(function(ch)
    task.wait(0.6)
    local hum=ch:FindFirstChildOfClass("Humanoid")
    if hum then hookWS(hum) end
    applyWS()
end)
if LP.Character then
    local hum=LP.Character:FindFirstChildOfClass("Humanoid")
    if hum then hookWS(hum) end
end
R.RenderStepped:Connect(function()
    if not wsEnabled then return end
    if not wsActive and wsMode~="always" then return end
    local ch=LP.Character
    if not ch then return end
    local hum=ch:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    if math.abs(hum.WalkSpeed-wsSpeed)>0.5 then hum.WalkSpeed=wsSpeed end
end)
U.InputBegan:Connect(function(input,gp)
    if gp then return end
    if wsListening then
        if input.KeyCode==Enum.KeyCode.Escape then wsListening=false wsRefreshBind() return end
        if input.KeyCode~=Enum.KeyCode.Unknown then
            wsBind=input.KeyCode
            wsListening=false
            wsRefreshBind()
        end
        return
    end
    if input.KeyCode==wsBind and wsEnabled then
        if wsMode=="toggle" then wsActive=not wsActive end
        if wsMode=="hold" then wsActive=true end
        applyWS()
    end
end)
U.InputEnded:Connect(function(input)
    if wsEnabled and wsMode=="hold" and input.KeyCode==wsBind then
        wsActive=false
        applyWS()
    end
end)

-- 360 DBD
local dbdOn=false
local dbdSnap=0.85
local dbdBoost=22
local dbdSavedRot=true
R.RenderStepped:Connect(function()
    if not dbdOn then
        if not dbdSavedRot then
            local ch=LP.Character
            if ch then
                local hum=ch:FindFirstChildOfClass("Humanoid")
                if hum then hum.AutoRotate=true end
            end
            dbdSavedRot=true
        end
        return
    end
    local ch=LP.Character
    if not ch then return end
    local hrp=ch:FindFirstChild("HumanoidRootPart")
    local hum=ch:FindFirstChildOfClass("Humanoid")
    if not hrp or not hum then return end
    if dbdSavedRot then hum.AutoRotate=false dbdSavedRot=false end
    local md=hum.MoveDirection
    if md.Magnitude>0.05 then
        local target=CFrame.lookAt(Vector3.zero,md)
        local cur=hrp.CFrame-hrp.Position
        local newRot=cur:Lerp(target,dbdSnap)
        hrp.CFrame=CFrame.new(hrp.Position)*newRot
        if math.abs(hum.WalkSpeed-dbdBoost)>1 then hum.WalkSpeed=dbdBoost end
    else
        if math.abs(hum.WalkSpeed-16)>1 then hum.WalkSpeed=16 end
    end
end)
LP.CharacterAdded:Connect(function() task.wait(0.6) dbdSavedRot=true end)

-- KORBLOX / HEADLESS / PUMPKIN
local korbloxSaved={}
local headlessSaved={}
local pumpkinModel=nil
local function applyKorblox(on)
    local ch=LP.Character
    if not ch then return end
    local parts={}
    local p1=ch:FindFirstChild("RightUpperLeg") if p1 then table.insert(parts,p1) end
    local p2=ch:FindFirstChild("RightLowerLeg") if p2 then table.insert(parts,p2) end
    local p3=ch:FindFirstChild("Right Leg") if p3 then table.insert(parts,p3) end
    if #parts==0 then return end
    for _,leg in ipairs(parts) do
        if not korbloxSaved[leg] then
            korbloxSaved[leg]={size=leg.Size,col=leg.Color,mat=leg.Material,tr=leg.Transparency}
        end
        if on then
            local base=korbloxSaved[leg].size
            pcall(function() leg.Size=Vector3.new(base.X*0.28,base.Y,base.Z*0.28) end)
            leg.Color=Color3.fromRGB(15,15,15)
            leg.Material=Enum.Material.SmoothPlastic
            leg.Transparency=0
        else
            local s=korbloxSaved[leg]
            pcall(function() leg.Size=s.size end)
            leg.Color=s.col
            leg.Material=s.mat
            leg.Transparency=s.tr
        end
    end
end
local function applyHeadless(on)
    local ch=LP.Character
    if not ch then return end
    local head=ch:FindFirstChild("Head")
    if not head then return end
    if on then
        if not headlessSaved[head] then
            headlessSaved[head]={tr=head.Transparency,size=head.Size,decal={},acc={}}
        end
        head.Transparency=1
        if head:IsA("BasePart") then pcall(function() head.Size=Vector3.new(0.05,0.05,0.05) end) end
        for _,c in ipairs(head:GetChildren()) do
            if c:IsA("Decal") or c:IsA("Texture") then
                headlessSaved[head].decal[c]=c.Transparency
                c.Transparency=1
            end
        end
        for _,acc in ipairs(ch:GetChildren()) do
            if acc:IsA("Accessory") then
                local h=acc:FindFirstChild("Handle")
                if h and h:IsA("BasePart") then
                    headlessSaved[head].acc[acc]=h.Transparency
                    h.Transparency=1
                end
            end
        end
    else
        local s=headlessSaved[head]
        if s then
            head.Transparency=s.tr
            if head:IsA("BasePart") then pcall(function() head.Size=s.size end) end
            for d,t in pairs(s.decal) do if d and d.Parent then d.Transparency=t end end
            for acc,tr in pairs(s.acc) do
                if acc and acc.Parent then
                    local h=acc:FindFirstChild("Handle")
                    if h then h.Transparency=tr end
                end
            end
        end
    end
end
local function buildPumpkin()
    local ch=LP.Character
    if not ch then return end
    local head=ch:FindFirstChild("Head")
    if not head then return end
    if pumpkinModel and pumpkinModel.Parent then pumpkinModel:Destroy() end
    local m=Instance.new("Model")
    m.Name="dPumpkin"
    m.Parent=ch
    local body=Instance.new("Part")
    body.Shape=Enum.PartType.Ball
    body.Size=Vector3.new(1.3,1.3,1.3)
    body.Color=Color3.fromRGB(255,120,30)
    body.Material=Enum.Material.SmoothPlastic
    body.CanCollide=false
    body.Massless=true
    body.CFrame=head.CFrame*CFrame.new(0,0.15,0)
    body.Parent=m
    local w1=Instance.new("WeldConstraint")
    w1.Part0=head w1.Part1=body w1.Parent=body
    local stem=Instance.new("Part")
    stem.Shape=Enum.PartType.Cylinder
    stem.Size=Vector3.new(0.15,0.4,0.4)
    stem.Color=Color3.fromRGB(60,120,40)
    stem.Material=Enum.Material.SmoothPlastic
    stem.CanCollide=false
    stem.Massless=true
    stem.CFrame=head.CFrame*CFrame.new(0,0.85,0)*CFrame.Angles(0,0,math.rad(90))
    stem.Parent=m
    local w2=Instance.new("WeldConstraint")
    w2.Part0=head w2.Part1=stem w2.Parent=stem
    for _,off in ipairs({Vector3.new(-0.25,0.15,-0.55),Vector3.new(0.25,0.15,-0.55)}) do
        local e=Instance.new("Part")
        e.Shape=Enum.PartType.Ball
        e.Size=Vector3.new(0.18,0.18,0.1)
        e.Color=Color3.fromRGB(20,20,20)
        e.Material=Enum.Material.SmoothPlastic
        e.CanCollide=false
        e.Massless=true
        e.CFrame=head.CFrame*CFrame.new(off)
        e.Parent=m
        local we=Instance.new("WeldConstraint")
        we.Part0=head we.Part1=e we.Parent=e
    end
    local mouth=Instance.new("Part")
    mouth.Shape=Enum.PartType.Block
    mouth.Size=Vector3.new(0.5,0.15,0.1)
    mouth.Color=Color3.fromRGB(20,20,20)
    mouth.Material=Enum.Material.SmoothPlastic
    mouth.CanCollide=false
    mouth.Massless=true
    mouth.CFrame=head.CFrame*CFrame.new(0,-0.2,-0.6)
    mouth.Parent=m
    local wm=Instance.new("WeldConstraint")
    wm.Part0=head wm.Part1=mouth wm.Parent=mouth
    pumpkinModel=m
end
local function removePumpkin()
    if pumpkinModel and pumpkinModel.Parent then pumpkinModel:Destroy() end
    pumpkinModel=nil
end
local aoeColNorm=Color3.fromRGB(80,220,130)
local aoeColDanger=Color3.fromRGB(255,60,60)
local aoeVisible=true
local targetFOV=70
local fovLastSet=tick()
local sCam=sec(V,"Camera")
sl2(sCam,"FOV",70,160,70,function(v)
    targetFOV=v
    fovLastSet=tick()
    pcall(function() C.FieldOfView=v end)
end)
task.spawn(function()
    while true do
        task.wait(0.5)
        pcall(function()
            if C and math.abs(C.FieldOfView-targetFOV)>0.5 then
                if tick()-fovLastSet>0.5 then
                    C.FieldOfView=targetFOV
                    fovLastSet=tick()
                end
            end
        end)
    end
end)
local sLight=sec(V,"Lighting")
tg(sLight,"Fullbright",false,function(v)
    pcall(function()
        if v then
            L.Brightness=3
            L.Ambient=Color3.fromRGB(200,200,200)
            L.OutdoorAmbient=Color3.fromRGB(200,200,200)
            L.ClockTime=14
            L.ExposureCompensation=1
        else
            L.Brightness=O.B
            L.Ambient=O.A
            L.OutdoorAmbient=O.OA
            L.ClockTime=O.CT
            L.ExposureCompensation=O.E
        end
    end)
end)
sl2(sLight,"Brightness",0,100,0,function(v)
    pcall(function()
        if v==0 then
            L.Brightness=O.B
            L.Ambient=O.A
            L.OutdoorAmbient=O.OA
            L.ClockTime=O.CT
            L.ExposureCompensation=O.E
        else
            local r=v/100
            L.Brightness=O.B+r*(3-O.B)
            L.Ambient=O.A:Lerp(Color3.fromRGB(220,220,220),r)
            L.OutdoorAmbient=O.OA:Lerp(Color3.fromRGB(220,220,220),r)
            L.ClockTime=O.CT+r*(14-O.CT)
            L.ExposureCompensation=O.E+r
        end
    end)
end)
local sOpt=sec(V,"Optimization")
tg(sOpt,"No Shadows",false,function(v) pcall(function() L.GlobalShadows=not v end) end)
tg(sOpt,"Remove Fog",false,function(v)
    pcall(function()
        if v then
            L.FogEnd=100000
            L.FogStart=100000
            L.FogColor=Color3.new(1,1,1)
        else
            L.FogEnd=O.FE
            L.FogStart=O.FS
            L.FogColor=O.FC
        end
    end)
end)
local sV3=sec(V,"Korblox / Headless / Pumpkin")
tg(sV3,"Fake Headless",false,function(v) applyHeadless(v) end)
tg(sV3,"Korblox Leg",false,function(v) applyKorblox(v) end)
tg(sV3,"Pumpkin Head",false,function(v)
    if v then buildPumpkin() else removePumpkin() end
end)
local sAcc=sec(V,"Accessories")
local cA=nil
local aO=nil
local fL=nil
local function rmA()
    if aO then pcall(function() aO:Destroy() end) aO=nil end
    if fL then pcall(function() fL:Destroy() end) fL=nil end
    local ch=LP.Character
    if ch then
        local h=ch:FindFirstChild("Head")
        if h then
            for _,c in ipairs(h:GetChildren()) do
                if c.Name=="dFireL" or c.Name=="dAcc" then pcall(function() c:Destroy() end) end
            end
        end
        for _,c in ipairs(ch:GetChildren()) do
            if c.Name=="dFire" or c.Name=="dHat" or c.Name=="dCrown" or c.Name=="dSmoke" then
                pcall(function() c:Destroy() end)
            end
        end
    end
    cA=nil
end
local function addA(k)
    rmA()
    if k=="none" then return end
    cA=k
    local ch=LP.Character
    if not ch then return end
    local h=ch:FindFirstChild("Head")
    if not h then return end
    if k=="fire" then
        local f=Instance.new("Folder")
        f.Name="dFire"
        f.Parent=ch
        local at=Instance.new("Attachment")
        at.Name="dAcc"
        at.Parent=h
        local p=Instance.new("ParticleEmitter")
        p.Name="dFireP"
        p.Texture="rbxasset://textures/particles/fire_main.dds"
        p.Rate=60
        p.Lifetime=NumberRange.new(0.6,1.2)
        p.Speed=NumberRange.new(3,6)
        p.SpreadAngle=Vector2.new(20,20)
        p.Size=NumberSequence.new({
            NumberSequenceKeypoint.new(0,1.8),
            NumberSequenceKeypoint.new(0.5,1.2),
            NumberSequenceKeypoint.new(1,0)
        })
        p.Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0,Color3.fromRGB(255,220,180)),
            ColorSequenceKeypoint.new(0.4,Color3.fromRGB(255,160,80)),
            ColorSequenceKeypoint.new(0.7,Color3.fromRGB(230,100,40)),
            ColorSequenceKeypoint.new(1,Color3.fromRGB(120,30,10))
        })
        p.LightEmission=0.6
        p.LightInfluence=0
        p.Parent=at
        local s=Instance.new("ParticleEmitter")
        s.Name="dSpark"
        s.Texture="rbxasset://textures/particles/sparkles_main.dds"
        s.Rate=25
        s.Lifetime=NumberRange.new(0.3,0.8)
        s.Speed=NumberRange.new(4,8)
        s.SpreadAngle=Vector2.new(40,40)
        s.Size=NumberSequence.new(0.3)
        s.Color=ColorSequence.new(Color3.fromRGB(255,220,140))
        s.LightEmission=0.8
        s.LightInfluence=0
        s.Parent=at
        local lg=Instance.new("PointLight")
        lg.Name="dFireL"
        lg.Brightness=2
        lg.Range=12
        lg.Color=Color3.fromRGB(255,160,80)
        lg.Parent=h
        fL=lg
        aO=f
    elseif k=="hat" then
        local f=Instance.new("Folder")
        f.Name="dHat"
        f.Parent=ch
        local p=Instance.new("Part")
        p.Size=Vector3.new(1.4,1.8,1.4)
        p.Shape=Enum.PartType.Cylinder
        p.Color=Color3.fromRGB(20,20,20)
        p.Material=Enum.Material.SmoothPlastic
        p.CanCollide=false
        p.Massless=true
        p.CFrame=h.CFrame*CFrame.new(0,1.5,0)*CFrame.Angles(0,0,math.rad(90))
        p.Parent=f
        local w1=Instance.new("WeldConstraint")
        w1.Part0=h w1.Part1=p w1.Parent=p
        local b=Instance.new("Part")
        b.Size=Vector3.new(2.8,0.15,2.8)
        b.Shape=Enum.PartType.Cylinder
        b.Color=Color3.fromRGB(20,20,20)
        b.Material=Enum.Material.SmoothPlastic
        b.CanCollide=false
        b.Massless=true
        b.CFrame=h.CFrame*CFrame.new(0,0.7,0)
        b.Parent=f
        local w2=Instance.new("WeldConstraint")
        w2.Part0=h w2.Part1=b w2.Parent=b
        aO=f
    elseif k=="crown" then
        local f=Instance.new("Folder")
        f.Name="dCrown"
        f.Parent=ch
        local b=Instance.new("Part")
        b.Size=Vector3.new(1.6,0.4,1.6)
        b.Shape=Enum.PartType.Cylinder
        b.Color=Color3.fromRGB(255,215,0)
        b.Material=Enum.Material.Neon
        b.CanCollide=false
        b.Massless=true
        b.CFrame=h.CFrame*CFrame.new(0,1.1,0)*CFrame.Angles(0,0,math.rad(90))
        b.Parent=f
        local w1=Instance.new("WeldConstraint")
        w1.Part0=h w1.Part1=b w1.Parent=b
        for i=1,8 do
            local s=Instance.new("Part")
            s.Size=Vector3.new(0.15,0.7,0.15)
            s.Color=Color3.fromRGB(255,215,0)
            s.Material=Enum.Material.Neon
            s.CanCollide=false
            s.Massless=true
            local an=math.rad(i*45)
            s.CFrame=h.CFrame*CFrame.new(math.cos(an)*0.7,1.4,math.sin(an)*0.7)
            s.Parent=f
            local w=Instance.new("WeldConstraint")
            w.Part0=h w.Part1=s w.Parent=s
        end
        aO=f
    elseif k=="smoke" then
        local f=Instance.new("Folder")
        f.Name="dSmoke"
        f.Parent=ch
        local at=Instance.new("Attachment")
        at.Name="dAcc"
        at.Parent=h
        local s=Instance.new("ParticleEmitter")
        s.Name="dSmokeP"
        s.Texture="rbxasset://textures/particles/smoke_main.dds"
        s.Rate=20
        s.Lifetime=NumberRange.new(1,2)
        s.Speed=NumberRange.new(1,3)
        s.SpreadAngle=Vector2.new(30,30)
        s.Size=NumberSequence.new({
            NumberSequenceKeypoint.new(0,0.5),
            NumberSequenceKeypoint.new(1,3)
        })
        s.Transparency=NumberSequence.new({
            NumberSequenceKeypoint.new(0,0.3),
            NumberSequenceKeypoint.new(1,1)
        })
        s.Color=ColorSequence.new(Color3.fromRGB(200,200,200))
        s.LightEmission=0.2
        s.Parent=at
        aO=f
    end
end
local aR=Instance.new("Frame")
aR.Size=UDim2.new(1,0,0,54)
aR.BackgroundColor3=Color3.fromRGB(35,25,55)
aR.BackgroundTransparency=0.3
aR.BorderSizePixel=0
aR.Parent=sAcc
CC(aR,9)
local aL=Instance.new("TextLabel")
aL.Size=UDim2.new(1,0,0,16)
aL.Position=UDim2.new(0,10,0,6)
aL.Text="Accessory"
aL.TextColor3=Color3.fromRGB(220,200,255)
aL.TextXAlignment=Enum.TextXAlignment.Left
aL.BackgroundTransparency=1
aL.Font=Enum.Font.GothamMedium
aL.TextSize=11
aL.Parent=aR
local aH=Instance.new("Frame")
aH.Size=UDim2.new(1,-20,0,26)
aH.Position=UDim2.new(0,10,0,26)
aH.BackgroundTransparency=1
aH.Parent=aR
local aHL=Instance.new("UIListLayout")
aHL.FillDirection=Enum.FillDirection.Horizontal
aHL.Padding=UDim.new(0,6)
aHL.VerticalAlignment=Enum.VerticalAlignment.Center
aHL.Parent=aH
local aList={{k="fire",l="🔥"},{k="hat",l="🎩"},{k="crown",l="👑"},{k="smoke",l="💨"},{k="none",l="✕"}}
for _,ac in ipairs(aList) do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(0,26,0,26)
    b.Text=ac.l
    b.TextColor3=Color3.new(1,1,1)
    b.TextSize=15
    b.BackgroundColor3=Color3.fromRGB(55,42,75)
    b.BorderSizePixel=0
    b.AutoButtonColor=false
    b.Parent=aH
    CC(b,6)
    b:SetAttribute("a",false)
    if ac.k=="none" then
        b.MouseButton1Click:Connect(function()
            rmA()
            for _,x in ipairs(aH:GetChildren()) do
                if x:IsA("TextButton") then
                    x:SetAttribute("a",false)
                    x.BackgroundColor3=Color3.fromRGB(55,42,75)
                end
            end
        end)
    else
        b.MouseButton1Click:Connect(function()
            local a=b:GetAttribute("a")
            if a then
                rmA()
                b:SetAttribute("a",false)
                b.BackgroundColor3=Color3.fromRGB(55,42,75)
            else
                for _,x in ipairs(aH:GetChildren()) do
                    if x:IsA("TextButton") then
                        x:SetAttribute("a",false)
                        x.BackgroundColor3=Color3.fromRGB(55,42,75)
                    end
                end
                addA(ac.k)
                b:SetAttribute("a",true)
                b.BackgroundColor3=AC
            end
        end)
    end
end
LP.CharacterAdded:Connect(function()
    task.wait(0.8)
    if cA then local k=cA cA=nil addA(k) end
end)

-- ESP
local sESP=sec(V,"ESP")
local espSettings={
    Killer={enabled=false,color=Color3.fromRGB(255,60,60),alwaysOnTop=true},
    Survivors={enabled=false,color=Color3.fromRGB(60,150,255),alwaysOnTop=true},
    Generators={enabled=false,color=Color3.fromRGB(70,220,100),alwaysOnTop=true},
    ShowBox=true,ShowName=true,ShowHP=true,ShowDist=true,ShowHighlight=true
}
local espCache={}
local hasDrawing=type(Drawing)=="table" and type(Drawing.new)=="function"
local function mkDraw(cls,props)
    if not hasDrawing then return nil end
    local ok,obj=pcall(function()
        local d=Drawing.new(cls)
        for k,v in pairs(props) do pcall(function() d[k]=v end) end
        return d
    end)
    if not ok then return nil end
    return obj
end
local function makeESP(inst)
    if espCache[inst] then return espCache[inst] end
    local d={}
    d.hl=Instance.new("Highlight")
    d.hl.Name="dESP"
    d.hl.FillTransparency=0.5
    d.hl.OutlineTransparency=0.3
    d.hl.OutlineColor=Color3.new(1,1,1)
    d.hl.DepthMode=Enum.HighlightDepthMode.AlwaysOnTop
    d.hl.Adornee=inst
    d.hl.Enabled=false
    d.hl.Parent=inst
    if hasDrawing then
        d.box=mkDraw("Square",{Thickness=1,Filled=false,Transparency=1,Color=Color3.new(1,1,1)})
        d.name=mkDraw("Text",{Size=14,Center=true,Outline=true,Color=Color3.new(1,1,1),Transparency=1})
        d.dist=mkDraw("Text",{Size=12,Center=true,Outline=true,Color=Color3.new(1,1,1),Transparency=1})
        d.hpBg=mkDraw("Square",{Thickness=0,Filled=true,Color=Color3.fromRGB(20,20,20),Transparency=1})
        d.hpFg=mkDraw("Square",{Thickness=0,Filled=true,Color=Color3.fromRGB(80,220,130),Transparency=1})
    end
    espCache[inst]=d
    return d
end
local function removeESP(inst)
    local d=espCache[inst]
    if not d then return end
    if d.hl then pcall(function() d.hl:Destroy() end) end
    if d.box then pcall(function() d.box:Remove() end) end
    if d.name then pcall(function() d.name:Remove() end) end
    if d.dist then pcall(function() d.dist:Remove() end) end
    if d.hpBg then pcall(function() d.hpBg:Remove() end) end
    if d.hpFg then pcall(function() d.hpFg:Remove() end) end
    espCache[inst]=nil
end
local function hideESP(d)
    if not d then return end
    if d.hl then d.hl.Enabled=false end
    if d.box then d.box.Transparency=1 end
    if d.name then d.name.Transparency=1 end
    if d.dist then d.dist.Transparency=1 end
    if d.hpBg then d.hpBg.Transparency=1 end
    if d.hpFg then d.hpFg.Transparency=1 end
end
local function applyESP()
    local killer=nil
    for _,p in ipairs(P:GetPlayers()) do
        if isKiller(p) then killer=p break end
    end
    local toKeep={}
    for _,p in ipairs(P:GetPlayers()) do
        if p~=LP and p.Character then
            local char=p.Character
            local isK=(p==killer)
            local isS=not isK
            local enabled=(isK and espSettings.Killer.enabled) or (isS and espSettings.Survivors.enabled)
            if enabled then
                toKeep[char]=true
                local d=makeESP(char)
                local col=isK and espSettings.Killer.color or espSettings.Survivors.color
                local always=isK and espSettings.Killer.alwaysOnTop or espSettings.Survivors.alwaysOnTop
                if d.hl then
                    d.hl.FillColor=col
                    d.hl.Enabled=espSettings.ShowHighlight
                    d.hl.DepthMode=always and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
                end
                if hasDrawing and d.box then
                    local hrp=char:FindFirstChild("HumanoidRootPart")
                    local head=char:FindFirstChild("Head")
                    local hum=char:FindFirstChildOfClass("Humanoid")
                    if hrp and head and hum then
                        local hp,onScreen=C:WorldToViewportPoint(hrp.Position)
                        local tp=C:WorldToViewportPoint(head.Position+Vector3.new(0,0.5,0))
                        local bp=C:WorldToViewportPoint(hrp.Position-Vector3.new(0,3,0))
                        if onScreen and hp.Z>0 then
                            local h=math.max(math.abs(bp.Y-tp.Y),12)
                            local wBox=math.max(h*0.55,6)
                            local x=hp.X-wBox/2
                            local y=tp.Y
                            if espSettings.ShowBox then
                                d.box.Size=Vector2.new(wBox,h)
                                d.box.Position=Vector2.new(x,y)
                                d.box.Color=col
                                d.box.Transparency=1
                            else
                                d.box.Transparency=1
                            end
                            if espSettings.ShowName and d.name then
                                d.name.Text=p.Name
                                d.name.Position=Vector2.new(hp.X,y-16)
                                d.name.Color=col
                                d.name.Transparency=1
                            elseif d.name then
                                d.name.Transparency=1
                            end
                            if espSettings.ShowDist and d.dist then
                                local myHrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
                                if myHrp then
                                    local dist=(hrp.Position-myHrp.Position).Magnitude
                                    d.dist.Text=string.format("%d studs",math.floor(dist))
                                    d.dist.Position=Vector2.new(hp.X,y+h+4)
                                    d.dist.Color=col
                                    d.dist.Transparency=1
                                end
                            elseif d.dist then
                                d.dist.Transparency=1
                            end
                            if espSettings.ShowHP and d.hpBg and d.hpFg then
                                local hpPct=math.clamp(hum.Health/math.max(hum.MaxHealth,1),0,1)
                                local barX=x-6
                                local barY=y
                                local barW=3
                                local barH=h
                                d.hpBg.Size=Vector2.new(barW,barH)
                                d.hpBg.Position=Vector2.new(barX,barY)
                                d.hpBg.Transparency=1
                                d.hpFg.Size=Vector2.new(barW,barH*hpPct)
                                d.hpFg.Position=Vector2.new(barX,barY+barH*(1-hpPct))
                                local c
                                if hpPct>0.6 then c=Color3.fromRGB(80,220,130)
                                elseif hpPct>0.3 then c=Color3.fromRGB(255,200,60)
                                else c=Color3.fromRGB(255,60,60) end
                                d.hpFg.Color=c
                                d.hpFg.Transparency=1
                            else
                                if d.hpBg then d.hpBg.Transparency=1 end
                                if d.hpFg then d.hpFg.Transparency=1 end
                            end
                        else
                            hideESP(d)
                        end
                    else
                        hideESP(d)
                    end
                end
            else
                local d=espCache[char]
                if d then hideESP(d) end
            end
        end
    end
    if espSettings.Generators.enabled then
        for _,obj in ipairs(workspace:GetDescendants()) do
            if (obj:IsA("BasePart") or obj:IsA("Model")) and not espCache[obj] then
                local nm=obj.Name:lower()
                if nm:find("generator") or nm:find("gen_") or nm=="gen" then
                    local d=makeESP(obj)
                    if d.hl then
                        d.hl.FillColor=espSettings.Generators.color
                        d.hl.Enabled=true
                        d.hl.DepthMode=espSettings.Generators.alwaysOnTop and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
                    end
                    toKeep[obj]=true
                end
            end
        end
    end
    for inst,d in pairs(espCache) do
        if not toKeep[inst] or not inst.Parent then removeESP(inst) end
    end
end
task.spawn(function()
    while true do
        task.wait(0.1)
        pcall(applyESP)
    end
end)
tg(sESP,"ESP Killer",false,function(v) espSettings.Killer.enabled=v end)
tg(sESP,"ESP Survivors",false,function(v) espSettings.Survivors.enabled=v end)
tg(sESP,"ESP Generators",false,function(v) espSettings.Generators.enabled=v end)
tg(sESP,"Boxes",true,function(v) espSettings.ShowBox=v end)
tg(sESP,"Names",true,function(v) espSettings.ShowName=v end)
tg(sESP,"HP bar",true,function(v) espSettings.ShowHP=v end)
tg(sESP,"Distance",true,function(v) espSettings.ShowDist=v end)
tg(sESP,"Highlight fill",true,function(v) espSettings.ShowHighlight=v end)
tg(sESP,"Through walls",true,function(v)
    espSettings.Killer.alwaysOnTop=v
    espSettings.Survivors.alwaysOnTop=v
    espSettings.Generators.alwaysOnTop=v
end)
local function espCP(parent,lbl,key)
    local r=Instance.new("Frame")
    r.Size=UDim2.new(1,0,0,40)
    r.BackgroundColor3=Color3.fromRGB(35,25,55)
    r.BackgroundTransparency=0.3
    r.BorderSizePixel=0
    r.Parent=parent
    CC(r,9)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(0.42,0,1,0)
    l.Position=UDim2.new(0,10,0,0)
    l.Text=lbl
    l.TextColor3=Color3.fromRGB(220,200,255)
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.BackgroundTransparency=1
    l.Font=Enum.Font.GothamMedium
    l.TextSize=10
    l.Parent=r
    local h=Instance.new("Frame")
    h.Size=UDim2.new(0.58,-10,1,0)
    h.Position=UDim2.new(0.42,0,0,0)
    h.BackgroundTransparency=1
    h.Parent=r
    local hl=Instance.new("UIListLayout")
    hl.FillDirection=Enum.FillDirection.Horizontal
    hl.Padding=UDim.new(0,5)
    hl.VerticalAlignment=Enum.VerticalAlignment.Center
    hl.Parent=h
    for _,c in ipairs({Color3.fromRGB(255,60,60),Color3.fromRGB(60,150,255),Color3.fromRGB(70,220,100),Color3.fromRGB(255,220,60),Color3.fromRGB(255,60,255),Color3.fromRGB(255,255,255)}) do
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(0,20,0,20)
        b.Text=""
        b.BackgroundColor3=c
        b.BorderSizePixel=0
        b.AutoButtonColor=false
        b.Parent=h
        CC(b,5)
        b.MouseButton1Click:Connect(function() espSettings[key].color=c end)
    end
end
espCP(sESP,"Killer color","Killer")
espCP(sESP,"Survivors color","Survivors")
espCP(sESP,"Generators color","Generators")

-- ЧАСТЬ 1 КОНЧАЕТСЯ ЗДЕСЬ.
-- Продолжение (Nick, Main, Watermark, Tabs, AOE, Mobile btn, print)
-- вставить сразу следующим блоком без пустых строк между.-- dayDlc v44.1 | part 2/2
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
