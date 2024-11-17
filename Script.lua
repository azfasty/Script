-- Script : FLASH avec coins arrondis

-- Variables principales
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local uiCorner = Instance.new("UICorner") -- Pour coins arrondis
local closeButton = Instance.new("TextButton")
local minimizeButton = Instance.new("TextButton")
local keyInput = Instance.new("TextBox")
local validateButton = Instance.new("TextButton")
local successMessage = Instance.new("TextLabel")
local guiTabs = Instance.new("Frame")
local minimized = false

-- Initialisation du GUI
local function createGUI()
    -- Configuration principale
    screenGui.Name = "FLASH"
    screenGui.Parent = player.PlayerGui
    screenGui.ResetOnSpawn = false

    -- Cadre principal
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    -- Coins arrondis pour le cadre principal
    uiCorner.CornerRadius = UDim.new(0, 15) -- Ajuste le rayon ici
    uiCorner.Parent = mainFrame

    -- Bouton fermer
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.Parent = mainFrame
    local closeUICorner = Instance.new("UICorner", closeButton)
    closeUICorner.CornerRadius = UDim.new(0, 5) -- Coins arrondis pour le bouton

    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Bouton réduire
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -70, 0, 5)
    minimizeButton.Text = "_"
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    minimizeButton.Parent = mainFrame
    local minimizeUICorner = Instance.new("UICorner", minimizeButton)
    minimizeUICorner.CornerRadius = UDim.new(0, 5) -- Coins arrondis pour le bouton

    minimizeButton.MouseButton1Click:Connect(function()
        if minimized then
            mainFrame:TweenSize(UDim2.new(0, 400, 0, 300), "Out", "Quad", 0.3, true)
            minimized = false
        else
            mainFrame:TweenSize(UDim2.new(0, 400, 0, 50), "Out", "Quad", 0.3, true)
            minimized = true
        end
    end)

    -- Champ de texte pour la clé
    keyInput.Size = UDim2.new(0, 300, 0, 30)
    keyInput.Position = UDim2.new(0.5, -150, 0.3, 0)
    keyInput.PlaceholderText = "Entrez votre clé"
    keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.Parent = mainFrame
    local keyInputUICorner = Instance.new("UICorner", keyInput)
    keyInputUICorner.CornerRadius = UDim.new(0, 5) -- Coins arrondis pour l'entrée texte

    -- Bouton valider
    validateButton.Size = UDim2.new(0, 100, 0, 30)
    validateButton.Position = UDim2.new(0.5, -50, 0.4, 0)
    validateButton.Text = "Valider"
    validateButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    validateButton.Parent = mainFrame
    local validateUICorner = Instance.new("UICorner", validateButton)
    validateUICorner.CornerRadius = UDim.new(0, 5) -- Coins arrondis pour le bouton

    validateButton.MouseButton1Click:Connect(function()
        if keyInput.Text == "3685" then
            successMessage.Text = "Clé valide ! Accès autorisé."
            successMessage.Visible = true
            mainFrame.Visible = false
            showTabs()
        else
            successMessage.Text = "Clé invalide !"
            successMessage.Visible = true
        end
    end)

    -- Message succès/erreur
    successMessage.Size = UDim2.new(0, 300, 0, 30)
    successMessage.Position = UDim2.new(0.5, -150, 0.5, 0)
    successMessage.Text = ""
    successMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
    successMessage.BackgroundTransparency = 1
    successMessage.Visible = false
    successMessage.Parent = mainFrame
end

-- Onglets après validation
local function showTabs()
    guiTabs.Name = "GuiTabs"
    guiTabs.Size = UDim2.new(0, 400, 0, 300)
    guiTabs.Position = UDim2.new(0.5, -200, 0.5, -150)
    guiTabs.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    guiTabs.Parent = screenGui
    local guiTabsUICorner = Instance.new("UICorner", guiTabs)
    guiTabsUICorner.CornerRadius = UDim.new(0, 15)

    local homeTab = Instance.new("TextLabel")
    homeTab.Size = UDim2.new(1, 0, 1, 0)
    homeTab.Text = "Bienvenue sur FLASH !"
    homeTab.TextScaled = true
    homeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
    homeTab.BackgroundTransparency = 1
    homeTab.Parent = guiTabs
end

-- Lancer l'interface
createGUI()
