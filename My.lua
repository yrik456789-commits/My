-- SYPHIX HUB | v18 | ALL FIXED
local P,R,U,T,C,L=game:GetService("Players"),game:GetService("RunService"),game:GetService("UserInputService"),game:GetService("TweenService"),workspace.CurrentCamera,game:GetService("Players").LocalPlayer
local VU=game:GetService("VirtualUser")

local function GetHui()
    pcall(function()if gethui then return gethui()end end)
    return game.CoreGui
end

local function Notify(text)
    pcall(function()
        local N=Instance.new("TextLabel")N.Size=UDim2.new(0,220,0,35)N.Position=UDim2.new(1,240,0,15)
        N.BackgroundColor3=Color3.fromRGB(10,10,20)N.TextColor3=Color3.fromRGB(0,255,255)N.Text=text
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
local Spin_Enabled=false
local SpinSpeed=10
local AntiFling_Enabled=false
local Tracer_Enabled=false
local TracerColor=Color3.fromRGB(255,255,255)
local Whitelist={}
local HideKey="LeftAlt"
local EspHighlights={}
local EspBoxes={}

function getRole(p)
    if not p then return"Innocent"end
    if p.Character then
        for _,child in pairs(p.Character:GetChildren())do
            if child:IsA("Tool")then
                local n=child.Name:lower()
                if n:find("knife")or n:find("murder")or n:find("blade")then return"Murderer"end
                if n:find("gun")or n:find("pistol")or n:find("revolver")then return"Sheriff"end
            end
        end
    end
    local bp=p:FindFirstChild("Backpack")
    if bp then
        for _,child in pairs(bp:GetChildren())do
            if child:IsA("Tool")then
                local n=child.Name:lower()
                if n:find("knife")or n:find("murder")or n:find("blade")then return"Murderer"end
                if n:find("gun")or n:find("pistol")or n:find("revolver")then return"Sheriff"end
            end
        end
    end
    return"Innocent"
end

-- ============ ESP КАЖДЫЙ КАДР ============
R.RenderStepped:Connect(function()
    pcall(function()
        -- Очистка
        for p,h in pairs(EspHighlights)do
            if not h or not h.Parent or not p or not p.Parent then
                if h then pcall(function()h:Destroy()end)end
                EspHighlights[p]=nil
            end
        end
        
        -- ESP для ВСЕХ
        if ESP_Enabled or ESP_Murderer or ESP_Sheriff or ESP_Innocent then
            for _,p in pairs(P:GetPlayers())do
                if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                    local role=getRole(p)
                    local show=false
                    local color=Color3.fromRGB(0,255,255)
                    if ESP_Enabled then show=true end
                    if role=="Murderer"and ESP_Murderer then show=true;color=Color3.fromRGB(255,0,255)end
                    if role=="Sheriff"and ESP_Sheriff then show=true;color=Color3.fromRGB(0,100,255)end
                    if role=="Innocent"and ESP_Innocent then show=true;color=Color3.fromRGB(0,255,100)end
                    
                    if show then
                        local existing=EspHighlights[p]
                        if not existing or not existing.Parent then
                            existing=Instance.new("Highlight")
                            existing.FillColor=color
                            existing.FillTransparency=0.5
                            existing.OutlineColor=color
                            existing.OutlineTransparency=0
                            existing.Parent=p.Character
                            EspHighlights[p]=existing
                        else
                            existing.FillColor=color
                            existing.OutlineColor=color
                            if not existing.Parent then existing.Parent=p.Character end
                        end
                    else
                        if EspHighlights[p]then
                            pcall(function()EspHighlights[p]:Destroy()end)
                            EspHighlights[p]=nil
                        end
                    end
                end
            end
        else
            for p,h in pairs(EspHighlights)do
                pcall(function()h:Destroy()end)
                EspHighlights[p]=nil
            end
        end
        
        -- Boxes
        if Boxes_Enabled or Boxes_Murderer or Boxes_Sheriff or Boxes_Innocent then
            for _,p in pairs(P:GetPlayers())do
                if p~=L and p.Character and p.Character:FindFirstChild("Head")then
                    local role=getRole(p)
                    local show=false
                    local color=Color3.fromRGB(0,255,255)
                    if Boxes_Enabled then show=true end
                    if role=="Murderer"and Boxes_Murderer then show=true;color=Color3.fromRGB(255,0,255)end
                    if role=="Sheriff"and Boxes_Sheriff then show=true;color=Color3.fromRGB(0,100,255)end
                    if role=="Innocent"and Boxes_Innocent then show=true;color=Color3.fromRGB(0,255,100)end
                    
                    if show then
                        local existing=EspBoxes[p]
                        if not existing or not existing.Parent then
                            existing=Instance.new("Highlight")
                            existing.FillColor=Color3.fromRGB(0,0,0)
                            existing.FillTransparency=1
                            existing.OutlineColor=color
                            existing.OutlineTransparency=0
                            existing.Parent=p.Character
                            EspBoxes[p]=existing
                        else
                            existing.OutlineColor=color
                            if not existing.Parent then existing.Parent=p.Character end
                        end
                    else
                        if EspBoxes[p]then
                            pcall(function()EspBoxes[p]:Destroy()end)
                            EspBoxes[p]=nil
                        end
                    end
                end
            end
        else
            for p,h in pairs(EspBoxes)do
                pcall(function()h:Destroy()end)
                EspBoxes[p]=nil
            end
        end
    end)
end)

-- ============ НЕОНОВЫЙ ФОН ============
local G=Instance.new("ScreenGui")G.Name="SyphixHub"G.Parent=GetHui()

-- Неоновые звёздочки
local Stars={}
for i=1,60 do
    pcall(function()
        local s=Instance.new("Frame")
        s.Size=UDim2.new(0,math.random(2,5),0,math.random(2,5))
        s.Position=UDim2.new(math.random(),0,math.random(),0)
        s.BackgroundColor3=Color3.fromHSV(math.random(),1,1)
        s.BackgroundTransparency=0.5
        s.BorderSizePixel=0
        s.Parent=G
        Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=s
        Stars[#Stars+1]=s
    end)
end

task.spawn(function()
    while true do
        pcall(function()
            for _,s in pairs(Stars)do
                s.BackgroundTransparency=0.2+math.sin(tick()*3+s.Position.X.Offset)*0.5
            end
        end)
        task.wait(0.05)
    end
end)

-- ============ ЛАУНЧЕР ============
local LG=Instance.new("ScreenGui")LG.Name="Launcher"LG.Parent=GetHui()

local TopBar=Instance.new("Frame")
TopBar.Size=UDim2.new(0,200,0,40)
TopBar.Position=UDim2.new(.5,-100,0,10)
TopBar.BackgroundColor3=Color3.fromRGB(10,10,20)
TopBar.BorderSizePixel=0
TopBar.Parent=LG
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=TopBar

local NeonBorder=Instance.new("Frame")
NeonBorder.Size=UDim2.new(1,6,1,6)
NeonBorder.Position=UDim2.new(0,-3,0,-3)
NeonBorder.BackgroundColor3=Color3.fromRGB(0,255,255)
NeonBorder.BackgroundTransparency=0.3
NeonBorder.BorderSizePixel=0
NeonBorder.ZIndex=0
NeonBorder.Parent=TopBar
Instance.new("UICorner").CornerRadius=UDim.new(0,15)Instance.new("UICorner").Parent=NeonBorder
TopBar.ZIndex=1

local TopBarText=Instance.new("TextLabel")
TopBarText.Size=UDim2.new(0,140,0,25)
TopBarText.Position=UDim2.new(0,35,0,8)
TopBarText.BackgroundTransparency=1
TopBarText.Text="SYPHIX HUB"
TopBarText.TextColor3=Color3.fromRGB(0,255,255)
TopBarText.Font=Enum.Font.GothamBlack
TopBarText.TextSize=13
TopBarText.Parent=TopBar

local TopBarArrow=Instance.new("TextButton")
TopBarArrow.Size=UDim2.new(0,25,0,25)
TopBarArrow.Position=UDim2.new(1,-30,0,7)
TopBarArrow.BackgroundColor3=Color3.fromRGB(0,255,255)
TopBarArrow.Text="v"
TopBarArrow.TextColor3=Color3.fromRGB(10,10,20)
TopBarArrow.Font=Enum.Font.GothamBold
TopBarArrow.TextSize=12
TopBarArrow.Parent=TopBar
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=TopBarArrow

local LauncherMenu=Instance.new("Frame")
LauncherMenu.Size=UDim2.new(0,0,0,0)
LauncherMenu.Position=UDim2.new(.5,0,0,55)
LauncherMenu.BackgroundColor3=Color3.fromRGB(10,10,20)
LauncherMenu.BorderSizePixel=0
LauncherMenu.BackgroundTransparency=1
LauncherMenu.ClipsDescendants=true
LauncherMenu.Visible=false
LauncherMenu.Parent=LG
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=LauncherMenu

local LauncherContent=Instance.new("ScrollingFrame")
LauncherContent.Size=UDim2.new(1,-20,1,-20)
LauncherContent.Position=UDim2.new(0,10,0,10)
LauncherContent.BackgroundTransparency=1
LauncherContent.BorderSizePixel=0
LauncherContent.Parent=LauncherMenu

local MM2Card=Instance.new("TextButton")
MM2Card.Size=UDim2.new(1,0,0,45)
MM2Card.Position=UDim2.new(0,0,0,5)
MM2Card.BackgroundColor3=Color3.fromRGB(15,15,30)
MM2Card.Text=""
MM2Card.Parent=LauncherContent
Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=MM2Card

local MM2Name=Instance.new("TextLabel")
MM2Name.Size=UDim2.new(1,-80,1,0)
MM2Name.Position=UDim2.new(0,50,0,0)
MM2Name.BackgroundTransparency=1
MM2Name.Text="Murder Mystery 2"
MM2Name.TextColor3=Color3.fromRGB(255,0,255)
MM2Name.Font=Enum.Font.GothamBold
MM2Name.TextSize=13
MM2Name.TextXAlignment=Enum.TextXAlignment.Left
MM2Name.Parent=MM2Card

local MM2Execute=Instance.new("TextButton")
MM2Execute.Size=UDim2.new(0,70,0,30)
MM2Execute.Position=UDim2.new(1,-75,0,7)
MM2Execute.BackgroundColor3=Color3.fromRGB(0,255,100)
MM2Execute.Text="EXECUTE"
MM2Execute.TextColor3=Color3.fromRGB(10,10,20)
MM2Execute.Font=Enum.Font.GothamBlack
MM2Execute.TextSize=9
MM2Execute.ZIndex=2
MM2Execute.Parent=MM2Card
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=MM2Execute

LauncherContent.CanvasSize=UDim2.new(0,0,0,60)

-- ============ MM2 ============
local MG=Instance.new("ScreenGui")MG.Name="MM2"MG.Parent=GetHui()
MG.Enabled=false

local MM2Bar=Instance.new("Frame")
MM2Bar.Size=UDim2.new(0,180,0,40)
MM2Bar.Position=UDim2.new(.5,-90,0,10)
MM2Bar.BackgroundColor3=Color3.fromRGB(10,10,20)
MM2Bar.BorderSizePixel=0
MM2Bar.Parent=MG
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=MM2Bar

local MM2NeonBorder=Instance.new("Frame")
MM2NeonBorder.Size=UDim2.new(1,6,1,6)
MM2NeonBorder.Position=UDim2.new(0,-3,0,-3)
MM2NeonBorder.BackgroundColor3=Color3.fromRGB(255,0,255)
MM2NeonBorder.BackgroundTransparency=0.3
MM2NeonBorder.BorderSizePixel=0
MM2NeonBorder.ZIndex=0
MM2NeonBorder.Parent=MM2Bar
Instance.new("UICorner").CornerRadius=UDim.new(0,15)Instance.new("UICorner").Parent=MM2NeonBorder
MM2Bar.ZIndex=1

local MM2BarText=Instance.new("TextLabel")
MM2BarText.Size=UDim2.new(0,120,0,25)
MM2BarText.Position=UDim2.new(0,10,0,8)
MM2BarText.BackgroundTransparency=1
MM2BarText.Text="SYPHIX MM2"
MM2BarText.TextColor3=Color3.fromRGB(255,0,255)
MM2BarText.Font=Enum.Font.GothamBlack
MM2BarText.TextSize=13
MM2BarText.Parent=MM2Bar

local MM2BarArrow=Instance.new("TextButton")
MM2BarArrow.Size=UDim2.new(0,25,0,25)
MM2BarArrow.Position=UDim2.new(1,-30,0,7)
MM2BarArrow.BackgroundColor3=Color3.fromRGB(255,0,255)
MM2BarArrow.Text=">"
MM2BarArrow.TextColor3=Color3.fromRGB(10,10,20)
MM2BarArrow.Font=Enum.Font.GothamBold
MM2BarArrow.TextSize=12
MM2BarArrow.Parent=MM2Bar
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=MM2BarArrow

-- MM2 PANEL (БОЛЬШЕ - 600x600)
local MM2Panel=Instance.new("Frame")
MM2Panel.Size=UDim2.new(0,0,0,0)
MM2Panel.Position=UDim2.new(.5,-300,.5,-300)
MM2Panel.BackgroundColor3=Color3.fromRGB(10,10,20)
MM2Panel.BorderSizePixel=0
MM2Panel.BackgroundTransparency=1
MM2Panel.ClipsDescendants=true
MM2Panel.Visible=false
MM2Panel.Parent=MG
Instance.new("UICorner").CornerRadius=UDim.new(0,20)Instance.new("UICorner").Parent=MM2Panel

local MM2Header=Instance.new("Frame")
MM2Header.Size=UDim2.new(1,0,0,55)
MM2Header.BackgroundColor3=Color3.fromRGB(15,15,30)
MM2Header.BorderSizePixel=0
MM2Header.Parent=MM2Panel
Instance.new("UICorner").CornerRadius=UDim.new(0,20)Instance.new("UICorner").Parent=MM2Header

local MM2Title=Instance.new("TextLabel")
MM2Title.Size=UDim2.new(0,200,0,30)
MM2Title.Position=UDim2.new(0,15,0,12)
MM2Title.BackgroundTransparency=1
MM2Title.Text="SYPHIX MM2"
MM2Title.TextColor3=Color3.fromRGB(255,0,255)
MM2Title.Font=Enum.Font.GothamBlack
MM2Title.TextSize=16
MM2Title.Parent=MM2Header

local MM2CloseBtn=Instance.new("TextButton")
MM2CloseBtn.Size=UDim2.new(0,28,0,28)
MM2CloseBtn.Position=UDim2.new(1,-34,0,13)
MM2CloseBtn.BackgroundColor3=Color3.fromRGB(255,0,100)
MM2CloseBtn.Text="X"
MM2CloseBtn.TextColor3=Color3.fromRGB(255,255,255)
MM2CloseBtn.Font=Enum.Font.GothamBold
MM2CloseBtn.TextSize=13
MM2CloseBtn.Parent=MM2Header
Instance.new("UICorner").CornerRadius=UDim.new(0,7)Instance.new("UICorner").Parent=MM2CloseBtn

local MM2Tabs=Instance.new("Frame")
MM2Tabs.Size=UDim2.new(0,130,1,-55)
MM2Tabs.Position=UDim2.new(0,0,0,55)
MM2Tabs.BackgroundColor3=Color3.fromRGB(12,12,25)
MM2Tabs.BorderSizePixel=0
MM2Tabs.Parent=MM2Panel

local MM2Content=Instance.new("Frame")
MM2Content.Size=UDim2.new(1,-140,1,-65)
MM2Content.Position=UDim2.new(0,135,0,60)
MM2Content.BackgroundTransparency=1
MM2Content.Parent=MM2Panel

local MM2TabFrames={}
local MM2TabButtons={}
local MM2TabNames={"Combat","Visual","Fling","Others"}

for i=1,4 do
    local name=MM2TabNames[i]
    local SF=Instance.new("ScrollingFrame")
    SF.Size=UDim2.new(1,0,1,0)
    SF.BackgroundTransparency=1
    SF.BorderSizePixel=0
    SF.ScrollBarThickness=2
    SF.Visible=false
    SF.Parent=MM2Content
    MM2TabFrames[name]=SF
    
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-10,0,55)
    b.Position=UDim2.new(0,5,0,5+(i-1)*60)
    b.BackgroundColor3=Color3.fromRGB(15,15,30)
    b.Text=name
    b.TextColor3=Color3.fromRGB(0,255,255)
    b.Font=Enum.Font.GothamBold
    b.TextSize=12
    b.Parent=MM2Tabs
    Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
    b.MouseButton1Click:Connect(function()
        for n,btn in pairs(MM2TabButtons)do
            btn.BackgroundColor3=n==name and Color3.fromRGB(0,255,255)or Color3.fromRGB(15,15,30)
            btn.TextColor3=n==name and Color3.fromRGB(10,10,20)or Color3.fromRGB(0,255,255)
        end
        for n,f in pairs(MM2TabFrames)do f.Visible=n==name end
    end)
    MM2TabButtons[name]=b
end

-- ============ COMBAT ============
local CombatSF=MM2TabFrames.Combat

local function mkToggleWithSub(parent,name,y,subContent,subHeight,onToggle)
    local mainFrame=Instance.new("Frame")
    mainFrame.Size=UDim2.new(1,-10,0,42)
    mainFrame.Position=UDim2.new(0,5,0,y)
    mainFrame.BackgroundColor3=Color3.fromRGB(15,15,30)
    mainFrame.BorderSizePixel=0
    mainFrame.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=mainFrame
    
    local label=Instance.new("TextLabel")
    label.Size=UDim2.new(.55,0,1,0)
    label.Position=UDim2.new(0,11,0,0)
    label.BackgroundTransparency=1
    label.Text=name
    label.TextColor3=Color3.fromRGB(0,255,255)
    label.Font=Enum.Font.Gotham
    label.TextSize=12
    label.Parent=mainFrame
    
    local toggle=Instance.new("TextButton")
    toggle.Size=UDim2.new(0,55,0,25)
    toggle.Position=UDim2.new(1,-105,0,8)
    toggle.BackgroundColor3=Color3.fromRGB(30,30,50)
    toggle.Text="OFF"
    toggle.TextColor3=Color3.fromRGB(150,170,200)
    toggle.Font=Enum.Font.GothamBold
    toggle.TextSize=9
    toggle.Parent=mainFrame
    Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=toggle
    
    local expand=Instance.new("TextButton")
    expand.Size=UDim2.new(0,25,0,25)
    expand.Position=UDim2.new(1,-32,0,8)
    expand.BackgroundColor3=Color3.fromRGB(0,255,255)
    expand.Text=">"
    expand.TextColor3=Color3.fromRGB(10,10,20)
    expand.Font=Enum.Font.GothamBold
    expand.TextSize=11
    expand.Parent=mainFrame
    Instance.new("UICorner").CornerRadius=UDim.new(0,7)Instance.new("UICorner").Parent=expand
    
    -- Подменю ОТДЕЛЬНО (не двигает другие элементы)
    local submenu=Instance.new("Frame")
    submenu.Size=UDim2.new(1,-10,0,0)
    submenu.Position=UDim2.new(0,5,0,y+47)
    submenu.BackgroundColor3=Color3.fromRGB(20,20,40)
    submenu.BorderSizePixel=0
    submenu.ClipsDescendants=true
    submenu.Parent=parent
    Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=submenu
    
    if subContent then subContent(submenu)end
    
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
        local state=not(toggle.Text=="ON")
        toggle.BackgroundColor3=state and Color3.fromRGB(0,255,100)or Color3.fromRGB(30,30,50)
        toggle.Text=state and"ON"or"OFF"
        if onToggle then onToggle(state)end
    end)
end

mkToggleWithSub(CombatSF,"Aimbot",5,function(sub)
    local info=Instance.new("TextLabel")
    info.Size=UDim2.new(1,0,0,25)
    info.Position=UDim2.new(0,5,0,5)
    info.BackgroundTransparency=1
    info.Text="Targets Murderer"
    info.TextColor3=Color3.fromRGB(255,0,255)
    info.Font=Enum.Font.Gotham
    info.TextSize=11
    info.Parent=sub
end,40,function(state)Aimbot_Enabled=state end)

mkToggleWithSub(CombatSF,"Kill All",55,function(sub)
    local wl=Instance.new("ScrollingFrame")
    wl.Size=UDim2.new(1,-10,0,150)
    wl.Position=UDim2.new(0,5,0,5)
    wl.BackgroundColor3=Color3.fromRGB(15,15,25)
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
                    b.Size=UDim2.new(1,-10,0,25)
                    b.Position=UDim2.new(0,5,0,y)
                    b.BackgroundColor3=isW and Color3.fromRGB(0,255,100)or Color3.fromRGB(20,20,35)
                    b.Text=p.Name
                    b.TextColor3=isW and Color3.fromRGB(10,10,20)or Color3.fromRGB(0,255,255)
                    b.Font=Enum.Font.GothamBold
                    b.TextSize=9
                    b.Parent=wl
                    Instance.new("UICorner").CornerRadius=UDim.new(0,4)Instance.new("UICorner").Parent=b
                    b.MouseButton1Click:Connect(function()
                        if Whitelist[p.Name]then Whitelist[p.Name]=nil else Whitelist[p.Name]=true end
                        refreshWL()
                    end)
                    y+=29
                end
            end
            wl.CanvasSize=UDim2.new(0,0,0,y)
        end)
    end
    refreshWL()
end,160,function(state)KillAll_Enabled=state end)

mkToggleWithSub(CombatSF,"Spin",220,function(sub)
    local speedLabel=Instance.new("TextLabel")
    speedLabel.Size=UDim2.new(1,0,0,20)
    speedLabel.Position=UDim2.new(0,5,0,5)
    speedLabel.BackgroundTransparency=1
    speedLabel.Text="Speed: "..SpinSpeed
    speedLabel.TextColor3=Color3.fromRGB(0,255,255)
    speedLabel.Font=Enum.Font.Gotham
    speedLabel.TextSize=11
    speedLabel.Parent=sub
    
    local speedSlider=Instance.new("TextButton")
    speedSlider.Size=UDim2.new(1,-20,0,8)
    speedSlider.Position=UDim2.new(0,10,0,30)
    speedSlider.BackgroundColor3=Color3.fromRGB(30,30,50)
    speedSlider.Text=""
    speedSlider.BorderSizePixel=0
    speedSlider.Parent=sub
    Instance.new("UICorner").CornerRadius=UDim.new(1,0)Instance.new("UICorner").Parent=speedSlider
    
    local speedFill=Instance.new("Frame")
    speedFill.Size=UDim2.new(SpinSpeed/50,0,1,0)
    speedFill.BackgroundColor3=Color3.fromRGB(0,255,255)
    speedFill.BorderSizePixel=0
    speedFill.Parent=speedSlider
    
    speedSlider.MouseButton1Down:Connect(function()
        local con
        con=R.RenderStepped:Connect(function()
            if U:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)then
                local rel=math.clamp((U:GetMouseLocation().X-speedSlider.AbsolutePosition.X)/speedSlider.AbsoluteSize.X,0,1)
                SpinSpeed=math.floor(rel*50)+1
                speedLabel.Text="Speed: "..SpinSpeed
                speedFill.Size=UDim2.new(rel,0,1,0)
            else con:Disconnect()end
        end)
    end)
end,50,function(state)Spin_Enabled=state end)

-- Grab Gun (ищет пистолет на КАРТЕ)
local GrabGunFrame=Instance.new("Frame")
GrabGunFrame.Size=UDim2.new(1,-10,0,42)
GrabGunFrame.Position=UDim2.new(0,5,0,275)
GrabGunFrame.BackgroundColor3=Color3.fromRGB(15,15,30)
GrabGunFrame.BorderSizePixel=0
GrabGunFrame.Parent=CombatSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=GrabGunFrame

local GrabGunLabel=Instance.new("TextLabel")
GrabGunLabel.Size=UDim2.new(.55,0,1,0)
GrabGunLabel.Position=UDim2.new(0,11,0,0)
GrabGunLabel.BackgroundTransparency=1
GrabGunLabel.Text="Grab Gun"
GrabGunLabel.TextColor3=Color3.fromRGB(0,255,255)
GrabGunLabel.Font=Enum.Font.Gotham
GrabGunLabel.TextSize=12
GrabGunLabel.Parent=GrabGunFrame

local GrabGunBtn=Instance.new("TextButton")
GrabGunBtn.Size=UDim2.new(0,55,0,25)
GrabGunBtn.Position=UDim2.new(1,-60,0,8)
GrabGunBtn.BackgroundColor3=Color3.fromRGB(0,255,255)
GrabGunBtn.Text="GRAB"
GrabGunBtn.TextColor3=Color3.fromRGB(10,10,20)
GrabGunBtn.Font=Enum.Font.GothamBold
GrabGunBtn.TextSize=9
GrabGunBtn.Parent=GrabGunFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=GrabGunBtn

GrabGunBtn.MouseButton1Click:Connect(function()
    pcall(function()
        -- Ищем пистолет на КАРТЕ (workspace)
        for _,v in pairs(workspace:GetDescendants())do
            if v:IsA("Tool")then
                local n=v.Name:lower()
                if n:find("gun")or n:find("pistol")or n:find("revolver")then
                    v.Parent=L.Backpack or L.Character
                    Notify("Gun grabbed from map!")
                    return
                end
            end
        end
        -- Если на карте нет, ищем у игроков
        for _,p in pairs(P:GetPlayers())do
            if p~=L and getRole(p)=="Sheriff"then
                local char=p.Character
                if char then
                    for _,child in pairs(char:GetChildren())do
                        if child:IsA("Tool")and(child.Name:lower():find("gun")or child.Name:lower():find("pistol"))then
                            child.Parent=L.Backpack or L.Character
                            Notify("Gun grabbed from Sheriff!")
                            return
                        end
                    end
                end
            end
        end
        Notify("Gun not found")
    end)
end)

CombatSF.CanvasSize=UDim2.new(0,0,0,330)

-- ============ VISUAL ============
local VisualSF=MM2TabFrames.Visual

mkToggleWithSub(VisualSF,"ESP",5,function(sub)
    local function mkRole(name,y,setter)
        local f=Instance.new("Frame")
        f.Size=UDim2.new(1,-10,0,30)
        f.Position=UDim2.new(0,5,0,y)
        f.BackgroundColor3=Color3.fromRGB(20,20,40)
        f.BorderSizePixel=0
        f.Parent=sub
        Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=f
        local l=Instance.new("TextLabel")
        l.Size=UDim2.new(.6,0,1,0)
        l.Position=UDim2.new(0,7,0,0)
        l.BackgroundTransparency=1
        l.Text=name
        l.TextColor3=Color3.fromRGB(0,255,255)
        l.Font=Enum.Font.Gotham
        l.TextSize=10
        l.Parent=f
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(0,45,0,20)
        b.Position=UDim2.new(1,-50,0,5)
        b.BackgroundColor3=Color3.fromRGB(30,30,50)
        b.Text="OFF"
        b.TextColor3=Color3.fromRGB(150,170,200)
        b.Font=Enum.Font.GothamBold
        b.TextSize=8
        b.Parent=f
        Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
        b.MouseButton1Click:Connect(function()
            local st=not(b.Text=="ON")
            b.BackgroundColor3=st and Color3.fromRGB(0,255,100)or Color3.fromRGB(30,30,50)
            b.Text=st and"ON"or"OFF"
            setter(st)
        end)
    end
    mkRole("Murderer",5,function(st)ESP_Murderer=st end)
    mkRole("Sheriff",38,function(st)ESP_Sheriff=st end)
    mkRole("Innocent",71,function(st)ESP_Innocent=st end)
end,110,function(state)ESP_Enabled=state end)

mkToggleWithSub(VisualSF,"Boxes",120,function(sub)
    local function mkRole2(name,y,setter)
        local f=Instance.new("Frame")
        f.Size=UDim2.new(1,-10,0,30)
        f.Position=UDim2.new(0,5,0,y)
        f.BackgroundColor3=Color3.fromRGB(20,20,40)
        f.BorderSizePixel=0
        f.Parent=sub
        Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=f
        local l=Instance.new("TextLabel")
        l.Size=UDim2.new(.6,0,1,0)
        l.Position=UDim2.new(0,7,0,0)
        l.BackgroundTransparency=1
        l.Text=name
        l.TextColor3=Color3.fromRGB(0,255,255)
        l.Font=Enum.Font.Gotham
        l.TextSize=10
        l.Parent=f
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(0,45,0,20)
        b.Position=UDim2.new(1,-50,0,5)
        b.BackgroundColor3=Color3.fromRGB(30,30,50)
        b.Text="OFF"
        b.TextColor3=Color3.fromRGB(150,170,200)
        b.Font=Enum.Font.GothamBold
        b.TextSize=8
        b.Parent=f
        Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=b
        b.MouseButton1Click:Connect(function()
            local st=not(b.Text=="ON")
            b.BackgroundColor3=st and Color3.fromRGB(0,255,100)or Color3.fromRGB(30,30,50)
            b.Text=st and"ON"or"OFF"
            setter(st)
        end)
    end
    mkRole2("Murderer",5,function(st)Boxes_Murderer=st end)
    mkRole2("Sheriff",38,function(st)Boxes_Sheriff=st end)
    mkRole2("Innocent",71,function(st)Boxes_Innocent=st end)
end,110,function(state)Boxes_Enabled=state end)

-- Tracer (НОРМАЛЬНЫЙ для пуль)
mkToggleWithSub(VisualSF,"Tracer",235,function(sub)
    local colors={
        {Name="White",Color=Color3.fromRGB(255,255,255)},
        {Name="Red",Color=Color3.fromRGB(255,50,50)},
        {Name="Blue",Color=Color3.fromRGB(0,100,255)},
        {Name="Green",Color=Color3.fromRGB(0,255,100)},
    }
    
    for i,c in pairs(colors)do
        local b=Instance.new("TextButton")
        b.Size=UDim2.new(1,-10,0,25)
        b.Position=UDim2.new(0,5,0,(i-1)*28)
        b.BackgroundColor3=c.Color
        b.Text=c.Name
        b.TextColor3=Color3.fromRGB(10,10,20)
        b.Font=Enum.Font.GothamBold
        b.TextSize=9
        b.Parent=sub
        Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=b
        b.MouseButton1Click:Connect(function()
            TracerColor=c.Color
        end)
    end
end,120,function(state)Tracer_Enabled=state end)

VisualSF.CanvasSize=UDim2.new(0,0,0,360)

-- ============ FLING ============
local FlingSF=MM2TabFrames.Fling

local FlingPlayerList=Instance.new("ScrollingFrame")
FlingPlayerList.Size=UDim2.new(1,-10,0,300)
FlingPlayerList.Position=UDim2.new(0,5,0,5)
FlingPlayerList.BackgroundColor3=Color3.fromRGB(15,15,25)
FlingPlayerList.BorderSizePixel=0
FlingPlayerList.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=FlingPlayerList

local function RealFling(targetPlayer)
    pcall(function()
        if not targetPlayer then return end
        local char=targetPlayer.Character
        if not char then return end
        local hrp=char:FindFirstChild("HumanoidRootPart")
        local hum=char:FindFirstChild("Humanoid")
        if not hrp then return end
        
        -- Отключаем анимации
        if hum then
            hum.PlatformStand=true
            hum:ChangeState(Enum.HumanoidStateType.Physics)
        end
        
        -- Мощный импульс
        hrp.Velocity=Vector3.new(math.random(-50000,50000),100000,math.random(-50000,50000))
        hrp.RotVelocity=Vector3.new(math.random(-5000,5000),math.random(-5000,5000),math.random(-5000,5000))
        
        -- Телепорт за карту через 0.5 сек
        task.delay(0.5,function()
            pcall(function()
                if hrp and hrp.Parent then
                    hrp.CFrame=CFrame.new(0,-3000,0)
                    hrp.Velocity=Vector3.new(0,0,0)
                    hrp.RotVelocity=Vector3.new(0,0,0)
                end
                if hum then hum.PlatformStand=false end
            end)
        end)
        
        Notify("РВАНУЛ "..targetPlayer.Name)
    end)
end

local function RefreshFlingList()
    pcall(function()
        for _,c in pairs(FlingPlayerList:GetChildren())do if c:IsA("TextButton")then c:Destroy()end end
        local y=0
        for _,p in pairs(P:GetPlayers())do
            if p~=L then
                local b=Instance.new("TextButton")
                b.Size=UDim2.new(1,-10,0,30)
                b.Position=UDim2.new(0,5,0,y)
                b.BackgroundColor3=Color3.fromRGB(20,20,35)
                b.Text=p.Name
                b.TextColor3=Color3.fromRGB(0,255,255)
                b.Font=Enum.Font.GothamBold
                b.TextSize=10
                b.Parent=FlingPlayerList
                Instance.new("UICorner").CornerRadius=UDim.new(0,5)Instance.new("UICorner").Parent=b
                b.MouseButton1Click:Connect(function()RealFling(p)end)
                b.Activated:Connect(function()RealFling(p)end)
                y+=34
            end
        end
        FlingPlayerList.CanvasSize=UDim2.new(0,0,0,y)
    end)
end
RefreshFlingList()

local FlingMurdererBtn=Instance.new("TextButton")
FlingMurdererBtn.Size=UDim2.new(1,-10,0,40)
FlingMurdererBtn.Position=UDim2.new(0,5,0,315)
FlingMurdererBtn.BackgroundColor3=Color3.fromRGB(255,0,255)
FlingMurdererBtn.Text="РВАНУТЬ МАРДЕРА"
FlingMurdererBtn.TextColor3=Color3.fromRGB(10,10,20)
FlingMurdererBtn.Font=Enum.Font.GothamBlack
FlingMurdererBtn.TextSize=12
FlingMurdererBtn.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=FlingMurdererBtn
FlingMurdererBtn.MouseButton1Click:Connect(function()
    pcall(function()
        for _,p in pairs(P:GetPlayers())do
            if p~=L and getRole(p)=="Murderer"then RealFling(p)return end
        end
    end)
end)

local FlingSheriffBtn=Instance.new("TextButton")
FlingSheriffBtn.Size=UDim2.new(1,-10,0,40)
FlingSheriffBtn.Position=UDim2.new(0,5,0,360)
FlingSheriffBtn.BackgroundColor3=Color3.fromRGB(0,100,255)
FlingSheriffBtn.Text="РВАНУТЬ ШЕРИФА"
FlingSheriffBtn.TextColor3=Color3.fromRGB(10,10,20)
FlingSheriffBtn.Font=Enum.Font.GothamBlack
FlingSheriffBtn.TextSize=12
FlingSheriffBtn.Parent=FlingSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=FlingSheriffBtn
FlingSheriffBtn.MouseButton1Click:Connect(function()
    pcall(function()
        for _,p in pairs(P:GetPlayers())do
            if p~=L and getRole(p)=="Sheriff"then RealFling(p)return end
        end
    end)
end)

FlingSF.CanvasSize=UDim2.new(0,0,0,410)

-- ============ OTHERS ============
local OthersSF=MM2TabFrames.Others

local AntiFlingFrame=Instance.new("Frame")
AntiFlingFrame.Size=UDim2.new(1,-10,0,42)
AntiFlingFrame.Position=UDim2.new(0,5,0,5)
AntiFlingFrame.BackgroundColor3=Color3.fromRGB(15,15,30)
AntiFlingFrame.BorderSizePixel=0
AntiFlingFrame.Parent=OthersSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=AntiFlingFrame

local AntiFlingLabel=Instance.new("TextLabel")
AntiFlingLabel.Size=UDim2.new(.55,0,1,0)
AntiFlingLabel.Position=UDim2.new(0,11,0,0)
AntiFlingLabel.BackgroundTransparency=1
AntiFlingLabel.Text="Anti-Fling"
AntiFlingLabel.TextColor3=Color3.fromRGB(0,255,255)
AntiFlingLabel.Font=Enum.Font.Gotham
AntiFlingLabel.TextSize=12
AntiFlingLabel.Parent=AntiFlingFrame

local AntiFlingToggle=Instance.new("TextButton")
AntiFlingToggle.Size=UDim2.new(0,55,0,25)
AntiFlingToggle.Position=UDim2.new(1,-60,0,8)
AntiFlingToggle.BackgroundColor3=Color3.fromRGB(30,30,50)
AntiFlingToggle.Text="OFF"
AntiFlingToggle.TextColor3=Color3.fromRGB(150,170,200)
AntiFlingToggle.Font=Enum.Font.GothamBold
AntiFlingToggle.TextSize=9
AntiFlingToggle.Parent=AntiFlingFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=AntiFlingToggle

AntiFlingToggle.MouseButton1Click:Connect(function()
    AntiFling_Enabled=not AntiFling_Enabled
    AntiFlingToggle.BackgroundColor3=AntiFling_Enabled and Color3.fromRGB(0,255,100)or Color3.fromRGB(30,30,50)
    AntiFlingToggle.Text=AntiFling_Enabled and"ON"or"OFF"
end)

local HideFrame=Instance.new("Frame")
HideFrame.Size=UDim2.new(1,-10,0,60)
HideFrame.Position=UDim2.new(0,5,0,55)
HideFrame.BackgroundColor3=Color3.fromRGB(15,15,30)
HideFrame.BorderSizePixel=0
HideFrame.Parent=OthersSF
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=HideFrame

local HideLabel=Instance.new("TextLabel")
HideLabel.Size=UDim2.new(1,0,0,25)
HideLabel.Position=UDim2.new(0,5,0,5)
HideLabel.BackgroundTransparency=1
HideLabel.Text="Hide Key: "..HideKey
HideLabel.TextColor3=Color3.fromRGB(0,255,255)
HideLabel.Font=Enum.Font.GothamBold
HideLabel.TextSize=12
HideLabel.Parent=HideFrame

local ChangeKeyBtn=Instance.new("TextButton")
ChangeKeyBtn.Size=UDim2.new(1,-20,0,25)
ChangeKeyBtn.Position=UDim2.new(0,10,0,32)
ChangeKeyBtn.BackgroundColor3=Color3.fromRGB(0,255,255)
ChangeKeyBtn.Text="CHANGE KEY"
ChangeKeyBtn.TextColor3=Color3.fromRGB(10,10,20)
ChangeKeyBtn.Font=Enum.Font.GothamBold
ChangeKeyBtn.TextSize=10
ChangeKeyBtn.Parent=HideFrame
Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=ChangeKeyBtn

local listeningForKeys=false
ChangeKeyBtn.MouseButton1Click:Connect(function()
    listeningForKeys=true
    ChangeKeyBtn.Text="PRESS ANY KEY..."
end)

U.InputBegan:Connect(function(input,gameProcessed)
    if listeningForKeys and not gameProcessed then
        if input.KeyCode~=Enum.KeyCode.Unknown then
            HideKey=input.KeyCode.Name
            HideLabel.Text="Hide Key: "..HideKey
            ChangeKeyBtn.Text="CHANGE KEY"
            listeningForKeys=false
        end
    end
end)

OthersSF.CanvasSize=UDim2.new(0,0,0,130)

-- ============ INIT ============
MM2TabFrames.Combat.Visible=true
MM2TabButtons.Combat.BackgroundColor3=Color3.fromRGB(0,255,255)
MM2TabButtons.Combat.TextColor3=Color3.fromRGB(10,10,20)

-- ============ LOGIC ============
R.RenderStepped:Connect(function()
    pcall(function()
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
        
        if KillAll_Enabled then
            for _,p in pairs(P:GetPlayers())do
                if p~=L and not Whitelist[p.Name]and p.Character and p.Character:FindFirstChild("Humanoid")then
                    p.Character.Humanoid.Health=0
                end
            end
        end
        
        if Spin_Enabled and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            L.Character.HumanoidRootPart.CFrame=L.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(SpinSpeed),0)
        end
        
        if AntiFling_Enabled and L.Character and L.Character:FindFirstChild("HumanoidRootPart")then
            local hrp=L.Character.HumanoidRootPart
            if hrp.Velocity.Magnitude>200 then
                hrp.Velocity=Vector3.new(0,0,0)
                hrp.RotVelocity=Vector3.new(0,0,0)
                local hum=L.Character:FindFirstChild("Humanoid")
                if hum then hum.PlatformStand=true task.delay(0.3,function()pcall(function()hum.PlatformStand=false end)end)end
            end
        end
    end)
end)

-- ============ PANEL DRAG ============
local panelDragging=false
local panelStart=nil
local panelPos=nil
MM2Header.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        panelDragging=true
        panelStart=i.Position
        panelPos=MM2Panel.Position
    end
end)
U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        panelDragging=false
    end
end)
U.InputChanged:Connect(function(i)
    if panelDragging and i.UserInputType==Enum.UserInputType.MouseMovement then
        local d=i.Position-panelStart
        MM2Panel.Position=UDim2.new(panelPos.X.Scale,panelPos.X.Offset+d.X,panelPos.Y.Scale,panelPos.Y.Offset+d.Y)
    end
end)

-- ============ OPEN/CLOSE ============
function OpenMM2Panel()
    MM2Panel.Visible=true
    MM2Panel.Size=UDim2.new(0,0,0,0)
    MM2Panel.BackgroundTransparency=1
    T:Create(MM2Panel,TweenInfo.new(.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{
        Size=UDim2.new(0,600,0,600),
        BackgroundTransparency=0
    }):Play()
end

function CloseMM2Panel()
    T:Create(MM2Panel,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
    task.wait(.3)
    MM2Panel.Visible=false
end

MM2CloseBtn.MouseButton1Click:Connect(CloseMM2Panel)

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

U.InputBegan:Connect(function(input,gameProcessed)
    if gameProcessed then return end
    if input.KeyCode==Enum.KeyCode[HideKey]then
        MM2Bar.Visible=not MM2Bar.Visible
        if MM2Panel.Visible then MM2Panel.Visible=false end
    end
end)

local barDragging=false
local barStartPos=nil
local barOrigPos=nil
MM2Bar.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        barDragging=true
        barStartPos=i.Position
        barOrigPos=MM2Bar.Position
    end
end)
U.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        barDragging=false
    end
end)
U.InputChanged:Connect(function(i)
    if barDragging and i.UserInputType==Enum.UserInputType.MouseMovement then
        local d=i.Position-barStartPos
        MM2Bar.Position=UDim2.new(barOrigPos.X.Scale,barOrigPos.X.Offset+d.X,barOrigPos.Y.Scale,barOrigPos.Y.Offset+d.Y)
    end
end)

MM2Execute.MouseButton1Click:Connect(function()
    T:Create(LauncherMenu,TweenInfo.new(.3),{Size=UDim2.new(0,0,0,0),BackgroundTransparency=1}):Play()
    task.wait(.3)
    LauncherMenu.Visible=false
    LG:Destroy()
    MG.Enabled=true
end)

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

Notify("SYPHIX HUB loaded! ESP updates every frame!")
