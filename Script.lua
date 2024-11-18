-- Script : FLASH (sans système de clé)

-- Initialisation du GUI
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local closeButton = Instance.new("TextButton")
local minimizeButton = Instance.new("TextButton")
local titleLabel = Instance.new("TextLabel")
local tabsFrame = Instance.new("Frame")
local tabButtons = {}
local tabs = {}

-- Fonction de création des onglets
local function createTab(name)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, 80, 0, 30)
    tabButton.Text = name
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Parent = tabsFrame

    local tabContent = Instance.new("Frame")
    tabContent.Size = UDim2.new(1, 0, 1, -30)
    tabContent.Position = UDim2.new(0, 0, 0, 30)
    tabContent.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabContent.Visible = false
    tabContent.Parent = mainFrame

    tabButton.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do
            t.Visible = false
        end
        tabContent.Visible = true
    end)

    tabButtons[name] = tabButton
    tabs[name] = tabContent
end

-- Création du GUI
screenGui.Name = "FLASH_GUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.IgnoreGuiInset = true

mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 350)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Coins arrondis
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = mainFrame

closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -40, 0, 10)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Parent = mainFrame
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -80, 0, 10)
minimizeButton.Text = "_"
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
minimizeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
minimizeButton.Parent = mainFrame

minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "FLASH Menu"
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.Parent = mainFrame

tabsFrame.Size = UDim2.new(1, 0, 0, 30)
tabsFrame.Position = UDim2.new(0, 0, 0, 30)
tabsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
tabsFrame.Parent = mainFrame

-- Ajout des onglets
createTab("Home")
createTab("Multiplayer")
createTab("Player")
createTab("Car Mods")
createTab("Miscellaneous")
createTab("ESP")
createTab("Aimbot")

-- Remplir les onglets
local homeTab = tabs["Home"]
local homeLabel = Instance.new("TextLabel")
homeLabel.Size = UDim2.new(0, 300, 0, 30)
homeLabel.Position = UDim2.new(0.5, -150, 0.1, 0)
homeLabel.Text = "Bienvenue dans FLASH"
homeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
homeLabel.BackgroundTransparency = 1
homeLabel.Parent = homeTab

local carModsTab = tabs["Car Mods"]
local speedSlider = Instance.new("TextLabel")
speedSlider.Size = UDim2.new(0, 300, 0, 30)
speedSlider.Position = UDim2.new(0.5, -150, 0.2, 0)
speedSlider.Text = "Speed: Adjust here"
speedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
speedSlider.BackgroundTransparency = 1
speedSlider.Parent = carModsTab

-- Afficher le premier onglet par défaut
tabs["Home"].Visible = true
