RegisterServerEvent('krp-pizza:cash')
AddEventHandler('krp-pizza:cash',function(cash)
    TriggerEvent('es:getPlayerFromId',source, function(user)
        user.addMoney(cash)
    end)
end)