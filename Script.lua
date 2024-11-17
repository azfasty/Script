-- Script : FLASH avec onglets fonctionnels

-- Variables principales
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local uiCorner = Instance.new("UICorner")
local closeButton = Instance.new("TextButton")
local minimizeButton = Instance.new("TextButton")
local keyInput = Instance.new("TextBox")
local validateButton = Instance.new("TextButton")
local successMessage = Instance.new("TextLabel")
local tabsFrame = Instance.new("Frame") -- Cadre pour les onglets
local minimized = false

-- Initialisation de l'interface principale
local function createGUI()
    screenGui.Name = "FLASH"
    screenGui.Parent = player.PlayerGui
    screenGui.ResetOnSpawn = false

    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    uiCorner.CornerRadius = UDim.new(0, 15)
    uiCorner.Parent = mainFrame

    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.Parent = mainFrame
    local closeUICorner = Instance.new("UICorner", closeButton)
    closeUICorner.CornerRadius = UDim.new(0, 5)

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -70, 0, 5)
    minimizeButton.Text = "_"
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    minimizeButton.Parent = mainFrame
    local minimizeUICorner = Instance.new("UICorner", minimizeButton)
    minimizeUICorner.CornerRadius = UDim.new(0, 5)

    minimizeButton.MouseButton1Click:Connect(function()
        if minimized then
            mainFrame:TweenSize(UDim2.new(0, 400, 0, 300), "Out", "Quad", 0.3, true)
            minimized = false
        else
            mainFrame:TweenSize(UDim2.new(0, 400, 0, 50), "Out", "Quad", 0.3, true)
            minimized = true
        end
    end)

    keyInput.Size = UDim2.new(0, 300, 0, 30)
    keyInput.Position = UDim2.new(0.5, -150, 0.3, 0)
    keyInput.PlaceholderText = "Entrez votre clé"
    keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.Parent = mainFrame
    local keyInputUICorner = Instance.new("UICorner", keyInput)
    keyInputUICorner.CornerRadius = UDim.new(0, 5)

    validateButton.Size = UDim2.new(0, 100, 0, 30)
    validateButton.Position = UDim2.new(0.5, -50, 0.4, 0)
    validateButton.Text = "Valider"
    validateButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    validateButton.Parent = mainFrame
    local validateUICorner = Instance.new("UICorner", validateButton)
    validateUICorner.CornerRadius = UDim.new(0, 5)

    validateButton.MouseButton1Click:Connect(function()
        if keyInput.Text == "3685" then
            successMessage.Text = "Clé valide !"
            successMessage.Visible = true
            mainFrame:Destroy()
            showTabs()
        else
            successMessage.Text = "Clé invalide !"
            successMessage.Visible = true
        end
    end)

    successMessage.Size = UDim2.new(0, 300, 0, 30)
    successMessage.Position = UDim2.new(0.5, -150, 0.5, 0)
    successMessage.Text = ""
    successMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
    successMessage.BackgroundTransparency = 1
    successMessage.Visible = false
    successMessage.Parent = mainFrame
end

-- Affichage des onglets
local function showTabs()
    tabsFrame.Size = UDim2.new(0, 400, 0, 300)
    tabsFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    tabsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    tabsFrame.Parent = screenGui

    local uiCorner = Instance.new("UICorner", tabsFrame)
    uiCorner.CornerRadius = UDim.new(0, 15)

    -- Création des onglets
    local tabs = {"Home", "Car Mods", "Multiplayer", "Player ESP", "Aimbot", "Miscellaneous"}
    for i, tab in ipairs(tabs) do
        local tabButton = Instance.new("TextButton")
        tabButton.Size = UDim2.new(0, 100, 0, 30)
        tabButton.Position = UDim2.new(0, (i - 1) * 105, 0, 10)
        tabButton.Text = tab
        tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        tabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        tabButton.Parent = tabsFrame
        local tabUICorner = Instance.new("UICorner", tabButton)
        tabUICorner.CornerRadius = UDim.new(0, 5)
    end
end

-- Lancer l'interface
createGUI()
