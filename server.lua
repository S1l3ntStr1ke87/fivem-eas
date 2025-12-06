-- ===========================================
--   PERMISSION CHECKER
-- ===========================================
local function isAdmin(source)
    if source == 0 then return true end  -- Console always allowed

    local ids = GetPlayerIdentifiers(source)

    -- 1) Direct identifier match
    for _, allowedID in ipairs(Config.EAS.admins) do
        for _, pid in ipairs(ids) do
            if string.lower(pid) == string.lower(allowedID) then
                return true
            end
        end
    end

    -- 2) ACE permissions
    for _, acePerm in ipairs(Config.EAS.ace) do
        if IsPlayerAceAllowed(source, acePerm) then
            return true
        end
    end

    -- 3) ACE groups
    for _, grp in ipairs(Config.EAS.groups) do
        if IsPlayerAceAllowed(source, "group." .. grp) then
            return true
        end
    end

    return false
end

-- ===========================================
--   COMMAND REGISTRATION HELPER
-- ===========================================
local function RegisterEAS(cmd, issuer, isTest)
    RegisterCommand(cmd, function(source, args)
        -- Permission block
        if not isAdmin(source) then
            if source ~= 0 then
                TriggerClientEvent("chat:addMessage", source, {
                    color = {255, 0, 0},
                    multiline = true,
                    args = {"EAS", "You do not have permission to use this command."}
                })
            end
            return
        end

        -- Build the message
        local msg = table.concat(args, " ")
        if msg == "" then msg = "(No message provided)" end

        -- Append test note if this is a test
        if isTest then
            msg = msg .. " - THIS IS A TEST PLEASE IGNORE"
        end

        -- Send alert to all clients
        TriggerClientEvent("SendAlert", -1, issuer, msg)
    end)
end

-- ===========================================
--   REGISTER ALL AGENCIES
-- ===========================================
RegisterEAS("eas-lspd", "Los Santos Police Department")
RegisterEAS("eas-lsfd", "Los Santos Fire Department")
RegisterEAS("eas-sasg", "San Andreas State Government")
RegisterEAS("eas-sang", "San Andreas National Guard")
RegisterEAS("eas-sasp", "San Andreas State Patrol")
RegisterEAS("eas-bcso", "Blaine County Sheriff's Office")
RegisterEAS("eas-bcfd", "Blaine County Fire Department")
RegisterEAS("eas-usg", "United States Government")
RegisterEAS("eas-usss", "United States Secret Service")
RegisterEAS("eas-test", "Emergency Alert System Test", true)

print("^2[EAS] EAS Loaded.^0")
