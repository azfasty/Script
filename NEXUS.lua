local HttpService = game:GetService("HttpService")
local hwdListUrl = "https://pastebin.com/raw/14dhpyFS"  -- URL brute du fichier Pastebin
local videoUrl = "https://youtu.be/B6cXCFbLg6o?si=-xiYoZhOO32LStxD"  -- URL de la vidéo YouTube
local hwd = identifyexecutor and identifyexecutor() or "unknown_hwd"  -- Récupérer le HWD de l'utilisateur

-- Fonction pour télécharger et récupérer la liste des HWD depuis Pastebin
local function fetchHwdList()
    local response
    local success, errorMessage = pcall(function()
        response = HttpService:GetAsync(hwdListUrl)
    end)

    if success and response then
        -- Le fichier Pastebin contient une table de HWDs
        local hwdListFunc = loadstring(response)
        if hwdListFunc then
            return hwdListFunc()  -- Retourne la liste des HWD autorisés sous forme de table
        else
            error("Impossible de charger la liste des HWD.")
        end
    else
        error("Erreur lors du téléchargement des données : " .. (errorMessage or ""))
    end
end

-- Fonction pour vérifier si le HWD est autorisé
local function isHwdAuthorized(hwd)
    local hwdList = fetchHwdList()
    for _, authorizedHwd in ipairs(hwdList) do
        if authorizedHwd == hwd then
            return true  -- Si le HWD est trouvé, il est autorisé
        end
    end
    return false  -- Si le HWD n'est pas trouvé, l'accès est refusé
end

-- Fonction principale pour lancer le script
local function main()
    if not isHwdAuthorized(hwd) then
        print("HWD non autorisé. Lecture de la vidéo.")
        -- Si le HWD n'est pas autorisé, afficher la vidéo en boucle
        while true do
            game:GetService("GuiService"):OpenBrowserWindow(videoUrl)
            wait(10)  -- Répéter l'ouverture toutes les 10 secondes
        end
    else
        print("HWD autorisé. Script activé.")
        -- Code principal du script ici, si l'utilisateur est autorisé
    end
end

-- Lancer la vérification
main()
