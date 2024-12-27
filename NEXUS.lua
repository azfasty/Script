local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Créer un frame pour contenir le champ de texte et le bouton
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)  -- Taille du frame
frame.Position = UDim2.new(0.5, -200, 0.5, -100)  -- Centrer sur l'écran
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Parent = screenGui

-- Ajouter un TextBox pour entrer la clé
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, 0, 0.4, 0)  -- Prendre toute la largeur du frame
keyBox.Position = UDim2.new(0, 0, 0, 0)
keyBox.PlaceholderText = "Entrez la clé ici"
keyBox.TextSize = 24
keyBox.TextColor3 = Color3.fromRGB(0, 0, 0)
keyBox.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
keyBox.Parent = frame

-- Ajouter un bouton pour valider la clé
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, 0, 0.3, 0)  -- Prendre toute la largeur du frame
button.Position = UDim2.new(0, 0, 0.4, 0)
button.Text = "Vérifier la clé"
button.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame

-- Création de la vidéo (initialement cachée)
local videoFrame = Instance.new("VideoFrame")
videoFrame.Size = UDim2.new(1, 0, 1, 0)  -- Plein écran
videoFrame.Position = UDim2.new(0, 0, 0, 0)
videoFrame.Video = "https://www.dropbox.com/scl/fi/6hzpkw8r1i06fa88g8nq3/ssstik.io_-jjp11__1735215402093.mp4?rlkey=5aypijgyfu2qhmdczwmqqd2hb&st=uyc5m6fz&dl=1"  -- Lien direct vers la vidéo
videoFrame.Looped = true
videoFrame.Visible = false  -- La vidéo est cachée au départ
videoFrame.Parent = screenGui

-- Fonction de vérification de la clé
local correctKey = "123"  -- La clé correcte

button.MouseButton1Click:Connect(function()
    local enteredKey = keyBox.Text  -- Récupérer le texte entré par l'utilisateur

    if enteredKey == correctKey then
        -- Si la clé est correcte, on continue normalement
        print("Clé correcte, accès autorisé")
        frame:Destroy()  -- Supprimer le GUI une fois que la clé est valide
        -- Ici, tu peux ajouter le code du script VIP que tu veux exécuter après la validation de la clé
    else
        -- Si la clé est incorrecte, afficher la vidéo en plein écran
        videoFrame.Visible = true  -- Afficher la vidéo
        videoFrame:Play()  -- Commencer la lecture de la vidéo
        keyBox.Text = ""  -- Réinitialiser le champ de texte
    end
end)
