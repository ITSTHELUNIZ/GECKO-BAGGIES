local QBCore = exports['qb-core']:GetCoreObject()
local isProcessing = false

local function createMethbaggy()
	isProcessing = true
	local playerPed = PlayerPedId()
	local Player = QBCore.Functions.GetPlayerData()
	local src = source

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", "Creating meth bags", 15000, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('luniz-baggymaker:gecko-sv:createMethbag')
		local timeLeft = 10000 / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
		end
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end, function()
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end)
end

RegisterNetEvent('luniz-baggymaker:gecko-cl:createMethbaggy', function()
	local result = false
    if QBCore.Functions.HasItem("methounce", 1) and QBCore.Functions.HasItem('emptybaggies', 10) and QBCore.Functions.HasItem('finescale', 1) then
		result = true
	end
		if result then
			createMethbaggy()
		else
			QBCore.Functions.Notify("You don't have the items for this", 'error')
		end
end)

local function createCrackbaggy()
	isProcessing = true
	local playerPed = PlayerPedId()
	local Player = QBCore.Functions.GetPlayerData()
	local src = source

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", "Creating crack bags", 15000, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('luniz-baggymaker:gecko-sv:createCrackbag')
		local timeLeft = 10000 / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
		end
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end, function()
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end)
end

RegisterNetEvent('luniz-baggymaker:gecko-cl:createCrackbaggy', function()
	local result = false
    if QBCore.Functions.HasItem("crackounce", 1) and QBCore.Functions.HasItem('emptybaggies', 10) and QBCore.Functions.HasItem('finescale', 1) then
		result = true
	end
		if result then
			createCrackbaggy()
		else
			QBCore.Functions.Notify("You don't have the items for this", 'error')
		end
end)

local function createHeroinbaggy()
	isProcessing = true
	local playerPed = PlayerPedId()
	local Player = QBCore.Functions.GetPlayerData()
	local src = source

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", "Creating heroin bags", 15000, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('luniz-baggymaker:gecko-sv:createHeroinbag')
		local timeLeft = 10000 / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
		end
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end, function()
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end)
end



RegisterNetEvent('luniz-baggymaker:gecko-cl:createHeroinbaggy', function()
	local result = false
	if Config.Inventory == 'qb' then
    if QBCore.Functions.HasItem("heroinounce", 1) and QBCore.Functions.HasItem('emptybaggies', 10) and QBCore.Functions.HasItem('finescale', 1) then
		result = true
	end
		if result then
			createHeroinbaggy()
		else
			QBCore.Functions.Notify("You don't have the items for this", 'error')
		end
	elseif Config.Inventory == 'ox' then
		local inventory = exports.ox_inventory:Search('count', {'heroinounce', 'emptybaggies'})
		print(inventory)
		if inventory then
			local result = false
			for name, count in pairs(inventory) do
				if count >= 10 then
					result = true
					print(result)
				end
			end
			if result then
				createHeroinbaggy()
			else
				lib.notify({
					title = '',
					description = 'Not enough materials',
					type = 'error'
				})
			end
	end
end
end)

local function createCocainebaggy()
	isProcessing = true
	local playerPed = PlayerPedId()
	local Player = QBCore.Functions.GetPlayerData()
	local src = source

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", "Creating cocaine bags", 15000, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('luniz-baggymaker:gecko-sv:createCocainebag')
		local timeLeft = 10000 / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
		end
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end, function()
		ClearPedTasks(PlayerPedId())
		isProcessing = false
	end)
end

RegisterNetEvent('luniz-baggymaker:gecko-cl:createCocainebaggy', function()
	local result = false
    if QBCore.Functions.HasItem("cokeounce", 1) then
		result = true
		print(result)
	end
		if result then
			createCocainebaggy()
		else
			QBCore.Functions.Notify("You don't have the items for this", 'error')
		end
end)




