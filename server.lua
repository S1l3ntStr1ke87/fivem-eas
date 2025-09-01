local function isAdmin(source)
    local allowed = false
    for i,id in ipairs(Config.EAS.admins) do
        for x,pid in ipairs(GetPlayerIdentifiers(source)) do
            if string.lower(pid) == string.lower(id) then
                allowed = true
            end
        end
	end
	
	if IsPlayerAceAllowed(source, "lance.eas", "group.admin") then
		allowed = true
	else
		print("NOT ALLOWED TO USE EAS")
		allowed = false
	end
    return allowed
end

RegisterCommand("eas-lspd", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "Los Santos Police Department", msg)
	end
end)

RegisterCommand("eas-lsfd", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "Los Santos Fire Department", msg)
	end
end)

RegisterCommand("eas-sasg", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "San Andreas State Goverment", msg)
	end
end)

RegisterCommand("eas-sang", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "San Andreas National Guard", msg)
	end
end)

RegisterCommand("eas-sasp", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "San Andreas State Patrol", msg)
	end
end)

RegisterCommand("eas-scp", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "SCP Foundation", msg)
	end
end)

RegisterCommand("eas-bcso", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "Blaine County Sheriffs Office", msg)
	end
end)

RegisterCommand("eas-bcfd", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "Blaine County Fire Department", msg)
	end
end)

RegisterCommand("eas-usss", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "United States Secret Service", msg)
	end

RegisterCommand("eas-usg", function(source, args, rawCommand)
	if (isAdmin(source)) then
		CancelEvent()
		local msg = table.concat(args, " ")
		TriggerClientEvent("SendAlert", -1, "United States Goverment", msg)
	end
