-- SYPHIX HUB | Launcher v5 | Top Bar Integrated Menu
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer

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

-- ============ МЕНЮ (встроено в панель) ============
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
        
        Card.MouseButton1Click:Connect(function()
            Notify("Selected: "..script.Name)
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
        -- Меню следует за панелью
        M.Position=UDim2.new(TopBar.Position.X.Scale,TopBar.Position.X.Offset-100,TopBar.Position.Y.Scale,TopBar.Position.Y.Offset+50)
    end
end)

-- Открытие/закрытие меню
local menuOpen=false
local function ToggleMenu()
    menuOpen=not menuOpen
    if menuOpen then
        M.Visible=true
        M.Size=UDim2.new(0,0,0,0)
        M.Position=UDim2.new(TopBar.Position.X.Scale,TopBar.Position.X.Offset-100,TopBar.Position.Y.Scale,TopBar.Position.Y.Offset+50)
        M.BackgroundTransparency=1
        
        T:Create(M,TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
            Size=UDim2.new(0,400,0,420),
            BackgroundTransparency=0
        }):Play()
        TopBarArrow.Text="^"
    else
        T:Create(M,TweenInfo.new(.35,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{
            Size=UDim2.new(0,0,0,0),
            BackgroundTransparency=1
        }):Play()
        TopBarArrow.Text="v"
        task.wait(.35)
        M.Visible=false
    end
end

TopBarArrow.MouseButton1Click:Connect(ToggleMenu)
TopBarText.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 and not draggingBar then
        ToggleMenu()
    end
end)
CloseBtn.MouseButton1Click:Connect(ToggleMenu)

Notify("SYPHIX HUB loaded! Click on bar to open")
