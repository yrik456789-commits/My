-- SYPHIX HUB | v11 | MM2 Collapsible Bar
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
        task.wait(1.5)
        N:Destroy()
    end)
end

-- ============ СОСТОЯНИЯ ============
local ESP_Enabled=false
local ESP_Murderer=false
local ESP_Sheriff=false
local ESP_Innocent=false

local Boxes_Enabled=false
local Boxes_Murderer=false
local Boxes_Sheriff=false
local Boxes_Innocent=false

local Aimbot_Enabled=false
local KillAll_Enabled=false
local Whitelist={}
local HideKey="LeftAlt"

local EspHighlights={}
local EspBoxes={}

-- ============ ЛАУНЧЕР ============
local LG=Instance.new("ScreenGui")LG.Name="Launcher"LG.Parent=GetHui()

local TopBar=Instance.new("Frame")
TopBar.Size=UDim2.new(0,200,0,40)
TopBar.Position=UDim2.new(.5,-100,0,10)
TopBar.BackgroundColor3=Color3.fromRGB(15,15,30)
TopBar.BorderSizePixel=0
TopBar.Parent=LG
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

local LauncherMenu=Instance.new("Frame")
LauncherMenu.Size=UDim2.new(0,0,0,0)
LauncherMenu.Position=UDim2.new(.5,0,0,55)
LauncherMenu.BackgroundColor3=Color3.fromRGB(12,12,25)
LauncherMenu.BorderSizePixel=0
LauncherMenu.BackgroundTransparency=1
LauncherMenu.ClipsDescendants=true
LauncherMenu.Visible=false
LauncherMenu.Parent=LG
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=LauncherMenu

local LauncherHeader=Instance.new("Frame")
LauncherHeader.Size=UDim2.new(1,0,0,60)
LauncherHeader.BackgroundColor3=Color3.fromRGB(18,18,35)
LauncherHeader.BorderSizePixel=0
LauncherHeader.Parent=LauncherMenu
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=LauncherHeader

local LauncherTitle=Instance.new("TextLabel")
LauncherTitle.Size=UDim2.new(0,200,0,25)
LauncherTitle.Position=UDim2.new(0,15,0,10)
LauncherTitle.BackgroundTransparency=1
LauncherTitle.Text="SYPHIX HUB"
LauncherTitle.TextColor3=Color3.fromRGB(255,255,255)
LauncherTitle.Font=Enum.Font.GothamBlack
LauncherTitle.TextSize=16
LauncherTitle.TextXAlignment=Enum.TextXAlignment.Left
LauncherTitle.Parent=LauncherHeader

local LauncherContent=Instance.new("ScrollingFrame")
LauncherContent.Size=UDim2.new(1,-20,1,-75)
LauncherContent.Position=UDim2.new(0,10,0,65)
LauncherContent.BackgroundTransparency=1
LauncherContent.BorderSizePixel=0
LauncherContent.ScrollBarThickness=3
LauncherContent.Parent=LauncherMenu

-- Карточка MM2
local MM2Card=Instance.new("TextButton")
MM2Card.Size=UDim2.new(1,0,0,45)
MM2Card.Position=UDim2.new(0,0,0,5)
MM2Card.BackgroundColor3=Color3.fromRGB(18,18,35)
MM2Card.Text=""
MM2Card.Parent=LauncherContent
Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=MM2Card

local MM2Icon=Instance.new("Frame")
MM2Icon.Size=UDim2.new(0,35,0,35)
MM2Icon.Position=UDim2.new(0,5,0,5)
MM2Icon.BackgroundColor3=Color3.fromRGB(255,80,80)
MM2Icon.BorderSizePixel=0
MM2Icon.Parent=MM2Card
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=MM2Icon

local MM2IconText=Instance.new("TextLabel")
MM2IconText.Size=UDim2.new(1,0,1,0)
MM2IconText.BackgroundTransparency=1
MM2IconText.Text="[M]"
MM2IconText.TextColor3=Color3.fromRGB(15,15,25)
MM2IconText.Font=Enum.Font.GothamBlack
MM2IconText.TextSize=12
MM2IconText.Parent=MM2Icon

local MM2Name=Instance.new("TextLabel")
MM2Name.Size=UDim2.new(1,-50,1,0)
MM2Name.Position=UDim2.new(0,45,0,0)
MM2Name.BackgroundTransparency=1
MM2Name.Text="Murder Mystery 2"
MM2Name.TextColor3=Color3.fromRGB(255,255,255)
MM2Name.Font=Enum.Font.GothamBold
MM2Name.TextSize=13
MM2Name.TextXAlignment=Enum.TextXAlignment.Left
MM2Name.Parent=MM2Card

local MM2Execute=Instance.new("TextButton")
MM2Execute.Size=UDim2.new(0,70,0,30)
MM2Execute.Position=UDim2.new(1,-75,0,7)
MM2Execute.BackgroundColor3=Color3.fromRGB(60,200,100)
MM2Execute.Text="EXECUTE"
MM2Execute.TextColor3=Color3.fromRGB(15,15,25)
MM2Execute.Font=Enum.Font.GothamBlack
MM2Execute.TextSize=9
MM2Execute.ZIndex=2
MM2Execute.Parent=MM2Card
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=MM2Execute

LauncherContent.CanvasSize=UDim2.new(0,0,0,60)

-- ============ MM2 BAR ============
local MG=Instance.new("ScreenGui")MG.Name="MM2Bar"MG.Parent=GetHui()
MG.Enabled=false

local MM2Bar=Instance.new("Frame")
MM2Bar.Size=UDim2.new(0,180,0,40)
MM2Bar.Position=UDim2.new(.5,-90,0,10)
MM2Bar.BackgroundColor3=Color3.fromRGB(15,15,30)
MM2Bar.BorderSizePixel=0
MM2Bar.Parent=MG
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=MM2Bar

local MM2BarText=Instance.new("TextLabel")
MM2BarText.Size=UDim2.new(0,120,0,25)
MM2BarText.Position=UDim2.new(0,10,0,8)
MM2BarText.BackgroundTransparency=1
MM2BarText.Text="SYPHIX MM2"
MM2BarText.TextColor3=Color3.fromRGB(255,100,100)
MM2BarText.Font=Enum.Font.GothamBlack
MM2BarText.TextSize=13
MM2BarText.Parent=MM2Bar

local MM2BarArrow=Instance.new("TextButton")
MM2BarArrow.Size=UDim2.new(0,25,0,25)
MM2BarArrow.Position=UDim2.new(1,-30,0,7)
MM2BarArrow.BackgroundColor3=Color3.fromRGB(255,80,80)
MM2BarArrow.Text=">"
MM2BarArrow.TextColor3=Color3.fromRGB(255,255,255)
MM2BarArrow.Font=Enum.Font.GothamBold
MM2BarArrow.TextSize=12
MM2BarArrow.Parent=MM2Bar
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=MM2BarArrow

-- ============ MM2 PANEL ============
local MM2Panel=Instance.new("Frame")
MM2Panel.Size=UDim2.new(0,0,0,0)
MM2Panel.Position=UDim2.new(.5,-262,.5,-262)
MM2Panel.BackgroundColor3=Color3.fromRGB(12,12,25)
MM2Panel.BorderSizePixel=0
MM2Panel.BackgroundTransparency=1
MM2Panel.ClipsDescendants=true
MM2Panel.Visible=false
MM2Panel.Parent=MG
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=MM2Panel

local MM2Header=Instance.new("Frame")
MM2Header.Size=UDim2.new(1,0,0,50)
MM2Header.BackgroundColor3=Color3.fromRGB(18,18,35)
MM2Header.BorderSizePixel=0
MM2Header.Parent=MM2Panel
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=MM2Header

local MM2Title=Instance.new("TextLabel")
MM2Title.Size=UDim2.new(0,200,0,30)
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

-- ============ COMBAT ============
local CombatSF=MM2TabFrames.Combat

local function mkToggleWithSub(parent,name,y,subContent,subHeight)
    pcall(function()
        local mainFrame=Instance.new("Frame")
        mainFrame.Size=UDim2.new(1,-10,0,40)
        mainFrame.Position=UDim2.new(0,5,0,y)
        mainFrame.BackgroundColor3=Color3.fromRGB(20,20,38)
        mainFrame.BorderSizePixel=0
        mainFrame.Parent=parent
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=mainFrame
        
        local label=Instance.new("TextLabel")
        label.Size=UDim2.new(.55,0,1,0)
        label.Position=UDim2.new(0,10,0,0)
        label.BackgroundTransparency=1
        label.Text=name
        label.TextColor3=Color3.fromRGB(200,220,255)
        label.Font=Enum.Font.Gotham
        label.TextSize=12
        label.Parent=mainFrame
        
        local toggle=Instance.new("TextButton")
        toggle.Size=UDim2.new(0,55,0,25)
        toggle.Position=UDim2.new(1,-100,0,7)
        toggle.BackgroundColor3=Color3.fromRGB(40,40,70)
        toggle.Text="OFF"
        toggle.TextColor3=Color3.fromRGB(150,170,200)
        toggle.Font=Enum.Font.GothamBold
        toggle.TextSize=9
        toggle.Parent=mainFrame
        Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=toggle
        
        local expand=Instance.new("TextButton")
        expand.Size=UDim2.new(0,25,0,25)
        expand.Position=UDim2.new(1,-35,0,7)
        expand.BackgroundColor3=Color3.fromRGB(60,100,200)
        expand.Text=">"
        expand.TextColor3=Color3.fromRGB(255,255,255)
        expand.Font=Enum.Font.GothamBold
        expand.TextSize=12
        expand.Parent=mainFrame
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=expand
        
        local submenu=Instance.new("Frame")
        submenu.Size=UDim2.new(1,-10,0,0)
        submenu.Position=UDim2.new(0,5,0,y+43)
        submenu.BackgroundColor3=Color3.fromRGB(25,25,45)
        submenu.BorderSizePixel=0
        submenu.ClipsDescendants=true
        submenu.Parent=parent
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=submenu
        
        if subContent then
            subContent(submenu)
        end
        
        local isOpen=false
        expand.MouseButton1Click:Connect(function()
            isOpen=not isOpen
            if isOpen then
                T:Create(submenu,TweenInfo.new(.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=UDim2.new(1,-10,0,subHeight or 100)}):Play()
                expand.Text="v"
            else
                T:Create(submenu,TweenInfo.new(.3,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(1,-10,0,0)}):Play()
                expand.Text=">"
            end
        end)
        
        toggle.MouseButton1Click:Connect(function()
            local state=not (toggle.Text=="ON")
            toggle.BackgroundColor3=state and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
            toggle.Text=state and"ON"or"OFF"
            if name=="Aimbot"then Aimbot_Enabled=state end
            if name=="Kill All"then KillAll_Enabled=state end
        end)
        
        return toggle,submenu
    end)
end

-- Aimbot
mkToggleWithSub(CombatSF,"Aimbot",5,function(sub)
    local info=Instance.new("TextLabel")
    info.Size=UDim2.new(1,0,0,25)
    info.Position=UDim2.new(0,5,0,5)
    info.BackgroundTransparency=1
    info.Text="Always targets Murderer"
    info.TextColor3=Color3.fromRGB(255,100,100)
    info.Font=Enum.Font.Gotham
    info.TextSize=11
    info.Parent=sub
end,80)

-- Kill All с белым списком
mkToggleWithSub(CombatSF,"Kill All",130,function(sub)
    local wl=Instance.new("ScrollingFrame")
    wl.Size=UDim2.new(1,-10,0,200)
    wl.Position=UDim2.new(0,5,0,30)
    wl.BackgroundColor3=Color3.fromRGB(18,18,30)
    wl.BorderSizePixel=0
    wl.Parent=sub
    Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=wl
    
    local function refreshWL()
        pcall(function()
            for _,c in pairs(wl:GetChildren())do if c:IsA("TextButton")then c:Destroy()end end
            local y=0
            for _,p in pairs(P:GetPlayers())do
                if p~=L then
                    local isW=Whitelist[p.Name]
                    local b=Instance.new("TextButton")
                    b.Size=UDim2.new(1,-10,0,28)
                    b.Position=UDim2.new(0,5,0,y)
                    b.BackgroundColor3=isW and Color3.fromRGB(50,200,100)or Color3.fromRGB(30,30,50)
                    b.Text=p.Name
                    b.TextColor3=isW and Color3.fromRGB(15,15,25)or Color3.fromRGB(200,220,255)
                    b.Font=Enum.Font.GothamBold
                    b.TextSize=10
                    b.Parent=wl
                    Instance.new("UICorner").CornerRadius=UDim.new(0,4)Instance.new("UICorner").Parent=b
                    b.MouseButton1Click:Connect(function()
                        if Whitelist[p.Name]then Whitelist[p.Name]=nil else Whitelist[p.Name]=true end
                        refreshWL()
                    end)
                    y+=32
                end
            end
            wl.CanvasSize=UDim2.new(0,0,0,y)
        end)
    end
    refreshWL()
end,240)

CombatSF.CanvasSize=UDim2.new(0,0,0,400)

-- ============ VISUAL ============
local VisualSF=MM2TabFrames.Visual

-- ESP
local ESPToggle,ESPSub=mkToggleWithSub(VisualSF,"ESP",5,function(sub)
    local function mkRoleToggle(name,y,stateVar)
        pcall(function()
            local f=Instance.new("Frame")
            f.Size=UDim2.new(1,-10,0,30)
            f.Position=UDim2.new(0,5,0,y)
            f.BackgroundColor3=Color3.fromRGB(30,30,50)
            f.BorderSizePixel=0
            f.Parent=sub
            Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=f
            
            local l=Instance.new("TextLabel")
            l.Size=UDim2.new(.6,0,1,0)
            l.Position=UDim2.new(0,7,0,0)
            l.BackgroundTransparency=1
            l.Text=name
            l.TextColor3=Color3.fromRGB(200,220,255)
            l.Font=Enum.Font.Gotham
            l.TextSize=10
            l.Parent=f
            
            local b=Instance.new("TextButton")
            b.Size=UDim2.new(0,45,0,20)
            b.Position=UDim2.new(1,-50,0,5)
            b.BackgroundColor3=Color3.fromRGB(40,40,70)
            b.Text="OFF"
            b.TextColor3=Color3.fromRGB(150,170,200)
            b.Font=Enum.Font.GothamBold
            b.TextSize=9
            b.Parent=f
            Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
            
            b.MouseButton1Click:Connect(function()
                local st=not(b.Text=="ON")
                b.BackgroundColor3=st and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
                b.Text=st and"ON"or"OFF"
                if name=="Murderer"then ESP_Murderer=st end
                if name=="Sheriff"then ESP_Sheriff=st end
                if name=="Innocent"then ESP_Innocent=st end
            end)
        end)
    end
    
    mkRoleToggle("Murderer",5,"ESP_Murderer")
    mkRoleToggle("Sheriff",38,"ESP_Sheriff")
    mkRoleToggle("Innocent",71,"ESP_Innocent")
end,110)

-- Boxes
local BoxToggle,BoxSub=mkToggleWithSub(VisualSF,"Boxes",130,function(sub)
    local function mkRoleToggle2(name,y,stateVar)
        pcall(function()
            local f=Instance.new("Frame")
            f.Size=UDim2.new(1,-10,0,30)
            f.Position=UDim2.new(0,5,0,y)
            f.BackgroundColor3=Color3.fromRGB(30,30,50)
            f.BorderSizePixel=0
            f.Parent=sub
            Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=f
            
            local l=Instance.new("TextLabel")
            l.Size=UDim2.new(.6,0,1,0)
            l.Position=UDim2.new(0,7,0,0)
            l.BackgroundTransparency=1
            l.Text=name
            l.TextColor3=Color3.fromRGB(200,220,255)
            l.Font=Enum.Font.Gotham
            l.TextSize=10
            l.Parent=f
            
            local b=Instance.new("TextButton")
            b.Size=UDim2.new(0,45,0,20)
            b.Position=UDim2.new(1,-50,0,5)
            b.BackgroundColor3=Color3.fromRGB(40,40,70)
            b.Text="OFF"
            b.TextColor3=Color3.fromRGB(150,170,200)
            b.Font=Enum.Font.GothamBold
            b.TextSize=9
            b.Parent=f
            Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
            
            b.MouseButton1Click:Connect(function()
                local st=not(b.Text=="ON")
                b.BackgroundColor3=st and Color3.fromRGB(50,200,100)or Color3.fromRGB(40,40,70)
                b.Text=st and"ON"or"OFF"
                if name=="Murderer"then Boxes_Murderer=st end
                if name=="Sheriff"then Boxes_Sheriff=st end
                if name=="Innocent"then Boxes_Innocent=st end
            end)
        end)
    end
    
    mkRoleToggle2("Murderer",5,"Boxes_Murderer")
    mkRoleToggle2("Sheriff",38,"Boxes_Sheriff")
    mkRoleToggle2("Innocent",71,"Boxes_Innocent")
end,110)

VisualSF.CanvasSize=UDim2.new(0,0,0,300)

-- ============ OTHERS ============
local OthersSF=MM2TabFrames.Others

-- Hide Key
local HideFrame=Instance.new("Frame")
HideFrame.Size=UDim2.new(1,-10,0,60)
HideFrame.Position=UDim2.new(0,5,0,5)
HideFrame.BackgroundColor3=Color3.fromRGB(20,20,38)
HideFrame.BorderSizePixel=0
HideFrame.Parent=OthersSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=HideFrame

local HideLabel=Instance.new("TextLabel")
HideLabel.Size=UDim2.new(1,0,0,25)
HideLabel.Position=UDim2.new(0,5,0,5)
HideLabel.BackgroundTransparency=1
HideLabel.Text="Hide Key: "..HideKey
HideLabel.TextColor3=Color3.fromRGB(200,220,255)
HideLabel.Font=Enum.Font.GothamBold
HideLabel.TextSize=12
HideLabel.Parent=HideFrame

local ChangeKeyBtn=Instance.new("TextButton")
ChangeKeyBtn.Size=UDim2.new(1,-20,0,25)
ChangeKeyBtn.Position=UDim2.new(0,10,0,32)
ChangeKeyBtn.BackgroundColor3=Color3.fromRGB(60,100,200)
ChangeKeyBtn.Text="CHANGE KEY"
ChangeKeyBtn.TextColor3=Color3.fromRGB(255,255,255)
ChangeKeyBtn.Font=Enum.Font.GothamBold
ChangeKeyBtn.TextSize=10
ChangeKeyBtn.Parent=HideFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=ChangeKeyBtn

local listeningForKeys=false
ChangeKeyBtn.MouseButton1Click:Connect(function()
    listeningForKeys=true
    ChangeKeyBtn.Text="PRESS ANY KEY..."
    Notify("Press any key...")
end)

U.InputBegan:Connect(function(input,gameProcessed)
    if listeningForKeys and not gameProcessed then
        if input.KeyCode~=Enum.KeyCode.Unknown then
            HideKey=input.KeyCode.Name
            HideLabel.Text="Hide Key: "..HideKey
            ChangeKeyBtn.Text="CHANGE KEY"
            listeningForKeys=false
            Notify("Key set to: "..HideKey)
        end
    end
end)

OthersSF.CanvasSize=UDim2.new(0,0,0,100)

-- ============ INIT ============
MM2TabFrames.Combat.Visible=true
MM2TabButtons.Combat.BackgroundColor3=Color3.fromRGB(60,100,200)
MM2TabButtons.Combat.TextColor3=Color3.fromRGB(255,255,255)

-- ============ ФУНКЦИИ ============
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

function CloseMM2Panel()
    T:Create(MM2Panel,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1,Position=UDim2.new(.5,0,.5,0)}):Play()
    task.wait(.3)
    MM2Panel.Visible=false
end

MM2CloseBtn.MouseButton1Click:Connect(CloseMM2Panel)

-- MM2 Bar Toggle
local mm2PanelOpen=false
local function ToggleMM2Panel()
    mm2PanelOpen=not mm2PanelOpen
    if mm2PanelOpen then
        OpenMM2Panel()
        MM2BarArrow.Text="<"
    else
        CloseMM2Panel()
        MM2BarArrow.Text=">"
    end
end

MM2BarArrow.MouseButton1Click:Connect(ToggleMM2Panel)
MM2BarText.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        ToggleMM2Panel()
    end
end)

-- Hide key
U.InputBegan:Connect(function(input,gameProcessed)
    if gameProcessed then return end
    if input.KeyCode==Enum.KeyCode[HideKey]then
        MM2Panel.Visible=not MM2Panel.Visible
        MM2Bar.Visible=not MM2Bar.Visible
    end
end)

-- Перетаскивание MM2 Bar
local mm2Dragging=false
local mm2Start=nil
local mm2Pos=nil
MM2Bar.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        mm2Dragging=true
        mm2Start=i.Position
        mm2Pos=MM2Bar.Position
    end
end)
U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        mm2Dragging=false
    end
end)
U.InputChanged:Connect(function(i)
    if mm2Dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
        local d=i.Position-mm2Start
        MM2Bar.Position=UDim2.new(mm2Pos.X.Scale,mm2Pos.X.Offset+d.X,mm2Pos.Y.Scale,mm2Pos.Y.Offset+d.Y)
    end
end)

-- ============ LAUNCHER ЛОГИКА ============
MM2Execute.MouseButton1Click:Connect(function()
    -- Закрываем лаунчер
    T:Create(LauncherMenu,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
    task.wait(.3)
    LauncherMenu.Visible=false
    LG:Destroy()
    
    -- Показываем MM2 Bar
    MG.Enabled=true
    Notify("SYPHIX MM2 loaded! Click bar to open")
end)

-- Лаунчер открытие
local launcherOpen=false
local function ToggleLauncher()
    launcherOpen=not launcherOpen
    if launcherOpen then
        LauncherMenu.Visible=true
        LauncherMenu.Size=UDim2.new(0,0,0,0)
        T:Create(LauncherMenu,TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,300,0,130),BackgroundTransparency=0}):Play()
        TopBarArrow.Text="^"
    else
        T:Create(LauncherMenu,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
        TopBarArrow.Text="v"
        task.wait(.3)
        LauncherMenu.Visible=false
    end
end

TopBarArrow.MouseButton1Click:Connect(ToggleLauncher)
TopBarText.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        ToggleLauncher()
    end
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

-- ============ РОЛИ ============
local function getRole(p)
    if p.Character then
        for _,child in pairs(p.Character:GetChildren())do
            if child:IsA("Tool")then
                local n=child.Name:lower()
                if n:find("knife")or n:find("murder")then return"Murderer"end
                if n:find("gun")or n:find("pistol")or n:find("sheriff")then return"Sheriff"end
            end
        end
    end
    local bp=p:FindFirstChild("Backpack")
    if bp then
        for _,child in pairs(bp:GetChildren())do
            if child:IsA("Tool")then
                local n=child.Name:lower()
                if n:find("knife")or n:find("murder")then return"Murderer"end
                if n:find("gun")or n:find("pistol")or n:find("sheriff")then return"Sheriff"end
            end
        end
    end
    return"Innocent"
end

-- ESP/Boxes логика
R.RenderStepped:Connect(function()
    pcall(function()
        -- ESP
        if ESP_Enabled or ESP_Murderer or ESP_Sheriff or ESP_Innocent then
            for _,p in pairs(P:GetPlayers())do
                if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                    local role=getRole(p)
                    local show=false
                    local color=Color3.fromRGB(0,255,100)
                    if ESP_Enabled then show=true end
                    if role=="Murderer"and ESP_Murderer then show=true;color=Color3.fromRGB(255,50,50)end
                    if role=="Sheriff"and ESP_Sheriff then show=true;color=Color3.fromRGB(50,100,255)end
                    if role=="Innocent"and ESP_Innocent then show=true;color=Color3.fromRGB(0,255,100)end
                    
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
            for p,h in pairs(EspHighlights)do if h and h.Parent then h:Destroy()end end
            EspHighlights={}
        end
        
        -- Boxes (2D прямоугольники)
        if Boxes_Enabled or Boxes_Murderer or Boxes_Sheriff or Boxes_Innocent then
            for _,p in pairs(P:GetPlayers())do
                if p~=L and p.Character and p.Character:FindFirstChild("Head")and p.Character:FindFirstChild("HumanoidRootPart")then
                    local role=getRole(p)
                    local show=false
                    local color=Color3.fromRGB(0,255,100)
                    if Boxes_Enabled then show=true end
                    if role=="Murderer"and Boxes_Murderer then show=true;color=Color3.fromRGB(255,50,50)end
                    if role=="Sheriff"and Boxes_Sheriff then show=true;color=Color3.fromRGB(50,100,255)end
                    if role=="Innocent"and Boxes_Innocent then show=true;color=Color3.fromRGB(0,255,100)end
                    
                    if show then
                        local existing=EspBoxes[p]
                        if not existing or not existing.Parent then
                            local box=Instance.new("SelectionBox")
                            box.Color3=color
                            box.LineThickness=0.05
                            box.Transparency=0.5
                            box.Adornee=p.Character
                            box.Parent=p.Character
                            EspBoxes[p]=box
                        else
                            existing.Color3=color
                        end
                    elseif EspBoxes[p]and EspBoxes[p].Parent then
                        EspBoxes[p]:Destroy()
                        EspBoxes[p]=nil
                    end
                end
            end
        else
            for p,b in pairs(EspBoxes)do if b and b.Parent then b:Destroy()end end
            EspBoxes={}
        end
        
        -- Aimbot
        if Aimbot_Enabled and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            local target=nil
            local minDist=math.huge
            for _,p in pairs(P:GetPlayers())do
                if p~=L and getRole(p)=="Murderer"and p.Character and p.Character:FindFirstChild("Head")then
                    local d=(L.Character.HumanoidRootPart.Position-p.Character.Head.Position).Magnitude
                    if d<minDist then minDist=d target=p end
                end
            end
            if target and target.Character and target.Character:FindFirstChild("Head")then
                C.CFrame=CFrame.new(C.CFrame.Position,target.Character.Head.Position)
            end
        end
        
        -- Kill All
        if KillAll_Enabled then
            for _,p in pairs(P:GetPlayers())do
                if p~=L and not Whitelist[p.Name]and p.Character and p.Character:FindFirstChild("Humanoid")then
                    p.Character.Humanoid.Health=0
                end
            end
        end
    end)
end)

Notify("SYPHIX HUB loaded!")
