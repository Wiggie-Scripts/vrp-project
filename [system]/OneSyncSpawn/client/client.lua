
Citizen.CreateThread(function()
    local onlinePlayer = GetEntityCoords(PlayerPedId())
    local onlinePlayerID = GetPlayerServerId()                  
    DisablePlayerVehicleRewards(onlinePlayerID)                 
    
    while true do
        Citizen.Wait(0)
        for i = 0, 15 do                                    
            EnableDispatchService(i, false)     
        end
        SetVehicleDensityMultiplierThisFrame((Config.VehX - Config.onlinePlayers) / Config.Divider)
        SetPedDensityMultiplierThisFrame((Config.PedsX - Config.onlinePlayers) / Config.Divider)
        SetRandomVehicleDensityMultiplierThisFrame((Config.VehX - Config.onlinePlayers) / Config.Divider)
        SetParkedVehicleDensityMultiplierThisFrame((Config.VehParkX - Config.onlinePlayers) / Config.Divider)
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
        ClearAreaOfCops(onlinePlayer.x, onlinePlayer.y, onlinePlayer.z, 5000.0)
        RemoveVehiclesFromGeneratorsInArea(onlinePlayer.x - 55.0, onlinePlayer.y - 55.0, onlinePlayer.z - 15.0, onlinePlayer.x + 55.0, onlinePlayer.y + 55.0, onlinePlayer.z + 15.0);
        SetGarbageTrucks(0)
        SetRandomBoats(0)
        SetVehicleModelIsSuppressed(GetHashKey("rubble"), true)
        SetVehicleModelIsSuppressed(GetHashKey("taco"), true)
        SetVehicleModelIsSuppressed(GetHashKey("biff"), true)
        SetVehicleModelIsSuppressed(GetHashKey("ambulance"), true) 
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
				
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)     
        Clients()
    end
end)

function Clients()
    local Count = 0
    Config.onlinePlayers = Count
    for _,v in ipairs(GetActivePlayers()) do
        Count = Count + 1
    end
    if (Count ~= nil) then
        Config.onlinePlayers = (Count * Config.Base)
    end
end