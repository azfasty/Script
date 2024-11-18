-- Script : Brookhaven Custom GUI

-- Création du GUI
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local closeButton = Instance.new("TextButton")
local minimizeButton = Instance.new("TextButton")
local titleLabel = Instance.new("TextLabel")
local tabsFrame = Instance.new("Frame")
local carModsButton = Instance.new("TextButton")

-- Variables pour modifier la voiture
local vehicleSpeed = 100 -- Vitesse par défaut
local acceleration = 50 -- Accélération par défaut

-- Configuration principale du GUI
screenGui.Name = "BrookhavenGUI"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 400)
mainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleLabel.Text = "Brookhaven Script"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 24
titleLabel.Parent = mainFrame

closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -50, 0, 0)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.Parent = mainFrame

-- Onglet Car Mods
carModsButton.Name = "CarModsButton"
carModsButton.Size = UDim2.new(0, 150, 0, 50)
carModsButton.Position = UDim2.new(0, 20, 0, 70)
carModsButton.Text = "Car Mods"
carModsButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
carModsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
carModsButton.Font = Enum.Font.SourceSans
carModsButton.TextSize = 18
carModsButton.Parent = mainFrame

-- Fonction pour modifier la vitesse de la voiture
local function adjustVehicleSpeed()
    local player = game.Players.LocalPlayer
    local character = player.Character
    local vehicle = character:FindFirstChildOfClass("VehicleSeat")

    if vehicle then
        vehicle.MaxSpeed = vehicleSpeed
        vehicle.Torque = acceleration
        print("Vitesse du véhicule modifiée :", vehicleSpeed)
    else
        print("Aucun véhicule détecté.")
    end
end

-- Interaction avec l'onglet Car Mods
carModsButton.MouseButton1Click:Connect(function()
    vehicleSpeed = 200 -- Exemple : doubler la vitesse
    acceleration = 100 -- Exemple : augmenter l'accélération
    adjustVehicleSpeed()
end)

-- Fermeture du GUI
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
