-- SYPHIX HUB | Launcher v3
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

-- ============ LAUNCHER GUI ============
local G=Instance.new("ScreenGui")G.Name="SyphixHub"G.Parent=GetHui()

local BG=Instance.new("Frame")BG.Size=UDim2.new(1,0,1,0)BG.BackgroundColor3=Color3.fromRGB(0,0,0)BG.BackgroundTransparency=1 BG.Parent=G

local M=Instance.new("Frame")M.Size=UDim2.new(0,500,0,550)M.Position=UDim2.new(.5,-250,.5,-275)
M.BackgroundColor3=Color3.fromRGB(12,12,25)M.BorderSizePixel=0 M.BackgroundTransparency=1 M.Parent=G
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=M

local Border=Instance.new("Frame")Border.Size=UDim2.new(1,4,1,4)Border.Position=UDim2.new(0,-2,0,-2)
Border.BackgroundColor3=Color3.fromRGB(255,200,50)Border.BackgroundTransparency=0.7 Border.BorderSizePixel=0 Border.ZIndex=0 Border.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,18)Instance.new("UICorner").Parent=Border
M.ZIndex=1

local Header=Instance.new("Frame")Header.Size=UDim2.new(1,0,0,70)Header.BackgroundColor3=Color3.fromRGB(18,18,35)Header.BorderSizePixel=0 Header.Parent=M
Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=Header
local HeaderB=Instance.new("Frame")HeaderB.Size=UDim2.new(1,0,0,35)HeaderB.Position=UDim2.new(0,0,0,35)HeaderB.BackgroundColor3=Color3.fromRGB(18,18,35)HeaderB.BorderSizePixel=0 HeaderB.Parent=Header

local Logo=Instance.new("TextLabel")Logo.Size=UDim2.new(0,50,0,50)Logo.Position=UDim2.new(0,20,0,10)
Logo.BackgroundColor3=Color3.fromRGB(255,200,50)Logo.Text="S"Logo.TextColor3=Color3.fromRGB(15,15,25)
Logo.Font=Enum.Font.GothamBlack Logo.TextSize=30 Logo.Parent=Header
Instance.new("UICorner").CornerRadius=UDim.new(0,12)Instance.new("UICorner").Parent=Logo

local Title=Instance.new("TextLabel")Title.Size=UDim2.new(0,250,0,30)Title.Position=UDim2.new(0,80,0,12)
Title.BackgroundTransparency=1 Title.Text="SYPHIX HUB"Title.TextColor3=Color3.fromRGB(255,255,255)
Title.Font=Enum.Font.GothamBlack Title.TextSize=20 Title.TextXAlignment=Enum.TextXAlignment.Left Title.Parent=Header

local Sub=Instance.new("TextLabel")Sub.Size=UDim2.new(0,200,0,20)Sub.Position=UDim2.new(0,80,0,40)
Sub.BackgroundTransparency=1 Sub.Text="LAUNCHER v3.0"Sub.TextColor3=Color3.fromRGB(150,150,180)
Sub.Font=Enum.Font.Gotham Sub.TextSize=11 Sub.TextXAlignment=Enum.TextXAlignment.Left Sub.Parent=Header

local CloseBtn=Instance.new("TextButton")CloseBtn.Size=UDim2.new(0,30,0,30)CloseBtn.Position=UDim2.new(1,-40,0,20)
CloseBtn.BackgroundColor3=Color3.fromRGB(255,60,60)CloseBtn.Text="X"CloseBtn.TextColor3=Color3.fromRGB(255,255,255)
CloseBtn.Font=Enum.Font.GothamBold CloseBtn.TextSize=14 CloseBtn.Parent=Header
Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=CloseBtn
CloseBtn.MouseButton1Click:Connect(function()
    T:Create(M,TweenInfo.new(.3),{BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),Position=UDim2.new(.5,0,.5,0)}):Play()
    T:Create(BG,TweenInfo.new(.3),{BackgroundTransparency=1}):Play()
    task.wait(.3)
    G:Destroy()
end)

local dragging=false local ds=nil local sp=nil
Header.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true ds=i.Position sp=M.Position end end)
U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end end)
U.InputChanged:Connect(function(i)if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then local d=i.Position-ds M.Position=UDim2.new(sp.X.Scale,sp.X.Offset+d.X,sp.Y.Scale,sp.Y.Offset+d.Y)end end)

local Content=Instance.new("ScrollingFrame")Content.Size=UDim2.new(1,-30,1,-90)Content.Position=UDim2.new(0,15,0,80)
Content.BackgroundTransparency=1 Content.BorderSizePixel=0 Content.ScrollBarThickness=4 Content.ScrollBarImageColor3=Color3.fromRGB(255,200,50) Content.Parent=M

local Scripts={
    {Name="Murder Mystery 2",Desc="Menu Only",Icon="[M]",Color=Color3.fromRGB(255,80,80)},
    {Name="+1 Speed",Desc="Menu Only",Icon="[S]",Color=Color3.fromRGB(80,180,255)},
    {Name="Fling Things",Desc="Menu Only",Icon="[F]",Color=Color3.fromRGB(80,255,150)},
    {Name="Universal ESP",Desc="Menu Only",Icon="[U]",Color=Color3.fromRGB(255,200,50)},
    {Name="Universal Fly",Desc="Menu Only",Icon="[Y]",Color=Color3.fromRGB(200,100,255)},
}

local function CreateScriptCard(name,desc,icon,color,y)
    pcall(function()
        local Card=Instance.new("Frame")Card.Size=UDim2.new(1,0,0,70)Card.Position=UDim2.new(0,0,0,y)
        Card.BackgroundColor3=Color3.fromRGB(18,18,35)Card.BorderSizePixel=0 Card.Parent=Content
        Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=Card
        
        Card.MouseEnter:Connect(function()T:Create(Card,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(25,25,50)}):Play()end)
        Card.MouseLeave:Connect(function()T:Create(Card,TweenInfo.new(.3),{BackgroundColor3=Color3.fromRGB(18,18,35)}):Play()end)
        
        local IconFrame=Instance.new("Frame")IconFrame.Size=UDim2.new(0,50,0,50)IconFrame.Position=UDim2.new(0,10,0,10)
        IconFrame.BackgroundColor3=color IconFrame.BorderSizePixel=0 IconFrame.Parent=Card
        Instance.new("UICorner").CornerRadius=UDim.new(0,10)Instance.new("UICorner").Parent=IconFrame
        
        local IconText=Instance.new("TextLabel")IconText.Size=UDim2.new(1,0,1,0)IconText.BackgroundTransparency=1
        IconText.Text=icon IconText.TextColor3=Color3.fromRGB(15,15,25)IconText.Font=Enum.Font.GothamBlack IconText.TextSize=16 IconText.Parent=IconFrame
        
        local NameText=Instance.new("TextLabel")NameText.Size=UDim2.new(0,200,0,25)NameText.Position=UDim2.new(0,70,0,8)
        NameText.BackgroundTransparency=1 NameText.Text=name NameText.TextColor3=Color3.fromRGB(255,255,255)
        NameText.Font=Enum.Font.GothamBold NameText.TextSize=14 NameText.TextXAlignment=Enum.TextXAlignment.Left NameText.Parent=Card
        
        local DescText=Instance.new("TextLabel")DescText.Size=UDim2.new(0,250,0,20)DescText.Position=UDim2.new(0,70,0,35)
        DescText.BackgroundTransparency=1 DescText.Text=desc DescText.TextColor3=Color3.fromRGB(150,150,180)
        DescText.Font=Enum.Font.Gotham DescText.TextSize=10 DescText.TextXAlignment=Enum.TextXAlignment.Left DescText.Parent=Card
        
        local ExecuteBtn=Instance.new("TextButton")ExecuteBtn.Size=UDim2.new(0,80,0,35)ExecuteBtn.Position=UDim2.new(1,-90,0,17)
        ExecuteBtn.BackgroundColor3=Color3.fromRGB(60,200,100)ExecuteBtn.Text="EXECUTE"ExecuteBtn.TextColor3=Color3.fromRGB(15,15,25)
        ExecuteBtn.Font=Enum.Font.GothamBlack ExecuteBtn.TextSize=11 ExecuteBtn.Parent=Card
        Instance.new("UICorner").CornerRadius=UDim.new(0,8)Instance.new("UICorner").Parent=ExecuteBtn
        
        ExecuteBtn.MouseEnter:Connect(function()T:Create(ExecuteBtn,TweenInfo.new(.2),{Size=UDim2.new(0,85,0,38)}):Play()end)
        ExecuteBtn.MouseLeave:Connect(function()T:Create(ExecuteBtn,TweenInfo.new(.2),{Size=UDim2.new(0,80,0,35)}):Play()end)
        
        ExecuteBtn.MouseButton1Click:Connect(function()
            T:Create(ExecuteBtn,TweenInfo.new(.1),{Size=UDim2.new(0,75,0,32)}):Play()
            task.wait(.08)
            T:Create(ExecuteBtn,TweenInfo.new(.2,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,80,0,35)}):Play()
            Notify("Opening "..name.." menu...")
            
            task.delay(1,function()
                T:Create(M,TweenInfo.new(.4),{BackgroundTransparency=1,Size=UDim2.new(0,0,0,0),Position=UDim2.new(.5,0,.5,0)}):Play()
                T:Create(BG,TweenInfo.new(.4),{BackgroundTransparency=1}):Play()
                task.wait(.4)
                G:Destroy()
                OpenEmptyMenu(name)
            end)
        end)
    end)
end

for i,script in pairs(Scripts)do
    CreateScriptCard(script.Name,script.Desc,script.Icon,script.Color,(i-1)*78)
end

Content.CanvasSize=UDim2.new(0,0,0,#Scripts*78+10)

local Footer=Instance.new("TextLabel")Footer.Size=UDim2.new(1,0,0,20)Footer.Position=UDim2.new(0,0,1,-20)
Footer.BackgroundTransparency=1 Footer.Text="SYPHIX HUB | by Ryzen"Footer.TextColor3=Color3.fromRGB(100,100,130)
Footer.Font=Enum.Font.Gotham Footer.TextSize=10 Footer.Parent=M

T:Create(BG,TweenInfo.new(.4),{BackgroundTransparency=0.5}):Play()
T:Create(M,TweenInfo.new(.6,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0,Position=UDim2.new(.5,-250,.5,-275)}):Play()

-- ============ ПУСТОЕ МЕНЮ ============
function OpenEmptyMenu(scriptName)
    local MG=Instance.new("ScreenGui")MG.Name="EmptyMenu"MG.Parent=GetHui()
    
    local MM=Instance.new("Frame")MM.Size=UDim2.new(0,350,0,250)MM.Position=UDim2.new(.5,-175,.5,-125)
    MM.BackgroundColor3=Color3.fromRGB(12,12,25)MM.BorderSizePixel=0 MM.BackgroundTransparency=1 MM.Parent=MG
    Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=MM
    
    local Border2=Instance.new("Frame")Border2.Size=UDim2.new(1,3,1,3)Border2.Position=UDim2.new(0,-1,0,-1)
    Border2.BackgroundColor3=Color3.fromRGB(255,200,50)Border2.BackgroundTransparency=0.7 Border2.BorderSizePixel=0 Border2.ZIndex=0 Border2.Parent=MM
    Instance.new("UICorner").CornerRadius=UDim.new(0,16)Instance.new("UICorner").Parent=Border2
    MM.ZIndex=1
    
    local MTB=Instance.new("Frame")MTB.Size=UDim2.new(1,0,0,50)MTB.BackgroundColor3=Color3.fromRGB(18,18,35)MTB.BorderSizePixel=0 MTB.Parent=MM
    Instance.new("UICorner").CornerRadius=UDim.new(0,14)Instance.new("UICorner").Parent=MTB
    local MTBb=Instance.new("Frame")MTBb.Size=UDim2.new(1,0,0,25)MTBb.Position=UDim2.new(0,0,0,25)MTBb.BackgroundColor3=Color3.fromRGB(18,18,35)MTBb.BorderSizePixel=0 MTBb.Parent=MTB
    
    local MTitle=Instance.new("TextLabel")MTitle.Size=UDim2.new(0,250,0,30)MTitle.Position=UDim2.new(0,15,0,10)
    MTitle.BackgroundTransparency=1 MTitle.Text=scriptName MTitle.TextColor3=Color3.fromRGB(255,255,255)
    MTitle.Font=Enum.Font.GothamBlack MTitle.TextSize=15 MTitle.TextXAlignment=Enum.TextXAlignment.Left MTitle.Parent=MTB
    
    local MCB=Instance.new("TextButton")MCB.Size=UDim2.new(0,26,0,26)MCB.Position=UDim2.new(1,-32,0,12)
    MCB.BackgroundColor3=Color3.fromRGB(255,60,60)MCB.Text="X"MCB.TextColor3=Color3.fromRGB(255,255,255)
    MCB.Font=Enum.Font.GothamBold MCB.TextSize=12 MCB.Parent=MTB
    Instance.new("UICorner").CornerRadius=UDim.new(0,6)Instance.new("UICorner").Parent=MCB
    MCB.MouseButton1Click:Connect(function()MG:Destroy()end)
    
    local dragging2=false local ds2=nil local sp2=nil
    MTB.InputBegan:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging2=true ds2=i.Position sp2=MM.Position end end)
    U.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging2=false end end)
    U.InputChanged:Connect(function(i)if dragging2 and i.UserInputType==Enum.UserInputType.MouseMovement then local d=i.Position-ds2 MM.Position=UDim2.new(sp2.X.Scale,sp2.X.Offset+d.X,sp2.Y.Scale,sp2.Y.Offset+d.Y)end end)
    
    -- Заглушка
    local Placeholder=Instance.new("TextLabel")Placeholder.Size=UDim2.new(1,0,1,-50)Placeholder.Position=UDim2.new(0,0,0,50)
    Placeholder.BackgroundTransparency=1 Placeholder.Text="COMING SOON"Placeholder.TextColor3=Color3.fromRGB(100,100,150)
    Placeholder.Font=Enum.Font.GothamBold Placeholder.TextSize=20 Placeholder.Parent=MM
    
    T:Create(MM,TweenInfo.new(.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0,Position=UDim2.new(.5,-175,.5,-125)}):Play()
end

Notify("SYPHIX HUB loaded!")
