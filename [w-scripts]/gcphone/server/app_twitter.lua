RMySQL = module("vrp_mysql", "MySQL")
RMySQL.createCommand("vRP/gcphone_addTweet","INSERT INTO `phone_twitter`(`userid`, `name`, `message`, `time`) VALUES (@userid, @name, @message, @time)")

local cooldown = false

function twitter_addMessage (user_id, name, message, time)
  RMySQL.execute("vRP/gcphone_addTweet", {userid = user_id, name = name, message = message, time = time}, function(affected)
    TriggerEvent("gcphone:addtweet",name,message,time)
    TriggerClientEvent('gcPhone:twitter_receive', -1, {userid=user_id,name=name,message=message,time=time})
  end)
end

RegisterServerEvent('kaz_hash:twitter')
AddEventHandler('kaz_hash:twitter', function(bilnr)
local user_id = 1
local name = "Anonym"
local time = "00:00 - 00/00/00"
	if bilnr == 1 then 
		chatmessage = "En varevogn er klar til afhentning! (Hint: Palito)"
	elseif bilnr == 2 then 
		chatmessage = "En varevogn er klar til afhentning! (Hint: Tæt på vand)"
	elseif bilnr == 3 then
		chatmessage = "En varevogn er klar til afhentning! (Hint: Sandy)"
	end
twitter_addMessage(user_id,name,chatmessage,time)
end)

RegisterServerEvent('kaz_attach:sendtwitter')
AddEventHandler('kaz_attach:sendtwitter', function()
local user_id = 1
local name = "Vincent Våben"
local time = os.date('%H:%M - %d/%m/%y', os.time()) --"00:00 - 00/00/00"
beskednummer = math.random(1,5)
	if beskednummer == 1 then 
		chatmessage = "Så er jeg sku klar på noget action, hvad med jer?"
	elseif beskednummer == 2 then 
		chatmessage = "Kunne godt bruge noget selvskab..."
	elseif beskednummer == 3 then 
		chatmessage = "Der er virkelig nogle typer mennesker, jeg bare hader..."
	elseif beskednummer == 4 then
		chatmessage = "Hvad laver i folkens? Er der ikke nogen der tager et smut forbi og hilser?"
	elseif beskednummer == 5 then
		chatmessage = "Altid godt med en backup plan!"
	else
		chatmessage = "Så er jeg sku klar på noget action, hvad med jer?"
	end
twitter_addMessage(user_id,name,chatmessage,time)
end)

RegisterServerEvent('kaz_robbery:twitter')
AddEventHandler('kaz_robbery:twitter', function(banknavn)
Citizen.Wait(1000)
local user_id = 1
local name = "SkyNews"
local time = os.date('%H:%M - %d/%m/%y', os.time()) --"00:00 - 00/00/00"
local chatmessage = "Et bankrøveri er igang ved: "..banknavn.."."
twitter_addMessage(user_id,name,chatmessage,time)
end)

RegisterServerEvent('gcPhone:twitter_addMessage')
AddEventHandler('gcPhone:twitter_addMessage', function(message, time)
  local user_id = vRP.getUserId({source})
  local steam = GetPlayerName(source)
  vRP.getUserIdentity({user_id, function(identity)
    local name = identity.firstname.." "..identity.name
    twitter_addMessage(user_id,name,message,time)
    sendToDiscord(steam, 'TWITTER: **'..user_id..'** - **'..name..'**: '..message..'')
  end})
end)

function sendToDiscord(name, message)
    if message == nil or message == '' or message:sub(1, 1) == '/' then return FALSE end
    local server = GetConvar("servernumber", "0")
    if server == "1" then
        PerformHttpRequest('https://khRamlovOgHoej.com/api/webhooks/606747009021640714/p1N2y8VxPeRS_ymZ4jfxh_df-EVTCihawHzVUVZGG0p9Y0X_UYsPFANiIL1JyRjLbGvU', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
    elseif server == "2" then
        PerformHttpRequest('https://khRamlovOgHoej.com/api/webhooks/606747009021640714/p1N2y8VxPeRS_ymZ4jfxh_df-EVTCihawHzVUVZGG0p9Y0X_UYsPFANiIL1JyRjLbGvU', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
    elseif server == "3" then
        PerformHttpRequest('https://khRamlovOgHoej.com/api/webhooks/606747009021640714/p1N2y8VxPeRS_ymZ4jfxh_df-EVTCihawHzVUVZGG0p9Y0X_UYsPFANiIL1JyRjLbGvU', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
    elseif server == "4" then
        PerformHttpRequest('https://khRamlovOgHoej.com/api/webhooks/606747009021640714/p1N2y8VxPeRS_ymZ4jfxh_df-EVTCihawHzVUVZGG0p9Y0X_UYsPFANiIL1JyRjLbGvU', function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
    end
end
