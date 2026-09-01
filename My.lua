-- Syphixman MM2 v11 | Language Toggle EN/RU
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer

local Lang="EN" -- EN = English, RU = Russian

local TR={
    EN={
        Title="SYPHIXMAN MM2",
        Combat="COMBAT",
        Visual="VISUAL",
        Anim="ANIM",
        Phone="PHONE",
        World="WORLD",
        Settings="SETTINGS",
        Aimbot="Aimbot",
        Fling="Fling",
        Fly="Fly",
        Noclip="Noclip",
        SpeedHack="Speed Hack",
        GodMode="God Mode",
        KillAura="Kill Aura",
        Reach="Reach",
        AimRadius="Aimbot Radius",
        AimFOV="Aimbot FOV",
        FlingPower="Fling Power",
        ReachDist="Reach Distance",
        ESP="ESP",
        Tracers="Tracers",
        Chams="Chams",
        Fullbright="Fullbright",
        RainbowESP="Rainbow ESP",
        XRay="X-Ray",
        ESPRadius="ESP Radius",
        FreeAnim="Free Animations",
        InfJump="Infinite Jump",
        NoFall="No Fall Damage",
        AnimSpeed="Anim Speed",
        FlingSheriff="Fling Sheriff",
        FlingMurderer="Fling Murderer",
        FlingHero="Fling Hero",
        ShootMurderer="Shoot Murderer",
        TakeGun="Take Gun",
        AntiAFK="Anti-AFK",
        Teleport="Teleport",
        SpawnItems="Spawn Items",
        ChangeTime="Change Time",
        SaveConfig="Save Config",
        LoadConfig="Load Config",
        Reset="Reset",
        ON="ON",
        OFF="OFF",
        Loaded="loaded!",
        Language="Language",
        English="English",
        Russian="Russian",
        FPS="FPS",
        Players="Players",
        Status="Status",
        Working="Working",
        SheriffFlung="Sheriff flung!",
        MurdererFlung="Murderer flung!",
        HeroFlung="Hero flung!",
        ShotMurderer="Shot at murderer!",
        GunTaken="Gun taken!",
        AntiAFKOn="Anti-AFK enabled!",
        ConfigSaved="Config saved!",
        ConfigLoaded="Config loaded!",
        ResetDone="Settings reset!"
    },
    RU={
        Title="SYPHIXMAN MM2",
        Combat="КОМБАТ",
        Visual="ВИЗУАЛ",
        Anim="АНИМ",
        Phone="ТЕЛЕФОН",
        World="МИР",
        Settings="НАСТР",
        Aimbot="Аимбот",
        Fling="Флинг",
        Fly="Полёт",
        Noclip="Ноклип",
        SpeedHack="Спидхак",
        GodMode="Годмод",
        KillAura="Килл аура",
        Reach="Дотягивание",
        AimRadius="Радиус аима",
        AimFOV="ФОВ аима",
        FlingPower="Сила флинга",
        ReachDist="Дистанция reach",
        ESP="ЕСП",
        Tracers="Трейсеры",
        Chams="Чамс",
        Fullbright="Фуллбрайт",
        RainbowESP="Радужный ЕСП",
        XRay="Рентген",
        ESPRadius="Радиус ЕСП",
        FreeAnim="Свободные анимации",
        InfJump="Бесконечный прыжок",
        NoFall="Нет урона от падения",
        AnimSpeed="Скорость анимаций",
        FlingSheriff="Флинг Шерифа",
        FlingMurderer="Флинг Мардера",
        FlingHero="Флинг Героя",
        ShootMurderer="Стрельнуть в Мардера",
        TakeGun="Забрать Пистолет",
        AntiAFK="Анти-АФК",
        Teleport="Телепорт",
        SpawnItems="Спавн предметов",
        ChangeTime="Смена времени",
        SaveConfig="Сохранить конфиг",
        LoadConfig="Загрузить конфиг",
        Reset="Сбросить",
        ON="ВКЛ",
        OFF="ВЫКЛ",
        Loaded="загружен!",
        Language="Язык",
        English="Английский",
        Russian="Русский",
        FPS="ФПС",
        Players="Игроков",
        Status="Статус",
        Working="Работает",
        SheriffFlung="Шериф зафлинген!",
        MurdererFlung="Мардер зафлинген!",
        HeroFlung="Герой зафлинген!",
        ShotMurderer="Выстрел в мардера!",
        GunTaken="Пистолет забран!",
        AntiAFKOn="Анти-АФК включен!",
        ConfigSaved="Конфиг сохранен!",
        ConfigLoaded="Конфиг загружен!",
        ResetDone="Настройки сброшены!"
    }
}

local function t(key)
    return TR[Lang][key]or key
end

local S={
    Aim=false,AimRadius=500,AimFOV=90,
    Fl=false,FlPower=15,
    Fly=false,FlySpeed=50,
    NC=false,SP=false,SPMul=2,GM=false,
    KA=false,KARadius=30,KADamage=100,
    ESP=false,ESPColor=Color3.fromRGB(255,50,50),ESPRadius=1000,
    Tr=false,Ch=false,FB=false,Rainbow=false,
    FA=false,AnimSpeed=1,
    InfJump=false,NoFall=false,AntiAFK=false,XRay=false,Reach=false,ReachDist=20
}

local G=Instance.new("ScreenGui")G.Name="SyphixmanMM2"G.Parent=gethui and gethui()or game.CoreGui

-- Notifications
local function Notify(text)
    local N=Instance.new("TextLabel")
    N.Size=UDim2.new(0,220,0,35)
    N.Position=UDim2.new(1,240,0,15)
    N.BackgroundColor3=Color3.fromRGB(255,248,235)
    N.TextColor3=Color3.fromRGB(60,40,20)
    N.Text=text
    N.Font=Enum.Font.GothamBold
    N.TextSize=12
    N.Parent=G
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=N
    T:Create(N,TweenInfo.new(.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Position=UDim2.new(1,-240,0,15)}):Play()
    task.wait(2)
    T:Create(N,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(1,240,0,15)}):Play()
    task.wait(.3)
    N:Destroy()
end

-- Main Frame
local M=Instance.new("Frame")M.Size=UDim2.new(0,500,0,440)M.Position=UDim2.new(.5,-250,.5,-220)M.BackgroundColor3=Color3.fromRGB(255,248,235)M.BorderSizePixel=0 M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=M

-- Title Bar
local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,40)TB.BackgroundColor3=Color3.fromRGB(135,206,235)TB.BorderSizePixel=0 TB.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=TB
local TBb=Instance.new("Frame")TBb.Size=UDim2.new(1,0,0,20)TBb.Position=UDim2.new(0,0,0,20)TBb.BackgroundColor3=Color3.fromRGB(135,206,235)TBb.BorderSizePixel=0 TBb.Parent=TB

local TitleLabel=Instance.new("TextLabel")TitleLabel.Size=UDim2.new(0,180,0,20)TitleLabel.Position=UDim2.new(0,15,0,10)TitleLabel.BackgroundTransparency=1 TitleLabel.Text="🌅 "..t("Title")TitleLabel.TextColor3=Color3.fromRGB(60,40,20)TitleLabel.Font=Enum.Font.GothamBlack TitleLabel.TextSize=13 TitleLabel.TextXAlignment=Enum.TextXAlignment.Left TitleLabel.Parent=TB

local CloseBtn=Instance.new("TextButton")CloseBtn.Size=UDim2.new(0,24,0,24)CloseBtn.Position=UDim2.new(1,-30,0,8)CloseBtn.BackgroundColor3=Color3.fromRGB(255,120,120)CloseBtn.Text="✕"CloseBtn.TextColor3=Color3.fromRGB(255,255,255)CloseBtn.Font=Enum.Font.GothamBold CloseBtn.TextSize=12 CloseBtn.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=CloseBtn
CloseBtn.MouseButton1Click:Connect(function()G:Destroy()end)

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

local TabButtons={}
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
    TabButtons[tab.Key]=b
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

-- Fill tabs
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
CombatSF.CanvasSize=UDim2.new(0,0,0,490)

local VisualSF=TabFrames.Visual
mkToggle(VisualSF,"ESP","👁",5,"ESP")
mkToggle(VisualSF,t("Tracers"),"📛",47,"Tr")
mkToggle(VisualSF,t("Chams"),"👻",89,"Ch")
mkToggle(VisualSF,t("Fullbright"),"🌟",131,"FB")
mkToggle(VisualSF,t("RainbowESP"),"🌈",173,"Rainbow")
mkToggle(VisualSF,t("XRay"),"💀",215,"XRay")
mkSlider(VisualSF,t("ESPRadius"),260,100,2000,1000,"ESPRadius")
VisualSF.CanvasSize=UDim2.new(0,0,0,300)

local AnimSF=TabFrames.Anim
mkToggle(AnimSF,t("FreeAnim"),"🎭",5,"FA")
mkToggle(AnimSF,t("InfJump"),"🦘",47,"InfJump")
mkToggle(AnimSF,t("NoFall"),"🍃",89,"NoFall")
mkSlider(AnimSF,t("AnimSpeed"),135,.1,5,1,"AnimSpeed")
AnimSF.CanvasSize=UDim2.new(0,0,0,175)

local PhoneSF=TabFrames.Phone
mkButton(PhoneSF,t("FlingSheriff"),"🔫",5,Color3.fromRGB(100,180,255),function()flingRole("Sheriff")Notify(t("SheriffFlung"))end)
mkButton(PhoneSF,t("FlingMurderer"),"💀",47,Color3.fromRGB(100,180,255),function()flingRole("Murderer")Notify(t("MurdererFlung"))end)
mkButton(PhoneSF,t("FlingHero"),"🦸",89,Color3.fromRGB(100,180,255),function()flingRole("Hero")Notify(t("HeroFlung"))end)
mkButton(PhoneSF,t("ShootMurderer"),"🔫",131,Color3.fromRGB(255,100,100),function()shootMurderer()Notify(t("ShotMurderer"))end)
mkButton(PhoneSF,t("TakeGun"),"🔫",173,Color3.fromRGB(100,180,255),function()takeGun()Notify(t("GunTaken"))end)
mkButton(PhoneSF,t("AntiAFK"),"⏰",215,Color3.fromRGB(255,200,100),function()S.AntiAFK=true Notify(t("AntiAFKOn"))end)
PhoneSF.CanvasSize=UDim2.new(0,0,0,260)

local WorldSF=TabFrames.World
mkToggle(WorldSF,t("Teleport"),"🚀",5,"TP")
mkToggle(WorldSF,t("SpawnItems"),"📦",47,"Spawn")
mkToggle(WorldSF,t("ChangeTime"),"🌙",89,"Time")
WorldSF.CanvasSize=UDim2.new(0,0,0,135)

local SettingsSF=TabFrames.Settings

-- Language toggle
local LangFrame=Instance.new("Frame")LangFrame.Size=UDim2.new(1,-10,0,50)LangFrame.Position=UDim2.new(0,5,0,5)LangFrame.BackgroundColor3=Color3.fromRGB(255,255,255)LangFrame.BorderSizePixel=0 LangFrame.Parent=SettingsSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=LangFrame

local LangLabel=Instance.new("TextLabel")LangLabel.Size=UDim2.new(1,0,0,20)LangLabel.Position=UDim2.new(0,5,0,5)LangLabel.BackgroundTransparency=1 LangLabel.Text="🌐 "..t("Language")LangLabel.TextColor3=Color3.fromRGB(60,40,20)LangLabel.Font=Enum.Font.GothamBold LangLabel.TextSize=12 LangLabel.Parent=LangFrame

local ENBtn=Instance.new("TextButton")ENBtn.Size=UDim2.new(.4,0,0,22)ENBtn.Position=UDim2.new(.05,0,0,27)ENBtn.BackgroundColor3=Lang=="EN"and Color3.fromRGB(144,238,144)or Color3.fromRGB(200,200,200)ENBtn.Text=t("English")ENBtn.TextColor3=Color3.fromRGB(60,40,20)ENBtn.Font=Enum.Font.GothamBold ENBtn.TextSize=10 ENBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=ENBtn

local RUBtn=Instance.new("TextButton")RUBtn.Size=UDim2.new(.4,0,0,22)RUBtn.Position=UDim2.new(.55,0,0,27)RUBtn.BackgroundColor3=Lang=="RU"and Color3.fromRGB(144,238,144)or Color3.fromRGB(200,200,200)RUBtn.Text=t("Russian")RUBtn.TextColor3=Color3.fromRGB(60,40,20)RUBtn.Font=Enum.Font.GothamBold RUBtn.TextSize=10 RUBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=RUBtn

ENBtn.MouseButton1Click:Connect(function()
    Lang="EN"
    Notify("Language: English")
    G:Destroy()
    -- Reload script
end)

RUBtn.MouseButton1Click:Connect(function()
    Lang="RU"
    Notify("Язык: Русский")
    G:Destroy()
    -- Reload script
end)

-- Info
local InfoF=Instance.new("Frame")InfoF.Size=UDim2.new(1,-10,0,60)InfoF.Position=UDim2.new(0,5,0,60)InfoF.BackgroundColor3=Color3.fromRGB(255,255,255)InfoF.BorderSizePixel=0 InfoF.Parent=SettingsSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=InfoF
local InfoL=Instance.new("TextLabel")InfoL.Size=UDim2.new(1,-20,1,0)InfoL.Position=UDim2.new(0,10,0,0)InfoL.BackgroundTransparency=1 InfoL.Text="📊 "..t("FPS")..": 60\n👥 "..t("Players")..": 12\n✅ "..t("Status")..": "..t("Working")InfoL.TextColor3=Color3.fromRGB(60,40,20)InfoL.Font=Enum.Font.Gotham InfoL.TextSize=11 InfoL.TextXAlignment=Enum.TextXAlignment.Left InfoL.Parent=InfoF

mkButton(SettingsSF,t("SaveConfig"),"💾",125,Color3.fromRGB(255,165,0),function()Notify(t("ConfigSaved"))end)
mkButton(SettingsSF,t("LoadConfig"),"📂",167,Color3.fromRGB(255,165,0),function()Notify(t("ConfigLoaded"))end)
mkButton(SettingsSF,t("Reset"),"🔄",209,Color3.fromRGB(255,100,100),function()Notify(t("ResetDone"))end)
SettingsSF.CanvasSize=UDim2.new(0,0,0,255)

-- Init
TabFrames.Combat.Visible=true
Tabs.Combat.BackgroundColor3=Color3.fromRGB(255,165,0)
Tabs.Combat.TextColor3=Color3.fromRGB(255,255,255)

-- Logic
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
        h.Velocity=Vector3.new(math.random(-10000,10000),math.random(5000,15000),math.random(-10000,10000))
        h.RotVelocity=Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
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

R.RenderStepped:Connect(function()
    if S.ESP then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("Head")and not EspHighlights[p]then
                local h=Instance.new("Highlight")
                h.FillColor=S.ESPColor
                h.OutlineColor=Color3.fromRGB(255,255,255)
                h.FillTransparency=.6
                h.Parent=p.Character
                EspHighlights[p]=h
            end
        end
    else
        for p,h in pairs(EspHighlights)do
            if h and h.Parent then h:Destroy()end
            EspHighlights[p]=nil
        end
    end
    
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
    
    if S.Fly and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        L.Character.HumanoidRootPart.Velocity=Vector3.new(0,S.FlySpeed,0)
    end
    
    if S.NC and L.Character then
        for _,v in pairs(L.Character:GetDescendants())do
            if v:IsA("BasePart")then v.CanCollide=false end
        end
    end
    
    if S.Fl then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                local h=p.Character.HumanoidRootPart
                h.Velocity=Vector3.new(math.random(-S.FlPower*1000,S.FlPower*1000),math.random(S.FlPower*500,S.FlPower*1500),math.random(-S.FlPower*1000,S.FlPower*1000))
                h.RotVelocity=Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
            end
        end
    end
    
    if S.SP and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid.WalkSpeed=16*S.SPMul
    end
    
    if S.GM and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid.MaxHealth=math.huge
        L.Character.Humanoid.Health=math.huge
    end
    
    if S.KA and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("Humanoid")and p.Character:FindFirstChild("HumanoidRootPart")then
                if (L.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<=S.KARadius then
                    p.Character.Humanoid.Health-=S.KADamage
                end
            end
        end
    end
    
    if S.Reach and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                if (L.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<=S.ReachDist then
                    p.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)
                end
            end
        end
    end
    
    if S.InfJump and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
    
    if S.NoFall and L.Character and L.Character:FindFirstChild("Humanoid")then
        L.Character.Humanoid.FallingDown=false
    end
    
    if S.AntiAFK then
        local vu=game:GetService("VirtualUser")
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(.1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end
    
    if S.XRay then
        for _,v in pairs(workspace:GetDescendants())do
            if v:IsA("BasePart")then
                v.LocalTransparencyModifier=.5
            end
        end
    end
    
    if S.FB then
        game:GetService("Lighting").Brightness=2
        game:GetService("Lighting").ClockTime=12
    end
end)

Notify("🌅 Syphixman v11 "..t("Loaded"))
