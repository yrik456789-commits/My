-- Syphixman MM2 v21 | Fixed Everything
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer
local VU=game:GetService("VirtualUser")
local Lighting=game:GetService("Lighting")

-- ============ INTRO ============
local IntroGui=Instance.new("ScreenGui")
IntroGui.Name="SyphixIntro"
IntroGui.Parent=gethui and gethui()or game.CoreGui

local IntroBG=Instance.new("Frame")
IntroBG.Size=UDim2.new(1,0,1,0)
IntroBG.BackgroundColor3=Color3.fromRGB(5,5,15)
IntroBG.BackgroundTransparency=1
IntroBG.Parent=IntroGui

local Stars={}
for i=1,50 do
    local Star=Instance.new("Frame")
    Star.Size=UDim2.new(0,math.random(2,5),0,math.random(2,5))
    Star.Position=UDim2.new(math.random(),0,math.random(),0)
    Star.BackgroundColor3=Color3.fromRGB(100,180,255)
    Star.BackgroundTransparency=0.5
    Star.BorderSizePixel=0
    Star.Parent=IntroGui
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=Star
    Stars[#Stars+1]=Star
end

local LogoIcon=Instance.new("TextLabel")
LogoIcon.Size=UDim2.new(0,100,0,100)
LogoIcon.Position=UDim2.new(.5,-50,.5,-160)
LogoIcon.BackgroundTransparency=1
LogoIcon.Text="🔷"
LogoIcon.TextSize=70
LogoIcon.TextTransparency=1
LogoIcon.Parent=IntroGui

local TitleText=Instance.new("TextLabel")
TitleText.Size=UDim2.new(0,500,0,60)
TitleText.Position=UDim2.new(.5,-250,.5,-40)
TitleText.BackgroundTransparency=1
TitleText.Text="SYPHIXMAN"
TitleText.TextColor3=Color3.fromRGB(100,180,255)
TitleText.Font=Enum.Font.GothamBlack
TitleText.TextSize=48
TitleText.TextTransparency=1
TitleText.Parent=IntroGui

local Line=Instance.new("Frame")
Line.Size=UDim2.new(0,0,0,3)
Line.Position=UDim2.new(.5,0,.5,50)
Line.BackgroundColor3=Color3.fromRGB(80,140,255)
Line.BorderSizePixel=0
Line.Parent=IntroGui
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=Line

local BetaText=Instance.new("TextLabel")
BetaText.Size=UDim2.new(0,300,0,40)
BetaText.Position=UDim2.new(.5,-150,.5,65)
BetaText.BackgroundTransparency=1
BetaText.Text="BETA VERSION"
BetaText.TextColor3=Color3.fromRGB(80,140,255)
BetaText.Font=Enum.Font.GothamBold
BetaText.TextSize=22
BetaText.TextTransparency=1
BetaText.Parent=IntroGui

local VerText=Instance.new("TextLabel")
VerText.Size=UDim2.new(0,300,0,30)
VerText.Position=UDim2.new(.5,-150,.5,115)
VerText.BackgroundTransparency=1
VerText.Text="v21.0 | by Ryzen"
VerText.TextColor3=Color3.fromRGB(100,100,150)
VerText.Font=Enum.Font.Gotham
VerText.TextSize=16
VerText.TextTransparency=1
VerText.Parent=IntroGui

local ProgressFrame=Instance.new("Frame")
ProgressFrame.Size=UDim2.new(0,300,0,6)
ProgressFrame.Position=UDim2.new(.5,-150,.5,160)
ProgressFrame.BackgroundColor3=Color3.fromRGB(20,20,40)
ProgressFrame.BorderSizePixel=0
ProgressFrame.BackgroundTransparency=1
ProgressFrame.Parent=IntroGui
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgressFrame

local ProgressFill=Instance.new("Frame")
ProgressFill.Size=UDim2.new(0,0,1,0)
ProgressFill.BackgroundColor3=Color3.fromRGB(80,140,255)
ProgressFill.BorderSizePixel=0
ProgressFill.Parent=ProgressFrame
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgressFill

-- ============ LANGUAGE ============
local Lang="EN"
local TR={
    EN={
        Title="SYPHIXMAN MM2",Combat="COMBAT",Visual="VISUAL",Anim="ANIM",Fling="FLING",World="WORLD",Settings="SETTINGS",
        Aimbot="Aimbot",FlingAll="Fling All",Fly="Fly",Noclip="Noclip",SpeedHack="Speed Hack",GodMode="God Mode",KillAura="Kill Aura",Reach="Reach",
        Spin="Spin",BunnyHop="Bunny Hop",
        AimRadius="Aimbot Radius",AimFOV="Aimbot FOV",FlingPower="Fling Power",ReachDist="Reach Distance",SpeedMul="Speed Multiplier",SpinSpeed="Spin Speed",
        ESP="ESP",Tracers="Tracers",Chams="Chams",Fullbright="Fullbright",RainbowESP="Rainbow ESP",XRay="X-Ray",
        InnocentESP="Innocent ESP",MurdererESP="Murderer ESP",SheriffESP="Sheriff ESP",
        FreeAnim="Free Animations",InfJump="Infinite Jump",NoFall="No Fall Damage",AnimSpeed="Anim Speed",
        SelectPlayer="Select Player",FlingButton="FLING",RefreshList="Refresh",
        ShootMurderer="Shoot Murderer",TakeGun="Take Gun",AntiAFK="Anti-AFK",AutoFarm="Auto Farm",FarmSpeed="Farm Speed",
        TeleportLobby="Teleport to Lobby",TeleportMap="Teleport to Map",
        SaveConfig="Save Config",LoadConfig="Load Config",Reset="Reset",Language="Language",
        ON="ON",OFF="OFF",Loaded="loaded!",Flung="flung!",ShotMurderer="Shot!",GunTaken="Gun taken!",
        ConfigSaved="Saved!",ConfigLoaded="Loaded!",ResetDone="Reset!",
        PhoneButtons="Show Phone Buttons"
    },
    RU={
        Title="SYPHIXMAN MM2",Combat="КОМБАТ",Visual="ВИЗУАЛ",Anim="АНИМ",Fling="ФЛИНГ",World="МИР",Settings="НАСТР",
        Aimbot="Аимбот",FlingAll="Флинг всех",Fly="Полёт",Noclip="Ноклип",SpeedHack="Спидхак",GodMode="Годмод",KillAura="Килл аура",Reach="Дотягивание",
        Spin="Вращение",BunnyHop="Баннихоп",
        AimRadius="Радиус аима",AimFOV="ФОВ аима",FlingPower="Сила флинга",ReachDist="Дистанция reach",SpeedMul="Множитель скорости",SpinSpeed="Скорость вращения",
        ESP="ЕСП",Tracers="Трейсеры",Chams="Чамс",Fullbright="Фуллбрайт",RainbowESP="Радужный ЕСП",XRay="Рентген",
        InnocentESP="ЕСП невиновных",MurdererESP="ЕСП мардера",SheriffESP="ЕСП шерифа",
        FreeAnim="Свободные анимации",InfJump="Бесконечный прыжок",NoFall="Нет урона",AnimSpeed="Скорость анимаций",
        SelectPlayer="Выберите игрока",FlingButton="ФЛИНГ",RefreshList="Обновить",
        ShootMurderer="Стрельнуть",TakeGun="Забрать пистолет",AntiAFK="Анти-АФК",AutoFarm="Авто-фарм",FarmSpeed="Скорость фарма",
        TeleportLobby="В лобби",TeleportMap="На карту",
        SaveConfig="Сохранить",LoadConfig="Загрузить",Reset="Сброс",Language="Язык",
        ON="ВКЛ",OFF="ВЫКЛ",Loaded="загружен!",Flung="зафлинген!",ShotMurderer="Выстрел!",GunTaken="Пистолет забран!",
        ConfigSaved="Сохранено!",ConfigLoaded="Загружено!",ResetDone="Сброшено!",
        PhoneButtons="Показать кнопки"
    }
}

local function t(key)return TR[Lang][key]or key end

-- ============ SETTINGS ============
local S={
    Aim=false,AimRadius=500,AimFOV=90,
    Fl=false,FlPower=15,
    Fly=false,FlySpeed=50,
    NC=false,SP=false,SPMul=2,GM=false,
    KA=false,KARadius=30,KADamage=100,
    ESP=false,ESPColor=Color3.fromRGB(100,180,255),
    InnESP=false,MurESP=false,ShESP=false,
    Tr=false,Ch=false,FB=false,Rainbow=false,
    FA=false,AnimSpeed=1,
    InfJump=false,NoFall=false,AntiAFK=false,XRay=false,Reach=false,ReachDist=20,
    AutoFarm=false,FarmSpeed=1,
    Spin=false,SpinSpeed=10,
    BunnyHop=false,
    ShowPhoneButtons=false,
    SelectedPlayer=nil
}

-- ============ FIX: Speed Hack ============
local OriginalWalkSpeed=16
local SpeedApplied=false

local function ApplySpeed()
    if S.SP and L.Character and L.Character:FindFirstChild("Humanoid")then
        if not SpeedApplied then
            OriginalWalkSpeed=L.Character.Humanoid.WalkSpeed
            SpeedApplied=true
        end
        L.Character.Humanoid.WalkSpeed=OriginalWalkSpeed*S.SPMul
    else
        if SpeedApplied and L.Character and L.Character:FindFirstChild("Humanoid")then
            L.Character.Humanoid.WalkSpeed=OriginalWalkSpeed
            SpeedApplied=false
        end
    end
end

-- ============ FIX: BunnyHop с ускорением ============
local BHopSpeed=0
local BHopApplied=false

local function ApplyBunnyHop()
    if S.BunnyHop and L.Character and L.Character:FindFirstChild("Humanoid")then
        local humanoid=L.Character.Humanoid
        if not BHopApplied then
            OriginalWalkSpeed=humanoid.WalkSpeed
            BHopApplied=true
            BHopSpeed=humanoid.WalkSpeed
        end
        if humanoid.FloorMaterial~=Enum.Material.Air then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            BHopSpeed=BHopSpeed+5
            humanoid.WalkSpeed=BHopSpeed
        end
    else
        if BHopApplied and L.Character and L.Character:FindFirstChild("Humanoid")then
            L.Character.Humanoid.WalkSpeed=OriginalWalkSpeed
            BHopApplied=false
            BHopSpeed=0
        end
    end
end

-- ============ NOTIFY ============
local function Notify(text)
    local N=Instance.new("TextLabel")
    N.Size=UDim2.new(0,240,0,40)
    N.Position=UDim2.new(1,260,0,15)
    N.BackgroundColor3=Color3.fromRGB(15,15,30)
    N.TextColor3=Color3.fromRGB(100,180,255)
    N.Text=text
    N.Font=Enum.Font.GothamBold
    N.TextSize=13
    N.BackgroundTransparency=1
    N.TextTransparency=1
    N.Parent=gethui and gethui()or game.CoreGui
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=N
    T:Create(N,TweenInfo.new(.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(1,-260,0,15),BackgroundTransparency=0,TextTransparency=0}):Play()
    task.wait(2)
    T:Create(N,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Position=UDim2.new(1,260,0,15),BackgroundTransparency=1,TextTransparency=1}):Play()
    task.wait(.5)
    N:Destroy()
end

-- ============ GUI (создаётся сразу, но скрыт) ============
local G=Instance.new("ScreenGui")G.Name="SyphixmanMM2"G.Parent=gethui and gethui()or game.CoreGui
G.Enabled=false -- Скрыт до конца интро

local M=Instance.new("Frame")
M.Size=UDim2.new(0,540,0,480)
M.Position=UDim2.new(.5,-270,.5,-240)
M.BackgroundColor3=Color3.fromRGB(15,15,30)
M.BorderSizePixel=0
M.BackgroundTransparency=1
M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,18)Instance.new("UICorner").Parent=M

local TB=Instance.new("Frame")
TB.Size=UDim2.new(1,0,0,50)
TB.BackgroundColor3=Color3.fromRGB(20,20,40)
TB.BorderSizePixel=0
TB.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,18)Instance.new("UICorner").Parent=TB

local TBb=Instance.new("Frame")
TBb.Size=UDim2.new(1,0,0,25)
TBb.Position=UDim2.new(0,0,0,25)
TBb.BackgroundColor3=Color3.fromRGB(20,20,40)
TBb.BorderSizePixel=0
TBb.Parent=TB

local LogoDot=Instance.new("Frame")
LogoDot.Size=UDim2.new(0,14,0,14)
LogoDot.Position=UDim2.new(0,16,0,18)
LogoDot.BackgroundColor3=Color3.fromRGB(80,140,255)
LogoDot.BorderSizePixel=0
LogoDot.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=LogoDot

local TitleLabel=Instance.new("TextLabel")
TitleLabel.Size=UDim2.new(0,200,0,30)
TitleLabel.Position=UDim2.new(0,36,0,10)
TitleLabel.BackgroundTransparency=1
TitleLabel.Text="🔷 "..t("Title")
TitleLabel.TextColor3=Color3.fromRGB(200,220,255)
TitleLabel.Font=Enum.Font.GothamBlack
TitleLabel.TextSize=15
TitleLabel.TextXAlignment=Enum.TextXAlignment.Left
TitleLabel.Parent=TB

local CB=Instance.new("TextButton")
CB.Size=UDim2.new(0,30,0,30)
CB.Position=UDim2.new(1,-38,0,10)
CB.BackgroundColor3=Color3.fromRGB(255,80,80)
CB.Text="✕"
CB.TextColor3=Color3.fromRGB(255,255,255)
CB.Font=Enum.Font.GothamBold
CB.TextSize=14
CB.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=CB

CB.MouseEnter:Connect(function()T:Create(CB,TweenInfo.new(.3),{Size=UDim2.new(0,34,0,34),BackgroundColor3=Color3.fromRGB(255,120,120)}):Play()end)
CB.MouseLeave:Connect(function()T:Create(CB,TweenInfo.new(.3),{Size=UDim2.new(0,30,0,30),BackgroundColor3=Color3.fromRGB(255,80,80)}):Play()end)
CB.MouseButton1Click:Connect(function()
    T:Create(M,TweenInfo.new(.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),Position=UDim2.new(.5,0,.5,0)}):Play()
    task.wait(.4)
    G:Destroy()
end)

local dragging=false
local dragStart=nil
local startPos=nil

TB.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=input.Position
        startPos=M.Position
    end
end)

U.InputEnded:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=false
    end
end)

U.InputChanged:Connect(function(input)
    if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then
        local delta=input.Position-dragStart
        M.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
    end
end)

local LP=Instance.new("Frame")
LP.Size=UDim2.new(0,115,1,-50)
LP.Position=UDim2.new(0,0,0,50)
LP.BackgroundColor3=Color3.fromRGB(20,20,40)
LP.BorderSizePixel=0
LP.Parent=M

local ContentArea=Instance.new("Frame")
ContentArea.Size=UDim2.new(1,-125,1,-70)
ContentArea.Position=UDim2.new(0,120,0,65)
ContentArea.BackgroundTransparency=1
ContentArea.Parent=M

local TabFrames={}
local Tabs={}

local TabData={
    {Name="Combat",Icon="⚔",Key="Combat"},
    {Name="Visual",Icon="👁",Key="Visual"},
    {Name="Anim",Icon="🎭",Key="Anim"},
    {Name="Fling",Icon="💥",Key="Fling"},
    {Name="World",Icon="🌍",Key="World"},
    {Name="Settings",Icon="⚙",Key="Settings"}
}

for _,tab in pairs(TabData)do
    local SF=Instance.new("ScrollingFrame")
    SF.Size=UDim2.new(1,0,1,0)
    SF.BackgroundTransparency=1
    SF.BorderSizePixel=0
    SF.ScrollBarThickness=3
    SF.ScrollBarImageColor3=Color3.fromRGB(80,140,255)
    SF.Visible=false
    SF.Parent=ContentArea
    TabFrames[tab.Name]=SF
end

local function SwitchTab(tabName)
    for name,btn in pairs(Tabs)do
        local isActive=name==tabName
        T:Create(btn,TweenInfo.new(.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
            BackgroundColor3=isActive and Color3.fromRGB(60,100,200)or Color3.fromRGB(25,25,45),
            TextColor3=isActive and Color3.fromRGB(255,255,255)or Color3.fromRGB(120,140,180)
        }):Play()
    end
    for name,frame in pairs(TabFrames)do
        if name==tabName then
            frame.Visible=true
            frame.Position=UDim2.new(0,30,0,0)
            T:Create(frame,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(0,0,0,0)}):Play()
        else
            T:Create(frame,TweenInfo.new(.3,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Position=UDim2.new(0,-30,0,0)}):Play()
            task.delay(.3,function()if name~=tabName then frame.Visible=false end end)
        end
    end
end

for i,tab in pairs(TabData)do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-10,0,55)
    b.Position=UDim2.new(0,5,0,5+(i-1)*60)
    b.BackgroundColor3=Color3.fromRGB(25,25,45)
    b.Text=tab.Icon.."\n"..t(tab.Key)
    b.TextColor3=Color3.fromRGB(120,140,180)
    b.Font=Enum.Font.GothamBold
    b.TextSize=10
    b.Parent=LP
    Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=b
    b.MouseEnter:Connect(function()
        if Tabs[tab.Name].BackgroundColor3~=Color3.fromRGB(60,100,200)then
            T:Create(b,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(35,35,60)}):Play()
        end
    end)
    b.MouseLeave:Connect(function()
        if Tabs[tab.Name].BackgroundColor3~=Color3.fromRGB(60,100,200)then
            T:Create(b,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(25,25,45)}):Play()
        end
    end)
    b.MouseButton1Click:Connect(function()
        T:Create(b,TweenInfo.new(.15),{Size=UDim2.new(1,-10,0,50)}):Play()
        task.wait(.1)
        T:Create(b,TweenInfo.new(.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(1,-10,0,55)}):Play()
        SwitchTab(tab.Name)
    end)
    Tabs[tab.Name]=b
end

local function mkToggle(parent,name,icon,y,set)
    local f=Instance.new("Frame")
    f.Size=UDim2.new(1,-10,0,45)
    f.Position=UDim2.new(0,5,0,y)
    f.BackgroundColor3=Color3.fromRGB(25,25,45)
    f.BorderSizePixel=0
    f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=f
    f.MouseEnter:Connect(function()T:Create(f,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(30,30,55)}):Play()end)
    f.MouseLeave:Connect(function()T:Create(f,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(25,25,45)}):Play()end)
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(.55,0,1,0)
    l.Position=UDim2.new(0,14,0,0)
    l.BackgroundTransparency=1
    l.Text=icon.." "..name
    l.TextColor3=Color3.fromRGB(200,220,255)
    l.Font=Enum.Font.Gotham
    l.TextSize=13
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.Parent=f
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(0,65,0,28)
    b.Position=UDim2.new(1,-73,0,8)
    b.BackgroundColor3=Color3.fromRGB(40,40,70)
    b.Text=t("OFF")
    b.TextColor3=Color3.fromRGB(150,170,200)
    b.Font=Enum.Font.GothamBold
    b.TextSize=11
    b.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(function()
        S[set]=not S[set]
        T:Create(b,TweenInfo.new(.15),{Size=UDim2.new(0,58,0,24)}):Play()
        task.wait(.1)
        T:Create(b,TweenInfo.new(.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
            Size=UDim2.new(0,65,0,28),
            BackgroundColor3=S[set]and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70),
            TextColor3=S[set]and Color3.fromRGB(255,255,255)or Color3.fromRGB(150,170,200)
        }):Play()
        b.Text=S[set]and t("ON")or t("OFF")
        
        -- Fix speed hack on toggle
        if set=="SP"then ApplySpeed()end
        if set=="BunnyHop"then
            if not S[set]then
                -- Reset speed when bunnyhop off
                if L.Character and L.Character:FindFirstChild("Humanoid")then
                    L.Character.Humanoid.WalkSpeed=16
                end
                BHopSpeed=0
                BHopApplied=false
            end
        end
    end)
end

local function mkSlider(parent,name,y,min,max,def,set)
    local f=Instance.new("Frame")
    f.Size=UDim2.new(1,-10,0,38)
    f.Position=UDim2.new(0,5,0,y)
    f.BackgroundColor3=Color3.fromRGB(25,25,45)
    f.BorderSizePixel=0
    f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=f
    local l=Instance.new("TextLabel")
    l.Size=UDim2.new(.4,0,1,0)
    l.Position=UDim2.new(0,10,0,0)
    l.BackgroundTransparency=1
    l.Text=name
    l.TextColor3=Color3.fromRGB(150,170,200)
    l.Font=Enum.Font.Gotham
    l.TextSize=11
    l.TextXAlignment=Enum.TextXAlignment.Left
    l.Parent=f
    local vl=Instance.new("TextLabel")
    vl.Size=UDim2.new(0,45,1,0)
    vl.Position=UDim2.new(1,-48,0,0)
    vl.BackgroundTransparency=1
    vl.Text=tostring(def)
    vl.TextColor3=Color3.fromRGB(100,180,255)
    vl.Font=Enum.Font.GothamBold
    vl.TextSize=11
    vl.Parent=f
    local sb=Instance.new("TextButton")
    sb.Size=UDim2.new(.35,0,0,10)
    sb.Position=UDim2.new(.38,0,0,14)
    sb.BackgroundColor3=Color3.fromRGB(40,40,70)
    sb.Text=""
    sb.BorderSizePixel=0
    sb.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=sb
    local fill=Instance.new("Frame")
    fill.Size=UDim2.new((def-min)/(max-min),0,1,0)
    fill.BackgroundColor3=Color3.fromRGB(80,140,255)
    fill.BorderSizePixel=0
    fill.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=fill
    local knob=Instance.new("Frame")
    knob.Size=UDim2.new(0,16,0,16)
    knob.Position=UDim2.new((def-min)/(max-min),-8,0,-3)
    knob.BackgroundColor3=Color3.fromRGB(255,255,255)
    knob.BorderSizePixel=0
    knob.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=knob
    sb.MouseButton1Down:Connect(function()
        local con
        con=R.RenderStepped:Connect(function()
            if U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then
                local rel=math.clamp((U:GetMouseLocation().X-sb.AbsolutePosition.X)/sb.AbsoluteSize.X,0,1)
                local val=math.floor(min+(max-min)*rel)
                S[set]=val
                vl.Text=tostring(val)
                T:Create(fill,TweenInfo.new(.1),{Size=UDim2.new(rel,0,1,0)}):Play()
                T:Create(knob,TweenInfo.new(.1),{Position=UDim2.new(rel,-8,0,-3)}):Play()
                if set=="SPMul"then ApplySpeed()end
            else con:Disconnect()end
        end)
    end)
end

local function mkButton(parent,name,icon,y,color,callback)
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-10,0,45)
    b.Position=UDim2.new(0,5,0,y)
    b.BackgroundColor3=color or Color3.fromRGB(60,100,200)
    b.Text=icon.." "..name
    b.TextColor3=Color3.fromRGB(255,255,255)
    b.Font=Enum.Font.GothamBold
    b.TextSize=13
    b.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=b
    b.MouseEnter:Connect(function()T:Create(b,TweenInfo.new(.3),{Size=UDim2.new(1,-10,0,50)}):Play()end)
    b.MouseLeave:Connect(function()T:Create(b,TweenInfo.new(.3),{Size=UDim2.new(1,-10,0,45)}):Play()end)
    b.MouseButton1Click:Connect(function()
        T:Create(b,TweenInfo.new(.1),{Size=UDim2.new(1,-10,0,40)}):Play()
        task.wait(.08)
        T:Create(b,TweenInfo.new(.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(1,-10,0,45)}):Play()
        callback()
    end)
end

-- ============ FILL TABS ============

-- COMBAT
local CombatSF=TabFrames.Combat
mkToggle(CombatSF,t("Aimbot"),"🔫",5,"Aim")
mkToggle(CombatSF,t("FlingAll"),"💥",54,"Fl")
mkToggle(CombatSF,t("Fly"),"🕊",103,"Fly")
mkToggle(CombatSF,t("Noclip"),"👻",152,"NC")
mkToggle(CombatSF,t("SpeedHack"),"⚡",201,"SP")
mkToggle(CombatSF,t("GodMode"),"🛡",250,"GM")
mkToggle(CombatSF,t("KillAura"),"⚔",299,"KA")
mkToggle(CombatSF,t("Reach"),"📏",348,"Reach")
mkToggle(CombatSF,t("Spin"),"🌀",397,"Spin")
mkToggle(CombatSF,t("BunnyHop"),"🦘",446,"BunnyHop")
mkSlider(CombatSF,t("AimRadius"),500,100,2000,500,"AimRadius")
mkSlider(CombatSF,t("AimFOV"),542,30,360,90,"AimFOV")
mkSlider(CombatSF,t("FlingPower"),584,1,50,15,"FlPower")
mkSlider(CombatSF,t("ReachDist"),626,5,50,20,"ReachDist")
mkSlider(CombatSF,t("SpeedMul"),668,1,10,2,"SPMul")
mkSlider(CombatSF,t("SpinSpeed"),710,1,50,10,"SpinSpeed")
CombatSF.CanvasSize=UDim2.new(0,0,0,760)

-- VISUAL
local VisualSF=TabFrames.Visual
mkToggle(VisualSF,"ESP","👁",5,"ESP")
mkToggle(VisualSF,t("InnocentESP"),"🟢",54,"InnESP")
mkToggle(VisualSF,t("MurdererESP"),"🔴",103,"MurESP")
mkToggle(VisualSF,t("SheriffESP"),"🔵",152,"ShESP")
mkToggle(VisualSF,t("Tracers"),"📛",201,"Tr")
mkToggle(VisualSF,t("Chams"),"👻",250,"Ch")
mkToggle(VisualSF,t("Fullbright"),"🌟",299,"FB")
mkToggle(VisualSF,t("RainbowESP"),"🌈",348,"Rainbow")
mkToggle(VisualSF,t("XRay"),"💀",397,"XRay")
VisualSF.CanvasSize=UDim2.new(0,0,0,450)

-- ANIM
local AnimSF=TabFrames.Anim
mkToggle(AnimSF,t("FreeAnim"),"🎭",5,"FA")
mkToggle(AnimSF,t("InfJump"),"🦘",54,"InfJump")
mkToggle(AnimSF,t("NoFall"),"🍃",103,"NoFall")
mkSlider(AnimSF,t("AnimSpeed"),157,.1,5,1,"AnimSpeed")
AnimSF.CanvasSize=UDim2.new(0,0,0,200)

-- FLING
local FlingSF=TabFrames.Fling

local SelectLabel=Instance.new("TextLabel")
SelectLabel.Size=UDim2.new(1,-10,0,30)
SelectLabel.Position=UDim2.new(0,5,0,5)
SelectLabel.BackgroundTransparency=1
SelectLabel.Text="💥 "..t("SelectPlayer")..":"
SelectLabel.TextColor3=Color3.fromRGB(200,220,255)
SelectLabel.Font=Enum.Font.GothamBold
SelectLabel.TextSize=14
SelectLabel.TextXAlignment=Enum.TextXAlignment.Left
SelectLabel.Parent=FlingSF

local PlayerList=Instance.new("ScrollingFrame")
PlayerList.Size=UDim2.new(1,-10,0,280)
PlayerList.Position=UDim2.new(0,5,0,40)
PlayerList.BackgroundColor3=Color3.fromRGB(25,25,45)
PlayerList.BorderSizePixel=0
PlayerList.ScrollBarThickness=3
PlayerList.ScrollBarImageColor3=Color3.fromRGB(80,140,255)
PlayerList.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=PlayerList

local SelectedNameLabel=Instance.new("TextLabel")
SelectedNameLabel.Size=UDim2.new(1,-10,0,35)
SelectedNameLabel.Position=UDim2.new(0,5,0,325)
SelectedNameLabel.BackgroundColor3=Color3
