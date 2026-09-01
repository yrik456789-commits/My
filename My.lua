-- Syphixman MM2 v13 | Beta Intro Animation
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer
local VU=game:GetService("VirtualUser")
local Lighting=game:GetService("Lighting")

-- ============ BETA INTRO ============
local IntroGui=Instance.new("ScreenGui")
IntroGui.Name="SyphixIntro"
IntroGui.Parent=gethui and gethui()or game.CoreGui

-- Затемнение фона
local IntroBG=Instance.new("Frame")
IntroBG.Size=UDim2.new(1,0,1,0)
IntroBG.BackgroundColor3=Color3.fromRGB(0,0,0)
IntroBG.BackgroundTransparency=1
IntroBG.Parent=IntroGui

-- Логотип
local Logo=Instance.new("TextLabel")
Logo.Size=UDim2.new(0,400,0,80)
Logo.Position=UDim2.new(.5,-200,.5,-40)
Logo.BackgroundTransparency=1
Logo.Text="🌅 SYPHIXMAN"
Logo.TextColor3=Color3.fromRGB(255,215,0)
Logo.Font=Enum.Font.GothamBlack
Logo.TextSize=40
Logo.TextTransparency=1
Logo.TextScaled=true
Logo.Parent=IntroGui

-- Beta текст
local BetaText=Instance.new("TextLabel")
BetaText.Size=UDim2.new(0,400,0,50)
BetaText.Position=UDim2.new(.5,-200,.5,60)
BetaText.BackgroundTransparency=1
BetaText.Text="BETA VERSION"
BetaText.TextColor3=Color3.fromRGB(255,165,0)
BetaText.Font=Enum.Font.GothamBold
BetaText.TextSize=20
BetaText.TextTransparency=1
BetaText.Parent=IntroGui

-- Линия
local Line=Instance.new("Frame")
Line.Size=UDim2.new(0,0,0,3)
Line.Position=UDim2.new(.5,0,.5,125)
Line.BackgroundColor3=Color3.fromRGB(255,215,0)
Line.BorderSizePixel=0
Line.Parent=IntroGui
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=Line

-- Версия
local VerText=Instance.new("TextLabel")
VerText.Size=UDim2.new(0,400,0,30)
VerText.Position=UDim2.new(.5,-200,.5,140)
VerText.BackgroundTransparency=1
VerText.Text="v13.0 | by Ryzen"
VerText.TextColor3=Color3.fromRGB(200,200,200)
VerText.Font=Enum.Font.Gotham
VerText.TextSize=16
VerText.TextTransparency=1
VerText.Parent=IntroGui

-- Анимация появления
task.spawn(function()
    -- Затемнение появляется
    T:Create(IntroBG,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
        BackgroundTransparency=0.3
    }):Play()
    
    wait(.3)
    
    -- Логотип выезжает
    T:Create(Logo,TweenInfo.new(1,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        TextTransparency=0,
        Position=UDim2.new(.5,-200,.5,-40)
    }):Play()
    
    wait(.4)
    
    -- Beta текст появляется
    T:Create(BetaText,TweenInfo.new(.8,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
        TextTransparency=0
    }):Play()
    
    wait(.3)
    
    -- Линия расширяется
    T:Create(Line,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
        Size=UDim2.new(0,400,0,3),
        Position=UDim2.new(.5,-200,.5,125)
    }):Play()
    
    wait(.5)
    
    -- Версия появляется
    T:Create(VerText,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{
        TextTransparency=0
    }):Play()
    
    wait(1.5)
    
    -- Всё исчезает
    T:Create(Logo,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        TextTransparency=1,
        Position=UDim2.new(.5,-200,.5,-80)
    }):Play()
    T:Create(BetaText,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        TextTransparency=1
    }):Play()
    T:Create(Line,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        Size=UDim2.new(0,0,0,3),
        Position=UDim2.new(.5,0,.5,125)
    }):Play()
    T:Create(VerText,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        TextTransparency=1
    }):Play()
    T:Create(IntroBG,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        BackgroundTransparency=1
    }):Play()
    
    wait(.5)
    IntroGui:Destroy()
end)

-- ============ MAIN GUI ============
local Lang="EN"
local TR={
    EN={
        Title="SYPHIXMAN MM2",Combat="COMBAT",Visual="VISUAL",Anim="ANIM",Phone="PHONE",World="WORLD",Settings="SETTINGS",
        Aimbot="Aimbot",Fling="Fling",Fly="Fly",Noclip="Noclip",SpeedHack="Speed Hack",GodMode="God Mode",KillAura="Kill Aura",Reach="Reach",
        AimRadius="Aimbot Radius",AimFOV="Aimbot FOV",FlingPower="Fling Power",ReachDist="Reach Distance",SpeedMul="Speed Multiplier",
        ESP="ESP",Tracers="Tracers",Chams="Chams",Fullbright="Fullbright",RainbowESP="Rainbow ESP",XRay="X-Ray",ESPRadius="ESP Radius",
        InnocentESP="Innocent ESP",MurdererESP="Murderer ESP",SheriffESP="Sheriff ESP",
        FreeAnim="Free Animations",InfJump="Infinite Jump",NoFall="No Fall Damage",AnimSpeed="Anim Speed",
        FlingPlayer="Fling Player",ShootMurderer="Shoot Murderer",TakeGun="Take Gun",AntiAFK="Anti-AFK",AutoFarm="Auto Farm",FarmSpeed="Farm Speed",
        TeleportLobby="Teleport to Lobby",TeleportMap="Teleport to Map",
        SaveConfig="Save Config",LoadConfig="Load Config",Reset="Reset",Language="Language",English="English",Russian="Russian",
        ON="ON",OFF="OFF",Loaded="loaded!",FPS="FPS",Players="Players",Status="Status",Working="Working",
        Innocent="Innocent",Murderer="Murderer",Sheriff="Sheriff",Hero="Hero",
        Flung="flung!",ShotMurderer="Shot at murderer!",GunTaken="Gun taken!",AntiAFKOn="Anti-AFK enabled!",
        ConfigSaved="Config saved!",ConfigLoaded="Config loaded!",ResetDone="Settings reset!",
        SelectPlayer="Select Player",Keybind="Keybind",PressKey="Press a key...",NoPlayers="No players found",
        BindAimbot="Aimbot",BindFling="Fling",BindFly="Fly",BindNoclip="Noclip",BindESP="ESP",BindKillAura="Kill Aura"
    },
    RU={
        Title="SYPHIXMAN MM2",Combat="КОМБАТ",Visual="ВИЗУАЛ",Anim="АНИМ",Phone="ТЕЛЕФОН",World="МИР",Settings="НАСТР",
        Aimbot="Аимбот",Fling="Флинг",Fly="Полёт",Noclip="Ноклип",SpeedHack="Спидхак",GodMode="Годмод",KillAura="Килл аура",Reach="Дотягивание",
        AimRadius="Радиус аима",AimFOV="ФОВ аима",FlingPower="Сила флинга",ReachDist="Дистанция reach",SpeedMul="Множитель скорости",
        ESP="ЕСП",Tracers="Трейсеры",Chams="Чамс",Fullbright="Фуллбрайт",RainbowESP="Радужный ЕСП",XRay="Рентген",ESPRadius="Радиус ЕСП",
        InnocentESP="ЕСП невиновных",MurdererESP="ЕСП мардера",SheriffESP="ЕСП шерифа",
        FreeAnim="Свободные анимации",InfJump="Бесконечный прыжок",NoFall="Нет урона от падения",AnimSpeed="Скорость анимаций",
        FlingPlayer="Флинг игрока",ShootMurderer="Стрельнуть в мардера",TakeGun="Забрать пистолет",AntiAFK="Анти-АФК",AutoFarm="Авто-фарм",FarmSpeed="Скорость фарма",
        TeleportLobby="Телепорт в лобби",TeleportMap="Телепорт на карту",
        SaveConfig="Сохранить конфиг",LoadConfig="Загрузить конфиг",Reset="Сбросить",Language="Язык",English="Английский",Russian="Русский",
        ON="ВКЛ",OFF="ВЫКЛ",Loaded="загружен!",FPS="ФПС",Players="Игроков",Status="Статус",Working="Работает",
        Innocent="Невиновный",Murderer="Мардер",Sheriff="Шериф",Hero="Герой",
        Flung="зафлинген!",ShotMurderer="Выстрел в мардера!",GunTaken="Пистолет забран!",AntiAFKOn="Анти-АФК включен!",
        ConfigSaved="Конфиг сохранен!",ConfigLoaded="Конфиг загружен!",ResetDone="Настройки сброшены!",
        SelectPlayer="Выбрать игрока",Keybind="Бинд",PressKey="Нажмите клавишу...",NoPlayers="Игроки не найдены",
        BindAimbot="Аимбот",BindFling="Флинг",BindFly="Полёт",BindNoclip="Ноклип",BindESP="ЕСП",BindKillAura="Килл аура"
    }
}

local function t(key)return TR[Lang][key]or key end

local S={
    Aim=false,AimRadius=500,AimFOV=90,
    Fl=false,FlPower=15,
    Fly=false,FlySpeed=50,
    NC=false,SP=false,SPMul=2,GM=false,
    KA=false,KARadius=30,KADamage=100,
    ESP=false,ESPColor=Color3.fromRGB(255,50,50),ESPRadius=1000,
    InnESP=false,MurESP=false,ShESP=false,
    Tr=false,Ch=false,FB=false,Rainbow=false,
    FA=false,AnimSpeed=1,
    InfJump=false,NoFall=false,AntiAFK=false,XRay=false,Reach=false,ReachDist=20,
    AutoFarm=false,FarmSpeed=1,
    Keybinds={}
}

-- ============ NOTIFICATIONS ============
local function Notify(text)
    local N=Instance.new("TextLabel")
    N.Size=UDim2.new(0,220,0,35)
    N.Position=UDim2.new(1,240,0,15)
    N.BackgroundColor3=Color3.fromRGB(255,248,235)
    N.TextColor3=Color3.fromRGB(60,40,20)
    N.Text=text
    N.Font=Enum.Font.GothamBold
    N.TextSize=12
    N.Parent=gethui and gethui()or game.CoreGui
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=N
    T:Create(N,TweenInfo.new(.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(1,-240,0,15)}):Play()
    task.wait(2)
    T:Create(N,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(1,240,0,15)}):Play()
    task.wait(.3)
    N:Destroy()
end

-- ============ MAIN GUI ============
local G=Instance.new("ScreenGui")G.Name="SyphixmanMM2"G.Parent=gethui and gethui()or game.CoreGui

local M=Instance.new("Frame")
M.Size=UDim2.new(0,500,0,440)
M.Position=UDim2.new(.5,-250,.5,-220)
M.BackgroundColor3=Color3.fromRGB(255,248,235)
M.BorderSizePixel=0
M.BackgroundTransparency=1
M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=M

-- Анимация появления GUI после интро
task.spawn(function()
    wait(3.5) -- Ждём пока интро закончится
    
    T:Create(M,TweenInfo.new(.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        BackgroundTransparency=0,
        Position=UDim2.new(.5,-250,.5,-220)
    }):Play()
end)

-- Title Bar
local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,40)TB.BackgroundColor3=Color3.fromRGB(135,206,235)TB.BorderSizePixel=0 TB.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=TB
local TBb=Instance.new("Frame")TBb.Size=UDim2.new(1,0,0,20)TBb.Position=UDim2.new(0,0,0,20)TBb.BackgroundColor3=Color3.fromRGB(135,206,235)TBb.BorderSizePixel=0 TBb.Parent=TB

local TitleLabel=Instance.new("TextLabel")TitleLabel.Size=UDim2.new(0,180,0,20)TitleLabel.Position=UDim2.new(0,15,0,10)TitleLabel.BackgroundTransparency=1 TitleLabel.Text="🌅 "..t("Title")TitleLabel.TextColor3=Color3.fromRGB(60,40,20)TitleLabel.Font=Enum.Font.GothamBlack TitleLabel.TextSize=13 TitleLabel.TextXAlignment=Enum.TextXAlignment.Left TitleLabel.Parent=TB

-- Drag functionality
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

-- Close
local CB=Instance.new("TextButton")CB.Size=UDim2.new(0,24,0,24)CB.Position=UDim2.new(1,-30,0,8)CB.BackgroundColor3=Color3.fromRGB(255,120,120)CB.Text="✕"CB.TextColor3=Color3.fromRGB(255,255,255)CB.Font=Enum.Font.GothamBold CB.TextSize=12 CB.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=CB
CB.MouseButton1Click:Connect(function()
    T:Create(M,TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{
        BackgroundTransparency=1,
        Size=UDim2.new(0,0,0,0),
        Position=UDim2.new(.5,0,.5,0)
    }):Play()
    task.wait(.4)
    G:Destroy()
end)

-- Left Panel
local LP=Instance.new("Frame")LP.Size=UDim2.new(0,100,1,-40)LP.Position=UDim2.new(0,0,0,40)LP.BackgroundColor3=Color3.fromRGB(255,236,179)LP.BorderSizePixel=0 LP.Parent=M

-- Content Area
local ContentArea=Instance.new("Frame")ContentArea.Size=UDim2.new(1,-110,1,-60)ContentArea.Position=UDim2.new(0,105,0,55)ContentArea.BackgroundTransparency=1 ContentArea.Parent=M

local TabFrames={}
local Tabs={}

local TabData={
    {Name="Combat",Icon="⚔",Key="Combat"},
    {Name="Visual",Icon="👁",Key="Visual"},
    {Name="Anim",Icon="🎭",Key="Anim"},
    {Name="Phone",Icon="📱",Key="Phone"},
    {Name="World",Icon="🌍",Key="World"},
    {Name="Settings",Icon="⚙",Key="Settings"}
}

for _,tab in pairs(TabData)do
    local SF=Instance.new("ScrollingFrame")SF.Size=UDim2.new(1,0,1,0)SF.BackgroundTransparency=1 SF.BorderSizePixel=0 SF.ScrollBarThickness=4 SF.ScrollBarImageColor3=Color3.fromRGB(255,165,0)SF.Visible=false SF.Parent=ContentArea
    TabFrames[tab.Name]=SF
end

local function SwitchTab(tabName)
    for name,btn in pairs(Tabs)do
        local isActive=name==tabName
        btn.BackgroundColor3=isActive and Color3.fromRGB(255,165,0)or Color3.fromRGB(255,228,181)
        btn.TextColor3=isActive and Color3.fromRGB(255,255,255)or Color3.fromRGB(60,40,20)
    end
    for name,frame in pairs(TabFrames)do
        frame.Visible=(name==tabName)
    end
end

for i,tab in pairs(TabData)do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-10,0,48)
    b.Position=UDim2.new(0,5,0,5+(i-1)*53)
    b.BackgroundColor3=Color3.fromRGB(255,228,181)
    b.Text=tab.Icon.." "..t(tab.Key)
    b.TextColor3=Color3.fromRGB(60,40,20)
    b.Font=Enum.Font.GothamBold
    b.TextSize=10
    b.Parent=LP
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(function()SwitchTab(tab.Name)end)
    Tabs[tab.Name]=b
end

-- Element creators
local function mkToggle(parent,name,icon,y,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,38)f.Position=UDim2.new(0,5,0,y)f.BackgroundColor3=Color3.fromRGB(255,255,255)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=f
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.55,0,1,0)l.Position=UDim2.new(0,12,0,0)l.BackgroundTransparency=1 l.Text=icon.." "..name l.TextColor3=Color3.fromRGB(60,40,20)l.Font=Enum.Font.Gotham l.TextSize=12 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
    local b=Instance.new("TextButton")b.Size=UDim2.new(0,55,0,24)b.Position=UDim2.new(1,-62,0,7)b.BackgroundColor3=Color3.fromRGB(200,200,200)b.Text=t("OFF")b.TextColor3=Color3.fromRGB(60,40,20)b.Font=Enum.Font.GothamBold b.TextSize=10 b.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(function()
        S[set]=not S[set]
        b.BackgroundColor3=S[set]and Color3.fromRGB(144,238,144)or Color3.fromRGB(200,200,200)
        b.Text=S[set]and t("ON")or t("OFF")
        Notify(icon.." "..name..": "..(S[set]and t("ON")or t("OFF")))
    end)
    return f,b
end

local function mkSlider(parent,name,y,min,max,def,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,32)f.Position=UDim2.new(0,5,0,y)f.BackgroundColor3=Color3.fromRGB(255,255,255)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=f
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.4,0,1,0)l.Position=UDim2.new(0,8,0,0)l.BackgroundTransparency=1 l.Text=name l.TextColor3=Color3.fromRGB(60,40,20)l.Font=Enum.Font.Gotham l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
    local vl=Instance.new("TextLabel")vl.Size=UDim2.new(0,45,1,0)vl.Position=UDim2.new(1,-48,0,0)vl.BackgroundTransparency=1 vl.Text=tostring(def)vl.TextColor3=Color3.fromRGB(255,165,0)vl.Font=Enum.Font.GothamBold vl.TextSize=11 vl.Parent=f
    local sb=Instance.new("TextButton")sb.Size=UDim2.new(.35,0,0,8)sb.Position=UDim2.new(.38,0,0,12)sb.BackgroundColor3=Color3.fromRGB(230,230,230)sb.Text=""sb.BorderSizePixel=0 sb.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=sb
    local fill=Instance.new("Frame")fill.Size=UDim2.new((def-min)/(max-min),0,1,0)fill.BackgroundColor3=Color3.fromRGB(255,165,0)fill.BorderSizePixel=0 fill.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=fill
    local knob=Instance.new("Frame")knob.Size=UDim2.new(0,14,0,14)knob.Position=UDim2.new((def-min)/(max-min),-7,0,-3)knob.BackgroundColor3=Color3.fromRGB(255,255,255)knob.BorderSizePixel=0 knob.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=knob
    sb.MouseButton1Down:Connect(function()
        local con
        con=R.RenderStepped:Connect(function()
            if U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then
                local rel=math.clamp((U:GetMouseLocation().X-sb.AbsolutePosition.X)/sb.AbsoluteSize.X,0,1)
                local val=math.floor(min+(max-min)*rel)
                S[set]=val
                vl.Text=tostring(val)
                fill.Size=UDim2.new(rel,0,1,0)
                knob.Position=UDim2.new(rel,-7,0,-3)
            else con:Disconnect()end
        end)
    end)
end

local function mkButton(parent,name,icon,y,color,callback)
    local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,38)b.Position=UDim2.new(0,5,0,y)b.BackgroundColor3=color or Color3.fromRGB(100,180,255)b.Text=icon.." "..name b.TextColor3=Color3.fromRGB(255,255,255)b.Font=Enum.Font.GothamBold b.TextSize=12 b.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(callback)
end

-- ============ FILL TABS ============

-- COMBAT
local CombatSF=TabFrames.Combat
mkToggle(CombatSF,t("Aimbot"),"🔫",5,"Aim")
mkToggle(CombatSF,t("Fling"),"💥",47,"Fl")
mkToggle(CombatSF,t("Fly"),"🕊",89,"Fly")
mkToggle(CombatSF,t("Noclip"),"👻",131,"NC")
mkToggle(CombatSF,t("SpeedHack"),"⚡",173,"SP")
mkToggle(CombatSF,t("GodMode"),"🛡",215,"GM")
mkToggle(CombatSF,t("KillAura"),"⚔",257,"KA")
mkToggle(CombatSF,t("Reach"),"📏",299,"Reach")
mkSlider(CombatSF,t("AimRadius"),343,100,1000,500,"AimRadius")
mkSlider(CombatSF,t("AimFOV"),379,30,360,90,"AimFOV")
mkSlider(CombatSF,t("FlingPower"),415,1,50,15,"FlPower")
mkSlider(CombatSF,t("ReachDist"),451,5,50,20,"ReachDist")
mkSlider(CombatSF,t("SpeedMul"),487,1,10,2,"SPMul")
CombatSF.CanvasSize=UDim2.new(0,0,0,525)

-- VISUAL
local VisualSF=TabFrames.Visual
mkToggle(VisualSF,"ESP","👁",5,"ESP")
mkToggle(VisualSF,t("InnocentESP"),"🟢",47,"InnESP")
mkToggle(VisualSF,t("MurdererESP"),"🔴",89,"MurESP")
mkToggle(VisualSF,t("SheriffESP"),"🔵",131,"ShESP")
mkToggle(VisualSF,t("Tracers"),"📛",173,"Tr")
mkToggle(VisualSF,t("Chams"),"👻",215,"Ch")
mkToggle(VisualSF,t("Fullbright"),"🌟",257,"FB")
mkToggle(VisualSF,t("RainbowESP"),"🌈",299,"Rainbow")
mkToggle(VisualSF,t("XRay"),"💀",341,"XRay")
mkSlider(VisualSF,t("ESPRadius"),390,100,2000,1000,"ESPRadius")
VisualSF.CanvasSize=UDim2.new(0,0,0,430)

-- ANIM
local AnimSF=TabFrames.Anim
mkToggle(AnimSF,t("FreeAnim"),"🎭",5,"FA")
mkToggle(AnimSF,t("InfJump"),"🦘",47,"InfJump")
mkToggle(AnimSF,t("NoFall"),"🍃",89,"NoFall")
mkSlider(AnimSF,t("AnimSpeed"),135,.1,5,1,"AnimSpeed")
AnimSF.CanvasSize=UDim2.new(0,0,0,175)

-- PHONE
local PhoneSF=TabFrames.Phone

-- Fling Player List
local FlingLabel=Instance.new("TextLabel")FlingLabel.Size=UDim2.new(1,-10,0,25)FlingLabel.Position=UDim2.new(0,5,0,5)FlingLabel.BackgroundTransparency=1 FlingLabel.Text="💥 "..t("FlingPlayer")..":"FlingLabel.TextColor3=Color3.fromRGB(60,40,20)FlingLabel.Font=Enum.Font.GothamBold FlingLabel.TextSize=12 FlingLabel.TextXAlignment=Enum.TextXAlignment.Left FlingLabel.Parent=PhoneSF

local PlayerList=Instance.new("ScrollingFrame")PlayerList.Size=UDim2.new(1,-10,0,150)PlayerList.Position=UDim2.new(0,5,0,32)PlayerList.BackgroundColor3=Color3.fromRGB(255,255,255)PlayerList.BorderSizePixel=0 PlayerList.ScrollBarThickness=3 PlayerList.Parent=PhoneSF
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=PlayerList

local function RefreshPlayerList()
    for _,child in pairs(PlayerList:GetChildren())do if child:IsA("TextButton")then child:Destroy()end end
    local y=0
    for _,p in pairs(P:GetPlayers())do
        if p~=L then
            local btn=Instance.new("TextButton")
            btn.Size=UDim2.new(1,-10,0,30)
            btn.Position=UDim2.new(0,5,0,y)
            btn.BackgroundColor3=Color3.fromRGB(230,230,230)
            btn.Text=p.Name
            btn.TextColor3=Color3.fromRGB(60,40,20)
            btn.Font=Enum.Font.GothamBold
            btn.TextSize=11
            btn.Parent=PlayerList
            Instance.new("UICorner").CornerRadius=UDim.new(0,4)Instance.new("UICorner").Parent=btn
            btn.MouseButton1Click:Connect(function()
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                    local h=p.Character.HumanoidRootPart
                    h.Velocity=Vector3.new(math.random(-15000,15000),math.random(8000,20000),math.random(-15000,15000))
                    h.RotVelocity=Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100))
                    Notify("💥 "..p.Name.." "..t("Flung"))
                end
            end)
            y+=34
        end
    end
    PlayerList.CanvasSize=UDim2.new(0,0,0,y)
end

RefreshPlayerList()

local RefreshBtn=Instance.new("TextButton")RefreshBtn.Size=UDim2.new(1,-10,0,25)RefreshBtn.Position=UDim2.new(0,5,0,187)RefreshBtn.BackgroundColor3=Color3.fromRGB(200,200,200)RefreshBtn.Text="🔄"RefreshBtn.TextColor3=Color3.fromRGB(60,40,20)RefreshBtn.Font=Enum.Font.GothamBold RefreshBtn.TextSize=14 RefreshBtn.Parent=PhoneSF
Instance.new("UICorner").CornerRadius=UDim.new(0,4)Instance.new("UICorner").Parent=RefreshBtn
RefreshBtn.MouseButton1Click:Connect(RefreshPlayerList)

mkButton(PhoneSF,t("ShootMurderer"),"🔫",217,Color3.fromRGB(255,100,100),function()shootMurderer()Notify(t("ShotMurderer"))end)
mkButton(PhoneSF,t("TakeGun"),"🔫",259,Color3.fromRGB(100,180,255),function()takeGun()Notify(t("GunTaken"))end)
mkButton(PhoneSF,t("AntiAFK"),"⏰",301,Color3.fromRGB(255,200,100),function()S.AntiAFK=true Notify(t("AntiAFKOn"))end)
mkToggle(PhoneSF,t("AutoFarm"),"💰",343,"AutoFarm")
mkSlider(PhoneSF,t("FarmSpeed"),385,1,10,1,"FarmSpeed")
PhoneSF.CanvasSize=UDim2.new(0,0,0,425)

-- WORLD
local WorldSF=TabFrames.World
mkButton(WorldSF,t("TeleportLobby"),"🏠",5,Color3.fromRGB(100,180,255),function()
    local lobby=workspace:FindFirstChild("Lobby")or workspace:FindFirstChild("Spawn")
    if lobby and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        L.Character.HumanoidRootPart.CFrame=lobby.CFrame+Vector3.new(0,5,0)
        Notify("🏠 Teleported!")
    end
end)
mkButton(WorldSF,t("TeleportMap"),"🗺",47,Color3.fromRGB(100,180,255),function()
    local map=workspace:FindFirstChild("Map")or workspace:FindFirstChild("Arena")
    if map and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        L.Character.HumanoidRootPart.CFrame=map.CFrame+Vector3.new(0,5,0)
        Notify("🗺 Teleported!")
    end
end)
WorldSF.CanvasSize=UDim2.new(0,0,0,95)

-- SETTINGS
local SettingsSF=TabFrames.Settings

-- Language toggle
local LangFrame=Instance.new("Frame")LangFrame.Size=UDim2.new(1,-10,0,50)LangFrame.Position=UDim2.new(0,5,0,5)LangFrame.BackgroundColor3=Color3.fromRGB(255,255,255)LangFrame.BorderSizePixel=0 LangFrame.Parent=SettingsSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=LangFrame
local LangLabel=Instance.new("TextLabel")LangLabel.Size=UDim2.new(1,0,0,20)LangLabel.Position=UDim2.new(0,5,0,5)LangLabel.BackgroundTransparency=1 LangLabel.Text="🌐 "..t("Language")LangLabel.TextColor3=Color3.fromRGB(60,40,20)LangLabel.Font=Enum.Font.GothamBold LangLabel.TextSize=12 LangLabel.Parent=LangFrame

local ENBtn=Instance.new("TextButton")ENBtn.Size=UDim2.new(.4,0,0,22)ENBtn.Position=UDim2.new(.05,0,0,27)ENBtn.BackgroundColor3=Color3.fromRGB(144,238,144)ENBtn.Text=t("English")ENBtn.TextColor3=Color3.fromRGB(60,40,20)ENBtn.Font=Enum.Font.GothamBold ENBtn.TextSize=10 ENBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=ENBtn
local RUBtn=Instance.new("TextButton")RUBtn.Size=UDim2.new(.4,0,0,22)RUBtn.Position=UDim2.new(.55,0,0,27)RUBtn.BackgroundColor3=Color3.fromRGB(200,200,200)RUBtn.Text=t("Russian")RUBtn.TextColor3=Color3.fromRGB(60,40,20)RUBtn.Font=Enum.Font.GothamBold RUBtn.TextSize=10 RUBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=RUBtn

ENBtn.MouseButton1Click:Connect(function()
    Lang="EN"
    ENBtn.BackgroundColor3=Color3.fromRGB(144,238,144)
    RUBtn.BackgroundColor3=Color3.fromRGB(200,200,200)
    Notify("Language: English")
    TitleLabel.Text="🌅 "..t("Title")
end)

RUBtn.MouseButton1Click:Connect(function()
    Lang="RU"
    RUBtn.BackgroundColor3=Color3.fromRGB(144,238,144)
    ENBtn.BackgroundColor3=Color3.fromRGB(200,200,200)
    Notify("Язык: Русский")
    TitleLabel.Text="🌅 "..t("Title")
end)

-- Configs
mkButton(SettingsSF,t("SaveConfig"),"💾",60,Color3.fromRGB(255,165,0),function()
    if writefile then
        writefile("syphixman_config.json",game:GetService("HttpService"):JSONEncode(S))
        Notify(t("ConfigSaved"))
    end
end)
mkButton(SettingsSF,t("LoadConfig"),"📂",102,Color3.fromRGB(255,165,0),function()
    if readfile and isfile and isfile("syphixman_config.json")then
        local data=game:GetService("HttpService"):JSONDecode(readfile("syphixman_config.json"))
        for k,v in pairs(data)do S[k]=v end
        Notify(t("ConfigLoaded"))
    end
end)
mkButton(SettingsSF,t("Reset"),"🔄",144,Color3.fromRGB(255,100,100),function()
    for k,v in pairs(S)do
        if type(v)=="boolean"then S[k]=false
        elseif type(v)=="number"then S[k]=0 end
    end
    Notify(t("ResetDone"))
end)

SettingsSF.CanvasSize=UDim2.new(0,0,0,200)

-- ============ INIT ============
TabFrames.Combat.Visible=true
Tabs.Combat.BackgroundColor3=Color3.fromRGB(255,165,0)
Tabs.Combat.TextColor3=Color3.fromRGB(255,255,255)

-- ============ LOGIC ============
local EspHighlights={}

local function getRole(role)
    for _,p in pairs(P:GetPlayers())do
        if p~=L and p.Character then
            local rv=p.Character:FindFirstChild("Role")or p:FindFirstChild("Role")
            if rv and rv.Value==role then return p end
        end
    end
    return nil
end

local function flingRole(role)
    local target=getRole(role)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")then
        local h=target.Character.HumanoidRootPart
        h.Velocity=Vector3.new(math.random(-15000,15000),math.random(8000,20000),math.random(-15000,15000))
        h.RotVelocity=Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100))
    end
end

local function shootMurderer()
    local target=getRole("Murderer")
    if target and target.Character and target.Character:FindFirstChild("Humanoid")then
        target.Character.Humanoid.Health=0
    end
end

local function takeGun()
    local sh=getRole("Sheriff")
    if sh and sh.Character then
        local gun=sh.Character:FindFirstChild("Gun")or sh.Character:FindFirstChild("Pistol")
        if gun then gun.Parent=L.Character end
    end
end

-- Keybinds
U.InputBegan:Connect(function(input,gameProcessed)
    if gameProcessed then return end
    if input.KeyCode==Enum.KeyCode.LeftControl then
        S.Aim=not S.Aim
        Notify("🔫 "..t("Aimbot")..": "..(S.Aim and t("ON")or t("OFF")))
    elseif input.KeyCode==Enum.KeyCode.F then
        S.Fl=not S.Fl
        Notify("💥 "..t("Fling")..": "..(S.Fl and t("ON")or t("OFF")))
    elseif input.KeyCode==Enum.KeyCode.G then
        S.Fly=not S.Fly
        Notify("🕊 "..t("Fly")..": "..(S.Fly and t("ON")or t("OFF")))
    elseif input.KeyCode==Enum.KeyCode.N then
        S.NC=not S.NC
        Notify("👻 "..t("Noclip")..": "..(S.NC and t("ON")or t("OFF")))
    elseif input.KeyCode==Enum.KeyCode.E then
        S.ESP=not S.ESP
        Notify("👁 ESP: "..(S.ESP and t("ON")or t("OFF")))
    end
end)

R.RenderStepped:Connect(function()
    -- ESP with role colors
    if S.ESP or S.InnESP or S.MurESP or S.ShESP then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                local role="Innocent"
                local rv=p.Character:FindFirstChild("Role")or p:FindFirstChild("Role")
                if rv then role=rv.Value end
                
                local shouldShow=false
                local color=Color3.fromRGB(255,50,50)
                
                if S.ESP then
                    shouldShow=true
                    color=S.ESPColor
                end
                
                if role=="Innocent"and S.InnESP then
                    shouldShow=true
                    color=Color3.fromRGB(0,255,0)
                elseif role=="Murderer"and S.MurESP then
                    shouldShow=true
                    color=Color3.fromRGB(255,0,0)
                elseif role=="Sheriff"and S.ShESP then
                    shouldShow=true
                    color=Color3.fromRGB(0,100,255)
                end
                
                if shouldShow then
                    if not EspHighlights[p]or not EspHighlights[p].Parent then
                        local h=Instance.new("Highlight")
                        h.FillColor=color
                        h.OutlineColor=Color3.fromRGB(255,255,255)
                        h.FillTransparency=.6
                        h.Parent=p.Character
                        EspHighlights[p]=h
                    else
                        EspHighlights[p].FillColor=color
                    end
                elseif EspHighlights[p]and EspHighlights[p].Parent then
                    EspHighlights[p]:Destroy()
                    EspHighlights[p]=nil
                end
            end
        end
    else
        for p,h in pairs(EspHighlights)do
            if h and h.Parent then h:Destroy()end
            EspHighlights[p]=nil
        end
    end
    
    -- Aimbot
    if S.Aim and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        local closest=nil
        local minDist=math.huge
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                local dist=(L.Character.HumanoidRootPart.Position-p.Character.Head.Position).Magnitude
                if dist<minDist and dist<=S.AimRadius then
                    minDist=dist
                    closest=p
                end
            end
        end
        if closest and closest.Character and closest.Character:FindFirstChild("Head")then
            C.CFrame=CFrame.new(C.CFrame.Position,closest.Character.Head.Position)
        end
    end
    
    -- Fly (WASD control)
    if S.Fly and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        local h=L.Character.HumanoidRootPart
        local dir=Vector3.new(0,0,0)
        if U:IsKeyDown(Enum.KeyCode.W)then dir+=C.CFrame.LookVector end
        if U:IsKeyDown(Enum.KeyCode.S)then dir-=C.CFrame.LookVector end
        if U:IsKeyDown(Enum.KeyCode.A)then dir-=C.CFrame.RightVector end
        if U:IsKeyDown(Enum.KeyCode.D)then dir+=C.CFrame.RightVector end
        if U:IsKeyDown(Enum.KeyCode.Space)then dir+=Vector3.new(0,1,0)end
        if U:IsKeyDown(Enum.KeyCode.LeftShift)then dir-=Vector3.new(0,1,0)end
        h.Velocity=dir*S.FlySpeed
    end
    
    -- Noclip
    if S.NC and L.Character then
        for _,v in pairs(L.Character:GetDescendants())do
            if v:IsA("BasePart")then v.CanCollide=false end
        end
    end
    
    -- Fling
    if S.Fl then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                local h=p.Character.HumanoidRootPart
                h.Velocity=Vector3.new(math.random(-S.FlPower*1000,S.FlPower*1000),math.random(S.FlPower*500,S.FlPower*1500),math.random(-S.FlPower*1000,S.FlPower*1000))
                h.RotVelocity=Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100))
            end
        end
    end
    
    -- Speed Hack
    if S.SP and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid.WalkSpeed=16*S.SPMul
    end
    
    -- God Mode
    if S.GM and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid.MaxHealth=math.huge
        L.Character.Humanoid.Health=math.huge
    end
    
    -- Kill Aura
    if S.KA and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("Humanoid")and p.Character:FindFirstChild("HumanoidRootPart")then
                if (L.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<=S.KARadius then
                    p.Character.Humanoid.Health-=S.KADamage
                end
            end
        end
    end
    
    -- Reach
    if S.Reach and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                if (L.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<=S.ReachDist then
                    p.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)
                end
            end
        end
    end
    
    -- Infinite Jump
    if S.InfJump and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
    
    -- No Fall
    if S.NoFall and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid.FallingDown=false
    end
    
    -- Anti AFK
    if S.AntiAFK then
        VU:Button2Down(Vector2.new(0,0),C.CFrame)
        task.wait(.1)
        VU:Button2Up(Vector2.new(0,0),C.CFrame)
    end
    
    -- XRay
    if S.XRay then
        for _,v in pairs(workspace:GetDescendants())do
            if v:IsA("BasePart")then
                v.LocalTransparencyModifier=.5
            end
        end
    end
    
    -- Fullbright
    if S.FB then
        Lighting.Brightness=2
        Lighting.ClockTime=12
    end
    
    -- AutoFarm
    if S.AutoFarm and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        L.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame+Vector3.new(0,0,S.FarmSpeed)
    end
end)

Notify("🌅 Syphixman v13 "..t("Loaded"))
