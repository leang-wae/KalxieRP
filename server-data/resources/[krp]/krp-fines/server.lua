KRPCore = nil

TriggerEvent('krp:getSharedObject', function(obj) KRPCore = obj end)

RegisterCommand('fine', function(source, args, raw)
    local src = source
    local myPed = GetPlayerPed(src)
    local myPos = GetEntityCoords(myPed)
    local players = KRPCore.GetPlayers()

    for k, v in ipairs(players) do
        if v ~= src then
            local xTarget = GetPlayerPed(v)
            local xPlayer = KRPCore.GetPlayerFromId(v)
            local tPos = GetEntityCoords(xTarget)
            local dist = #(vector3(tPos.x, tPos.y, tPos.z) - myPos)
            local xSource = KRPCore.GetPlayerFromId(source)
        
            if dist < 1 and xSource.job.name == 'police' then
                if tonumber(args[1]) ~= nil then
                    TriggerClientEvent('DoLongHudText',  source, 'You have fined ID - [' .. v .. '] for $' .. tonumber(args[1]) .. '.', 1)
                    TriggerClientEvent('DoLongHudText',  v, 'You have been sent a Fine for $' .. tonumber(args[1]) .. '.', 1)
                    TriggerClientEvent('krp-fines:Anim', source)
                    xPlayer.removeAccountMoney('bank', tonumber(args[1]))
                end
            end
        end
    end
end)