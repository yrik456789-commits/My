-- SYPHIX HUB | Launcher v8 | MM2 Panel 524x524 with Combat Submenus
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

-- ============ ЛАУНЧЕР ============
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

local Header=Instance.new("Frame")
Header.Size=UDim2.new(1,0,0,60)
Header.BackgroundColor3=Color3.fromRGB(18,18,35)
Header.BorderSizePixel=0
Header.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=Header

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(0,200,0,25)
Title.Position=UDim2.new(0,15,0,10)
Title.BackgroundTransparency=1
Title.Text="SYPHIX HUB"
Title.TextColor3=Color3.fromRGB(255,255,255)
Title.Font=Enum.Font.GothamBlack
Title.TextSize=16
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.Parent=Header

local Content=Instance.new("ScrollingFrame")
Content.Size=UDim2.new(1,-20,1,-75)
Content.Position=UDim2.new(0,10,0,65)
Content.BackgroundTransparency=1
Content.BorderSizePixel=0
Content.ScrollBarThickness=3
Content.Parent=M

local Scripts={
    {Name="Murder Mystery 2",Icon="[M]",Color=Color3.fromRGB(255,80,80)},
    {Name="+1 Speed",Icon="[S]",Color=Color3.fromRGB(80,180,255)},
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
                -- Закрываем лаунчер
                T:Create(M,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
                task.wait(.3)
                M.Visible=false
                
                -- Ждём 5 секунд
                Notify("Loading MM2...")
                task.wait(5)
                
                -- Открываем MM2 панель 524x524
                OpenMM2Panel()
            end
        end)
    end)
end

Content.CanvasSize=UDim2.new(0,0,0,#Scripts*50+5)

-- ============ MM2 ПАНЕЛЬ 524x524 ============
local MM2Panel=Instance.new("Frame")
MM2Panel.Size=UDim2.new(0,0,0,0)
MM2Panel.Position=UDim2.new(.5,-262,.5,-262)
MM2Panel.BackgroundColor3=Color3.fromRGB(12,12,25)
MM2Panel.BorderSizePixel=0
MM2Panel.BackgroundTransparency=1
MM2Panel.ClipsDescendants=true
MM2Panel.Visible=false
MM2Panel.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=MM2Panel

local MM2Header=Instance.new("Frame")
MM2Header.Size=UDim2.new(1,0,0,50)
MM2Header.BackgroundColor3=Color3.fromRGB(18,18,35)
MM2Header.BorderSizePixel=0
MM2Header.Parent=MM2Panel
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=MM2Header

local MM2Title=Instance.new("TextLabel")
MM2Title.Size=UDim2.new(0,250,0,30)
MM2Title.Position=UDim2.new(0,15,0,10)
MM2Title.BackgroundTransparency=1
MM2Title.Text="SYPHIX MM2"
MM2Title.TextColor3=Color3.fromRGB(255,100,100)
MM2Title.Font=Enum.Font.GothamBlack
MM2Title.TextSize=15
MM2Title.TextXAlignment=Enum.TextXAlignment.Left
MM2Title.Parent=MM2Header

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

-- Вкладки MM2
local MM2Tabs=Instance.new("Frame")
MM2Tabs.Size=UDim2.new(0,120,1,-50)
MM2Tabs.Position=UDim2.new(0,0,0,50)
MM2Tabs.BackgroundColor3=Color3.fromRGB(15,15,28)
MM2Tabs.BorderSizePixel=0
MM2Tabs.Parent=MM2Panel

local MM2Content=Instance.new("Frame")
MM2Content.Size=UDim2.new(1,-130,1,-60)
MM2Content.Position=UDim2.new(0,125,0,55)
MM2Content.BackgroundTransparency=1
MM2Content.Parent=MM2Panel

local MM2TabFrames={}
local MM2TabButtons={}
local MM2TabNames={"Combat","Visual","Fling","Others"}

for i=1,4 do
    local name=MM2TabNames[i]
    pcall(function()
        local SF=Instance.new("ScrollingFrame")
        SF.Size=UDim2.new(1,0,1,0)
        SF.BackgroundTransparency=1
        SF.BorderSizePixel=0
        SF.ScrollBarThickness=2
        SF.Visible=false
        SF.Parent=MM2Content
        MM2TabFrames[name]=SF
        
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(1,-10,0,50)
        b.Position=UDim2.new(0,5,0,5+(i-1)*55)
        b.BackgroundColor3=Color3.fromRGB(20,20,38)
        b.Text=name
        b.TextColor3=Color3.fromRGB(120,140,180)
        b.Font=Enum.Font.GothamBold
        b.TextSize=11
        b.Parent=MM2Tabs
        Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
        
        b.MouseButton1Click:Connect(function()
            for n,btn in pairs(MM2TabButtons)do
                btn.BackgroundColor3=n==name and Color3.fromRGB(60,100,200)or Color3.fromRGB(20,20,38)
                btn.TextColor3=n==name and Color3.fromRGB(255,255,255)or Color3.fromRGB(120,140,180)
            end
            for n,f in pairs(MM2TabFrames)do
                f.Visible=n==name
            end
        end)
        MM2TabButtons[name]=b
    end)
end

-- ============ COMBAT TAB ============
local CombatSF=MM2TabFrames.Combat

-- Aimbot с подменю
local AimbotState=false
local AimbotOpen=false

local AimbotFrame=Instance.new("Frame")
AimbotFrame.Size=UDim2.new(1,-10,0,40)
AimbotFrame.Position=UDim2.new(0,5,0,5)
AimbotFrame.BackgroundColor3=Color3.fromRGB(20,20,38)
AimbotFrame.BorderSizePixel=0
AimbotFrame.Parent=CombatSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=AimbotFrame

local AimbotLabel=Instance.new("TextLabel")
AimbotLabel.Size=UDim2.new(.55,0,1,0)
AimbotLabel.Position=UDim2.new(0,10,0,0)
AimbotLabel.BackgroundTransparency=1
AimbotLabel.Text="Aimbot"
AimbotLabel.TextColor3=Color3.fromRGB(200,220,255)
AimbotLabel.Font=Enum.Font.Gotham
AimbotLabel.TextSize=12
AimbotLabel.Parent=AimbotFrame

local AimbotToggle=Instance.new("TextButton")
AimbotToggle.Size=UDim2.new(0,55,0,25)
AimbotToggle.Position=UDim2.new(1,-100,0,7)
AimbotToggle.BackgroundColor3=Color3.fromRGB(40,40,70)
AimbotToggle.Text="OFF"
AimbotToggle.TextColor3=Color3.fromRGB(150,170,200)
AimbotToggle.Font=Enum.Font.GothamBold
AimbotToggle.TextSize=9
AimbotToggle.Parent=AimbotFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=AimbotToggle

local AimbotExpand=Instance.new("TextButton")
AimbotExpand.Size=UDim2.new(0,25,0,25)
AimbotExpand.Position=UDim2.new(1,-35,0,7)
AimbotExpand.BackgroundColor3=Color3.fromRGB(60,100,200)
AimbotExpand.Text=">"
AimbotExpand.TextColor3=Color3.fromRGB(255,255,255)
AimbotExpand.Font=Enum.Font.GothamBold
AimbotExpand.TextSize=12
AimbotExpand.Parent=AimbotFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=AimbotExpand

-- Подменю Aimbot
local AimbotSubmenu=Instance.new("Frame")
AimbotSubmenu.Size=UDim2.new(1,-10,0,0)
AimbotSubmenu.Position=UDim2.new(0,5,0,48)
AimbotSubmenu.BackgroundColor3=Color3.fromRGB(25,25,45)
AimbotSubmenu.BorderSizePixel=0
AimbotSubmenu.ClipsDescendants=true
AimbotSubmenu.Parent=CombatSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=AimbotSubmenu

local AimbotInfoLabel=Instance.new("TextLabel")
AimbotInfoLabel.Size=UDim2.new(1,0,0,25)
AimbotInfoLabel.Position=UDim2.new(0,5,0,5)
AimbotInfoLabel.BackgroundTransparency=1
AimbotInfoLabel.Text="Always targets Murderer"
AimbotInfoLabel.TextColor3=Color3.fromRGB(255,100,100)
AimbotInfoLabel.Font=Enum.Font.Gotham
AimbotInfoLabel.TextSize=11
AimbotInfoLabel.Parent=AimbotSubmenu

-- Радиус слайдер
local RadiusLabel=Instance.new("TextLabel")
RadiusLabel.Size=UDim2.new(1,0,0,20)
RadiusLabel.Position=UDim2.new(0,5,0,35)
RadiusLabel.BackgroundTransparency=1
RadiusLabel.Text="Radius: 500"
RadiusLabel.TextColor3=Color3.fromRGB(150,170,200)
RadiusLabel.Font=Enum.Font.Gotham
RadiusLabel.TextSize=10
RadiusLabel.Parent=AimbotSubmenu

local RadiusSlider=Instance.new("TextButton")
RadiusSlider.Size=UDim2.new(1,-20,0,8)
RadiusSlider.Position=UDim2.new(0,10,0,55)
RadiusSlider.BackgroundColor3=Color3.fromRGB(40,40,70)
RadiusSlider.Text=""
RadiusSlider.BorderSizePixel=0
RadiusSlider.Parent=AimbotSubmenu
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=RadiusSlider

local RadiusFill=Instance.new("Frame")
RadiusFill.Size=UDim2.new(0.4,0,1,0)
RadiusFill.BackgroundColor3=Color3.fromRGB(255,80,80)
RadiusFill.BorderSizePixel=0
RadiusFill.Parent=RadiusSlider
Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=RadiusFill

AimbotExpand.MouseButton1Click:Connect(function()
    AimbotOpen=not AimbotOpen
    if AimbotOpen then
        T:Create(AimbotSubmenu,TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(1,-10,0,70)}):Play()
        AimbotExpand.Text="v"
    else
        T:Create(AimbotSubmenu,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(1,-10,0,0)}):Play()
        AimbotExpand.Text=">"
    end
end)

AimbotToggle.MouseButton1Click:Connect(function()
    AimbotState=not AimbotState
    AimbotToggle.BackgroundColor3=AimbotState and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
    AimbotToggle.Text=AimbotState and"ON"or"OFF"
end)

-- Kill All с белым списком
local KillAllState=false
local KillAllOpen=false
local Whitelist={}

local KillAllFrame=Instance.new("Frame")
KillAllFrame.Size=UDim2.new(1,-10,0,40)
KillAllFrame.Position=UDim2.new(0,5,0,125)
KillAllFrame.BackgroundColor3=Color3.fromRGB(20,20,38)
KillAllFrame.BorderSizePixel=0
KillAllFrame.Parent=CombatSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=KillAllFrame

local KillAllLabel=Instance.new("TextLabel")
KillAllLabel.Size=UDim2.new(.55,0,1,0)
KillAllLabel.Position=UDim2.new(0,10,0,0)
KillAllLabel.BackgroundTransparency=1
KillAllLabel.Text="Kill All"
KillAllLabel.TextColor3=Color3.fromRGB(200,220,255)
KillAllLabel.Font=Enum.Font.Gotham
KillAllLabel.TextSize=12
KillAllLabel.Parent=KillAllFrame

local KillAllToggle=Instance.new("TextButton")
KillAllToggle.Size=UDim2.new(0,55,0,25)
KillAllToggle.Position=UDim2.new(1,-100,0,7)
KillAllToggle.BackgroundColor3=Color3.fromRGB(40,40,70)
KillAllToggle.Text="OFF"
KillAllToggle.TextColor3=Color3.fromRGB(150,170,200)
KillAllToggle.Font=Enum.Font.GothamBold
KillAllToggle.TextSize=9
KillAllToggle.Parent=KillAllFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=KillAllToggle

local KillAllExpand=Instance.new("TextButton")
KillAllExpand.Size=UDim2.new(0,25,0,25)
KillAllExpand.Position=UDim2.new(1,-35,0,7)
KillAllExpand.BackgroundColor3=Color3.fromRGB(60,100,200)
KillAllExpand.Text=">"
KillAllExpand.TextColor3=Color3.fromRGB(255,255,255)
KillAllExpand.Font=Enum.Font.GothamBold
KillAllExpand.TextSize=12
KillAllExpand.Parent=KillAllFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=KillAllExpand

-- Подменю Kill All (белый список)
local KillAllSubmenu=Instance.new("Frame")
KillAllSubmenu.Size=UDim2.new(1,-10,0,0)
KillAllSubmenu.Position=UDim2.new(0,5,0,168)
KillAllSubmenu.BackgroundColor3=Color3.fromRGB(25,25,45)
KillAllSubmenu.BorderSizePixel=0
KillAllSubmenu.ClipsDescendants=true
KillAllSubmenu.Parent=CombatSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=KillAllSubmenu

local WhitelistLabel=Instance.new("TextLabel")
WhitelistLabel.Size=UDim2.new(1,0,0,25)
WhitelistLabel.Position=UDim2.new(0,5,0,5)
WhitelistLabel.BackgroundTransparency=1
WhitelistLabel.Text="Whitelist (won't be killed):"
WhitelistLabel.TextColor3=Color3.fromRGB(200,220,255)
WhitelistLabel.Font=Enum.Font.GothamBold
WhitelistLabel.TextSize=10
WhitelistLabel.Parent=KillAllSubmenu

local WhitelistScrolling=Instance.new("ScrollingFrame")
WhitelistScrolling.Size=UDim2.new(1,-10,0,200)
WhitelistScrolling.Position=UDim2.new(0,5,0,32)
WhitelistScrolling.BackgroundColor3=Color3.fromRGB(18,18,30)
WhitelistScrolling.BorderSizePixel=0
WhitelistScrolling.Parent=KillAllSubmenu
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=WhitelistScrolling

local function RefreshWhitelist()
    pcall(function()
        for _,c in pairs(WhitelistScrolling:GetChildren())do
            if c:IsA("TextButton")then c:Destroy()end
        end
        local y=0
        for _,p in pairs(P:GetPlayers())do
            if p~=L then
                local isWhite=Whitelist[p.Name]
                local b=Instance.new("TextButton")
                b.Size=UDim2.new(1,-10,0,28)
                b.Position=UDim2.new(0,5,0,y)
                b.BackgroundColor3=isWhite and Color3.fromRGB(50,200,100)or Color3.fromRGB(30,30,50)
                b.Text=p.Name
                b.TextColor3=isWhite and Color3.fromRGB(15,15,25)or Color3.fromRGB(200,220,255)
                b.Font=Enum.Font.GothamBold
                b.TextSize=10
                b.Parent=WhitelistScrolling
                Instance.new("UICorner").CornerRadius=UDim.new(0,4)Instance.new("UICorner").Parent=b
                
                b.MouseButton1Click:Connect(function()
                    if Whitelist[p.Name]then
                        Whitelist[p.Name]=nil
                    else
                        Whitelist[p.Name]=true
                    end
                    RefreshWhitelist()
                end)
                y+=32
            end
        end
        WhitelistScrolling.CanvasSize=UDim2.new(0,0,0,y)
    end)
end
RefreshWhitelist()

KillAllExpand.MouseButton1Click:Connect(function()
    KillAllOpen=not KillAllOpen
    if KillAllOpen then
        T:Create(KillAllSubmenu,TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(1,-10,0,240)}):Play()
        KillAllExpand.Text="v"
        RefreshWhitelist()
    else
        T:Create(KillAllSubmenu,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(1,-10,0,0)}):Play()
        KillAllExpand.Text=">"
    end
end)

KillAllToggle.MouseButton1Click:Connect(function()
    KillAllState=not KillAllState
    KillAllToggle.BackgroundColor3=KillAllState and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
    KillAllToggle.Text=KillAllState and"ON"or"OFF"
    Notify("Kill All: "..(KillAllState and"ON"or"OFF"))
end)

CombatSF.CanvasSize=UDim2.new(0,0,0,420)

-- ============ VISUAL TAB (пустая) ============
local VisualSF=MM2TabFrames.Visual
local VisualPlaceholder=Instance.new("TextLabel")
VisualPlaceholder.Size=UDim2.new(1,0,0,30)
VisualPlaceholder.Position=UDim2.new(0,0,0,10)
VisualPlaceholder.BackgroundTransparency=1
VisualPlaceholder.Text="Visual functions coming soon"
VisualPlaceholder.TextColor3=Color3.fromRGB(100,100,150)
VisualPlaceholder.Font=Enum.Font.Gotham
VisualPlaceholder.TextSize=12
VisualPlaceholder.Parent=VisualSF

-- ============ FLING TAB (пустая) ============
local FlingSF=MM2TabFrames.Fling
local FlingPlaceholder=Instance.new("TextLabel")
FlingPlaceholder.Size=UDim2.new(1,0,0,30)
FlingPlaceholder.Position=UDim2.new(0,0,0,10)
FlingPlaceholder.BackgroundTransparency=1
FlingPlaceholder.Text="Fling functions coming soon"
FlingPlaceholder.TextColor3=Color3.fromRGB(100,100,150)
FlingPlaceholder.Font=Enum.Font.Gotham
FlingPlaceholder.TextSize=12
FlingPlaceholder.Parent=FlingSF

-- ============ OTHERS TAB (пустая) ============
local OthersSF=MM2TabFrames.Others
local OthersPlaceholder=Instance.new("TextLabel")
OthersPlaceholder.Size=UDim2.new(1,0,0,30)
OthersPlaceholder.Position=UDim2.new(0,0,0,10)
OthersPlaceholder.BackgroundTransparency=1
OthersPlaceholder.Text="Other functions coming soon"
OthersPlaceholder.TextColor3=Color3.fromRGB(100,100,150)
OthersPlaceholder.Font=Enum.Font.Gotham
OthersPlaceholder.TextSize=12
OthersPlaceholder.Parent=OthersSF

-- Инициализация вкладок
MM2TabFrames.Combat.Visible=true
MM2TabButtons.Combat.BackgroundColor3=Color3.fromRGB(60,100,200)
MM2TabButtons.Combat.TextColor3=Color3.fromRGB(255,255,255)

-- ============ Функции открытия ============
function OpenMM2Panel()
    MM2Panel.Visible=true
    MM2Panel.Size=UDim2.new(0,0,0,0)
    MM2Panel.BackgroundTransparency=1
    T:Create(MM2Panel,TweenInfo.new(.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size=UDim2.new(0,524,0,524),
        BackgroundTransparency=0,
        Position=UDim2.new(.5,-262,.5,-262)
    }):Play()
end

MM2CloseBtn.MouseButton1Click:Connect(function()
    T:Create(MM2Panel,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1,Position=UDim2.new(.5,0,.5,0)}):Play()
    task.wait(.3)
    MM2Panel.Visible=false
end)

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
    end
end)

-- Открытие лаунчера
local launcherOpen=false
local function ToggleLauncher()
    launcherOpen=not launcherOpen
    if launcherOpen then
        M.Visible=true
        M.Size=UDim2.new(0,0,0,0)
        T:Create(M,TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,300,0,180),BackgroundTransparency=0}):Play()
        TopBarArrow.Text="^"
    else
        T:Create(M,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
        TopBarArrow.Text="v"
        task.wait(.3)
        M.Visible=false
    end
end

TopBarArrow.MouseButton1Click:Connect(ToggleLauncher)
TopBarText.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 and not draggingBar then
        ToggleLauncher()
    end
end)

Notify("SYPHIX HUB loaded!")
