-- Syphixman MM2 v33 | Intro GUI-sized + LeftAlt Toggle
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer
local VU=game:GetService("VirtualUser")
local Lighting=game:GetService("Lighting")

local Lang="EN"
local TR={
    EN={Title="SYPHIXMAN MM2",Combat="COMBAT",Visual="VISUAL",Anim="ANIM",Fling="FLING",World="WORLD",Settings="SETTINGS",
        Aimbot="Aimbot",FlingAll="Fling All",Fly="Fly",Noclip="Noclip",SpeedHack="Speed Hack",GodMode="God Mode",KillAura="Kill Aura",Reach="Reach",Spin="Spin",BunnyHop="Bunny Hop",AntiFling="Anti-Fling",
        AimRadius="Aimbot Radius",AimFOV="Aimbot FOV",FlingPower="Fling Power",ReachDist="Reach Distance",SpeedMul="Speed Multiplier",SpinSpeed="Spin Speed",FarmSpeed="Farm Speed",AnimSpeed="Anim Speed",
        ESP="ESP",Tracers="Tracers",Chams="Chams",XRay="X-Ray",
        InnocentESP="Innocent ESP",MurdererESP="Murderer ESP",SheriffESP="Sheriff ESP",
        SelectPlayer="Select Player",FlingButton="FLING",RefreshList="Refresh",
        ShootMurderer="Shoot Murderer",TakeGun="Take Gun",AntiAFK="Anti-AFK",AutoFarm="Auto Farm",
        TeleportLobby="Teleport to Lobby",TeleportMap="Teleport to Map",
        SaveConfig="Save Config",LoadConfig="Load Config",Reset="Reset",Language="Language",
        ON="ON",OFF="OFF",Loaded="loaded!",Flung="flung!",ConfigSaved="Saved!",ConfigLoaded="Loaded!",ResetDone="Reset!",PhoneButtons="Show Phone Buttons"},
    RU={Title="SYPHIXMAN MM2",Combat="КОМБАТ",Visual="ВИЗУАЛ",Anim="АНИМ",Fling="ФЛИНГ",World="МИР",Settings="НАСТР",
        Aimbot="Аимбот",FlingAll="Флинг всех",Fly="Полёт",Noclip="Ноклип",SpeedHack="Спидхак",GodMode="Годмод",KillAura="Килл аура",Reach="Дотягивание",Spin="Вращение",BunnyHop="Баннихоп",AntiFling="Анти-флинг",
        AimRadius="Радиус аима",AimFOV="ФОВ аима",FlingPower="Сила флинга",ReachDist="Дистанция reach",SpeedMul="Множитель скорости",SpinSpeed="Скорость вращения",FarmSpeed="Скорость фарма",AnimSpeed="Скорость анимаций",
        ESP="ЕСП",Tracers="Трейсеры",Chams="Чамс",XRay="Рентген",
        InnocentESP="ЕСП невиновных",MurdererESP="ЕСП мардера",SheriffESP="ЕСП шерифа",
        SelectPlayer="Выберите игрока",FlingButton="ФЛИНГ",RefreshList="Обновить",
        ShootMurderer="Стрельнуть",TakeGun="Забрать пистолет",AntiAFK="Анти-АФК",AutoFarm="Авто-фарм",
        TeleportLobby="В лобби",TeleportMap="На карту",
        SaveConfig="Сохранить",LoadConfig="Загрузить",Reset="Сброс",Language="Язык",
        ON="ВКЛ",OFF="ВЫКЛ",Loaded="загружен!",Flung="зафлинген!",ConfigSaved="Сохранено!",ConfigLoaded="Загружено!",ResetDone="Сброшено!",PhoneButtons="Показать кнопки"}
}
local function t(key)return TR[Lang][key]or key end

local S={
    Aim=false,AimRadius=500,AimFOV=90,Fl=false,FlPower=15,Fly=false,FlySpeed=50,NC=false,SP=false,SPMul=2,GM=false,
    KA=false,KARadius=30,KADamage=100,ESP=false,ESPColor=Color3.fromRGB(100,180,255),
    InnESP=false,MurESP=false,ShESP=false,Tr=false,Ch=false,XRay=false,
    InfJump=false,NoFall=false,AntiAFK=false,Reach=false,ReachDist=20,
    AutoFarm=false,FarmSpeed=1,Spin=false,SpinSpeed=10,BunnyHop=false,AntiFling=false,ShowPhoneButtons=false,SelectedPlayer=nil
}

local BHopActive=false

local function Notify(text)
    local N=Instance.new("TextLabel")N.Size=UDim2.new(0,240,0,40)N.Position=UDim2.new(1,260,0,15)
    N.BackgroundColor3=Color3.fromRGB(15,15,30)N.TextColor3=Color3.fromRGB(100,180,255)N.Text=text
    N.Font=Enum.Font.GothamBold N.TextSize=13 N.BackgroundTransparency=1 N.TextTransparency=1
    N.Parent=gethui and gethui()or game.CoreGui
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=N
    T:Create(N,TweenInfo.new(.5),{Position=UDim2.new(1,-260,0,15),BackgroundTransparency=0,TextTransparency=0}):Play()
    task.wait(1.5)
    T:Create(N,TweenInfo.new(.4),{Position=UDim2.new(1,260,0,15),BackgroundTransparency=1,TextTransparency=1}):Play()
    task.wait(.4)N:Destroy()
end

-- ============ INTRO (размером с GUI) ============
local IntroGui=Instance.new("ScreenGui")IntroGui.Name="Intro"IntroGui.Parent=gethui and gethui()or game.CoreGui

-- Рамка размером с будущее GUI (520x440)
local IntroFrame=Instance.new("Frame")
IntroFrame.Size=UDim2.new(0,520,0,440)
IntroFrame.Position=UDim2.new(.5,-260,.5,-220)
IntroFrame.BackgroundColor3=Color3.fromRGB(10,10,20)
IntroFrame.BorderSizePixel=0
IntroFrame.BackgroundTransparency=1
IntroFrame.Parent=IntroGui
Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=IntroFrame

local FixedText=Instance.new("TextLabel")
FixedText.Size=UDim2.new(1,0,0,40)
FixedText.Position=UDim2.new(0,0,.5,-120)
FixedText.BackgroundTransparency=1
FixedText.Text="FIXED"
FixedText.TextColor3=Color3.fromRGB(0,255,100)
FixedText.Font=Enum.Font.GothamBlack
FixedText.TextSize=24
FixedText.TextTransparency=1
FixedText.Parent=IntroFrame

local TitleText=Instance.new("TextLabel")
TitleText.Size=UDim2.new(1,0,0,60)
TitleText.Position=UDim2.new(0,0,.5,-60)
TitleText.BackgroundTransparency=1
TitleText.Text="SYPHIXMAN"
TitleText.TextColor3=Color3.fromRGB(100,180,255)
TitleText.Font=Enum.Font.GothamBlack
TitleText.TextSize=40
TitleText.TextTransparency=1
TitleText.Parent=IntroFrame

local Line=Instance.new("Frame")
Line.Size=UDim2.new(0,0,0,3)
Line.Position=UDim2.new(.5,0,.5,20)
Line.BackgroundColor3=Color3.fromRGB(80,140,255)
Line.BorderSizePixel=0
Line.Parent=IntroFrame
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=Line

local BetaText=Instance.new("TextLabel")
BetaText.Size=UDim2.new(1,0,0,30)
BetaText.Position=UDim2.new(0,0,.5,35)
BetaText.BackgroundTransparency=1
BetaText.Text="BETA VERSION"
BetaText.TextColor3=Color3.fromRGB(80,140,255)
BetaText.Font=Enum.Font.GothamBold
BetaText.TextSize=18
BetaText.TextTransparency=1
BetaText.Parent=IntroFrame

local VerText=Instance.new("TextLabel")
VerText.Size=UDim2.new(1,0,0,25)
VerText.Position=UDim2.new(0,0,.5,75)
VerText.BackgroundTransparency=1
VerText.Text="v33.0 | by Ryzen"
VerText.TextColor3=Color3.fromRGB(100,100,150)
VerText.Font=Enum.Font.Gotham
VerText.TextSize=14
VerText.TextTransparency=1
VerText.Parent=IntroFrame

local ProgF=Instance.new("Frame")
ProgF.Size=UDim2.new(0,300,0,6)
ProgF.Position=UDim2.new(.5,-150,.5,115)
ProgF.BackgroundColor3=Color3.fromRGB(25,25,45)
ProgF.BorderSizePixel=0
ProgF.BackgroundTransparency=1
ProgF.Parent=IntroFrame
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgF

local ProgFill=Instance.new("Frame")
ProgFill.Size=UDim2.new(0,0,1,0)
ProgFill.BackgroundColor3=Color3.fromRGB(80,140,255)
ProgFill.BorderSizePixel=0
ProgFill.Parent=ProgF
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgFill

-- ============ MAIN GUI ============
local G=Instance.new("ScreenGui")G.Name="Syphix"G.Parent=gethui and gethui()or game.CoreGui
G.Enabled=false

local M=Instance.new("Frame")M.Size=UDim2.new(0,520,0,440)M.Position=UDim2.new(.5,-260,.5,-220)
M.BackgroundColor3=Color3.fromRGB(15,15,30)M.BorderSizePixel=0 M.BackgroundTransparency=1 M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=M

local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,40)TB.BackgroundColor3=Color3.fromRGB(20,20,40)TB.BorderSizePixel=0 TB.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=TB
local TBb=Instance.new("Frame")TBb.Size=UDim2.new(1,0,0,20)TBb.Position=UDim2.new(0,0,0,20)TBb.BackgroundColor3=Color3.fromRGB(20,20,40)TBb.BorderSizePixel=0 TBb.Parent=TB

local TitleLabel=Instance.new("TextLabel")TitleLabel.Size=UDim2.new(0,180,0,25)TitleLabel.Position=UDim2.new(0,15,0,8)
TitleLabel.BackgroundTransparency=1 TitleLabel.Text="[FIXED] "..t("Title")TitleLabel.TextColor3=Color3.fromRGB(200,220,255)
TitleLabel.Font=Enum.Font.GothamBlack TitleLabel.TextSize=14 TitleLabel.Parent=TB

local CB=Instance.new("TextButton")CB.Size=UDim2.new(0,24,0,24)CB.Position=UDim2.new(1,-30,0,8)
CB.BackgroundColor3=Color3.fromRGB(255,80,80)CB.Text="X"CB.TextColor3=Color3.fromRGB(255,255,255)
CB.Font=Enum.Font.GothamBold CB.TextSize=12 CB.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=CB
CB.MouseButton1Click:Connect(function()G:Destroy()end)

local dragging=false local dragStart=nil local startPos=nil
TB.InputBegan:Connect(function(input)if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true dragStart=input.Position startPos=M.Position end end)
U.InputEnded:Connect(function(input)if input.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
U.InputChanged:Connect(function(input)if dragging and input.UserInputType==Enum.UserInputType.MouseMovement then local d=input.Position-dragStart M.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)end end)

local LP=Instance.new("Frame")LP.Size=UDim2.new(0,100,1,-40)LP.Position=UDim2.new(0,0,0,40)LP.BackgroundColor3=Color3.fromRGB(20,20,40)LP.BorderSizePixel=0 LP.Parent=M
local CA=Instance.new("Frame")CA.Size=UDim2.new(1,-110,1,-55)CA.Position=UDim2.new(0,105,0,55)CA.BackgroundTransparency=1 CA.Parent=M

local TabFrames={}local Tabs={}
local TabData={{"Combat","[=]"},{"Visual","[o]"},{"Anim","[~]"},{"Fling","[!]"},{"World","[@]"},{"Settings","[#]"}}

for _,tab in pairs(TabData)do
    local SF=Instance.new("ScrollingFrame")SF.Size=UDim2.new(1,0,1,0)SF.BackgroundTransparency=1 SF.BorderSizePixel=0
    SF.ScrollBarThickness=2 SF.Visible=false SF.Parent=CA
    TabFrames[tab[1]]=SF
end

local function SwitchTab(name)
    for n,b in pairs(Tabs)do
        b.BackgroundColor3=n==name and Color3.fromRGB(60,100,200)or Color3.fromRGB(25,25,45)
        b.TextColor3=n==name and Color3.fromRGB(255,255,255)or Color3.fromRGB(120,140,180)
    end
    for n,f in pairs(TabFrames)do f.Visible=n==name end
end

for i,tab in pairs(TabData)do
    local b=Instance.new("TextButton")b.Size=UDim2.new(1,-8,0,48)b.Position=UDim2.new(0,4,0,4+(i-1)*52)
    b.BackgroundColor3=Color3.fromRGB(25,25,45)b.Text=tab[2].." "..t(tab[1])b.TextColor3=Color3.fromRGB(120,140,180)
    b.Font=Enum.Font.GothamBold b.TextSize=10 b.Parent=LP
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(function()SwitchTab(tab[1])end)
    Tabs[tab[1]]=b
end

local function mkToggle(parent,name,icon,y,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-8,0,38)f.Position=UDim2.new(0,4,0,y)
    f.BackgroundColor3=Color3.fromRGB(25,25,45)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=f
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.55,0,1,0)l.Position=UDim2.new(0,10,0,0)
    l.BackgroundTransparency=1 l.Text=icon.." "..name l.TextColor3=Color3.fromRGB(200,220,255)
    l.Font=Enum.Font.Gotham l.TextSize=12 l.Parent=f
    local btn=Instance.new("TextButton")btn.Size=UDim2.new(0,55,0,24)btn.Position=UDim2.new(1,-60,0,7)
    btn.BackgroundColor3=Color3.fromRGB(40,40,70)btn.Text=t("OFF")btn.TextColor3=Color3.fromRGB(150,170,200)
    btn.Font=Enum.Font.GothamBold btn.TextSize=10 btn.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=btn
    btn.MouseButton1Click:Connect(function()
        S[set]=not S[set]
        btn.BackgroundColor3=S[set]and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
        btn.Text=S[set]and t("ON")or t("OFF")
    end)
end

local function mkSlider(parent,name,y,min,max,def,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-8,0,32)f.Position=UDim2.new(0,4,0,y)
    f.BackgroundColor3=Color3.fromRGB(25,25,45)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=f
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.4,0,1,0)l.Position=UDim2.new(0,7,0,0)
    l.BackgroundTransparency=1 l.Text=name l.TextColor3=Color3.fromRGB(150,170,200)
    l.Font=Enum.Font.Gotham l.TextSize=10 l.Parent=f
    local vl=Instance.new("TextLabel")vl.Size=UDim2.new(0,40,1,0)vl.Position=UDim2.new(1,-43,0,0)
    vl.BackgroundTransparency=1 vl.Text=tostring(def)vl.TextColor3=Color3.fromRGB(100,180,255)
    vl.Font=Enum.Font.GothamBold vl.TextSize=10 vl.Parent=f
    local sb=Instance.new("TextButton")sb.Size=UDim2.new(.35,0,0,6)sb.Position=UDim2.new(.38,0,0,13)
    sb.BackgroundColor3=Color3.fromRGB(40,40,70)sb.Text=""sb.BorderSizePixel=0 sb.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=sb
    local fill=Instance.new("Frame")fill.Size=UDim2.new((def-min)/(max-min),0,1,0)fill.BackgroundColor3=Color3.fromRGB(80,140,255)fill.BorderSizePixel=0 fill.Parent=sb
    local knob=Instance.new("Frame")knob.Size=UDim2.new(0,12,0,12)knob.Position=UDim2.new((def-min)/(max-min),-6,0,-3)knob.BackgroundColor3=Color3.fromRGB(255,255,255)knob.BorderSizePixel=0 knob.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=knob
    sb.MouseButton1Down:Connect(function()
        local con con=R.RenderStepped:Connect(function()
            if U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then
                local rel=math.clamp((U:GetMouseLocation().X-sb.AbsolutePosition.X)/sb.AbsoluteSize.X,0,1)
                local val=math.floor(min+(max-min)*rel)S[set]=val vl.Text=tostring(val)
                fill.Size=UDim2.new(rel,0,1,0)knob.Position=UDim2.new(rel,-6,0,-3)
            else con:Disconnect()end
        end)
    end)
end

local function mkButton(parent,name,icon,y,color,callback)
    local b=Instance.new("TextButton")b.Size=UDim2.new(1,-8,0,38)b.Position=UDim2.new(0,4,0,y)
    b.BackgroundColor3=color or Color3.fromRGB(60,100,200)b.Text=icon.." "..name b.TextColor3=Color3.fromRGB(255,255,255)
    b.Font=Enum.Font.GothamBold b.TextSize=12 b.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(callback)
end

-- ============ FILL TABS ============
local CombatSF=TabFrames.Combat
mkToggle(CombatSF,t("Aimbot"),"[T]",5,"Aim")
mkToggle(CombatSF,t("FlingAll"),"[F]",47,"Fl")
mkToggle(CombatSF,t("Fly"),"[Y]",89,"Fly")
mkToggle(CombatSF,t("Noclip"),"[N]",131,"NC")
mkToggle(CombatSF,t("SpeedHack"),"[S]",173,"SP")
mkToggle(CombatSF,t("GodMode"),"[G]",215,"GM")
mkToggle(CombatSF,t("KillAura"),"[K]",257,"KA")
mkToggle(CombatSF,t("Reach"),"[R]",299,"Reach")
mkToggle(CombatSF,t("Spin"),"[P]",341,"Spin")
mkToggle(CombatSF,t("BunnyHop"),"[B]",383,"BunnyHop")
mkToggle(CombatSF,t("AntiFling"),"[A]",425,"AntiFling")
mkSlider(CombatSF,t("AimRadius"),472,100,2000,500,"AimRadius")
mkSlider(CombatSF,t("AimFOV"),508,30,360,90,"AimFOV")
mkSlider(CombatSF,t("FlingPower"),544,1,50,15,"FlPower")
mkSlider(CombatSF,t("ReachDist"),580,5,50,20,"ReachDist")
mkSlider(CombatSF,t("SpeedMul"),616,1,10,2,"SPMul")
mkSlider(CombatSF,t("SpinSpeed"),652,1,50,10,"SpinSpeed")
CombatSF.CanvasSize=UDim2.new(0,0,0,690)

local VisualSF=TabFrames.Visual
mkToggle(VisualSF,"ESP","[E]",5,"ESP")
mkToggle(VisualSF,t("InnocentESP"),"[I]",47,"InnESP")
mkToggle(VisualSF,t("MurdererESP"),"[M]",89,"MurESP")
mkToggle(VisualSF,t("SheriffESP"),"[H]",131,"ShESP")
mkToggle(VisualSF,t("Tracers"),"[L]",173,"Tr")
mkToggle(VisualSF,t("Chams"),"[C]",215,"Ch")
mkToggle(VisualSF,t("XRay"),"[X]",257,"XRay")
VisualSF.CanvasSize=UDim2.new(0,0,0,300)

local AnimSF=TabFrames.Anim
mkToggle(AnimSF,t("InfJump"),"[J]",5,"InfJump")
mkToggle(AnimSF,t("NoFall"),"[D]",47,"NoFall")
AnimSF.CanvasSize=UDim2.new(0,0,0,90)

-- FLING
local FlingSF=TabFrames.Fling
local PlayerList=Instance.new("ScrollingFrame")PlayerList.Size=UDim2.new(1,-8,0,300)PlayerList.Position=UDim2.new(0,4,0,5)
PlayerList.BackgroundColor3=Color3.fromRGB(25,25,45)PlayerList.BorderSizePixel=0 PlayerList.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=PlayerList

local function RefreshPlayerList()
    for _,c in pairs(PlayerList:GetChildren())do if c:IsA("TextButton")then c:Destroy()end end
    local y=0
    for _,p in pairs(P:GetPlayers())do
        if p~=L then
            local b=Instance.new("TextButton")b.Size=UDim2.new(1,-8,0,32)b.Position=UDim2.new(0,4,0,y)
            b.BackgroundColor3=Color3.fromRGB(35,35,60)b.Text=p.Name b.TextColor3=Color3.fromRGB(200,220,255)
            b.Font=Enum.Font.GothamBold b.TextSize=11 b.Parent=PlayerList
            Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=b
            b.MouseButton1Click:Connect(function()
                if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                    local hrp=p.Character.HumanoidRootPart
                    hrp.CFrame=hrp.CFrame+Vector3.new(0,50,0)
                    hrp.Velocity=Vector3.new(math.random(-5000,5000),10000,math.random(-5000,5000))
                    hrp.RotVelocity=Vector3.new(math.random(-500,500),math.random(-500,500),math.random(-500,500))
                    task.delay(.5,function()if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then p.Character.HumanoidRootPart.CFrame=CFrame.new(0,-1000,0)end end)
                    Notify("[!] "..p.Name.." "..t("Flung"))
                end
            end)
            y+=37
        end
    end
    PlayerList.CanvasSize=UDim2.new(0,0,0,y)
end
RefreshPlayerList()

local RefreshBtn=Instance.new("TextButton")RefreshBtn.Size=UDim2.new(1,-8,0,30)RefreshBtn.Position=UDim2.new(0,4,0,310)
RefreshBtn.BackgroundColor3=Color3.fromRGB(35,35,60)RefreshBtn.Text="[...] "..t("RefreshList")RefreshBtn.TextColor3=Color3.fromRGB(200,220,255)
RefreshBtn.Font=Enum.Font.GothamBold RefreshBtn.TextSize=11 RefreshBtn.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=RefreshBtn
RefreshBtn.MouseButton1Click:Connect(RefreshPlayerList)
FlingSF.CanvasSize=UDim2.new(0,0,0,345)

-- WORLD
local WorldSF=TabFrames.World
mkButton(WorldSF,t("TeleportLobby"),"[1]",5,Color3.fromRGB(60,100,200),function()
    local lobby=workspace:FindFirstChild("Lobby")or workspace:FindFirstChild("Spawn")
    if lobby and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then L.Character.HumanoidRootPart.CFrame=lobby.CFrame+Vector3.new(0,10,0)end
end)
mkButton(WorldSF,t("TeleportMap"),"[2]",47,Color3.fromRGB(60,100,200),function()
    local map=workspace:FindFirstChild("Map")or workspace:FindFirstChild("Arena")
    if map and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then L.Character.HumanoidRootPart.CFrame=map.CFrame+Vector3.new(0,10,0)end
end)
WorldSF.CanvasSize=UDim2.new(0,0,0,90)

-- SETTINGS
local SettingsSF=TabFrames.Settings
local LangFrame=Instance.new("Frame")LangFrame.Size=UDim2.new(1,-8,0,45)LangFrame.Position=UDim2.new(0,4,0,5)
LangFrame.BackgroundColor3=Color3.fromRGB(25,25,45)LangFrame.BorderSizePixel=0 LangFrame.Parent=SettingsSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=LangFrame
local ENBtn=Instance.new("TextButton")ENBtn.Size=UDim2.new(.4,0,0,22)ENBtn.Position=UDim2.new(.05,0,0,20)
ENBtn.BackgroundColor3=Color3.fromRGB(50,200,100)ENBtn.Text="EN"ENBtn.TextColor3=Color3.fromRGB(255,255,255)
ENBtn.Font=Enum.Font.GothamBold ENBtn.TextSize=11 ENBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=ENBtn
local RUBtn=Instance.new("TextButton")RUBtn.Size=UDim2.new(.4,0,0,22)RUBtn.Position=UDim2.new(.55,0,0,20)
RUBtn.BackgroundColor3=Color3.fromRGB(40,40,70)RUBtn.Text="RU"RUBtn.TextColor3=Color3.fromRGB(255,255,255)
RUBtn.Font=Enum.Font.GothamBold RUBtn.TextSize=11 RUBtn.Parent=LangFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=RUBtn
ENBtn.MouseButton1Click:Connect(function()Lang="EN"ENBtn.BackgroundColor3=Color3.fromRGB(50,200,100)RUBtn.BackgroundColor3=Color3.fromRGB(40,40,70)TitleLabel.Text="[FIXED] "..t("Title")end)
RUBtn.MouseButton1Click:Connect(function()Lang="RU"RUBtn.BackgroundColor3=Color3.fromRGB(50,200,100)ENBtn.BackgroundColor3=Color3.fromRGB(40,40,70)TitleLabel.Text="[FIXED] "..t("Title")end)

mkToggle(SettingsSF,t("PhoneButtons"),"[P]",55,"ShowPhoneButtons")
mkToggle(SettingsSF,t("AutoFarm"),"[W]",97,"AutoFarm")
mkSlider(SettingsSF,t("FarmSpeed"),143,1,10,1,"FarmSpeed")
SettingsSF.CanvasSize=UDim2.new(0,0,0,180)

-- ============ INIT ============
TabFrames.Combat.Visible=true
Tabs.Combat.BackgroundColor3=Color3.fromRGB(60,100,200)
Tabs.Combat.TextColor3=Color3.fromRGB(255,255,255)

-- ============ LOGIC ============
local EspHighlights={}

local function getRole(p)
    local bp=p:FindFirstChild("Backpack")
    if bp then
        if bp:FindFirstChild("Knife")then return"Murderer"end
        if bp:FindFirstChild("Gun")then return"Sheriff"end
    end
    if p.Character then
        if p.Character:FindFirstChild("Knife")then return"Murderer"end
        if p.Character:FindFirstChild("Gun")or p.Character:FindFirstChild("Pistol")then return"Sheriff"end
    end
    return"Innocent"
end

local function shootMurderer()
    for _,p in pairs(P:GetPlayers())do
        if p~=L and getRole(p)=="Murderer"and p.Character and p.Character:FindFirstChild("Humanoid")then
            p.Character.Humanoid.Health=0
        end
    end
end

local function takeGun()
    for _,p in pairs(P:GetPlayers())do
        if p~=L and getRole(p)=="Sheriff"and p.Character then
            local gun=p.Character:FindFirstChild("Gun")or p.Character:FindFirstChild("Pistol")
            if gun then gun.Parent=L.Backpack or L.Character end
        end
    end
end

-- LeftAlt toggle для скрытия/показа GUI
local GUIVisible=true
U.InputBegan:Connect(function(input,gameProcessed)
    if gameProcessed then return end
    if input.KeyCode==Enum.KeyCode.LeftAlt then
        GUIVisible=not GUIVisible
        M.Visible=GUIVisible
    elseif input.KeyCode==Enum.KeyCode.LeftControl then S.Aim=not S.Aim
    elseif input.KeyCode==Enum.KeyCode.F then S.Fl=not S.Fl
    elseif input.KeyCode==Enum.KeyCode.G then S.Fly=not S.Fly
    elseif input.KeyCode==Enum.KeyCode.N then S.NC=not S.NC
    elseif input.KeyCode==Enum.KeyCode.E then S.ESP=not S.ESP end
end)

R.RenderStepped:Connect(function()
    -- ESP
    if S.ESP or S.InnESP or S.MurESP or S.ShESP then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                local role=getRole(p)
                local show=false local color=S.ESPColor
                if S.ESP then show=true end
                if role=="Innocent"and S.InnESP then show=true;color=Color3.fromRGB(0,255,100)end
                if role=="Murderer"and S.MurESP then show=true;color=Color3.fromRGB(255,50,50)end
                if role=="Sheriff"and S.ShESP then show=true;color=Color3.fromRGB(50,100,255)end
                if show then
                    local h=EspHighlights[p]
                    if not h or not h.Parent then
                        h=Instance.new("Highlight")h.FillColor=color h.FillTransparency=.5 h.Parent=p.Character EspHighlights[p]=h
                    else h.FillColor=color end
                elseif EspHighlights[p]and EspHighlights[p].Parent then
                    EspHighlights[p]:Destroy()EspHighlights[p]=nil
                end
            end
        end
    else
        for p,h in pairs(EspHighlights)do if h and h.Parent then h:Destroy()end end
        EspHighlights={}
    end
    
    -- Chams
    if S.Ch then
        for _,p in pairs(P:GetPlayers())do
            if p~=L and p.Character then
                for _,v in pairs(p.Character:GetChildren())do
                    if v:IsA("BasePart")then v.Material=Enum.M
