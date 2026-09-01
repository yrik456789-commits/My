-- Syphixman MM2 v23 | All Restored + Fixed
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer
local VU=game:GetService("VirtualUser")
local Lighting=game:GetService("Lighting")

local Lang="EN"
local TR={
    EN={Title="SYPHIXMAN MM2",Combat="COMBAT",Visual="VISUAL",Anim="ANIM",Fling="FLING",World="WORLD",Settings="SETTINGS",
        Aimbot="Aimbot",FlingAll="Fling All",Fly="Fly",Noclip="Noclip",SpeedHack="Speed Hack",GodMode="God Mode",KillAura="Kill Aura",Reach="Reach",Spin="Spin",BunnyHop="Bunny Hop",
        AimRadius="Aimbot Radius",FlingPower="Fling Power",ReachDist="Reach Distance",SpeedMul="Speed Multiplier",SpinSpeed="Spin Speed",FarmSpeed="Farm Speed",
        ESP="ESP",Tracers="Tracers",Chams="Chams",Fullbright="Fullbright",XRay="X-Ray",
        InnocentESP="Innocent ESP",MurdererESP="Murderer ESP",SheriffESP="Sheriff ESP",
        FreeAnim="Free Animations",InfJump="Infinite Jump",NoFall="No Fall Damage",
        SelectPlayer="Select Player",FlingButton="FLING",RefreshList="Refresh",
        ShootMurderer="Shoot Murderer",TakeGun="Take Gun",AntiAFK="Anti-AFK",AutoFarm="Auto Farm",
        TeleportLobby="Teleport to Lobby",TeleportMap="Teleport to Map",
        SaveConfig="Save Config",Reset="Reset",Language="Language",
        ON="ON",OFF="OFF",Loaded="loaded!",Flung="flung!",ConfigSaved="Saved!",ResetDone="Reset!",PhoneButtons="Show Phone Buttons"},
    RU={Title="SYPHIXMAN MM2",Combat="КОМБАТ",Visual="ВИЗУАЛ",Anim="АНИМ",Fling="ФЛИНГ",World="МИР",Settings="НАСТР",
        Aimbot="Аимбот",FlingAll="Флинг всех",Fly="Полёт",Noclip="Ноклип",SpeedHack="Спидхак",GodMode="Годмод",KillAura="Килл аура",Reach="Дотягивание",Spin="Вращение",BunnyHop="Баннихоп",
        AimRadius="Радиус аима",FlingPower="Сила флинга",ReachDist="Дистанция reach",SpeedMul="Множитель скорости",SpinSpeed="Скорость вращения",FarmSpeed="Скорость фарма",
        ESP="ЕСП",Tracers="Трейсеры",Chams="Чамс",Fullbright="Фуллбрайт",XRay="Рентген",
        InnocentESP="ЕСП невиновных",MurdererESP="ЕСП мардера",SheriffESP="ЕСП шерифа",
        FreeAnim="Свободные анимации",InfJump="Бесконечный прыжок",NoFall="Нет урона",
        SelectPlayer="Выберите игрока",FlingButton="ФЛИНГ",RefreshList="Обновить",
        ShootMurderer="Стрельнуть",TakeGun="Забрать пистолет",AntiAFK="Анти-АФК",AutoFarm="Авто-фарм",
        TeleportLobby="В лобби",TeleportMap="На карту",
        SaveConfig="Сохранить",Reset="Сброс",Language="Язык",
        ON="ВКЛ",OFF="ВЫКЛ",Loaded="загружен!",Flung="зафлинген!",ConfigSaved="Сохранено!",ResetDone="Сброшено!",PhoneButtons="Показать кнопки"}
}
local function t(key)return TR[Lang][key]or key end

local S={
    Aim=false,AimRadius=500,Fl=false,FlPower=15,Fly=false,FlySpeed=50,NC=false,SP=false,SPMul=2,GM=false,
    KA=false,KARadius=30,KADamage=100,ESP=false,ESPColor=Color3.fromRGB(100,180,255),
    InnESP=false,MurESP=false,ShESP=false,Tr=false,Ch=false,FB=false,
    FA=false,InfJump=false,NoFall=false,AntiAFK=false,XRay=false,Reach=false,ReachDist=20,
    AutoFarm=false,FarmSpeed=1,Spin=false,SpinSpeed=10,BunnyHop=false,ShowPhoneButtons=false,SelectedPlayer=nil
}

local BHopActive=false

local function Notify(text)
    local N=Instance.new("TextLabel")N.Size=UDim2.new(0,240,0,40)N.Position=UDim2.new(1,260,0,15)
    N.BackgroundColor3=Color3.fromRGB(15,15,30)N.TextColor3=Color3.fromRGB(100,180,255)N.Text=text
    N.Font=Enum.Font.GothamBold N.TextSize=13 N.BackgroundTransparency=1 N.TextTransparency=1
    N.Parent=gethui and gethui()or game.CoreGui
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=N
    T:Create(N,TweenInfo.new(.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(1,-260,0,15),BackgroundTransparency=0,TextTransparency=0}):Play()
    task.wait(2)
    T:Create(N,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Position=UDim2.new(1,260,0,15),BackgroundTransparency=1,TextTransparency=1}):Play()
    task.wait(.5)N:Destroy()
end

-- ============ INTRO ============
local IntroGui=Instance.new("ScreenGui")IntroGui.Name="Intro"IntroGui.Parent=gethui and gethui()or game.CoreGui
local IntroBG=Instance.new("Frame")IntroBG.Size=UDim2.new(1,0,1,0)IntroBG.BackgroundColor3=Color3.fromRGB(5,5,15)IntroBG.BackgroundTransparency=1 IntroBG.Parent=IntroGui

local Stars={}
for i=1,50 do
    local s=Instance.new("Frame")s.Size=UDim2.new(0,math.random(2,5),0,math.random(2,5))s.Position=UDim2.new(math.random(),0,math.random(),0)
    s.BackgroundColor3=Color3.fromRGB(100,180,255)s.BackgroundTransparency=0.5 s.BorderSizePixel=0 s.Parent=IntroGui
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=s
    Stars[#Stars+1]=s
end

local LogoIcon=Instance.new("TextLabel")LogoIcon.Size=UDim2.new(0,100,0,100)LogoIcon.Position=UDim2.new(.5,-50,.5,-160)
LogoIcon.BackgroundTransparency=1 LogoIcon.Text="🔷"LogoIcon.TextSize=70 LogoIcon.TextTransparency=1 LogoIcon.Parent=IntroGui

local TitleText=Instance.new("TextLabel")TitleText.Size=UDim2.new(0,500,0,60)TitleText.Position=UDim2.new(.5,-250,.5,-40)
TitleText.BackgroundTransparency=1 TitleText.Text="SYPHIXMAN"TitleText.TextColor3=Color3.fromRGB(100,180,255)
TitleText.Font=Enum.Font.GothamBlack TitleText.TextSize=48 TitleText.TextTransparency=1 TitleText.Parent=IntroGui

local Line=Instance.new("Frame")Line.Size=UDim2.new(0,0,0,3)Line.Position=UDim2.new(.5,0,.5,50)
Line.BackgroundColor3=Color3.fromRGB(80,140,255)Line.BorderSizePixel=0 Line.Parent=IntroGui
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=Line

local BetaText=Instance.new("TextLabel")BetaText.Size=UDim2.new(0,300,0,40)BetaText.Position=UDim2.new(.5,-150,.5,65)
BetaText.BackgroundTransparency=1 BetaText.Text="BETA VERSION"BetaText.TextColor3=Color3.fromRGB(80,140,255)
BetaText.Font=Enum.Font.GothamBold BetaText.TextSize=22 BetaText.TextTransparency=1 BetaText.Parent=IntroGui

local VerText=Instance.new("TextLabel")VerText.Size=UDim2.new(0,300,0,30)VerText.Position=UDim2.new(.5,-150,.5,115)
VerText.BackgroundTransparency=1 VerText.Text="v23.0 | by Ryzen"VerText.TextColor3=Color3.fromRGB(100,100,150)
VerText.Font=Enum.Font.Gotham VerText.TextSize=16 VerText.TextTransparency=1 VerText.Parent=IntroGui

local ProgF=Instance.new("Frame")ProgF.Size=UDim2.new(0,300,0,6)ProgF.Position=UDim2.new(.5,-150,.5,160)
ProgF.BackgroundColor3=Color3.fromRGB(20,20,40)ProgF.BorderSizePixel=0 ProgF.BackgroundTransparency=1 ProgF.Parent=IntroGui
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgF

local ProgFill=Instance.new("Frame")ProgFill.Size=UDim2.new(0,0,1,0)ProgFill.BackgroundColor3=Color3.fromRGB(80,140,255)ProgFill.BorderSizePixel=0 ProgFill.Parent=ProgF
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgFill

-- ============ MAIN GUI ============
local G=Instance.new("ScreenGui")G.Name="Syphix"G.Parent=gethui and gethui()or game.CoreGui
G.Enabled=false

local M=Instance.new("Frame")M.Size=UDim2.new(0,520,0,460)M.Position=UDim2.new(.5,-260,.5,-230)
M.BackgroundColor3=Color3.fromRGB(15,15,30)M.BorderSizePixel=0 M.BackgroundTransparency=1 M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=M

local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,45)TB.BackgroundColor3=Color3.fromRGB(20,20,40)TB.BorderSizePixel=0 TB.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=TB
local TBb=Instance.new("Frame")TBb.Size=UDim2.new(1,0,0,22)TBb.Position=UDim2.new(0,0,0,23)TBb.BackgroundColor3=Color3.fromRGB(20,20,40)TBb.BorderSizePixel=0 TBb.Parent=TB

local LogoDot=Instance.new("Frame")LogoDot.Size=UDim2.new(0,14,0,14)LogoDot.Position=UDim2.new(0,16,0,15)
LogoDot.BackgroundColor3=Color3.fromRGB(80,140,255)LogoDot.BorderSizePixel=0 LogoDot.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=LogoDot

local TitleLabel=Instance.new("TextLabel")TitleLabel.Size=UDim2.new(0,180,0,25)TitleLabel.Position=UDim2.new(0,36,0,10)
TitleLabel.BackgroundTransparency=1 TitleLabel.Text="🔷 "..t("Title")TitleLabel.TextColor3=Color3.fromRGB(200,220,255)
TitleLabel.Font=Enum.Font.GothamBlack TitleLabel.TextSize=14 TitleLabel.TextXAlignment=Enum.TextXAlignment.Left TitleLabel.Parent=TB

local CB=Instance.new("TextButton")CB.Size=UDim2.new(0,28,0,28)CB.Position=UDim2.new(1,-34,0,8)
CB.BackgroundColor3=Color3.fromRGB(255,80,80)CB.Text="✕"CB.TextColor3=Color3.fromRGB(255,255,255)
CB.Font=Enum.Font.GothamBold CB.TextSize=13 CB.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=CB
CB.MouseEnter:Connect(function()T:Create(CB,TweenInfo.new(.3),{Size=UDim2.new(0,32,0,32),BackgroundColor3=Color3.fromRGB(255,120,120)}):Play()end)
CB.MouseLeave:Connect(function()T:Create(CB,TweenInfo.new(.3),{Size=UDim2.new(0,28,0,28),BackgroundColor3=Color3.fromRGB(255,80,80)}):Play()end)
CB.MouseButton1Click:Connect(function()
    T:Create(M,TweenInfo.new(.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),Position=UDim2.new(.5,0,.5,0)}):Play()
    task.wait(.4)G:Destroy()
end)

local dragging=false local dragStart=nil local startPos=nil
TB.InputBegan:Connect(function(input)if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true dragStart=input.Position startPos=M.Position end end)
U.InputEnded:Connect(function(input)if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
U.InputChanged:Connect(function(input)if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then local d=input.Position-dragStart M.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)end end)

local LP=Instance.new("Frame")LP.Size=UDim2.new(0,110,1,-45)LP.Position=UDim2.new(0,0,0,45)LP.BackgroundColor3=Color3.fromRGB(20,20,40)LP.BorderSizePixel=0 LP.Parent=M
local CA=Instance.new("Frame")CA.Size=UDim2.new(1,-120,1,-60)CA.Position=UDim2.new(0,115,0,60)CA.BackgroundTransparency=1 CA.Parent=M

local TabFrames={}local Tabs={}
local TabData={{"Combat","⚔","Combat"},{"Visual","👁","Visual"},{"Anim","🎭","Anim"},{"Fling","💥","Fling"},{"World","🌍","World"},{"Settings","⚙","Settings"}}

for _,tab in pairs(TabData)do
    local SF=Instance.new("ScrollingFrame")SF.Size=UDim2.new(1,0,1,0)SF.BackgroundTransparency=1 SF.BorderSizePixel=0
    SF.ScrollBarThickness=3 SF.ScrollBarImageColor3=Color3.fromRGB(80,140,255)SF.Visible=false SF.Parent=CA
    TabFrames[tab[1]]=SF
end

local function SwitchTab(name)
    for n,b in pairs(Tabs)do
        T:Create(b,TweenInfo.new(.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
            BackgroundColor3=n==name and Color3.fromRGB(60,100,200)or Color3.fromRGB(25,25,45),
            TextColor3=n==name and Color3.fromRGB(255,255,255)or Color3.fromRGB(120,140,180)
        }):Play()
    end
    for n,f in pairs(TabFrames)do
        if n==name then
            f.Visible=true f.Position=UDim2.new(0,30,0,0)
            T:Create(f,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(0,0,0,0)}):Play()
        else
            T:Create(f,TweenInfo.new(.3,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Position=UDim2.new(0,-30,0,0)}):Play()
            task.delay(.3,function()if n~=name then f.Visible=false end end)
        end
    end
end

for i,tab in pairs(TabData)do
    local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,52)b.Position=UDim2.new(0,5,0,5+(i-1)*57)
    b.BackgroundColor3=Color3.fromRGB(25,25,45)b.Text=tab[2].." "..t(tab[3])b.TextColor3=Color3.fromRGB(120,140,180)
    b.Font=Enum.Font.GothamBold b.TextSize=10 b.Parent=LP
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
    b.MouseEnter:Connect(function()
        if Tabs[tab[1]].BackgroundColor3~=Color3.fromRGB(60,100,200)then T:Create(b,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(35,35,60)}):Play()end
    end)
    b.MouseLeave:Connect(function()
        if Tabs[tab[1]].BackgroundColor3~=Color3.fromRGB(60,100,200)then T:Create(b,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(25,25,45)}):Play()end
    end)
    b.MouseButton1Click:Connect(function()
        T:Create(b,TweenInfo.new(.15),{Size=UDim2.new(1,-10,0,47)}):Play()
        task.wait(.1)
        T:Create(b,TweenInfo.new(.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(1,-10,0,52)}):Play()
        SwitchTab(tab[1])
    end)
    Tabs[tab[1]]=b
end

local function mkToggle(parent,name,icon,y,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,42)f.Position=UDim2.new(0,5,0,y)
    f.BackgroundColor3=Color3.fromRGB(25,25,45)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=f
    f.MouseEnter:Connect(function()T:Create(f,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(30,30,55)}):Play()end)
    f.MouseLeave:Connect(function()T:Create(f,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(25,25,45)}):Play()end)
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.55,0,1,0)l.Position=UDim2.new(0,12,0,0)
    l.BackgroundTransparency=1 l.Text=icon.." "..name l.TextColor3=Color3.fromRGB(200,220,255)
    l.Font=Enum.Font.Gotham l.TextSize=13 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
    local btn=Instance.new("TextButton")btn.Size=UDim2.new(0,60,0,26)btn.Position=UDim2.new(1,-68,0,8)
    btn.BackgroundColor3=Color3.fromRGB(40,40,70)btn.Text=t("OFF")btn.TextColor3=Color3.fromRGB(150,170,200)
    btn.Font=Enum.Font.GothamBold btn.TextSize=11 btn.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(0,13)Instance.new("UICorner").Parent=btn
    btn.MouseButton1Click:Connect(function()
        S[set]=not S[set]
        T:Create(btn,TweenInfo.new(.15),{Size=UDim2.new(0,54,0,22)}):Play()
        task.wait(.1)
        T:Create(btn,TweenInfo.new(.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
            Size=UDim2.new(0,60,0,26),
            BackgroundColor3=S[set]and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70),
            TextColor3=S[set]and Color3.fromRGB(255,255,255)or Color3.fromRGB(150,170,200)
        }):Play()
        btn.Text=S[set]and t("ON")or t("OFF")
        if set=="BunnyHop"and not S[set]then BHopActive=false if L.Character and L.Character:FindFirstChild("Humanoid")then L.Character.Humanoid.WalkSpeed=16 end end
    end)
end

local function mkSlider(parent,name,y,min,max,def,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,35)f.Position=UDim2.new(0,5,0,y)
    f.BackgroundColor3=Color3.fromRGB(25,25,45)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=f
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.4,0,1,0)l.Position=UDim2.new(0,8,0,0)
    l.BackgroundTransparency=1 l.Text=name l.TextColor3=Color3.fromRGB(150,170,200)
    l.Font=Enum.Font.Gotham l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
    local vl=Instance.new("TextLabel")vl.Size=UDim2.new(0,45,1,0)vl.Position=UDim2.new(1,-48,0,0)
    vl.BackgroundTransparency=1 vl.Text=tostring(def)vl.TextColor3=Color3.fromRGB(100,180,255)
    vl.Font=Enum.Font.GothamBold vl.TextSize=11 vl.Parent=f
    local sb=Instance.new("TextButton")sb.Size=UDim2.new(.35,0,0,8)sb.Position=UDim2.new(.38,0,0,13)
    sb.BackgroundColor3=Color3.fromRGB(40,40,70)sb.Text=""sb.BorderSizePixel=0 sb.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=sb
    local fill=Instance.new("Frame")fill.Size=UDim2.new((def-min)/(max-min),0,1,0)fill.BackgroundColor3=Color3.fromRGB(80,140,255)fill.BorderSizePixel=0 fill.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=fill
    local knob=Instance.new("Frame")knob.Size=UDim2.new(0,14,0,14)knob.Position=UDim2.new((def-min)/(max-min),-7,0,-3)knob.BackgroundColor3=Color3.fromRGB(255,255,255)knob.BorderSizePixel=0 knob.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=knob
    sb.MouseButton1Down:Connect(function()
        local con con=R.RenderStepped:Connect(function()
            if U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then
                local rel=math.clamp((U:GetMouseLocation().X-sb.AbsolutePosition.X)/sb.AbsoluteSize.X,0,1)
                local val=math.floor(min+(max-min)*rel)S[set]=val vl.Text=tostring(val)
                T:Create(fill,TweenInfo.new(.1),{Size=UDim2.new(rel,0,1,0)}):Play()
                T:Create(knob,TweenInfo.new(.1),{Position=UDim2.new(rel,-7,0,-3)}):Play()
            else con:Disconnect()end
        end)
    end)
end

local function mkButton(parent,name,icon,y,color,callback)
    local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,42)b.Position=UDim2.new(0,5,0,y)
    b.BackgroundColor3=color or Color3.fromRGB(60,100,200)b.Text=icon.." "..name b.TextColor3=Color3.fromRGB(255,255,255)
    b.Font=Enum.Font.GothamBold b.TextSize=12 b.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
    b.MouseEnter:Connect(function()T:Create(b,TweenInfo.new(.3),{Size=UDim2.new(1,-10,0,47)}):Play()end)
    b.MouseLeave:Connect(function()T:Create(b,TweenInfo.new(.3),{Size=UDim2.new(1,-10,0,42)}):Play()end)
    b.MouseButton1Click:Connect(function()
        T:Create(b,TweenInfo.new(.1),{Size=UDim2.new(1,-10,0,37)}):Play()
        task.wait(.08)
        T:Create(b,TweenInfo.new(.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(1,-10,0,42)}):Play()
        callback()
    end)
end

-- ============ FILL TABS ============
local CombatSF=TabFrames.Combat
mkToggle(CombatSF,t("Aimbot"),"🔫",5,"Aim")
mkToggle(CombatSF,t("FlingAll"),"💥",51,"Fl")
mkToggle(CombatSF,t("Fly"),"🕊",97,"Fly")
mkToggle(CombatSF,t("Noclip"),"👻",143,"NC")
mkToggle(CombatSF,t("SpeedHack"),"⚡",189,"SP")
mkToggle(CombatSF,t("GodMode"),"🛡",235,"GM")
mkToggle(CombatSF,t("KillAura"),"⚔",281,"KA")
mkToggle(CombatSF,t("Reach"),"📏",327,"Reach")
mkToggle(CombatSF,t("Spin"),"🌀",373,"Spin")
mkToggle(CombatSF,t("BunnyHop"),"🦘",419,"BunnyHop")
mkSlider(CombatSF,t("AimRadius"),470,100,2000,500,"AimRadius")
mkSlider(CombatSF,t("FlingPower"),509,1,50,15,"FlPower")
mkSlider(CombatSF,t("ReachDist"),548,5,50,20,"ReachDist")
mkSlider(CombatSF,t("SpeedMul"),587,1,10,2,"SPMul")
mkSlider(CombatSF,t("SpinSpeed"),626,1,50,10,"SpinSpeed")
CombatSF.CanvasSize=UDim2.new(0,0,0,670)

local VisualSF=TabFrames.Visual
mkToggle(VisualSF,"ESP","👁",5,"ESP")
mkToggle(VisualSF,t("InnocentESP"),"🟢",51,"InnESP")
mkToggle(VisualSF,t("MurdererESP"),"🔴",97,"MurESP")
mkToggle(VisualSF,t("SheriffESP"),"🔵",143,"ShESP")
mkToggle(VisualSF,t("Tracers"),"📛",189,"Tr")
mkToggle(VisualSF,t("Chams"),"👻",235,"Ch")
mkToggle(VisualSF,t("Fullbright"),"🌟",281,"FB")
mkToggle(VisualSF,t("XRay"),"💀",327,"XRay")
VisualSF.CanvasSize=UDim2.new(0,0,0,375)

local AnimSF=TabFrames.Anim
mkToggle(AnimSF,t("FreeAnim"),"🎭",5,"FA")
mkToggle(AnimSF,t("InfJump"),"🦘",51,"InfJump")
mkToggle(AnimSF,t("NoFall"),"🍃",97,"NoFall")
AnimSF.CanvasSize=UDim2.new(0,0,0,145)

-- FLING
local FlingSF=TabFrames.Fling
local SelectLabel=Instance.new("TextLabel")SelectLabel.Size=UDim2.new(1,-10,0,30)SelectLabel.Position=UDim2.new(0,5,0,5)
SelectLabel.BackgroundTransparency=1 SelectLabel.Text="💥 "..t("SelectPlayer")..":"
SelectLabel.TextColor3=Color3.fromRGB(200,220,255)SelectLabel.Font=Enum.Font.GothamBold SelectLabel.TextSize=14
SelectLabel.TextXAlignment=Enum.TextXAlignment.Left SelectLabel.Parent=FlingSF

local PlayerList=Instance.new("ScrollingFrame")PlayerList.Size=UDim2.new(1,-10,0,250)PlayerList.Position=UDim2.new(0,5,0,40)
PlayerList.BackgroundColor3=Color3.fromRGB(25,25,45)PlayerList.BorderSizePixel=0 PlayerList.ScrollBarThickness=3 PlayerList.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=PlayerList

local SelectedLabel=Instance.new("TextLabel")SelectedLabel.Size=UDim2.new(1,-10,0,35)SelectedLabel.Position=UDim2.new(0,5,0,295)
SelectedLabel.BackgroundColor3=Color3.fromRGB(25,25,45)SelectedLabel.Text="👤 "..t("SelectPlayer")..": "..t("OFF")
SelectedLabel.TextColor3=Color3.fromRGB(100,180,255)SelectedLabel.Font=Enum.Font.GothamBold SelectedLabel.TextSize=13 SelectedLabel.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=SelectedLabel

local function RefreshPlayerList()
    for _,c in pairs(PlayerList:GetChildren())do if c:IsA("TextButton")then c:Destroy()end end
    local y=0
    for _,p in pairs(P:GetPlayers())do
        if p~=L then
            local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,35)b.Position=UDim2.new(0,5,0,y)
            b.BackgroundColor3=S.SelectedPlayer==p and Color3.fromRGB(60,100,200)or Color3.fromRGB(35,35,60)
            b.Text=p.Name b.TextColor3=S.SelectedPlayer==p and Color3.fromRGB(255,255,255)or Color3.fromRGB(200,220,255)
            b.Font=Enum.Font.GothamBold b.TextSize=12 b.Parent=PlayerList
            Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=b
            b.MouseEnter:Connect(function()if S.SelectedPlayer~=p then T:Create(b,TweenInfo.new(.2),{BackgroundColor3=Color3.fromRGB(45,45,75)}):Play()end end)
            b.MouseLeave:Connect(function()if S.SelectedPlayer~=p then T:Create(b,TweenInfo.new(.2),{BackgroundColor3=Color3.fromRGB(35,35,60)}):Play()end end)
            b.MouseButton1Click:Connect(function()S.SelectedPlayer=p SelectedLabel.Text="👤 "..t("SelectPlayer")..": "..p.Name RefreshPlayerList()end)
            y+=40
        end
    end
    PlayerList.CanvasSize=UDim2.new(0,0,0,y)
end
RefreshPlayerList()

local RefreshBtn=Instance.new("TextButton")RefreshBtn.Size=UDim2.new(1,-10,0,30)RefreshBtn.Position=UDim2.new(0,5,0,335)
RefreshBtn.BackgroundColor3=Color3.fromRGB(35,35,60)RefreshBtn.Text="🔄"RefreshBtn.TextColor3=Color3.fromRGB(200,220,255)
RefreshBtn.Font=Enum.Font.GothamBold RefreshBtn.TextSize=14 RefreshBtn.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=RefreshBtn
RefreshBtn.MouseButton1Click:Connect(RefreshPlayerList)

local FlingBtn=Instance.new("TextButton")FlingBtn.Size=UDim2.new(1,-10,0,50)FlingBtn.Position=UDim2.new(0,5,0,370)
FlingBtn.BackgroundColor3=Color3.fromRGB(255,60,60)FlingBtn.Text="💥 "..t("FlingButton")
FlingBtn.TextColor3=Color3.fromRGB(255,255,255)FlingBtn.Font=Enum.Font.GothamBlack FlingBtn.TextSize=16 FlingBtn.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=FlingBtn
FlingBtn.MouseEnter:Connect(function()T:Create(FlingBtn,TweenInfo.new(.3),{Size=UDim2.new(1,-10,0,55),BackgroundColor3=Color3.fromRGB(255,80,80)}):Play()end)
FlingBtn.MouseLeave:Connect(function()T:Create(FlingBtn,TweenInfo.new(.3),{Size=UDim2.new(1,-10,0,50),BackgroundColor3=Color3.fromRGB(255,60,60)}):Play()end)
FlingBtn.MouseButton1Click:Connect(function()
    if S.SelectedPlayer and S.SelectedPlayer.Character and S.SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")then
        local hrp=S.SelectedPlayer.Character.HumanoidRootPart
        hrp.Velocity=Vector3.new(math.random(-3000,3000),5000,math.random(-3000,3000))
        hrp.RotVelocity=Vector3.new(math.random(-300,300),math.random(-300,300),math.random(-300,300))
        task.delay(1,function()if S.SelectedPlayer.Character and S.SelectedPlayer.Character:FindFirstChild("HumanoidRootPart")then S.SelectedPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(0,-500,0)end end)
        Notify("💥 "..S.SelectedPlayer.Name.." "..t("Flung"))
    else Notify("👤 "..t("SelectPlayer"))end
end)
FlingSF.CanvasSize=UDim2.new(0,0,0,430)

-- WORLD
local WorldSF=TabFrames.World
mkButton(WorldSF,t("TeleportLobby"),"🏠",5,Color3.fromRGB(60,100,200),function()
    local lobby=workspace:FindFirstChild("Lobby")or workspace:FindFirstChild("Spawn")
    if lobby and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then L.Character.HumanoidRootPart.CFrame=lobby.CFrame+Vector3.new(0,5,0)end
end)
mkButton(WorldSF,t("TeleportMap"),"🗺",52,Color3.fromRGB(60,100,200),function()
    local map=workspace:FindFirstChild("Map")or workspace:FindFirstChild("Arena")
    if map and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then L.Character.HumanoidRootPart.CFrame=map.CFrame+Vector3.new(0,5,0)end
end)
WorldSF.CanvasSize=UDim2.new(0,0,0,100)

-- SETTINGS
local SettingsSF=TabFrames.Settings
local LangFrame=Instance.new("Frame")LangFrame.Size=UDim2.new(1,-10,0,50)LangFrame.Position=UDim2.new(0,5,0,5)
LangFrame.BackgroundColor3=Color3.fromRGB(25,25,45)LangFrame.BorderSizePixel=0 LangFrame.Parent=SettingsSF
Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=LangFrame
local LangLabel=Instance.new("TextLabel")LangLabel.Size=UDim2.new(1,0,0,20)LangLabel.Position=UDim2.new(0,5,0,5)
LangLabel.BackgroundTransparency=1 LangLabel.Text="🌐 "..t("Language")LangLabel.TextColor3=Color3.fromRGB(200,220,255)
LangLabel.Font=Enum.Font.GothamBold LangLabel.TextSize=12 LangLabel.Parent=LangFrame
local ENBtn=Instance.new("TextButton")ENBtn.Size=UDim2.new(.4,0,0,22)ENBtn.Position=UDim2.new(.05,0,0,26)
ENBtn.BackgroundColor3=Color3.fromRGB(50,200,100)ENBtn.Text="EN"ENBtn.TextColor3=Color3.fromRGB(255,255,255)
ENBtn.Font=Enum.Font.GothamBold ENBtn.TextSize=11 ENBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=ENBtn
local RUBtn=Instance.new("TextButton")RUBtn.Size=UDim2.new(.4,0,0,22)RUBtn.Position=UDim2.new(.55,0,0,26)
RUBtn.BackgroundColor3=Color3.fromRGB(40,40,70)RUBtn.Text="RU"RUBtn.TextColor3=Color3.fromRGB(255,255,255)
RUBtn.Font=Enum.Font.GothamBold RUBtn.TextSize=11 RUBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=RUBtn
ENBtn.MouseButton1Click:Connect(function()Lang="EN"T:Create(ENBtn,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(50,200,100)}):Play()T:Create(RUBtn,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(40,40,70)}):Play()TitleLabel.Text="🔷 "..t("Title")end)
RUBtn.MouseButton1Click:Connect(function()Lang="RU"T:Create(RUBtn,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(50,200,100)}):Play()T:Create(ENBtn,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(40,40,70)}):Play()TitleLabel.Text="🔷 "..t("Title")end)

mkToggle(SettingsSF,t("PhoneButtons"),"📱",60,"ShowPhoneButtons")
mkToggle(SettingsSF,t("AutoFarm"),"💰",107,"AutoFarm")
mkSlider(SettingsSF,t("FarmSpeed"),158,1,10,1,"FarmSpeed")
mkButton(SettingsSF,t("SaveConfig"),"💾",198,Color3.fromRGB(200,150,50),function()Notify(t("ConfigSaved"))end)
mkButton(SettingsSF,t("Reset"),"🔄",245,Color3.fromRGB(200,60,60),function()Notify(t("ResetDone"))end)
SettingsSF.CanvasSize=UDim2.new(0,0,0,295)

-- ============ PHONE BUTTONS ============
local PBF=Instance.new("Frame")PBF.Size=UDim2.new(0,50,0,180)PBF.Position=UDim2.new(1,-60,.5,-90)
PBF.BackgroundColor3=Color3.fromRGB(15,15,30)PBF.BorderSizePixel=0 PBF.Visible=false PBF.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=PBF

local function mkPBB(icon,pos,color,cb)
    local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,38)b.Position=UDim2.new(0,5,0,pos)
    b.BackgroundColor3=color b.Text=icon b.TextColor3=Color3.fromRGB(255,255,255)b.Font=Enum.Font.GothamBold b.TextSize=16 b.Parent=PBF
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
    b.MouseEnter:Connect(function()T:Create(b,TweenInfo.new(.2),{Size=UDim2.new(1,-10,0,42)}):Play()end)
    b.MouseLeave:Connect(function()T:Create(b,TweenInfo.new(.2),{Size=UDim2.new(1,-10,0,38)}):Play()end)
    b.MouseButton1Click:Connect(cb)
end

mkPBB("🔫",5,Color3.fromRGB(200,60,60),function()shootMurderer()end)
mkPBB("🔫",47,Color3.fromRGB(60,100,200),function()takeGun()end)
mkPBB("⏰",89,Color3.fromRGB(200,150,50),function()S.AntiAFK=true end)
mkPBB("💰",131,Color3.fromRGB(50,200,100),function()S.AutoFarm=not S.AutoFarm end)

-- ============ INIT ============
TabFrames.Combat.Visible=true
Tabs.Combat.BackgroundColor3=Color3.fromRGB(60,100,200)
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

local function shootMurderer()
    local target=getRole("Murderer")
    if target and target.Character and target.Character:FindFirstChild("Humanoid")then target.Character.Humanoid.Health=0 end
end

local function takeGun()
    local sh=getRole("Sheriff")
    if sh and sh.Character then
        local gun=sh.Character:FindFirstChild("Gun")or sh.Character:FindFirstChild("Pistol")
        if gun then gun.Parent=L.Character end
    end
end

U.InputBegan:Connect(function(input,gameProcessed)
    if gameProcessed then return end
    if input.KeyCode==Enum.KeyCode.LeftControl then S.Aim=not S.Aim Notify("Aimbot: "..(S.Aim and"ON"or"OFF"))
    elseif input.KeyCode==Enum.KeyCode.F then S.Fl=not S.Fl Notify("Fling: "..(S.Fl and"ON"or"OFF"))
    elseif input.KeyCode==Enum.KeyCode.G then S.Fly=not S.Fly Notify("Fly: "..(S.Fly and"ON"or"OFF"))
    elseif input.KeyCode==Enum.KeyCode.N then S.NC=not S.NC Notify("Noclip: "..(S.NC and"ON"or"OFF"))
    elseif input.KeyCode==Enum.KeyCode.E then S.ESP=not S.ESP Notify("ESP: "..(S.ESP and"ON"or"OFF"))end
end)

R.RenderStepped:Connect(function()
    PBF.Visible=S.ShowPhoneButtons
    
    -- ESP
    local inLobby=false
    if L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        local lobby=workspace:FindFirstChild("Lobby")or workspace:FindFirstChild("Spawn")
        if lobby and (L.Character.HumanoidRootPart.Position-lobby.Position).Magnitude<50 then inLobby=true end
    end
    if not inLobby and (S.ESP or S.InnESP or S.MurESP or S.ShESP)then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                local role="Innocent"
                local rv=p.Character:FindFirstChild("Role")or p:FindFirstChild("Role")
                if rv then role=rv.Value end
                local show=false local color=Color3.fromRGB(100,180,255)
                if S.ESP then show=true;color=S.ESPColor end
                if role=="Innocent"and S.InnESP then show=true;color=Color3.fromRGB(0,255,100)end
                if role=="Murderer"and S.MurESP then show=true;color=Color3.fromRGB(255,50,50)end
                if role=="Sheriff"and S.ShESP then show=true;color=Color3.fromRGB(50,100,255)end
                if show then
                    if not EspHighlights[p]or not EspHighlights[p].Parent then
                        local h=Instance.new("Highlight")h.FillColor=color h.OutlineColor=Color3.fromRGB(255,255,255)h.FillTransparency=.6 h.Parent=p.Character EspHighlights[p]=h
                    else EspHighlights[p].FillColor=color end
                elseif EspHighlights[p]and EspHighlights[p].Parent then EspHighlights[p]:Destroy()EspHighlights[p]=nil end
            end
        end
    else
        for p,h in pairs(EspHighlights)do if h and h.Parent then h:Destroy()end EspHighlights[p]=nil end
    end
    
    -- Speed Hack
    if S.SP and L.Character and L.Character:FindFirstChild("Humanoid")then L.Character.Humanoid.WalkSpeed=16*S.SPMul
    elseif not S.SP and not S.BunnyHop and L.Character and L.Character:FindFirstChild("Humanoid")then L.Character.Humanoid.WalkSpeed=16 end
    
    -- BunnyHop
    if S.BunnyHop and L.Character and L.Character:FindFirstChild("Humanoid")then
        local hum=L.Character.Humanoid
        if hum.FloorMaterial~=Enum.Material.Air then hum:ChangeState(Enum.HumanoidStateType.Jumping)hum.WalkSpeed=hum.WalkSpeed+3 BHopActive=true end
    elseif BHopActive and L.Character and L.Character:FindFirstChild("Humanoid")then L.Character.Humanoid.WalkSpeed=16 BHopActive=false end
    
    -- Fly
    if S.Fly and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        local h=L.Character.HumanoidRootPart local dir=Vector3.new(0,0,0)
        if U:IsKeyDown(Enum.KeyCode.W)then dir+=C.CFrame.LookVector end
        if U:IsKeyDown(Enum.KeyCode.S)then dir-=C.CFrame.LookVector end
        if U:IsKeyDown(Enum.KeyCode.A)then dir-=C.CFrame.RightVector end
        if U:IsKeyDown(Enum.KeyCode.D)then dir+=C.CFrame.RightVector end
        if U:IsKeyDown(Enum.KeyCode.Space)then dir+=Vector3.new(0,1,0)end
        if U:IsKeyDown(Enum.KeyCode.LeftShift)then dir-=Vector3.new(0,1,0)end
        h.Velocity=dir*S.FlySpeed
    end
    
    -- Spin
    if S.Spin and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then L.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(S.SpinSpeed),0)end
    
    -- Noclip
    if S.NC and L.Character then for _,v in pairs(L.Character:GetDescendants())do if v:IsA("BasePart")then v.CanCollide=false end end end
    
    -- Fling All
    if S.Fl then for _,p in pairs(P:GetPlayers())do if p~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then local h=p.Character.HumanoidRootPart h.Velocity=Vector3.new(math.random(-S.FlPower*1000,S.FlPower*1000),math.random(2000,8000),math.random(-S.FlPower*1000,S.FlPower*1000))h.RotVelocity=Vector3.new(math.random(-100,100),math.random(-100,100),math.random(-100,100))end end end
    
    -- Aimbot
    if S.Aim and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
        local closest=nil local minDist=math.huge
        for _,p in pairs(P:GetPlayers())do if p~=L and p.Character and p.Character:FindFirstChild("Head")then local dist=(L.Character.HumanoidRootPart.Position-p.Character.Head.Position).Magnitude if dist<minDist and dist<=S.AimRadius then minDist=dist closest=p end end end
        if closest and closest.Character and closest.Character:FindFirstChild("Head")then C.CFrame=CFrame.new(C.CFrame.Position,closest.Character.Head.Position)end
    end
    
    -- GodMode
    if S.GM and L.Character and L.Character:FindFirstChild("Humanoid")then L.Character.Humanoid.MaxHealth=math.huge L.Character.Humanoid.Health=math.huge end
    
    -- KillAura
    if S.KA and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then for _,p in pairs(P:GetPlayers())do if p~=L and p.Character and p.Character:FindFirstChild("Humanoid")and p.Character:FindFirstChild("HumanoidRootPart")then if (L.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<=S.KARadius then p.Character.Humanoid.Health-=S.KADamage end end end end
    
    -- Reach
    if S.Reach and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then for _,p in pairs(P:GetPlayers())do if p~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then if (L.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<=S.ReachDist then p.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-5)end end end end
    
    -- InfJump
    if S.InfJump and L.Character and L.Character:FindFirstChild("Humanoid")then L.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)end
    
    -- NoFall
    if S.NoFall and L.Character and L.Character:FindFirstChild("Humanoid")then L.Character.Humanoid.FallingDown=false end
    
    -- AntiAFK
    if S.AntiAFK then VU:Button2Down(Vector2.new(0,0),C.CFrame)task.wait(.1)VU:Button2Up(Vector2.new(0,0),C.CFrame)end
    
    -- XRay
    if S.XRay then for _,v in pairs(workspace:GetDescendants())do if v:IsA("BasePart")then v.LocalTransparencyModifier=.5 end end end
    
    -- Fullbright
    if S.FB then Lighting.Brightness=2 Lighting.ClockTime=12 end
    
    -- AutoFarm
    if S.AutoFarm and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then L.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame+Vector3.new(0,0,S.FarmSpeed)end
end)

-- ============ INTRO ANIMATION ============
task.spawn(function()
    for _,s in pairs(Stars)do
        task.spawn(function()
            while IntroGui.Parent do s.BackgroundTransparency=0.2+math.sin(tick()*2+s.Position.X.Offset)*0.4 task.wait(.03)end
        end)
    end
    T:Create(IntroBG,TweenInfo.new(.8),{BackgroundTransparency=0}):Play()
    task.wait(.2)
    T:Create(LogoIcon,TweenInfo.new(.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{TextTransparency=0}):Play()
    task.wait(.3)
    T:Create(TitleText,TweenInfo.new(.8,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{TextTransparency=0}):Play()
    task.wait(.4)
    T:Create(Line,TweenInfo.new(.8),{Size=UDim2.new(0,300,0,3),Position=UDim2.new(.5,-150,.5,50)}):Play()
    task.wait(.3)
    T:Create(BetaText,TweenInfo.new(.6),{TextTransparency=0}):Play()
    task.wait(.3)
    T:Create(VerText,TweenInfo.new(.5),{TextTransparency=0}):Play()
    task.wait(.3)
    T:Create(ProgF,TweenInfo.new(.3),{BackgroundTransparency=0}):Play()
    T:Create(ProgFill,TweenInfo.new(1),{Size=UDim2.new(1,0,1,0)}):Play()
    task.wait(1.2)
    T:Create(LogoIcon,TweenInfo.new(.4),{TextTransparency=1,Position=UDim2.new(.5,-50,.5,-200)}):Play()
    T:Create(TitleText,TweenInfo.new(.4),{TextTransparency=1}):Play()
    T:Create(Line,TweenInfo.new(.4),{Size=UDim2.new(0,0,0,3),Position=UDim2.new(.5,0,.5,50)}):Play()
    T:Create(BetaText,TweenInfo.new(.3),{TextTransparency=1}):Play()
    T:Create(VerText,TweenInfo.new(.3),{TextTransparency=1}):Play()
    T:Create(ProgF,TweenInfo.new(.3),{BackgroundTransparency=1}):Play()
    T:Create(IntroBG,TweenInfo.new(.5),{BackgroundTransparency=1}):Play()
    task.wait(.5)
    IntroGui:Destroy()
    G.Enabled=true
    T:Create(M,TweenInfo.new(.7,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0,Position=UDim2.new(.5,-260,.5,-230)}):Play()
end)

-- Пульсация логотипа
task.spawn(function()
    task.wait(3.5)
    while M.Parent do
        T:Create(LogoDot,TweenInfo.new(.8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,18,0,18)}):Play()
        task.wait(.8)
        T:Create(LogoDot,TweenInfo.new(.8,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Size=UDim2.new(0,14,0,14)}):Play()
        task.wait(.8)
    end
end)

Notify("🔷 Syphixman v23 "..t("Loaded"))
