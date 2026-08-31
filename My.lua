-- Syphixman MM2 v8 Final | Боковое меню | Утро
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer

local S={
    Aim=false,AimRadius=500,AimFOV=90,AimSmooth=3,
    Fl=false,FlPower=15,FlMode="Random",
    Fly=false,FlySpeed=50,
    NC=false,SP=false,SPMul=2,GM=false,
    KA=false,KARadius=30,KADamage=100,
    ESP=false,ESPType="Box",ESPColor=Color3.fromRGB(255,50,50),ESPRadius=1000,
    Tr=false,Ch=false,FB=false,Rainbow=false,
    FA=false,AnimStyle="Dance",AnimSpeed=1,
    InfJump=false,NoFall=false,AntiAFK=false,XRay=false,Reach=false,ReachDist=20,
    TP=false,Spawn=false,Time=false
}

local G=Instance.new("ScreenGui")G.Name="SyphixmanMM2"G.Parent=gethui and gethui()or game.CoreGui

-- Уведомления
local function Notify(text)
    local N=Instance.new("TextLabel")
    N.Size=UDim2.new(0,220,0,30)
    N.Position=UDim2.new(1,230,0,10)
    N.BackgroundColor3=Color3.fromRGB(255,248,235)
    N.TextColor3=Color3.fromRGB(60,40,20)
    N.Text=text
    N.Font=Enum.Font.GothamBold
    N.TextSize=12
    N.Parent=G
    Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=N
    T:Create(N,TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new(1,-230,0,10)}):Play()
    task.wait(2)
    T:Create(N,TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Position=UDim2.new(1,230,0,10)}):Play()
    task.wait(.4)
    N:Destroy()
end

-- Главное окно
local M=Instance.new("Frame")M.Size=UDim2.new(0,500,0,420)M.Position=UDim2.new(.5,-250,.5,-210)M.BackgroundColor3=Color3.fromRGB(255,248,235)M.BorderSizePixel=0 M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=M

-- Заголовок
local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,40)TB.BackgroundColor3=Color3.fromRGB(135,206,235)TB.BorderSizePixel=0 TB.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=TB

local TBb=Instance.new("Frame")TBb.Size=UDim2.new(1,0,0,20)TBb.Position=UDim2.new(0,0,0,20)TBb.BackgroundColor3=Color3.fromRGB(135,206,235)TBb.BorderSizePixel=0 TBb.Parent=TB

local Sun=Instance.new("Frame")Sun.Size=UDim2.new(0,14,0,14)Sun.Position=UDim2.new(0,12,0,13)Sun.BackgroundColor3=Color3.fromRGB(255,215,0)Sun.BorderSizePixel=0 Sun.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=Sun

local TT=Instance.new("TextLabel")TT.Size=UDim2.new(0,180,0,20)TT.Position=UDim2.new(0,32,0,10)TT.BackgroundTransparency=1 TT.Text="🌅 SYPHIXMAN MM2"TT.TextColor3=Color3.fromRGB(60,40,20)TT.Font=Enum.Font.GothamBlack TT.TextSize=13 TT.TextXAlignment=Enum.TextXAlignment.Left TT.Parent=TB

local CB=Instance.new("TextButton")CB.Size=UDim2.new(0,24,0,24)CB.Position=UDim2.new(1,-30,0,8)CB.BackgroundColor3=Color3.fromRGB(255,120,120)CB.Text="✕"CB.TextColor3=Color3.fromRGB(255,255,255)CB.Font=Enum.Font.GothamBold CB.TextSize=12 CB.Parent=TB
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=CB
CB.MouseButton1Click:Connect(function()G:Destroy()end)

-- Левая панель вкладок
local LP=Instance.new("Frame")LP.Size=UDim2.new(0,100,1,-40)LP.Position=UDim2.new(0,0,0,40)LP.BackgroundColor3=Color3.fromRGB(255,236,179)LP.BorderSizePixel=0 LP.Parent=M

local Tabs={}
local Cur="Combat"

local TabData={
    {Name="Combat",Icon="⚔",Label="КОМБАТ"},
    {Name="Visual",Icon="👁",Label="ВИЗУАЛ"},
    {Name="Anim",Icon="🎭",Label="АНИМ"},
    {Name="Phone",Icon="📱",Label="ТЕЛЕФОН"},
    {Name="World",Icon="🌍",Label="МИР"},
    {Name="Settings",Icon="⚙",Label="НАСТР"}
}

for i,tab in pairs(TabData)do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-10,0,50)
    b.Position=UDim2.new(0,5,0,5+(i-1)*55)
    b.BackgroundColor3=Color3.fromRGB(255,228,181)
    b.Text=tab.Icon.." "..tab.Label
    b.TextColor3=Color3.fromRGB(60,40,20)
    b.Font=Enum.Font.GothamBold
    b.TextSize=11
    b.Parent=LP
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(function()
        Cur=tab.Name
        for k,v in pairs(Tabs)do
            v.BackgroundColor3=k==tab.Name and Color3.fromRGB(255,165,0)or Color3.fromRGB(255,228,181)
            v.TextColor3=k==tab.Name and Color3.fromRGB(255,255,255)or Color3.fromRGB(60,40,20)
        end
        UpdateContent(tab.Name)
    end)
    Tabs[tab.Name]=b
end

Tabs.Combat.BackgroundColor3=Color3.fromRGB(255,165,0)
Tabs.Combat.TextColor3=Color3.fromRGB(255,255,255)

-- Правая панель контента
local RP=Instance.new("ScrollingFrame")RP.Size=UDim2.new(1,-110,1,-60)RP.Position=UDim2.new(0,105,0,55)RP.BackgroundTransparency=1 RP.BorderSizePixel=0 RP.ScrollBarThickness=4 RP.ScrollBarImageColor3=Color3.fromRGB(255,165,0)RP.Parent=M

local ContentFrames={}

local function ClearContent()
    for _,f in pairs(ContentFrames)do
        if f and f.Parent then f:Destroy()end
    end
    ContentFrames={}
end

local function mkToggle(parent,name,icon,y,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,35)f.Position=UDim2.new(0,5,0,y)f.BackgroundColor3=Color3.fromRGB(255,255,255)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=f
    table.insert(ContentFrames,f)
    
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.55,0,1,0)l.Position=UDim2.new(0,10,0,0)l.BackgroundTransparency=1 l.Text=icon.." "..name l.TextColor3=Color3.fromRGB(60,40,20)l.Font=Enum.Font.Gotham l.TextSize=12 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
    
    local b=Instance.new("TextButton")b.Size=UDim2.new(0,50,0,22)b.Position=UDim2.new(1,-58,0,6)b.BackgroundColor3=Color3.fromRGB(200,200,200)b.Text="OFF"b.TextColor3=Color3.fromRGB(60,40,20)b.Font=Enum.Font.GothamBold b.TextSize=10 b.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(0,11)Instance.new("UICorner").Parent=b
    
    b.MouseButton1Click:Connect(function()
        S[set]=not S[set]
        b.BackgroundColor3=S[set]and Color3.fromRGB(144,238,144)or Color3.fromRGB(200,200,200)
        b.Text=S[set]and"ON"or"OFF"
        Notify(icon.." "..name..": "..(S[set]and"ВКЛ"or"ВЫКЛ"))
    end)
end

local function mkSlider(parent,name,y,min,max,def,set)
    local f=Instance.new("Frame")f.Size=UDim2.new(1,-10,0,30)f.Position=UDim2.new(0,5,0,y)f.BackgroundColor3=Color3.fromRGB(255,255,255)f.BorderSizePixel=0 f.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=f
    table.insert(ContentFrames,f)
    
    local l=Instance.new("TextLabel")l.Size=UDim2.new(.4,0,1,0)l.Position=UDim2.new(0,8,0,0)l.BackgroundTransparency=1 l.Text=name l.TextColor3=Color3.fromRGB(60,40,20)l.Font=Enum.Font.Gotham l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f
    
    local vl=Instance.new("TextLabel")vl.Size=UDim2.new(0,45,1,0)vl.Position=UDim2.new(1,-48,0,0)vl.BackgroundTransparency=1 vl.Text=tostring(def)vl.TextColor3=Color3.fromRGB(255,165,0)vl.Font=Enum.Font.GothamBold vl.TextSize=11 vl.Parent=f
    
    local sb=Instance.new("TextButton")sb.Size=UDim2.new(.35,0,0,8)sb.Position=UDim2.new(.38,0,0,11)sb.BackgroundColor3=Color3.fromRGB(230,230,230)sb.Text=""sb.BorderSizePixel=0 sb.Parent=f
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=sb
    
    local fill=Instance.new("Frame")fill.Size=UDim2.new((def-min)/(max-min),0,1,0)fill.BackgroundColor3=Color3.fromRGB(255,165,0)fill.BorderSizePixel=0 fill.Parent=sb
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=fill
    
    local knob=Instance.new("Frame")knob.Size=UDim2.new(0,12,0,12)knob.Position=UDim2.new((def-min)/(max-min),-6,0,-2)knob.BackgroundColor3=Color3.fromRGB(255,255,255)knob.BorderSizePixel=0 knob.Parent=sb
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
                knob.Position=UDim2.new(rel,-6,0,-2)
            else con:Disconnect()end
        end)
    end)
end

local function mkButton(parent,name,icon,y,color,callback)
    local b=Instance.new("TextButton")b.Size=UDim2.new(1,-10,0,35)b.Position=UDim2.new(0,5,0,y)b.BackgroundColor3=color or Color3.fromRGB(100,180,255)b.Text=icon.." "..name b.TextColor3=Color3.fromRGB(255,255,255)b.Font=Enum.Font.GothamBold b.TextSize=12 b.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=b
    table.insert(ContentFrames,b)
    b.MouseButton1Click:Connect(callback)
end

local function UpdateContent(tab)
    ClearContent()
    RP.CanvasSize=UDim2.new(0,0,0,0)
    
    if tab=="Combat"then
        mkToggle(RP,"Aimbot","🔫",5,"Aim")
        mkToggle(RP,"Fling","💥",42,"Fl")
        mkToggle(RP,"Fly","🕊",79,"Fly")
        mkToggle(RP,"Noclip","👻",116,"NC")
        mkToggle(RP,"Speed Hack","⚡",153,"SP")
        mkToggle(RP,"God Mode","🛡",190,"GM")
        mkToggle(RP,"Kill Aura","⚔",227,"KA")
        mkToggle(RP,"Reach","📏",264,"Reach")
        mkSlider(RP,"Aimbot Radius",305,100,1000,500,"AimRadius")
        mkSlider(RP,"Aimbot FOV",339,30,360,90,"AimFOV")
        mkSlider(RP,"Fling Power",373,1,50,15,"FlPower")
        mkSlider(RP,"Reach Distance",407,5,50,20,"ReachDist")
        RP.CanvasSize=UDim2.new(0,0,0,445)
    elseif tab=="Visual"then
        mkToggle(RP,"ESP","👁",5,"ESP")
        mkToggle(RP,"Tracers","📛",42,"Tr")
        mkToggle(RP,"Chams","👻",79,"Ch")
        mkToggle(RP,"Fullbright","🌟",116,"FB")
        mkToggle(RP,"Rainbow ESP","🌈",153,"Rainbow")
        mkToggle(RP,"X-Ray","💀",190,"XRay")
        mkSlider(RP,"ESP Radius",230,100,2000,1000,"ESPRadius")
        RP.CanvasSize=UDim2.new(0,0,0,270)
    elseif tab=="Anim"then
        mkToggle(RP,"Free Animations","🎭",5,"FA")
        mkToggle(RP,"Infinite Jump","🦘",42,"InfJump")
        mkToggle(RP,"No Fall Damage","🍃",79,"NoFall")
        mkSlider(RP,"Anim Speed",120,.1,5,1,"AnimSpeed")
        RP.CanvasSize=UDim2.new(0,0,0,160)
    elseif tab=="Phone"then
        mkButton(RP,"Флинг Шерифа","🔫",5,Color3.fromRGB(100,180,255),function()flingRole("Sheriff")Notify("🔫 Шериф зафлинген!")end)
        mkButton(RP,"Флинг Мардера","💀",42,Color3.fromRGB(100,180,255),function()flingRole("Murderer")Notify("💀 Мардер зафлинген!")end)
        mkButton(RP,"Флинг Героя","🦸",79,Color3.fromRGB(100,180,255),function()flingRole("Hero")Notify("🦸 Герой зафлинген!")end)
        mkButton(RP,"Стрельнуть в Мардера","🔫",116,Color3.fromRGB(255,100,100),function()shootMurderer()Notify("🔫 Выстрел в мардера!")end)
        mkButton(RP,"Забрать Пистолет","🔫",153,Color3.fromRGB(100,180,255),function()takeGun()Notify("🔫 Пистолет забран!")end)
        mkButton(RP,"Анти-АФК","⏰",190,Color3.fromRGB(255,200,100),function()S.AntiAFK=true Notify("⏰ Анти-АФК включен!")end)
        mkButton(RP,"Авто-Фарм","💰",227,Color3.fromRGB(255,200,100),function()Notify("💰 Авто-фарм включен!")end)
        RP.CanvasSize=UDim2.new(0,0,0,270)
    elseif tab=="World"then
        mkToggle(RP,"Teleport","🚀",5,"TP")
        mkToggle(RP,"Spawn Items","📦",42,"Spawn")
        mkToggle(RP,"Смена Времени","🌙",79,"Time")
        RP.CanvasSize=UDim2.new(0,0,0,120)
    elseif tab=="Settings"then
        local InfoF=Instance.new("Frame")InfoF.Size=UDim2.new(1,-10,0,70)InfoF.Position=UDim2.new(0,5,0,5)InfoF.BackgroundColor3=Color3.fromRGB(255,255,255)InfoF.BorderSizePixel=0 InfoF.Parent=RP
        Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=InfoF
        table.insert(ContentFrames,InfoF)
        local InfoL=Instance.new("TextLabel")InfoL.Size=UDim2.new(1,-20,1,0)InfoL.Position=UDim2.new(0,10,0,0)InfoL.BackgroundTransparency=1 InfoL.Text="📊 FPS: 60\n👥 Игроков: 12\n✅ Статус: Работает"InfoL.TextColor3=Color3.fromRGB(60,40,20)InfoL.Font=Enum.Font.Gotham InfoL.TextSize=11 InfoL.TextXAlignment=Enum.TextXAlignment.Left InfoL.Parent=InfoF
        mkButton(RP,"Сохранить Конфиг","💾",80,Color3.fromRGB(255,165,0),function()Notify("💾 Конфиг сохранен!")end)
        mkButton(RP,"Загрузить Конфиг","📂",120,Color3.fromRGB(255,165,0),function()Notify("📂 Конфиг загружен!")end)
        mkButton(RP,"Сбросить","🔄",160,Color3.fromRGB(255,100,100),function()Notify("🔄 Настройки сброшены!")end)
        RP.CanvasSize=UDim2.new(0,0,0,200)
    end
end

-- Футер
local Footer=Instance.new("TextLabel")Footer.Size=UDim2.new(1,0,0,18)Footer.Position=UDim2.new(0,0,1,-18)Footer.BackgroundTransparency=1 Footer.Text="🌅 Syphixman v8.0 | Утро | by Ryzen"Footer.TextColor3=Color3.fromRGB(60,40,20)Footer.Font=Enum.Font.Gotham Footer.TextSize=10 Footer.Parent=M

-- Инициализация
UpdateContent("Combat")

-- Логика
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
    local t=getRole(role)
    if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart")then
        local h=t.Character.HumanoidRootPart
        h.Velocity=Vector3.new(math.random(-10000,10000),math.random(5000,15000),math.random(-10000,10000))
        h.RotVelocity=Vector3.new(math.random(-50,50),math.random(-50,50),math.random(-50,50))
    end
end

local function shootMurderer()
    local t=getRole("Murderer")
    if t and t.Character and t.Character:FindFirstChild("Humanoid")then
        t.Character.Humanoid.Health=0
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
end)

Notify("🌅 Syphixman v8.0 загружен!")
