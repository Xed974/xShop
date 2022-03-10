ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--- Carte Bancaire
RegisterNetEvent('xed:buyitem1')
AddEventHandler('xed:buyitem1', function(v)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
  local price = v.prix * 1.1

	if playerMoney >= price then
    xPlayer.addInventoryItem(v.item, 1)
    xPlayer.removeAccountMoney('bank', price)
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Paiement accepté d\'un montant de '..price..' ~g~$~s~ !', 'CHAR_BANK_FLEECA', 2)
  else 
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Paiement ~r~refusé~s~ !', 'CHAR_BANK_FLEECA', 2)
	end
end)

--- Espèces
RegisterNetEvent('xed:buyitem2')
AddEventHandler('xed:buyitem2', function(v)
	local xPlayer = ESX.GetPlayerFromId(source)
  local playerMoney = xPlayer.getMoney()

	if playerMoney >= v.prix then
    xPlayer.addInventoryItem(v.item, 1)
		xPlayer.removeMoney(v.prix)
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Vendeur', 'Interraction', 'Et voilà, ~g~'..v.prix..'$ ~s~en plus dans ma caisse, merci de votre visite !', 'CHAR_CHEF', 9)
  else 
    TriggerClientEvent('esx:showAdvancedNotification', source, 'Vendeur', 'Interraction', 'Vous n\'avez pas ~r~assez d\'argent pour effectuer cette achat~s~ !', 'CHAR_CHEF', 9)
	end
end)

--- Xed#1188