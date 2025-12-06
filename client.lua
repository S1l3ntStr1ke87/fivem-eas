RegisterNetEvent("SendAlert")
AddEventHandler("SendAlert", function(issuer, message)
    SendNUIMessage({
        type    = "alert",
        enable  = true,
        issuer  = issuer,
        message = message,
        volume  = Config.EAS.Volume,
    })
end)
