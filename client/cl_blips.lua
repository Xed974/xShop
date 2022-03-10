Citizen.CreateThread(function()
    for k,v in pairs (Config.Shop.Position) do
        local superette = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(superette, Config.Shop.Model)
        SetBlipColour(superette, Config.Shop.Couleur)
        SetBlipScale(superette, Config.Shop.Taille)
        SetBlipAsShortRange(superette, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Supérette")
        EndTextCommandSetBlipName(superette)
    end
end)