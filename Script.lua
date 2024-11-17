-- Script : FLASH

-- Déclaration des variables pour le GUI
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local closeButton = Instance.new("TextButton")
local minimizeButton = Instance.new("TextButton")
local keyInput = Instance.new("TextBox")
local validateButton = Instance.new("TextButton")
local getKeyButton = Instance.new("TextButton")
local successMessage = Instance.new("TextLabel")
local errorMessage = Instance.new("TextLabel")
local guiTabs = Instance.new("Frame")
local uicorner = Instance.new("UICorner")

-- Fonction de création du GUI
local function createGUI()
    -- Configuration de la fenêtre principale
    screenGui.Name = "FLASH"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false

    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.Parent = screenGui

    -- Coins arrondis pour le cadre principal
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame

    -- Permettre de déplacer la fenêtre
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- Bouton fermer
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.Parent = mainFrame
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Bouton réduire
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -60, 0, 0)
    minimizeButton.Text = "_"
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    minimizeButton.Parent = mainFrame

    -- Champ de texte pour entrer la clé
    keyInput.Size = UDim2.new(0, 300, 0, 30)
    keyInput.Position = UDim2.new(0.5, -150, 0.3, 0)
    keyInput.PlaceholderText = "Entrez votre clé"
    keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.Parent = mainFrame

    -- Bouton valider
    validateButton.Size = UDim2.new(0, 100, 0, 30)
    validateButton.Position = UDim2.new(0.5, -50, 0.4, 0)
    validateButton.Text = "Valider"
    validateButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    validateButton.Parent = mainFrame
    validateButton.MouseButton1Click:Connect(function()
        if keyInput.Text == "3685" then
            successMessage.Text = "Clé valide ! Accès autorisé."
            errorMessage.Visible = false
            successMessage.Visible = true
            -- Afficher les onglets
            showTabs()
        else
            errorMessage.Text = "Clé invalide. Essayez encore."
            successMessage.Visible = false
            errorMessage.Visible = true
        end
    end)

    -- Bouton Get Key
    getKeyButton.Size = UDim2.new(0, 100, 0, 30)
    getKeyButton.Position = UDim2.new(0.5, -50, 0.5, 0)
    getKeyButton.Text = "Get Key"
    getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    getKeyButton.Parent = mainFrame
    getKeyButton.MouseButton1Click:Connect(function()
        setclipboard("https://linkvertise.com/your-key-page")
        errorMessage.Text = "Le lien a été copié !"
        errorMessage.Visible = true
    end)

    -- Message de succès
    successMessage.Size = UDim2.new(0, 300, 0, 30)
    successMessage.Position = UDim2.new(0.5, -150, 0.6, 0)
    successMessage.Text = ""
    successMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
    successMessage.BackgroundTransparency = 1
    successMessage.Visible = false
    successMessage.Parent = mainFrame

    -- Message d'erreur
    errorMessage.Size = UDim2.new(0, 300, 0, 30)
    errorMessage.Position = UDim2.new(0.5, -150, 0.6, 0)
    errorMessage.Text = ""
    errorMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
    errorMessage.BackgroundTransparency = 1
    errorMessage.Visible = false
    errorMessage.Parent = mainFrame
end

-- Fonction pour afficher les onglets
local function showTabs()
    guiTabs.Name = "GuiTabs"
    guiTabs.Size = mainFrame.Size
    guiTabs.Position = mainFrame.Position
    guiTabs.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    guiTabs.Parent = screenGui

    -- Exemple : Onglet Home
    local homeLabel = Instance.new("TextLabel")
    homeLabel.Size = UDim2.new(0, 300, 0, 30)
    homeLabel.Position = UDim2.new(0.5, -150, 0.1, 0)
    homeLabel.Text = "Bienvenue dans FLASH !"
    homeLabel.BackgroundTransparency = 1
    homeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    homeLabel.Parent = guiTabs
end

-- Lancer la création du GUI
createGUI()
