-- This file allows for developers to add permission checks or even integration with a server framework.
-- Leaked By: Leaking Hub | J. Snow | leakinghub.com
RegisterCommand("basket", function(source, args, rawCommand)
    local source = source
    if (source > 0) then
        TriggerClientEvent("Client:ToggleBasket", source, true) -- second argument is for permission.
        -- If the second argument is false, this will tell them access is denied to using the basket.
    end
end, false)

RegisterCommand("tripod", function(source, args, rawCommand)
    local source = source
    if (source > 0) then
        -- Add your permission check here
        -- The following checks if they wish to remove or setup a tripod
        local args = args[1]
        local remove = false
        if (args ~= nil) then
            if (args == "remove") then
                remove = true
            elseif (args == "setup") then
                remove = false
            end
            TriggerClientEvent("Client:RopeRescueCommand", source, remove)
        end
    end
end, false)

-- This server event is triggered upon player connect
RegisterServerEvent("reqestTripodPermission")
AddEventHandler("reqestTripodPermission", function()
    local source = source
    -- Add a permission check here
    -- This gives them access to go up and down ropes.
    local hasPermission = true
    TriggerClientEvent("returnTripodPermission", source, hasPermission)
    -- You must return the above client event to grant a player permission.
end)