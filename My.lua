-- Syphixman MM2 v36 | Fixed Launch
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer
local VU=game:GetService("VirtualUser")

local function GetHui()
    pcall(function()
        if gethui then return gethui() end
    end)
    pcall(function()
        if syn and syn.protect_gui then return game.CoreGui end
    end)
    pcall(function()
        if get_hidden_gui then return get_hidden_gui() end
    end)
    return game.CoreGui
end

local S={
    Aim=false,AimRadius=500,
    Fl=false,FlPower=15,
    Fly=false,FlySpeed=50,
    NC=false,SP=false,SPMul=2,GM=false,
    KA=false,KARadius=30,KADamage=100,
    ESP=false,ESPColor=Color3.fromRGB(100,180,255),
    InnESP=false,MurESP=false,ShESP=false,
    Tr=false,Ch=false,XRay=false,
    InfJump=false,NoFall=false,AntiAFK=false,Reach=false,ReachDist=20,
    AutoFarm=false,FarmSpeed=1,
    Spin=false,SpinSpeed=10,
    BunnyHop=false,AntiFling=false,
    SelectedPlayer=nil,
    GUIScale=1
}

local function Notify(text)
    pcall(function()
        local N=Instance.new("TextLabel")
        N.Size=UDim2.new(0,220,0,35)
        N.Position=UDim2.new(1,240,0,15)
        N.BackgroundColor3=Color3.fromRGB(15,15,30)
        N.TextColor3=Color3.fromRGB(100,180,255)
        N.Text=text
        N.Font=Enum.Font.GothamBold
        N.TextSize=12
        N.Parent=GetHui()
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=N
        T:Create(N,TweenInfo.new(.3),{Position=UDim2.new(1,-240,0,15)}):Play()
        task.wait(1.5)
        T:Create(N,TweenInfo.new(.3),{Position=UDim2.new(1,240,0,15)}):Play()
        task.wait(.3)
        N:Destroy()
    end)
end

-- ============ INTRO ============
local Intro=Instance.new("ScreenGui")
Intro.Name="Intro"
Intro.Parent=GetHui()

local IntroBG=Instance.new("Frame")
IntroBG.Size=UDim2.new(1,0,1,0)
IntroBG.BackgroundColor3=Color3.fromRGB(5,5,15)
IntroBG.BackgroundTransparency=1
IntroBG.Parent=Intro

local FixedText=Instance.new("TextLabel")
FixedText.Size=UDim2.new(0,300,0,40)
FixedText.Position=UDim2.new(.5,-150,.5,-80)
FixedText.BackgroundTransparency=1
FixedText.Text="FIXED"
FixedText.TextColor3=Color3.fromRGB(0,255,100)
FixedText.Font=Enum.Font.GothamBlack
FixedText.TextSize=24
FixedText.TextTransparency=1
FixedText.Parent=Intro

local TitleText=Instance.new("TextLabel")
TitleText.Size=UDim2.new(0,400,0,60)
TitleText.Position=UDim2.new(.5,-200,.5,-30)
TitleText.BackgroundTransparency=1
TitleText.Text="SYPHIXMAN"
TitleText.TextColor3=Color3.fromRGB(100,180,255)
TitleText.Font=Enum.Font.GothamBlack
TitleText.TextSize=40
TitleText.TextTransparency=1
TitleText.Parent=Intro

local Line=Instance.new("Frame")
Line.Size=UDim2.new(0,0,0,3)
Line.Position=UDim2.new(.5,0,.5,40)
Line.BackgroundColor3=Color3.fromRGB(80,140,255)
Line.BorderSizePixel=0
Line.Parent=Intro
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=Line

local BetaText=Instance.new("TextLabel")
BetaText.Size=UDim2.new(0,300,0,30)
BetaText.Position=UDim2.new(.5,-150,.5,55)
BetaText.BackgroundTransparency=1
BetaText.Text="BETA VERSION"
BetaText.TextColor3=Color3.fromRGB(80,140,255)
BetaText.Font=Enum.Font.GothamBold
BetaText.TextSize=18
BetaText.TextTransparency=1
BetaText.Parent=Intro

local VerText=Instance.new("TextLabel")
VerText.Size=UDim2.new(0,300,0,25)
VerText.Position=UDim2.new(.5,-150,.5,95)
VerText.BackgroundTransparency=1
VerText.Text="v36.0 | by Ryzen"
VerText.TextColor3=Color3.fromRGB(100,100,150)
VerText.Font=Enum.Font.Gotham
VerText.TextSize=14
VerText.TextTransparency=1
VerText.Parent=Intro

local ProgF=Instance.new("Frame")
ProgF.Size=UDim2.new(0,300,0,6)
ProgF.Position=UDim2.new(.5,-150,.5,135)
ProgF.BackgroundColor3=Color3.fromRGB(25,25,45)
ProgF.BorderSizePixel=0
ProgF.BackgroundTransparency=1
ProgF.Parent=Intro
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgF

local ProgFill=Instance.new("Frame")
ProgFill.Size=UDim2.new(0,0,1,0)
ProgFill.BackgroundColor3=Color3.fromRGB(80,140,255)
ProgFill.BorderSizePixel=0
ProgFill.Parent=ProgF
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=ProgFill

-- ============ MAIN GUI ============
local G=Instance.new("ScreenGui")
G.Name="Syphix"
G.Parent=GetHui()
G.Enabled=false

local M=Instance.new("Frame")
M.Size=UDim2.new(0,450,0,480)
M.Position=UDim2.new(.5,-225,.5,-240)
M.BackgroundColor3=Color3.fromRGB(15,15,30)
M.BorderSizePixel=0
M.BackgroundTransparency=1
M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=M

local TB=Instance.new("Frame")
TB.Size=UDim2.new(1,0,0,40)
TB.BackgroundColor3=Color3.fromRGB(20,20,40)
TB.BorderSizePixel=0
TB.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=TB

local TBb=Instance.new("Frame")
TBb.Size=UDim2.new(1,0,0,20)
TBb.Position=UDim2.new(0,0,0,20)
TBb.BackgroundColor3=Color3.fromRGB(20,20,40)
TBb.BorderSizePixel=0
TBb.Parent=TB

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(0,140,0,25)
Title.Position=UDim2.new(0,15,0,8)
Title.BackgroundTransparency=1
Title.Text="SYPHIX MM2"
Title.TextColor3=Color3.fromRGB(200,220,255)
Title.Font=Enum.Font.GothamBlack
Title.TextSize=13
Title.Parent=TB

local HideBtn=Instance.new("TextButton")
HideBtn.Size=UDim2.new(0,22,0,22)
HideBtn.Position=UDim2.new(1,-56,0,9)
HideBtn.BackgroundColor3=Color3.fromRGB(200,150,50)
HideBtn.Text="-"
HideBtn.TextColor3=Color3.fromRGB(255,255,255)
HideBtn.Font=Enum.Font.GothamBold
HideBtn.TextSize=14
HideBtn.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=HideBtn
HideBtn.MouseButton1Click:Connect(function()
    M.Visible=false
end)

local ExpandBtn=Instance.new("TextButton")
ExpandBtn.Size=UDim2.new(0,22,0,22)
ExpandBtn.Position=UDim2.new(1,-80,0,9)
ExpandBtn.BackgroundColor3=Color3.fromRGB(60,100,200)
ExpandBtn.Text="+"
ExpandBtn.TextColor3=Color3.fromRGB(255,255,255)
ExpandBtn.Font=Enum.Font.GothamBold
ExpandBtn.TextSize=14
ExpandBtn.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=ExpandBtn
ExpandBtn.MouseButton1Click:Connect(function()
    S.GUIScale=math.min(S.GUIScale+0.2,1.5)
    M.Size=UDim2.new(0,math.floor(450*S.GUIScale),0,math.floor(480*S.GUIScale))
end)

local ShrinkBtn=Instance.new("TextButton")
ShrinkBtn.Size=UDim2.new(0,22,0,22)
ShrinkBtn.Position=UDim2.new(1,-104,0,9)
ShrinkBtn.BackgroundColor3=Color3.fromRGB(200,60,60)
ShrinkBtn.Text="--"
ShrinkBtn.TextColor3=Color3.fromRGB(255,255,255)
ShrinkBtn.Font=Enum.Font.GothamBold
ShrinkBtn.TextSize=10
ShrinkBtn.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=ShrinkBtn
ShrinkBtn.MouseButton1Click:Connect(function()
    S.GUIScale=math.max(S.GUIScale-0.2,0.7)
    M.Size=UDim2.new(0,math.floor(450*S.GUIScale),0,math.floor(480*S.GUIScale))
end)

local CB=Instance.new("TextButton")
CB.Size=UDim2.new(0,22,0,22)
CB.Position=UDim2.new(1,-26,0,9)
CB.BackgroundColor3=Color3.fromRGB(255,80,80)
CB.Text="X"
CB.TextColor3=Color3.fromRGB(255,255,255)
CB.Font=Enum.Font.GothamBold
CB.TextSize=11
CB.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=CB
CB.MouseButton1Click:Connect(function()
    pcall(function()G:Destroy()end)
end)

local dragging=false
local ds=nil
local sp=nil
TB.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        ds=i.Position
        sp=M.Position
    end
end)
U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=false
    end
end)
U.InputChanged:Connect(function(i)
    if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
        local d=i.Position-ds
        M.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)
    end
end)

local LP=Instance.new("Frame")
LP.Size=UDim2.new(0,90,1,-40)
LP.Position=UDim2.new(0,0,0,40)
LP.BackgroundColor3=Color3.fromRGB(20,20,40)
LP.BorderSizePixel=0
LP.Parent=M

local CA=Instance.new("Frame")
CA.Size=UDim2.new(1,-100,1,-55)
CA.Position=UDim2.new(0,95,0,55)
CA.BackgroundTransparency=1
CA.Parent=M

local TabFrames={}
local Tabs={}
local TabNames={"Combat","Visual","Fling","World","Settings"}
local TabLabels={"[=] Combat","[o] Visual","[!] Fling","[@] World","[#] Settings"}

for i=1,5 do
    local name=TabNames[i]
    pcall(function()
        local SF=Instance.new("ScrollingFrame")
        SF.Size=UDim2.new(1,0,1,0)
        SF.BackgroundTransparency=1
        SF.BorderSizePixel=0
        SF.ScrollBarThickness=2
        SF.Visible=false
        SF.Parent=CA
        TabFrames[name]=SF
        
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(1,-8,0,45)
        b.Position=UDim2.new(0,4,0,4+(i-1)*49)
        b.BackgroundColor3=Color3.fromRGB(25,25,45)
        b.Text=TabLabels[i]
        b.TextColor3=Color3.fromRGB(120,140,180)
        b.Font=Enum.Font.GothamBold
        b.TextSize=10
        b.Parent=LP
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
        b.MouseButton1Click:Connect(function()
            for n,btn in pairs(Tabs)do
                btn.BackgroundColor3=n==name and Color3.fromRGB(60,100,200)or Color3.fromRGB(25,25,45)
                btn.TextColor3=n==name and Color3.fromRGB(255,255,255)or Color3.fromRGB(120,140,180)
            end
            for n,f in pairs(TabFrames)do
                f.Visible=n==name
            end
        end)
        Tabs[name]=b
    end)
end

local function mkToggle(parent,name,y,set)
    pcall(function()
        local f=Instance.new("Frame")
        f.Size=UDim2.new(1,-8,0,36)
        f.Position=UDim2.new(0,4,0,y)
        f.BackgroundColor3=Color3.fromRGB(25,25,45)
        f.BorderSizePixel=0
        f.Parent=parent
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=f
        
        local l=Instance.new("TextLabel")
        l.Size=UDim2.new(.55,0,1,0)
        l.Position=UDim2.new(0,9,0,0)
        l.BackgroundTransparency=1
        l.Text=name
        l.TextColor3=Color3.fromRGB(200,220,255)
        l.Font=Enum.Font.Gotham
        l.TextSize=12
        l.Parent=f
        
        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(0,50,0,22)
        btn.Position=UDim2.new(1,-55,0,7)
        btn.BackgroundColor3=Color3.fromRGB(40,40,70)
        btn.Text="OFF"
        btn.TextColor3=Color3.fromRGB(150,170,200)
        btn.Font=Enum.Font.GothamBold
        btn.TextSize=10
        btn.Parent=f
        Instance.new("UICorner").CornerRadius=UDim.new(0,11)Instance.new("UICorner").Parent=btn
        
        btn.MouseButton1Click:Connect(function()
            pcall(function()
                S[set]=not S[set]
                btn.BackgroundColor3=S[set]and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
                btn.Text=S[set]and"ON"or"OFF"
            end)
        end)
    end)
end

local function mkSlider(parent,name,y,min,max,def,set)
    pcall(function()
        local f=Instance.new("Frame")
        f.Size=UDim2.new(1,-8,0,30)
        f.Position=UDim2.new(0,4,0,y)
        f.BackgroundColor3=Color3.fromRGB(25,25,45)
        f.BorderSizePixel=0
        f.Parent=parent
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=f
        
        local l=Instance.new("TextLabel")
        l.Size=UDim2.new(.4,0,1,0)
        l.Position=UDim2.new(0,6,0,0)
        l.BackgroundTransparency=1
        l.Text=name
        l.TextColor3=Color3.fromRGB(150,170,200)
        l.Font=Enum.Font.Gotham
        l.TextSize=10
        l.Parent=f
        
        local vl=Instance.new("TextLabel")
        vl.Size=UDim2.new(0,40,1,0)
        vl.Position=UDim2.new(1,-43,0,0)
        vl.BackgroundTransparency=1
        vl.Text=tostring(def)
        vl.TextColor3=Color3.fromRGB(100,180,255)
        vl.Font=Enum.Font.GothamBold
        vl.TextSize=10
        vl.Parent=f
        
        local sb=Instance.new("TextButton")
        sb.Size=UDim2.new(.35,0,0,6)
        sb.Position=UDim2.new(.38,0,0,12)
        sb.BackgroundColor3=Color3.fromRGB(40,40,70)
        sb.Text=""
        sb.BorderSizePixel=0
        sb.Parent=f
        
        local fill=Instance.new("Frame")
        fill.Size=UDim2.new((def-min)/(max-min),0,1,0)
        fill.BackgroundColor3=Color3.fromRGB(80,140,255)
        fill.BorderSizePixel=0
        fill.Parent=sb
        
        local knob=Instance.new("Frame")
        knob.Size=UDim2.new(0,12,0,12)
        knob.Position=UDim2.new((def-min)/(max-min),-6,0,-3)
        knob.BackgroundColor3=Color3.fromRGB(255,255,255)
        knob.BorderSizePixel=0
        knob.Parent=sb
        
        sb.MouseButton1Down:Connect(function()
            local con
            con=R.RenderStepped:Connect(function()
                pcall(function()
                    if U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then
                        local rel=math.clamp((U:GetMouseLocation().X-sb.AbsolutePosition.X)/sb.AbsoluteSize.X,0,1)
                        local val=math.floor(min+(max-min)*rel)
                        S[set]=val
                        vl.Text=tostring(val)
                        fill.Size=UDim2.new(rel,0,1,0)
                        knob.Position=UDim2.new(rel,-6,0,-3)
                    else
                        con:Disconnect()
                    end
                end)
            end)
        end)
    end)
end

-- ============ FILL TABS ============
local CombatSF=TabFrames.Combat
mkToggle(CombatSF,"Aimbot",5,"Aim")
mkToggle(CombatSF,"Fling All",45,"Fl")
mkToggle(CombatSF,"Fly",85,"Fly")
mkToggle(CombatSF,"Noclip",125,"NC")
mkToggle(CombatSF,"Speed Hack",165,"SP")
mkToggle(CombatSF,"God Mode",205,"GM")
mkToggle(CombatSF,"Kill Aura",245,"KA")
mkToggle(CombatSF,"Reach",285,"Reach")
mkToggle(CombatSF,"Spin",325,"Spin")
mkToggle(CombatSF,"Bunny Hop",365,"BunnyHop")
mkToggle(CombatSF,"Anti-Fling",405,"AntiFling")
mkSlider(CombatSF,"Aim Radius",450,100,2000,500,"AimRadius")
mkSlider(CombatSF,"Fling Power",485,1,50,15,"FlPower")
mkSlider(CombatSF,"Reach Dist",520,5,50,20,"ReachDist")
mkSlider(CombatSF,"Speed Mul",555,1,10,2,"SPMul")
mkSlider(CombatSF,"Spin Speed",590,1,50,10,"SpinSpeed")
CombatSF.CanvasSize=UDim2.new(0,0,0,630)

local VisualSF=TabFrames.Visual
mkToggle(VisualSF,"ESP",5,"ESP")
mkToggle(VisualSF,"Innocent ESP",45,"InnESP")
mkToggle(VisualSF,"Murderer ESP",85,"MurESP")
mkToggle(VisualSF,"Sheriff ESP",125,"ShESP")
mkToggle(VisualSF,"Tracers",165,"Tr")
mkToggle(VisualSF,"Chams",205,"Ch")
mkToggle(VisualSF,"X-Ray",245,"XRay")
VisualSF.CanvasSize=UDim2.new(0,0,0,290)

local FlingSF=TabFrames.Fling
local PlayerList=Instance.new("ScrollingFrame")
PlayerList.Size=UDim2.new(1,-8,0,380)
PlayerList.Position=UDim2.new(0,4,0,5)
PlayerList.BackgroundColor3=Color3.fromRGB(25,25,45)
PlayerList.BorderSizePixel=0
PlayerList.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=PlayerList

local function RefreshList()
    pcall(function()
        for _,c in pairs(PlayerList:GetChildren())do
            if c:IsA("TextButton")then c:Destroy()end
        end
        local y=0
        for _,p in pairs(P:GetPlayers())do
            if p~=L then
                local b=Instance.new("TextButton")
                b.Size=UDim2.new(1,-8,0,30)
                b.Position=UDim2.new(0,4,0,y)
                b.BackgroundColor3=Color3.fromRGB(35,35,60)
                b.Text=p.Name
                b.TextColor3=Color3.fromRGB(200,220,255)
                b.Font=Enum.Font.GothamBold
                b.TextSize=11
                b.Parent=PlayerList
                Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=b
                b.MouseButton1Click:Connect(function()
                    pcall(function()
                        if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                            local hrp=p.Character.HumanoidRootPart
                            hrp.CFrame=hrp.CFrame+Vector3.new(0,50,0)
                            hrp.Velocity=Vector3.new(math.random(-5000,5000),10000,math.random(-5000,5000))
                            hrp.RotVelocity=Vector3.new(math.random(-500,500),math.random(-500,500),math.random(-500,500))
                            task.delay(.5,function()
                                pcall(function()
                                    if p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                                        p.Character.HumanoidRootPart.CFrame=CFrame.new(0,-1000,0)
                                    end
                                end)
                            end)
                        end
                    end)
                end)
                y+=35
            end
        end
        PlayerList.CanvasSize=UDim2.new(0,0,0,y)
    end)
end
RefreshList()

local RefreshBtn=Instance.new("TextButton")
RefreshBtn.Size=UDim2.new(1,-8,0,28)
RefreshBtn.Position=UDim2.new(0,4,0,390)
RefreshBtn.BackgroundColor3=Color3.fromRGB(35,35,60)
RefreshBtn.Text="Refresh"
RefreshBtn.TextColor3=Color3.fromRGB(200,220,255)
RefreshBtn.Font=Enum.Font.GothamBold
RefreshBtn.TextSize=11
RefreshBtn.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=RefreshBtn
RefreshBtn.MouseButton1Click:Connect(RefreshList)
FlingSF.CanvasSize=UDim2.new(0,0,0,425)

local WorldSF=TabFrames.World
local function mkBtn(parent,name,y,cb)
    pcall(function()
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(1,-8,0,36)
        b.Position=UDim2.new(0,4,0,y)
        b.BackgroundColor3=Color3.fromRGB(60,100,200)
        b.Text=name
        b.TextColor3=Color3.fromRGB(255,255,255)
        b.Font=Enum.Font.GothamBold
        b.TextSize=11
        b.Parent=parent
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
        b.MouseButton1Click:Connect(cb)
    end)
end
mkBtn(WorldSF,"Teleport Lobby",5,function()
    pcall(function()
        local lobby=workspace:FindFirstChild("Lobby")or workspace:FindFirstChild("Spawn")
        if lobby and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            L.Character.HumanoidRootPart.CFrame=lobby.CFrame+Vector3.new(0,10,0)
        end
    end)
end)
mkBtn(WorldSF,"Teleport Map",45,function()
    pcall(function()
        local map=workspace:FindFirstChild("Map")or workspace:FindFirstChild("Arena")
        if map and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            L.Character.HumanoidRootPart.CFrame=map.CFrame+Vector3.new(0,10,0)
        end
    end)
end)
WorldSF.CanvasSize=UDim2.new(0,0,0,85)

local SettingsSF=TabFrames.Settings
mkToggle(SettingsSF,"Auto Farm",5,"AutoFarm")
mkSlider(SettingsSF,"Farm Speed",45,1,10,1,"FarmSpeed")
mkToggle(SettingsSF,"Anti AFK",85,"AntiAFK")
mkToggle(SettingsSF,"Inf Jump",125,"InfJump")
mkToggle(SettingsSF,"No Fall",165,"NoFall")
SettingsSF.CanvasSize=UDim2.new(0,0,0,210)

-- ============ INIT ============
TabFrames.Combat.Visible=true
Tabs.Combat.BackgroundColor3=Color3.fromRGB(60,100,200)
Tabs.Combat.TextColor3=Color3.fromRGB(255,255,255)

-- ============ LOGIC ============
local EspHighlights={}

local function getRole(p)
    pcall(function()
        local bp=p:FindFirstChild("Backpack")
        if bp then
            if bp:FindFirstChild("Knife")then return"Murderer"end
            if bp:FindFirstChild("Gun")then return"Sheriff"end
        end
        if p.Character then
            if p.Character:FindFirstChild("Knife")then return"Murderer"end
            if p.Character:FindFirstChild("Gun")or p.Character:FindFirstChild("Pistol")then return"Sheriff"end
        end
    end)
    return"Innocent"
end

local PlayersCache={}
task.spawn(function()
    while true do
        pcall(function()PlayersCache=P:GetPlayers()end)
        task.wait(1)
    end
end)

U.InputBegan:Connect(function(input,gameProcessed)
    if gameProcessed then return end
    if input.KeyCode==Enum.KeyCode.LeftAlt then
        M.Visible=not M.Visible
    elseif input.KeyCode==Enum.KeyCode.LeftControl then
        S.Aim=not S.Aim
    elseif input.KeyCode==Enum.KeyCode.F then
        S.Fl=not S.Fl
    elseif input.KeyCode==Enum.KeyCode.G then
        S.Fly=not S.Fly
    elseif input.KeyCode==Enum.KeyCode.N then
        S.NC=not S.NC
    elseif input.KeyCode==Enum.KeyCode.E then
        S.ESP=not S.ESP
    end
end)

R.RenderStepped:Connect(function()
    pcall(function()
        local players=PlayersCache
        
        if S.ESP or S.InnESP or S.MurESP or S.ShESP then
            for _,p in pairs(players)do
                if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                    local role=getRole(p)
                    local show=false
                    local color=S.ESPColor
                    if S.ESP then show=true end
                    if role=="Innocent"and S.InnESP then show=true;color=Color3.fromRGB(0,255,100)end
                    if role=="Murderer"and S.MurESP then show=true;color=Color3.fromRGB(255,50,50)end
                    if role=="Sheriff"and S.ShESP then show=true;color=Color3.fromRGB(50,100,255)end
                    
                    if show then
                        local existing=EspHighlights[p]
                        if not existing or not existing.Parent then
                            existing=Instance.new("Highlight")
                            existing.FillColor=color
                            existing.FillTransparency=.5
                            existing.Parent=p.Character
                            EspHighlights[p]=existing
                        else
                            existing.FillColor=color
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
            end
            EspHighlights={}
        end
        
        if S.Ch then
            for _,p in pairs(players)do
                if p~=L and p.Character then
                    for _,v in pairs(p.Character:GetChildren())do
                        if v:IsA("BasePart")then
                            v.Material=Enum.Material.ForceField
                            v.LocalTransparencyModifier=0.3
                        end
                    end
                end
            end
        end
        
        if S.XRay then
            for _,v in pairs(workspace:GetDescendants())do
                if v:IsA("BasePart")then v.LocalTransparencyModifier=.4 end
            end
        else
            for _,v in pairs(workspace:GetDescendants())do
                if v:IsA("BasePart")and v.LocalTransparencyModifier==.4 then v.LocalTransparencyModifier=0 end
            end
        end
        
        if L.Character and L.Character:FindFirstChild("Humanoid")then
            if S.SP then
                L.Character.Humanoid.WalkSpeed=16*S.SPMul
            elseif not S.BunnyHop then
                L.Character.Humanoid.WalkSpeed=16
            end
        end
        
        if S.BunnyHop and L.Character and L.Character:FindFirstChild("Humanoid")then
            local hum=L.Character.Humanoid
            if U:IsKeyDown(Enum.KeyCode.Space)and hum.FloorMaterial~=Enum.Material.Air then
                hum:ChangeState(Enum.HumanoidStateType.Jumping)
                hum.WalkSpeed=hum.WalkSpeed+2
            end
        end
        
        if S.Fly and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            local hrp=L.Character.HumanoidRootPart
            local dir=Vector3.new(0,0,0)
            if U:IsKeyDown(Enum.KeyCode.W)then dir+=C.CFrame.LookVector end
            if U:IsKeyDown(Enum.KeyCode.S)then dir-=C.CFrame.LookVector end
            if U:IsKeyDown(Enum.KeyCode.A)then dir-=C.CFrame.RightVector end
            if U:IsKeyDown(Enum.KeyCode.D)then dir+=C.CFrame.RightVector end
            if U:IsKeyDown(Enum.KeyCode.Space)then dir+=Vector3.new(0,1,0)end
            if U:IsKeyDown(Enum.KeyCode.LeftShift)then dir-=Vector3.new(0,1,0)end
            hrp.Velocity=dir*S.FlySpeed
        end
        
        if S.Spin and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            L.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(S.SpinSpeed),0)
        end
        
        if S.NC and L.Character then
            for _,v in pairs(L.Character:GetDescendants())do
                if v:IsA("BasePart")then v.CanCollide=false end
            end
        end
        
        if S.Fl then
            for _,p in pairs(players)do
                if p~=L and p.Character and p.Character:FindFirstChild("HumanoidRootPart")then
                    p.Character.HumanoidRootPart.Velocity=Vector3.new(math.random(-5000,5000),5000,math.random(-5000,5000))
                end
            end
        end
        
        if S.AntiFling and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            if L.Character.HumanoidRootPart.Velocity.Magnitude>150 then
                L.Character.HumanoidRootPart.Velocity=Vector3.new(0,0,0)
            end
        end
        
        if S.Aim and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            local closest=nil
            local minDist=S.AimRadius
            for _,p in pairs(players)do
                if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                    local d=(L.Character.HumanoidRootPart.Position-p.Character.Head.Position).Magnitude
                    if d<minDist then minDist=d closest=p end
                end
            end
            if closest and closest.Character and closest.Character:FindFirstChild("Head")then
                C.CFrame=CFrame.new(C.CFrame.Position,closest.Character.Head.Position)
            end
        end
        
        if S.GM and L.Character and L.Character:FindFirstChild("Humanoid")then
            L.Character.Humanoid.MaxHealth=math.huge
            L.Character.Humanoid.Health=math.huge
        end
        
        if S.KA and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            for _,p in pairs(players)do
                if p~=L and p.Character and p.Character:FindFirstChild("Humanoid")and p.Character:FindFirstChild("HumanoidRootPart")then
                    if (L.Character.HumanoidRootPart.Position-p.Character.HumanoidRootPart.Position).Magnitude<=S.KARadius then
                        p.Character.Humanoid.Health-=S.KADamage
                    end
                end
            end
        end
        
        if S.Reach and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            for _,p in pairs(players)do
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
            VU:Button2Down(Vector2.new(0,0),C.CFrame)
            task.wait(.1)
            VU:Button2Up(Vector2.new(0,0),C.CFrame)
        end
        
        if S.AutoFarm and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            L.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame+Vector3.new(0,0,S.FarmSpeed)
        end
    end)
end)

-- ============ INTRO ANIMATION ============
task.spawn(function()
    pcall(function()
        T:Create(IntroBG,TweenInfo.new(.5),{BackgroundTransparency=0}):Play()
        task.wait(.2)
        T:Create(FixedText,TweenInfo.new(.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{TextTransparency=0}):Play()
        task.wait(.2)
        T:Create(TitleText,TweenInfo.new(.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{TextTransparency=0}):Play()
        task.wait(.3)
        T:Create(Line,TweenInfo.new(.5),{Size=UDim2.new(0,300,0,3),Position=UDim2.new(.5,-150,.5,40)}):Play()
        task.wait(.2)
        T:Create(BetaText,TweenInfo.new(.4),{TextTransparency=0}):Play()
        task.wait(.2)
        T:Create(VerText,TweenInfo.new(.4),{TextTransparency=0}):Play()
        task.wait(.2)
        T:Create(ProgF,TweenInfo.new(.2),{BackgroundTransparency=0}):Play()
        T:Create(ProgFill,TweenInfo.new(.8),{Size=UDim2.new(1,0,1,0)}):Play()
        task.wait(1)
        T:Create(FixedText,TweenInfo.new(.2),{TextTransparency=1}):Play()
        T:Create(TitleText,TweenInfo.new(.3),{TextTransparency=1}):Play()
        T:Create(Line,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,3),Position=UDim2.new(.5,0,.5,40)}):Play()
        T:Create(BetaText,TweenInfo.new(.2),{TextTransparency=1}):Play()
        T:Create(VerText,TweenInfo.new(.2),{TextTransparency=1}):Play()
        T:Create(ProgF,TweenInfo.new(.2),{BackgroundTransparency=1}):Play()
        T:Create(IntroBG,TweenInfo.new(.4),{BackgroundTransparency=1}):Play()
        task.wait(.4)
        Intro:Destroy()
        G.Enabled=true
        T:Create(M,TweenInfo.new(.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0,Position=UDim2.new(.5,-225,.5,-240)}):Play()
    end)
end)

Notify("Syphix v36 loaded!")
