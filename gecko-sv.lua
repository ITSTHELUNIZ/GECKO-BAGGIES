local QBCore = exports['qb-core']:GetCoreObject()

--DRUG BAGMAKER START
function GetDrugsLevel(src)
    local Player = QBCore.Functions.GetPlayer(src)

    local expNeeded = 100
    local expLeft = Player.PlayerData.metadata.drugrep or 0
    local level = 0

    for x = 1, 30, 1 do
        if expLeft >= expNeeded then
            level = x
            expLeft = expLeft - expNeeded
            expNeeded = expNeeded + 25
        else break end
    end

    return level
end

QBCore.Functions.CreateUseableItem("methounce", function(source, item)
	local src = source
	local druglevel = GetDrugsLevel(src)
	if druglevel >= 21 then
    	TriggerClientEvent('luniz-baggymaker:gecko-cl:createMethbaggy', source, 'methounce', item)
	else
		TriggerClientEvent('QBCore:Notify', src, "Your level is too low to manufacture this drug!", "error")
	end
end)

QBCore.Functions.CreateUseableItem("cokeounce", function(source, item)
	local src = source
	local druglevel = GetDrugsLevel(src)
	if druglevel >= 11 then
    	TriggerClientEvent('luniz-baggymaker:gecko-cl:createCocainebaggy', source, 'cokeounce', item)
	else
		TriggerClientEvent('QBCore:Notify', src, "Your level is too low to manufacture this drug!", "error")
	end

end)

QBCore.Functions.CreateUseableItem("heroinounce", function(source, item)
	local src = source
	local druglevel = GetDrugsLevel(src)
	if druglevel >= 0 then
    	TriggerClientEvent('luniz-baggymaker:gecko-cl:createHeroinbaggy', source, 'heroinounce', item)
	else
		TriggerClientEvent('QBCore:Notify', src, "Your level is too low to manufacture this drug!", "error")
	end
end)

QBCore.Functions.CreateUseableItem("crackounce", function(source, item)
	local src = source
	local druglevel = GetDrugsLevel(src)
	if druglevel >= 5 then
    	TriggerClientEvent('luniz-baggymaker:gecko-cl:createCrackbaggy', source, 'crackounce', item)
	else
		TriggerClientEvent('QBCore:Notify', src, "Your level is too low to manufacture this drug!", "error")
	end
end)

RegisterServerEvent('luniz-baggymaker:gecko-sv:createMethbag', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local druglevel = GetDrugsLevel(src)
	local amount = 0
	if druglevel == 21 then
		amount = 10
	elseif druglevel > 21 and druglevel < 23 then
		amount = 14
	elseif druglevel >= 23 and druglevel <= 25 then
		amount = 18
	elseif druglevel >= 26 and druglevel <= 28 then
		amount = 22
	elseif druglevel >= 29 and druglevel <= 30 then
		amount = 26
	else
		TriggerClientEvent('QBCore:Notify', src, "error debug", 'error')
	end
	if druglevel >= 21 then
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['emptybaggies'], "remove", amount)
    	TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['methbag'], "add", amount)
		exports.ox_inventory:RemoveItem(src, 'emptybaggies', amount, false)
		exports.ox_inventory:AddItem(src, 'methbag', amount, false)
		exports.ox_inventory:RemoveItem(src, 'methounce', 1, false)
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['methounce'], "remove", 1)
		TriggerClientEvent('QBCore:Notify', src, "You get some baggies in return", "success")
		Player.Functions.SetMetaData("drugrep", Player.PlayerData.metadata["drugrep"]+(0.5))
	end
end)

RegisterServerEvent('luniz-baggymaker:gecko-sv:createCocainebag', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local druglevel = GetDrugsLevel(src)
	local amount = 0
	if druglevel == 11 then
		amount = 10
	elseif druglevel >= 12 and druglevel < 15 then
		amount = 14
	elseif druglevel >= 15 and druglevel <= 16 then
		amount = 18
	elseif druglevel >= 17 and druglevel <= 18 then
		amount = 22
	elseif druglevel >= 19 then
		amount = 26
	else
		TriggerClientEvent('QBCore:Notify', src, "error debug", 'error')
	end
	if druglevel >= 11 and QBCore.Functions.HasItem('cokeounce', 1) and QBCore.Functions.HasItem('emptybaggies', amount) and QBCore.Functions.HasItem('finescale', 1)  then
	TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['emptybaggies'], "remove", amount)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['cokebag'], "add", amount)
	exports.ox_inventory:RemoveItem(src, 'emptybaggies', amount, false)
	exports.ox_inventory:AddItem(src, 'cokebag', amount, false)
	exports.ox_inventory:RemoveItem(src, 'cokeounce', 1, false)
	TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['cokeounce'], "remove", 1)
	TriggerClientEvent('QBCore:Notify', src, "You get some baggies in return", "success")
	Player.Functions.SetMetaData("drugrep", Player.PlayerData.metadata["drugrep"]+(0.5))
	end
end)

RegisterServerEvent('luniz-baggymaker:gecko-sv:createHeroinbag', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local druglevel = GetDrugsLevel(src)
	local amount = 0
  if druglevel == 0 then
		amount = 10
	elseif druglevel >= 1 and druglevel < 4 then
		amount = 14
	elseif druglevel >= 4 and druglevel <= 6 then
		amount = 18
	elseif druglevel >= 7 and druglevel <= 9 then
		amount = 22
	elseif druglevel >= 10 then
		amount = 26
	else
		TriggerClientEvent('QBCore:Notify', src, "error debug", 'error')
	end
	if druglevel >= 0 then
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['emptybaggies'], "remove", amount)
    	TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['heroinbag'], "add", amount)
		exports.ox_inventory:RemoveItem(src, 'emptybaggies', amount, false)
		exports.ox_inventory:AddItem(src, 'heroinbag', amount, false)
		exports.ox_inventory:RemoveItem(src, 'heroinounce', 1, false)
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['heroinounce'], "remove", 1)
		TriggerClientEvent('QBCore:Notify', src, "You get some baggies in return", "success")
		Player.Functions.SetMetaData("drugrep", Player.PlayerData.metadata["drugrep"]+(0.5))
	end
end)

RegisterServerEvent('luniz-baggymaker:gecko-sv:createCrackbag', function()
	local src = source
  local Player = QBCore.Functions.GetPlayer(src)
	local druglevel = GetDrugsLevel(src)
	local amount = 0	
	if druglevel == 5 then
		amount = 10
	elseif druglevel >= 6 and druglevel < 10 then
		amount = 14
	elseif druglevel >= 10 and druglevel <= 11 then
		amount = 18
	elseif druglevel >= 12 and druglevel <= 13 then
		amount = 22
	elseif druglevel >= 14 then
		amount = 26
	else
		TriggerClientEvent('QBCore:Notify', src, "error debug", 'error')
	end
	if druglevel >= 5 then
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['emptybaggies'], "remove", amount)
    	TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['crackbag'], "add", amount)
		exports.ox_inventory:RemoveItem(src, 'emptybaggies', amount, false)
		exports.ox_inventory:AddItem(src, 'crackbag', amount, false)
		exports.ox_inventory:RemoveItem(src, 'crackounce', 1, false)
		TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items['crackounce'], "remove", 1)
		TriggerClientEvent('QBCore:Notify', src, "You get some baggies in return", "success")
		Player.Functions.SetMetaData("drugrep", Player.PlayerData.metadata["drugrep"]+(0.5))
	end
end)
-- DRUG BAGMAKER END

--Start of drug spawn locations

local cocaPlantField = {
    name = 'Coca_field',
    renderDistance = 100.0,
    coords = {
      x = 4819.29, y = -5793.42, z = 37.06
    },
    radius = 15.0,
    amount = 10,
    regrowTime = 1,
    
    
    blip = {
      blipVisible = false,
      areaVisible = false,
      icon = 468,
      color = 61,
      scale = 0.9,
    },
    items = {
      {
        item = 'coca_leaf',
        chance = 100,
        amount = {
          min = 1,
          max = 2,
        },
      }
    },
    props = {
      {
        hash = 'prop_plant_01a',
        textureVariation = 4,
        minimumDistanceBetween = 1.5,
        offset = {
          x = 0.0, y = 0.0, z = -0.3,
        },
        animation = {
          duration = 5,
          dict = 'mp_take_money_mg',
          anim = 'put_cash_into_bag_loop',
          flag = 1,
        },
        labelSingular = 'Coca Leaf',
        labelPlurar = 'Coca Leaves',
        collectMessage = 'Collect Coca Leaves',
        icon = 'fas fa-seedling',
      }, 
    },
}

exports['kq_lootareas']:CreateArea('Coca_field', cocaPlantField)

local methBarrel = {
    name = 'meth_Barrel',
    renderDistance = 100.0,
    coords = {
      x = 3617.93, y = 5013.18, z = 13.0
    },
    radius = 4.0,
    amount = 10,
    regrowTime = 90,
    
    
    blip = {
      blipVisible = false,
      areaVisible = false,
      icon = 468,
      color = 61,
      scale = 0.9,
    },
    items = {
      {
        item = 'meth_barrel',
        chance = 100,
        amount = {
          min = 1,
          max = 1,
        },
      }
    },
    props = {
      {
        hash = 'prop_barrel_01a',
        textureVariation = 1,
        minimumDistanceBetween = 1.5,
        offset = {
          x = 0.0, y = 0.0, z = -0.3,
        },
        animation = {
          duration = 5,
          dict = 'mp_take_money_mg',
          anim = 'put_cash_into_bag_loop',
          flag = 1,
        },
        labelSingular = 'Meth Barrel',
        labelPlurar = 'Meth Barrels',
        collectMessage = 'Collect Meth Barrel',
        icon = 'fas fa-seedling',
      }, 
    },
}

exports['kq_lootareas']:CreateArea('meth_Barrel', methBarrel)


local poppyField = {
    name = 'poppy_Field',
    renderDistance = 100.0,
    coords = {
      x = 3093.34, y = 6087.83, z = 119.3
    },
    radius = 15.0,
    amount = 30,
    regrowTime = 20,
    
    
    blip = {
      blipVisible = false,
      areaVisible = false,
      icon = 468,
      color = 61,
      scale = 0.9,
    },
    items = {
      {
        item = 'poppyplant',
        chance = 100,
        amount = {
          min = 1,
          max = 1,
        },
      }
    },
    props = {
      {
        hash = 'prop_plant_fern_01b',
        textureVariation = 1,
        minimumDistanceBetween = 1.5,
        offset = {
          x = 0.0, y = 0.0, z = -0.3,
        },
        animation = {
          duration = 5,
          dict = 'mp_take_money_mg',
          anim = 'put_cash_into_bag_loop',
          flag = 1,
        },
        labelSingular = 'Poppy Leaf',
        labelPlurar = 'Poppy Plants',
        collectMessage = 'Collect Poppy Plants',
        icon = 'fas fa-seedling',
      }, 
    },
}

exports['kq_lootareas']:CreateArea('poppy_Field', poppyField)

--end of drug spawn locations

--paydirt
-- local paydirtField = {
--     name = 'Paydirt_site',
--     renderDistance = 100.0,
--     coords = {
--       x = 2815.58, y = -633.91, z = 2.68
--     },
--     radius = 15.0,
--     amount = 20,
--     regrowTime = 10,
    
    
--     blip = {
--       blipVisible = false,
--       areaVisible = false,
--       icon = 468,
--       color = 61,
--       scale = 0.9,
--     },
--     items = {
--       {
--         item = 'stone',
--         chance = 100,
--         amount = {
--           min = 1,
--           max = 2,
--         },
--       }
--     },
--     props = {
--       {
--         hash = 'prop_rock_4_cl_1',
--         textureVariation = 4,
--         minimumDistanceBetween = 1.5,
--         offset = {
--           x = 0.0, y = 0.0, z = -0.3,
--         },
--         animation = {
--           duration = 5,
--           dict = 'amb@world_human_const_drill@male@drill@base',
--           anim = 'base',
--           flag = 0,
--         },
-- 		tool = {
--      		model = 'prop_tool_jackham',
--      		bone = '28422',
-- 		},
--         labelSingular = 'Paydirt',
--         labelPlurar = 'Paydirt',
--         collectMessage = 'Collect Paydirt',
--         icon = 'fas fa-seedling',
--       }, 
--     },
-- }

-- exports['kq_lootareas']:CreateArea('Paydirt_site', paydirtField)