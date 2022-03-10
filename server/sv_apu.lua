ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('xed:buyitem')
AddEventHandler('xed:buyitem', function(v, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = { cash = xPlayer.getMoney(), bank = xPlayer.getAccount("bank").money };
  	local price = v.prix * 1.1
	local canBuy = false;
			
	if (type) then
		if (playerMoney.bank >= price) then
			canBuy = true;
			xPlayer.removeAccountMoney('bank', price)
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Paiement accepté d\'un montant de '..price..' ~g~$~s~ !', 'CHAR_BANK_FLEECA', 2)	
		else
			return TriggerClientEvent('esx:showAdvancedNotification', source, 'Fleeca Bank', 'Virement', 'Paiement ~r~refusé~s~ !', 'CHAR_BANK_FLEECA', 2);
		end
	else
		if (playerMoney.cash >= price) then
			canBuy = true;
			xPlayer.removeMoney(v.prix)
			TriggerClientEvent('esx:showAdvancedNotification', source, 'Vendeur', 'Interraction', 'Et voilà, ~g~'..v.prix..'$ ~s~en plus dans ma caisse, merci de votre visite !', 'CHAR_CHEF', 9)
		else
			return TriggerClientEvent('esx:showAdvancedNotification', source, 'Vendeur', 'Interraction', 'Vous n\'avez pas ~r~assez d\'argent pour effectuer cette achat~s~ !', 'CHAR_CHEF', 9);
		end
	end
		
	if (canBuy) then
		xPlayer.addInventoryItem(v.item, 1)
	end
end)
--- Xed#1188
