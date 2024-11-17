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

-- Onglets et leurs contenus
local guiTabs = Instance.new("Frame")
local carModsTab = Instance.new("Frame")
local sliders = {}

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

    -- Bouton fermer
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -40, 0, 10)
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.Parent = mainFrame
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Bouton réduire
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -80, 0, 10)
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
        if keyInput.Text == "VALID_KEY" then
            successMessage.Text = "Clé valide ! Accès autorisé."
            successMessage.Visible = true
            showTabs()
        else
            errorMessage.Text = "Clé invalide. Essayez encore."
            errorMessage.Visible = true
        end
    end)

    -- Message de succès
    successMessage.Size = UDim2.new(0, 300, 0, 30)
    successMessage.Position = UDim2.new(0.5, -150, 0.6, 0)
    successMessage.Text = ""
    successMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
    successMessage.BackgroundTransparency = 1
    successMessage.Visible = false
    successMessage.Parent = mainFrame
end

-- Fonction pour afficher les onglets après validation
local function showTabs()
    mainFrame.Visible = false
    guiTabs.Size = UDim2.new(1, 0, 1, 0)
    guiTabs.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    guiTabs.Parent = screenGui

    -- Onglet Car Mods
    carModsTab.Size = UDim2.new(1, 0, 1, 0)
    carModsTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    carModsTab.Visible = true
    carModsTab.Parent = guiTabs

    createCarModsTab()
end

-- Fonction pour ajouter des sliders
local function createSlider(tab, label, min, max, default, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(0, 300, 0, 50)
    sliderFrame.Position = UDim2.new(0.5, -150, #sliders * 60, 0)
    sliderFrame.Parent = tab

    local sliderLabel = Instance.new("TextLabel")
    sliderLabel.Size = UDim2.new(0, 150, 0, 50)
    sliderLabel.Text = label .. ": " .. default
    sliderLabel.Parent = sliderFrame

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(0, 100, 0, 10)
    sliderBar.Position = UDim2.new(0, 160, 0.5, -5)
    sliderBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    sliderBar.Parent = sliderFrame

    sliderFrame.MouseButton1Down:Connect(function()
        local value = math.random(min, max) -- Simulation
        sliderLabel.Text = label .. ": " .. value
        callback(value)
    end)

    table.insert(sliders, sliderFrame)
end

-- Initialisation
createGUI()
