local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("NEXUS", "BloodTheme")

local HOME = Window:NewTab("HOME")
local MainSection = HOME:NewSection("HOME")

local PLAYER = Window:NewTab("PLAYER")

-- URL du fichier GitHub (modifié avec l'URL correcte)
local GITHUB_URL = "https://raw.githubusercontent.com/azfasty/Script/main/NEXUS.lua"  -- Assurez-vous que l'URL est correcte

-- Fonction pour récupérer le contenu du fichier GitHub
local function getGitHubContent()
    local success, response = pcall(function()
        return game:GetService("HttpService"):GetAsync(GITHUB_URL)
    end)

    if success then
        return response
    else
        return nil
    end
end

-- Fonction de vérification de la clé
local function verifyKey(key)
    local content = getGitHubContent()
    
    if content then
        -- Vérifier si la clé est présente dans le fichier GitHub
        if string.find(content, key) then
            return true
        else
            return false
        end
    else
        warn("Erreur lors de la récupération du fichier GitHub.")
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

            -- Afficher la vraie interface après validation de la clé
            local successTab = Window:NewTab("Success")
            local successSection = successTab:NewSection("Welcome to the NEXUS")

            -- Exemple de contenu de la vraie interface
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
