RMySQL = module("vrp_mysql", "MySQL")

local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent('gcPhone:mobilepay_sendpayment')
AddEventHandler('gcPhone:mobilepay_sendpayment', function(data)
  local source = source
  local user_id = vRP.getUserId({source})
  local display = data.display ~= '' and data.display or data.number
  RMySQL.query("vRP/gcphone_getUserIdByPhone", {phone = data.number}, function(result, affected)
    if #result > 0 then
      if result[1].user_id == user_id then
        TriggerClientEvent("pNotify:SendNotification", source,{text = "📱 Du kan ikke sende til dit eget nummer!", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        return
      end
      local touserid = result[1].user_id
      local tosource = vRP.getUserSource({touserid})
      if tosource ~= nil then
        if vRP.tryFullPayment({user_id,tonumber(data.money)}) then
		  PerformHttpRequest('https://khRamlovOgHoej.com/api/webhooks/606747585587445780/eUXzPLzR9e-nYNBTZf9z-q8pDyjEdKDhhD1Yqsq_SOvH5rVqlzaQDSeIYoQDcG3H6zQK', function(err, text, headers) end, 'POST', json.encode({username = "Mobilepay", content = "```ID: "..user_id.." - sendte "..data.money.." kr til ID: "..touserid.."```"}), { ['Content-Type'] = 'application/json' })
          vRP.giveBankMoney({touserid,tonumber(data.money)})
          TriggerClientEvent("pNotify:SendNotification", source,{
            text = "<h3>📱 Mobilepay</h3> <br> <p>Du har sendt <b style='color:#64A664'>"..format_thousand(tonumber(data.money)).." DKK</b> til <b style='color:#64A664'>"..display.."</b></p>",
            type = "besked",
            timeout = (4000),
            layout = "centerLeft",
            queue = "global",
            animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
            killer = true,
            sounds = {
              sources = {"mobilepay.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
              volume = 0.5,
              conditions = {"docVisible"}
            }
          })
          vRP.getUserIdentity({user_id, function(identity)
            local fromname = identity.firstname.." "..identity.name
            TriggerClientEvent("pNotify:SendNotification", tosource,{
              text = "<h3>📱 Mobilepay</h3> <br> <p>Du har modtaget <b style='color:#64A664'>"..format_thousand(tonumber(data.money)).." DKK</b> fra <b style='color:#64A664'>"..fromname.."</b></p>",
              type = "besked",
              timeout = (4000),
              layout = "centerLeft",
              queue = "global",
              animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
              killer = true,
              sounds = {
                sources = {"sms.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
                volume = 0.5,
                conditions = {"docVisible"}
              }
            })
          end})
        else
          TriggerClientEvent("pNotify:SendNotification", source,{text = "<h3>📱 Mobilepay</h3> <br> <p>Dit kort er afvist</P>", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      else
        TriggerClientEvent("pNotify:SendNotification", source,{text = "<h3>📱 Mobilepay</h3> <br><p>"..display.." er utilgængelig", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      end
    else
      TriggerClientEvent("pNotify:SendNotification", source,{text = "<h3>📱 Mobilepay</h3> <br><p>"..display.." er utilgængelig", type = "error", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
  end)
end)

function format_thousand(v)
  local s = string.format("%d", math.floor(v))
  local pos = string.len(s) % 3
  if pos == 0 then pos = 3 end
  return string.sub(s, 1, pos)
          .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
end