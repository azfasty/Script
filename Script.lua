-- Script combiné de vol et de téléportations rapides
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Désactiver la gravité pour faire voler le joueur
humanoid.PlatformStand = true  -- Désactive les interactions physiques normales
humanoid.UseJumpPower = false  -- Désactive la puissance de saut

-- Fonction de vol et de téléportations rapides
local function flyAndTeleport()
    while true do
        -- Faire voler le joueur en maintenant une hauteur constante (ignorant la gravité)
        humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 10, 0)  -- Augmenter l'altitude du joueur

        -- Déplacement rapide et erratique en téléportant le joueur à des positions aléatoires
        local randomPosition = Vector3.new(
            math.random(-1000, 1000),  -- Déplacement sur l'axe X avec des valeurs aléatoires énormes
            50,                        -- Positionnement à une hauteur constante pour éviter de tomber
            math.random(-1000, 1000)   -- Déplacement sur l'axe Z avec des valeurs aléatoires énormes
        )

        humanoidRootPart.CFrame = CFrame.new(randomPosition)  -- Téléportation à une nouvelle position
        wait(0.1)  -- Délai très court pour rendre le mouvement erratique et anormal
    end
end

-- Exécution immédiate du script
flyAndTeleport()
