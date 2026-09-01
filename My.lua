-- SYPHIX HUB | Launcher v6 | MM2 Panel + Fixed Execute
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer
local VU=game:GetService("VirtualUser")

local function GetHui()
    pcall(function()if gethui then return gethui()end end)
    pcall(function()if syn and syn.protect_gui then return game.CoreGui end end)
    return game.CoreGui
end

local function Notify(text)
    pcall(function()
        local N=Instance.new("TextLabel")N.Size=UDim2.new(0,220,0,35)N.Position=UDim2.new(1,240,0,15)
        N.BackgroundColor3=Color3.fromRGB(15,15,30)N.TextColor3=Color3.fromRGB(255,200,50)N.Text=text
        N.Font=Enum.Font.GothamBold N.TextSize=12 N.Parent=GetHui()
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=N
        T:Create(N,TweenInfo.new(.3),{Position=UDim2.new(1,-240,0,15)}):Play()
        task.wait(1.5)
        N:Destroy()
    end)
end

local G=Instance.new("ScreenGui")G.Name="SyphixHub"G.Parent=GetHui()

-- ============ ВЕРХНЯЯ ПАНЕЛЬ ============
local TopBar=Instance.new("Frame")
TopBar.Size=UDim2.new(0,200,0,40)
TopBar.Position=UDim2.new(.5,-100,0,10)
TopBar.BackgroundColor3=Color3.fromRGB(15,15,30)
TopBar.BorderSizePixel=0
TopBar.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=TopBar

local TopBarBorder=Instance.new("Frame")
TopBarBorder.Size=UDim2.new(1,3,1,3)
TopBarBorder.Position=UDim2.new(0,-1,0,-1)
TopBarBorder.BackgroundColor3=Color3.fromRGB(255,200,50)
TopBarBorder.BackgroundTransparency=0.7
TopBarBorder.BorderSizePixel=0
TopBarBorder.ZIndex=0
TopBarBorder.Parent=TopBar
Instance.new("UICorner").CornerRadius=UDim.new(0,13)Instance.new("UICorner").Parent=TopBarBorder
TopBar.ZIndex=1

local TopBarLogo=Instance.new("Frame")
TopBarLogo.Size=UDim2.new(0,20,0,20)
TopBarLogo.Position=UDim2.new(0,10,0,10)
TopBarLogo.BackgroundColor3=Color3.fromRGB(255,200,50)
TopBarLogo.BorderSizePixel=0
TopBarLogo.Parent=TopBar
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=TopBarLogo

local TopBarText=Instance.new("TextLabel")
TopBarText.Size=UDim2.new(0,140,0,25)
TopBarText.Position=UDim2.new(0,35,0,8)
TopBarText.BackgroundTransparency=1
TopBarText.Text="SYPHIX HUB"
TopBarText.TextColor3=Color3.fromRGB(255,255,255)
TopBarText.Font=Enum.Font.GothamBlack
TopBarText.TextSize=13
TopBarText.Parent=TopBar

local TopBarArrow=Instance.new("TextButton")
TopBarArrow.Size=UDim2.new(0,25,0,25)
TopBarArrow.Position=UDim2.new(1,-30,0,7)
TopBarArrow.BackgroundColor3=Color3.fromRGB(60,100,200)
TopBarArrow.Text="v"
TopBarArrow.TextColor3=Color3.fromRGB(255,255,255)
TopBarArrow.Font=Enum.Font.GothamBold
TopBarArrow.TextSize=12
TopBarArrow.Parent=TopBar
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=TopBarArrow

-- ============ МЕНЮ ЛАУНЧЕРА ============
local M=Instance.new("Frame")
M.Size=UDim2.new(0,0,0,0)
M.Position=UDim2.new(.5,0,0,55)
M.BackgroundColor3=Color3.fromRGB(12,12,25)
M.BorderSizePixel=0
M.BackgroundTransparency=1
M.ClipsDescendants=true
M.Visible=false
M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=M

local Border=Instance.new("Frame")
Border.Size=UDim2.new(1,4,1,4)
Border.Position=UDim2.new(0,-2,0,-2)
Border.BackgroundColor3=Color3.fromRGB(255,200,50)
Border.BackgroundTransparency=0.7
Border.BorderSizePixel=0
Border.ZIndex=0
Border.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,18)Instance.new("UICorner").Parent=Border
M.ZIndex=1

local Header=Instance.new("Frame")
Header.Size=UDim2.new(1,0,0,60)
Header.BackgroundColor3=Color3.fromRGB(18,18,35)
Header.BorderSizePixel=0
Header.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=Header
local HeaderB=Instance.new("Frame")
HeaderB.Size=UDim2.new(1,0,0,30)
HeaderB.Position=UDim2.new(0,0,0,30)
HeaderB.BackgroundColor3=Color3.fromRGB(18,18,35)
HeaderB.BorderSizePixel=0
HeaderB.Parent=Header

local Logo=Instance.new("TextLabel")
Logo.Size=UDim2.new(0,40,0,40)
Logo.Position=UDim2.new(0,15,0,10)
Logo.BackgroundColor3=Color3.fromRGB(255,200,50)
Logo.Text="S"
Logo.TextColor3=Color3.fromRGB(15,15,25)
Logo.Font=Enum.Font.GothamBlack
Logo.TextSize=24
Logo.Parent=Header
Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=Logo

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(0,200,0,25)
Title.Position=UDim2.new(0,60,0,10)
Title.BackgroundTransparency=1
Title.Text="SYPHIX HUB"
Title.TextColor3=Color3.fromRGB(255,255,255)
Title.Font=Enum.Font.GothamBlack
Title.TextSize=16
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.Parent=Header

local Sub=Instance.new("TextLabel")
Sub.Size=UDim2.new(0,200,0,18)
Sub.Position=UDim2.new(0,60,0,35)
Sub.BackgroundTransparency=1
Sub.Text="SCRIPTS"
Sub.TextColor3=Color3.fromRGB(150,150,180)
Sub.Font=Enum.Font.Gotham
Sub.TextSize=10
Sub.TextXAlignment=Enum.TextXAlignment.Left
Sub.Parent=Header

local CloseBtn=Instance.new("TextButton")
CloseBtn.Size=UDim2.new(0,26,0,26)
CloseBtn.Position=UDim2.new(1,-32,0,17)
CloseBtn.BackgroundColor3=Color3.fromRGB(255,60,60)
CloseBtn.Text="X"
CloseBtn.TextColor3=Color3.fromRGB(255,255,255)
CloseBtn.Font=Enum.Font.GothamBold
CloseBtn.TextSize=12
CloseBtn.Parent=Header
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=CloseBtn

local Content=Instance.new("ScrollingFrame")
Content.Size=UDim2.new(1,-20,1,-75)
Content.Position=UDim2.new(0,10,0,65)
Content.BackgroundTransparency=1
Content.BorderSizePixel=0
Content.ScrollBarThickness=3
Content.ScrollBarImageColor3=Color3.fromRGB(255,200,50)
Content.Parent=M

-- ============ MM2 ПАНЕЛЬ ============
local MM2Panel=Instance.new("Frame")
MM2Panel.Size=UDim2.new(0,0,0,0)
MM2Panel.Position=UDim2.new(.5,0,0,55)
MM2Panel.BackgroundColor3=Color3.fromRGB(12,12,25)
MM2Panel.BorderSizePixel=0
MM2Panel.BackgroundTransparency=1
MM2Panel.ClipsDescendants=true
MM2Panel.Visible=false
MM2Panel.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=MM2Panel

local MM2Border=Instance.new("Frame")
MM2Border.Size=UDim2.new(1,4,1,4)
MM2Border.Position=UDim2.new(0,-2,0,-2)
MM2Border.BackgroundColor3=Color3.fromRGB(255,80,80)
MM2Border.BackgroundTransparency=0.7
MM2Border.BorderSizePixel=0
MM2Border.ZIndex=0
MM2Border.Parent=MM2Panel
Instance.new("UICorner").CornerRadius=UDim.new(0,18)Instance.new("UICorner").Parent=MM2Border
MM2Panel.ZIndex=1

local MM2Header=Instance.new("Frame")
MM2Header.Size=UDim2.new(1,0,0,50)
MM2Header.BackgroundColor3=Color3.fromRGB(18,18,35)
MM2Header.BorderSizePixel=0
MM2Header.Parent=MM2Panel
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=MM2Header
local MM2HeaderB=Instance.new("Frame")
MM2HeaderB.Size=UDim2.new(1,0,0,25)
MM2HeaderB.Position=UDim2.new(0,0,0,25)
MM2HeaderB.BackgroundColor3=Color3.fromRGB(18,18,35)
MM2HeaderB.BorderSizePixel=0
MM2HeaderB.Parent=MM2Header

local MM2Title=Instance.new("TextLabel")
MM2Title.Size=UDim2.new(0,200,0,30)
MM2Title.Position=UDim2.new(0,15,0,10)
MM2Title.BackgroundTransparency=1
MM2Title.Text="MURDER MYSTERY 2"
MM2Title.TextColor3=Color3.fromRGB(255,100,100)
MM2Title.Font=Enum.Font.GothamBlack
MM2Title.TextSize=14
MM2Title.TextXAlignment=Enum.TextXAlignment.Left
MM2Title.Parent=MM2Header

local MM2BackBtn=Instance.new("TextButton")
MM2BackBtn.Size=UDim2.new(0,26,0,26)
MM2BackBtn.Position=UDim2.new(1,-58,0,12)
MM2BackBtn.BackgroundColor3=Color3.fromRGB(60,100,200)
MM2BackBtn.Text="<"
MM2BackBtn.TextColor3=Color3.fromRGB(255,255,255)
MM2BackBtn.Font=Enum.Font.GothamBold
MM2BackBtn.TextSize=14
MM2BackBtn.Parent=MM2Header
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=MM2BackBtn

local MM2CloseBtn=Instance.new("TextButton")
MM2CloseBtn.Size=UDim2.new(0,26,0,26)
MM2CloseBtn.Position=UDim2.new(1,-32,0,12)
MM2CloseBtn.BackgroundColor3=Color3.fromRGB(255,60,60)
MM2CloseBtn.Text="X"
MM2CloseBtn.TextColor3=Color3.fromRGB(255,255,255)
MM2CloseBtn.Font=Enum.Font.GothamBold
MM2CloseBtn.TextSize=12
MM2CloseBtn.Parent=MM2Header
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=MM2CloseBtn

local MM2Content=Instance.new("ScrollingFrame")
MM2Content.Size=UDim2.new(1,-20,1,-65)
MM2Content.Position=UDim2.new(0,10,0,55)
MM2Content.BackgroundTransparency=1
MM2Content.BorderSizePixel=0
MM2Content.ScrollBarThickness=3
MM2Content.ScrollBarImageColor3=Color3.fromRGB(255,80,80)
MM2Content.Parent=MM2Panel

-- Функции MM2
local MM2Functions={
    "Aimbot","ESP","Fly","Noclip","Speed Hack","God Mode","Kill Aura","Reach","Spin","Bunny Hop","Anti-Fling","Chams","X-Ray"
}

local MM2States={}

for i,funcName in pairs(MM2Functions)do
    pcall(function()
        MM2States[funcName]=false
        
        local f=Instance.new("Frame")
        f.Size=UDim2.new(1,0,0,35)
        f.Position=UDim2.new(0,0,0,(i-1)*38)
        f.BackgroundColor3=Color3.fromRGB(18,18,35)
        f.BorderSizePixel=0
        f.Parent=MM2Content
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=f
        
        local l=Instance.new("TextLabel")
        l.Size=UDim2.new(.6,0,1,0)
        l.Position=UDim2.new(0,10,0,0)
        l.BackgroundTransparency=1
        l.Text=funcName
        l.TextColor3=Color3.fromRGB(200,220,255)
        l.Font=Enum.Font.Gotham
        l.TextSize=12
        l.TextXAlignment=Enum.TextXAlignment.Left
        l.Parent=f
        
        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(0,50,0,22)
        btn.Position=UDim2.new(1,-55,0,7)
        btn.BackgroundColor3=Color3.fromRGB(40,40,70)
        btn.Text="OFF"
        btn.TextColor3=Color3.fromRGB(150,170,200)
        btn.Font=Enum.Font.GothamBold
        btn.TextSize=9
        btn.Parent=f
        Instance.new("UICorner").CornerRadius=UDim.new(0,11)Instance.new("UICorner").Parent=btn
        
        btn.MouseButton1Click:Connect(function()
            pcall(function()
                MM2States[funcName]=not MM2States[funcName]
                btn.BackgroundColor3=MM2States[funcName]and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
                btn.Text=MM2States[funcName]and"ON"or"OFF"
                Notify(funcName..": "..(MM2States[funcName]and"ON"or"OFF"))
            end)
        end)
    end)
end

MM2Content.CanvasSize=UDim2.new(0,0,0,#MM2Functions*38+5)

-- Скрипты лаунчера
local Scripts={
    {Name="Murder Mystery 2",Icon="[M]",Color=Color3.fromRGB(255,80,80)},
    {Name="+1 Speed",Icon="[S]",Color=Color3.fromRGB(80,180,255)},
    {Name="Fling Things",Icon="[F]",Color=Color3.fromRGB(80,255,150)},
    {Name="Universal ESP",Icon="[U]",Color=Color3.fromRGB(255,200,50)},
    {Name="Universal Fly",Icon="[Y]",Color=Color3.fromRGB(200,100,255)},
}

for i,script in pairs(Scripts)do
    pcall(function()
        local Card=Instance.new("TextButton")
        Card.Size=UDim2.new(1,0,0,45)
        Card.Position=UDim2.new(0,0,0,(i-1)*50)
        Card.BackgroundColor3=Color3.fromRGB(18,18,35)
        Card.Text=""
        Card.Parent=Content
        Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=Card
        
        Card.MouseEnter:Connect(function()T:Create(Card,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(25,25,50)}):Play()end)
        Card.MouseLeave:Connect(function()T:Create(Card,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(18,18,35)}):Play()end)
        
        local IconFrame=Instance.new("Frame")
        IconFrame.Size=UDim2.new(0,35,0,35)
        IconFrame.Position=UDim2.new(0,5,0,5)
        IconFrame.BackgroundColor3=script.Color
        IconFrame.BorderSizePixel=0
        IconFrame.Parent=Card
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=IconFrame
        
        local IconText=Instance.new("TextLabel")
        IconText.Size=UDim2.new(1,0,1,0)
        IconText.BackgroundTransparency=1
        IconText.Text=script.Icon
        IconText.TextColor3=Color3.fromRGB(15,15,25)
        IconText.Font=Enum.Font.GothamBlack
        IconText.TextSize=12
        IconText.Parent=IconFrame
        
        local NameText=Instance.new("TextLabel")
        NameText.Size=UDim2.new(1,-50,1,0)
        NameText.Position=UDim2.new(0,45,0,0)
        NameText.BackgroundTransparency=1
        NameText.Text=script.Name
        NameText.TextColor3=Color3.fromRGB(255,255,255)
        NameText.Font=Enum.Font.GothamBold
        NameText.TextSize=13
        NameText.TextXAlignment=Enum.TextXAlignment.Left
        NameText.Parent=Card
        
        -- Execute кнопка
        local ExecuteBtn=Instance.new("TextButton")
        ExecuteBtn.Size=UDim2.new(0,70,0,30)
        ExecuteBtn.Position=UDim2.new(1,-75,0,7)
        ExecuteBtn.BackgroundColor3=Color3.fromRGB(60,200,100)
        ExecuteBtn.Text="EXECUTE"
        ExecuteBtn.TextColor3=Color3.fromRGB(15,15,25)
        ExecuteBtn.Font=Enum.Font.GothamBlack
        ExecuteBtn.TextSize=9
        ExecuteBtn.ZIndex=2
        ExecuteBtn.Parent=Card
        Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=ExecuteBtn
        
        ExecuteBtn.MouseButton1Click:Connect(function()
            if script.Name=="Murder Mystery 2"then
                -- Открываем MM2 панель
                CloseLauncherMenu()
                task.wait(.3)
                OpenMM2Panel()
            else
                Notify("Selected: "..script.Name)
            end
        end)
    end)
end

Content.CanvasSize=UDim2.new(0,0,0,#Scripts*50+5)

-- Перетаскивание TopBar
local draggingBar=false
local barStart=nil
local barPos=nil
TopBar.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        draggingBar=true
        barStart=i.Position
        barPos=TopBar.Position
    end
end)
U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        draggingBar=false
    end
end)
U.InputChanged:Connect(function(i)
    if draggingBar and i.UserInputType==Enum.UserInputType.MouseMovement then
        local d=i.Position-barStart
        TopBar.Position=UDim2.new(barPos.X.Scale,barPos.X.Offset+d.X,barPos.Y.Scale,barPos.Y.Offset+d.Y)
        M.Position=UDim2.new(TopBar.Position.X.Scale,TopBar.Position.X.Offset-100,TopBar.Position.Y.Scale,TopBar.Position.Y.Offset+50)
        MM2Panel.Position=UDim2.new(TopBar.Position.X.Scale,TopBar.Position.X.Offset-100,TopBar.Position.Y.Scale,TopBar.Position.Y.Offset+50)
    end
end)

-- Функции открытия
local launcherOpen=false
local function ToggleLauncherMenu()
    launcherOpen=not launcherOpen
    if launcherOpen then
        M.Visible=true
        M.Size=UDim2.new(0,0,0,0)
        M.Position=UDim2.new(TopBar.Position.X.Scale,TopBar.Position.X.Offset-100,TopBar.Position.Y.Scale,TopBar.Position.Y.Offset+50)
        T:Create(M,TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,400,0,420),BackgroundTransparency=0}):Play()
        TopBarArrow.Text="^"
    else
        CloseLauncherMenu()
    end
end

function CloseLauncherMenu()
    launcherOpen=false
    T:Create(M,TweenInfo.new(.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
    TopBarArrow.Text="v"
    task.wait(.35)
    M.Visible=false
end

function OpenMM2Panel()
    MM2Panel.Visible=true
    MM2Panel.Size=UDim2.new(0,0,0,0)
    MM2Panel.Position=UDim2.new(TopBar.Position.X.Scale,TopBar.Position.X.Offset-100,TopBar.Position.Y.Scale,TopBar.Position.Y.Offset+50)
    T:Create(MM2Panel,TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,380,0,400),BackgroundTransparency=0}):Play()
end

function CloseMM2Panel()
    T:Create(MM2Panel,TweenInfo.new(.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
    task.wait(.35)
    MM2Panel.Visible=false
end

TopBarArrow.MouseButton1Click:Connect(ToggleLauncherMenu)
TopBarText.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 and not draggingBar then
        ToggleLauncherMenu()
    end
end)
CloseBtn.MouseButton1Click:Connect(CloseLauncherMenu)
MM2CloseBtn.MouseButton1Click:Connect(CloseMM2Panel)
MM2BackBtn.MouseButton1Click:Connect(function()
    CloseMM2Panel()
    task.wait(.3)
    OpenLauncherMenu()
end)

function OpenLauncherMenu()
    launcherOpen=true
    M.Visible=true
    M.Size=UDim2.new(0,0,0,0)
    M.Position=UDim2.new(TopBar.Position.X.Scale,TopBar.Position.X.Offset-100,TopBar.Position.Y.Scale,TopBar.Position.Y.Offset+50)
    T:Create(M,TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,400,0,420),BackgroundTransparency=0}):Play()
    TopBarArrow.Text="^"
end

Notify("SYPHIX HUB loaded!")
