-- Chargement de la bibliothèque pour l'interface utilisateur
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Création de la fenêtre principale
local Window = Library.CreateLib("NEXUS", "BloodTheme")

-- Création de l'onglet et de la section pour la vérification
local HOME = Window:NewTab("NEXUS VERIFICATION")
local MainSection = HOME:NewSection("VERIFICATION")

-- URL de l'API de vérification
local API_URL = "https://your-server-url.com/check-key"

-- Fonction pour vérifier une clé auprès de l'API
local function verifyKey(key)
    local HttpService = game:GetService("HttpService")

    -- Envoie une requête POST à l'API
    local success, response = pcall(function()
        return HttpService:PostAsync(API_URL, HttpService:JSONEncode({ key = key }), Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        -- Décodage de la réponse de l'API
        local data = HttpService:JSONDecode(response)
        if data.message == "Key is valid." then
            return true
        else
            print("Server response:", data.message)
            return false
        end
    else
        warn("Error connecting to the server:", response)
        return false
    end
end

-- Fonction pour créer l'interface de saisie de clé
local function createKeyInterface()
    local keyBox = MainSection:NewTextBox("Enter Key", "Enter your key to proceed", true, function(input)
        local key = input
        if verifyKey(key) then
            print("Key validated! Access granted.")
            
            -- Supprimer l'interface de clé
            keyBox:Destroy()

            -- Afficher une interface de succès
            local successTab = Window:NewTab("Success")
            local successSection = successTab:NewSection("Welcome to the NEXUS")

            successSection:NewLabel("You have successfully entered the correct key!")
            successSection:NewButton("Do something cool", "Click me for a cool action", function()
                print("Cool action performed!")
            end)
        else
            print("Invalid key! Access denied.")
        end
    end)
end

-- Lancer l'interface de saisie de clé
createKeyInterface()
