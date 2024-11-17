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

-- Fonction de création du GUI
local function createGUI()
    -- Configuration de la fenêtre principale
    screenGui.Name = "FLASH"
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false

    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    mainFrame.BorderRadius = UDim.new(0, 10)
    mainFrame.Parent = screenGui

    -- Bouton fermer
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.Text = "X"
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeButton.BorderRadius = UDim.new(0, 5)
    closeButton.Parent = mainFrame
    closeButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    -- Bouton réduire
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -60, 0, 0)
    minimizeButton.Text = "_"
    minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    minimizeButton.BorderRadius = UDim.new(0, 5)
    minimizeButton.Parent = mainFrame

    -- Champ de texte pour entrer la clé
    keyInput.Size = UDim2.new(0, 300, 0, 30)
    keyInput.Position = UDim2.new(0.5, -150, 0.3, 0)
    keyInput.PlaceholderText = "Entrez votre clé"
    keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.BorderRadius = UDim.new(0, 5)
    keyInput.Parent = mainFrame

    -- Bouton valider
    validateButton.Size = UDim2.new(0, 100, 0, 30)
    validateButton.Position = UDim2.new(0.5, -50, 0.4, 0)
    validateButton.Text = "Valider"
    validateButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    validateButton.BorderRadius = UDim.new(0, 5)
    validateButton.Parent = mainFrame
    validateButton.MouseButton1Click:Connect(function()
        if keyInput.Text == "VALID_KEY" then
            successMessage.Text = "Clé valide ! Accès autorisé."
            errorMessage.Visible = false
            successMessage.Visible = true
            -- Passer au prochain écran de l'interface
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
    getKeyButton.BorderRadius = UDim.new(0, 5)
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

-- Fonction pour afficher les onglets après validation de la clé
local function showTabs()
    -- Créer le GUI pour les onglets
    guiTabs.Name = "GuiTabs"
    guiTabs.Size = UDim2.new(0, 400, 0, 300)
    guiTabs.Position = UDim2.new(0.5, -200, 0.5, -150)
    guiTabs.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    guiTabs.BorderRadius = UDim.new(0, 10)
    guiTabs.Parent = screenGui

    -- Ajouter des onglets comme Home, Multiplayer, Player, Car Mods, Miceseolaius, ESP, Aimbot ici
end

-- Fonction pour créer les sliders dans Car Mods
local function createCarModsTab()
    -- Créer le cadre pour l'onglet Car Mods
    local carModsFrame = Instance.new("Frame")
    carModsFrame.Name = "CarModsFrame"
    carModsFrame.Size = UDim2.new(0, 400, 0, 300)
    carModsFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    carModsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    carModsFrame.BorderRadius = UDim.new(0, 10)
    carModsFrame.Parent = screenGui

    -- Vitesse
    local speedSlider = Instance.new("Slider")
    speedSlider.Size = UDim2.new(0, 300, 0, 30)
    speedSlider.Position = UDim2.new(0.5, -150, 0.2, 0)
    speedSlider.MinValue = 0
    speedSlider.MaxValue = 200
    speedSlider.Value = 100
    speedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    speedSlider.Parent = carModsFrame

    local speedLabel = Instance.new("TextLabel")
    speedLabel.Size = UDim2.new(0, 200, 0, 30)
    speedLabel.Position = UDim2.new(0.5, -100, 0.1, 0)
    speedLabel.Text = "Vitesse: " .. tostring(speedSlider.Value)
    speedLabel.BackgroundTransparency = 1
    speedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    speedLabel.Parent = carModsFrame

    -- Mettre à jour la valeur en temps réel
    speedSlider.Changed:Connect(function()
        speedLabel.Text = "Vitesse: " .. tostring(speedSlider.Value)
        -- Ici vous pouvez lier cette valeur au comportement du véhicule (ajuster la vitesse)
    end)

-- Accélération
local accelerationSlider = Instance.new("Slider")
accelerationSlider.Size = UDim2.new(0, 300, 0, 30)
accelerationSlider.Position = UDim2.new(0.5, -150, 0.4, 0)
accelerationSlider.MinValue = 0
accelerationSlider.MaxValue = 100
accelerationSlider.Value = 50
accelerationSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
accelerationSlider.Parent = carModsFrame

local accelerationLabel = Instance.new("TextLabel")
accelerationLabel.Size = UDim2.new(0, 200, 0, 30)
accelerationLabel.Position = UDim2.new(0.5, -100, 0.3, 0)
accelerationLabel.Text = "Accélération: " .. tostring(accelerationSlider.Value)
accelerationLabel.BackgroundTransparency = 1
accelerationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
accelerationLabel.Parent = carModsFrame

-- Mettre à jour la valeur en temps réel
accelerationSlider.Changed:Connect(function()
    accelerationLabel.Text = "Accélération: " .. tostring(accelerationSlider.Value)
    -- Ici vous pouvez lier cette valeur au comportement du véhicule (ajuster l'accélération)
end)

-- Freinage
local brakeSlider = Instance.new("Slider")
brakeSlider.Size = UDim2.new(0, 300, 0, 30)
brakeSlider.Position = UDim2.new(0.5, -150, 0.6, 0)
brakeSlider.MinValue = 0
brakeSlider.MaxValue = 100
brakeSlider.Value = 30
brakeSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
brakeSlider.Parent = carModsFrame

local brakeLabel = Instance.new("TextLabel")
brakeLabel.Size = UDim2.new(0, 200, 0, 30)
brakeLabel.Position = UDim2.new(0.5, -100, 0.5, 0)
brakeLabel.Text = "Freinage: " .. tostring(brakeSlider.Value)
brakeLabel.BackgroundTransparency = 1
brakeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
brakeLabel.Parent = carModsFrame

-- Mettre à jour la valeur en temps réel
brakeSlider.Changed:Connect(function()
    brakeLabel.Text = "Freinage: " .. tostring(brakeSlider.Value)
    -- Ici vous pouvez lier cette valeur au comportement du véhicule (ajuster le freinage)
end)
end

-- Fonction d'animation de fermeture
local function closeWithAnimation()
    -- Animation de fermeture de la fenêtre
    mainFrame:TweenPosition(UDim2.new(0.5, -200, 1, 0), "Out", "Quad", 0.5, true)
    wait(0.5)
    screenGui:Destroy()
end

-- Lancer la création du GUI
createGUI()

-- Animation de fermeture lorsque le bouton est cliqué
closeButton.MouseButton1Click:Connect(closeWithAnimation)

-- Fonction pour afficher les onglets après validation de la clé
local function showTabs()
    -- Onglet Home
    local homeTab = Instance.new("Frame")
    homeTab.Size = UDim2.new(0, 400, 0, 300)
    homeTab.Position = UDim2.new(0.5, -200, 0.5, -150)
    homeTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    homeTab.Parent = guiTabs

    -- Afficher le nombre de joueurs et les pings (exemple)
    local playersLabel = Instance.new("TextLabel")
    playersLabel.Size = UDim2.new(0, 300, 0, 30)
    playersLabel.Position = UDim2.new(0.5, -150, 0.1, 0)
    playersLabel.Text = "Joueurs en ligne: " .. tostring(#game.Players:GetPlayers())
    playersLabel.BackgroundTransparency = 1
    playersLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    playersLabel.Parent = homeTab
end

-- Créer et afficher les onglets au démarrage
showTabs()
