Citizen.CreateThread(function()
    while true do
        Citizen.Wait(200) -- Mets à jour toutes les 200ms

        local ped = PlayerPedId()
        local health = GetEntityHealth(ped) - 100 -- La santé commence à 100 (max 200)
        local armor = GetPedArmour(ped)

        SendNUIMessage({
            type = "updateHUD",
            health = health,
            armor = armor
        })
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Désactive la barre de vie / armure GTA
        HideHudComponentThisFrame(20)

        -- Désactive la mini-map
        DisplayRadar(false)
    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Affiche ta mini-map custom
        DisplayRadar(true)

        -- Masque juste la vie/armure de base
        HideHudComponentThisFrame(20)

        -- Envoie les données au NUI
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped) - 100
        local armor = GetPedArmour(ped)

        SendNUIMessage({
            type = "updateHUD",
            health = health,
            armor = armor
        })
    end
end)

