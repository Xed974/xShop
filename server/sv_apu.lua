ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('xed:buyitem')
AddEventHandler('xed:buyitem', function(v, type)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local playerMoney = { cash = xPlayer.getMoney(), bank = xPlayer.getAccount("bank").money };
  	local price = v.prix * 1.1
	local canBuy = false;
			
	if (type) then
		if (playerMoney.bank >= price) then
			xPlayer.removeAccountMoney('bank', price)
			canBuy = true;
			TriggerClientEvent('esx:showAdvancedNotification', _source, 'Fleeca Bank', 'Virement', 'Paiement accepté d\'un montant de '..price..' ~g~$~s~ !', 'CHAR_BANK_FLEECA', 2)	
		else
			return TriggerClientEvent('esx:showAdvancedNotification', _source, 'Fleeca Bank', 'Virement', 'Paiement ~r~refusé~s~ !', 'CHAR_BANK_FLEECA', 2);
		end
	else
		if (playerMoney.cash >= v.prix) then
			xPlayer.removeMoney(v.prix)
			canBuy = true;
			TriggerClientEvent('esx:showAdvancedNotification', _source, 'Vendeur', 'Interraction', 'Et voilà, ~g~'..v.prix..'$ ~s~en plus dans ma caisse, merci de votre visite !', 'CHAR_CHEF', 9)
		else
			return TriggerClientEvent('esx:showAdvancedNotification', _source, 'Vendeur', 'Interraction', 'Vous n\'avez pas ~r~assez d\'argent pour effectuer cette achat~s~ !', 'CHAR_CHEF', 9);
		end
	end
		
	if (canBuy) then
		xPlayer.addInventoryItem(v.item, 1)
	end
end)
--- Xed#1188
