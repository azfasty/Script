local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local tabHolder = Instance.new("Frame")
local tabs = {"Home", "Car Mods", "Multiplayer", "Player ESP", "Miscellaneous"}

-- Configurer le GUI
screenGui.Name = "FlashGUI"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.IgnoreGuiInset = true

-- Fenêtre principale
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 300) -- Ajuster la taille si besoin
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150) -- Centré
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = true
mainFrame.BackgroundTransparency = 0.1

-- Créer le conteneur pour les onglets
tabHolder.Name = "TabHolder"
tabHolder.Size = UDim2.new(1, 0, 0.1, 0)
tabHolder.Position = UDim2.new(0, 0, 0, 0)
tabHolder.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabHolder.Parent = mainFrame

-- Générer les onglets automatiquement
for i, tabName in pairs(tabs) do
    local tab = Instance.new("TextButton")
    tab.Name = tabName .. "Tab"
    tab.Size = UDim2.new(0.2, 0, 1, 0) -- Divisé en 5 onglets égaux
    tab.Position = UDim2.new((i - 1) * 0.2, 0, 0, 0)
    tab.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    tab.Text = tabName
    tab.TextColor3 = Color3.fromRGB(255, 255, 255)
    tab.Parent = tabHolder

    -- Action sur clic (ajouter du contenu spécifique à l'onglet ici)
    tab.MouseButton1Click:Connect(function()
        print(tabName .. " selected")
        -- Ajouter du contenu spécifique ici pour chaque onglet
    end)
end

-- Contenu par défaut (affiché pour l'onglet Home au départ)
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, 0, 0.9, 0)
contentFrame.Position = UDim2.new(0, 0, 0.1, 0)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.Parent = mainFrame

local defaultLabel = Instance.new("TextLabel")
defaultLabel.Name = "DefaultLabel"
defaultLabel.Size = UDim2.new(1, 0, 1, 0)
defaultLabel.Position = UDim2.new(0, 0, 0, 0)
defaultLabel.BackgroundTransparency = 1
defaultLabel.Text = "Bienvenue dans l'onglet Home"
defaultLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
defaultLabel.TextScaled = true
defaultLabel.Parent = contentFrame
