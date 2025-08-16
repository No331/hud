Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100) -- Mise à jour plus fréquente pour plus de fluidité

        local ped = PlayerPedId()
        local health = GetEntityHealth(ped) - 100 -- La santé commence à 100 (max 200)
        local armor = GetPedArmour(ped)

        -- Assure-toi que les valeurs sont dans la bonne plage
        health = math.max(0, math.min(100, health))
        armor = math.max(0, math.min(100, armor))

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

        -- Désactive la barre de vie / armure GTA par défaut
        HideHudComponentThisFrame(20) -- Health/Armor bars
        
        -- Optionnel: garde la minimap mais cache d'autres éléments HUD
        -- HideHudComponentThisFrame(1)  -- Wanted level
        -- HideHudComponentThisFrame(2)  -- Weapon icon
        -- HideHudComponentThisFrame(3)  -- Cash
        -- HideHudComponentThisFrame(4)  -- MP cash
        -- HideHudComponentThisFrame(13) -- Cash change
    end
end)