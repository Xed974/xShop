ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

--- Menu

local open = false 
local mainMenu = RageUI.CreateMenu("", 'Interaction', nil, nil, "shopui_title_conveniencestore", "shopui_title_conveniencestore")
local subMenu1 = RageUI.CreateSubMenu(mainMenu, "", "Interaction")
local subMenu2 = RageUI.CreateSubMenu(mainMenu, "", "Interaction")
mainMenu.Display.Header = true 
mainMenu.Closed = function()
  open = false
  FreezeEntityPosition(PlayerPedId(), false)
end

--- Function Shop

function Shop()
	if open then 
		open = false
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true 
		RageUI.Visible(mainMenu, true)
		CreateThread(function()
		while open do 
		   RageUI.IsVisible(mainMenu,function() 

			RageUI.Separator("~y~↓ Mode de Paiment ↓")

			RageUI.Button("Espèces", nil, {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu1)
			RageUI.Button("Carte Bancaire", "+ ~y~10%~s~ de Taxe", {RightLabel = "→→"}, true , {
				onSelected = function()
				end
			}, subMenu2)

		end)
		
		RageUI.IsVisible(subMenu1,function() 

			RageUI.Separator("~y~Paiement : ~s~Espece")
			RageUI.Separator("_______________")
			RageUI.Separator("↓ ~y~Nourriture~s~ ↓")
			for k, v in pairs(Config.Shop.Type.Nourritures) do
				RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.prix.."$"}, true , {
					onSelected = function()
						TriggerServerEvent('xed:buyitem2', v)
					end
				})
			end
			RageUI.Separator("↓ ~y~Boissons~s~ ↓")
			for k, v in pairs(Config.Shop.Type.Boissons) do
				RageUI.Button(v.Label, nil, {RightLabel = "~g~"..v.prix.."$"}, true , {
					onSelected = function()
						TriggerServerEvent('xed:buyitem2', v)
					end
				})
			end
		end)

		RageUI.IsVisible(subMenu2,function() 
			
			RageUI.Separator("~y~Paiement : ~s~Carte Bancaire")
			RageUI.Separator("_______________")
			RageUI.Separator("↓ ~y~Nourriture~s~ ↓")
			for k, v in pairs(Config.Shop.Type.Nourritures) do
				local price = v.prix * 1.1
				RageUI.Button(v.Label, nil, {RightLabel = "~g~"..price.."$"}, true , {
					onSelected = function()
						TriggerServerEvent('xed:buyitem1', v)
					end
				})
			end
			RageUI.Separator("↓ ~y~Boissons~s~ ↓")
			for k, v in pairs(Config.Shop.Type.Boissons) do
				local price = v.prix * 1.1
				RageUI.Button(v.Label, nil, {RightLabel = "~g~"..price.."$"}, true , {
					onSelected = function()
						TriggerServerEvent('xed:buyitem1', v)
					end
				})
			end
		end)
		
		Wait(0)
	   end
		end)
 	end
end

--- Ouvrir le menu

Citizen.CreateThread(function()
    while true do
		local wait = 750
			for k in pairs(Config.Shop.Position) do
			local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
			local pos = Config.Shop.Position
			local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)

			if dist <= 1.0 then
				wait = 0
				Visual.Subtitle(Config.Shop.TextSuperette, 1)
				if IsControlJustPressed(1,51) then
					FreezeEntityPosition(PlayerPedId(-1), true)
					Shop()
				end
			end
		end
    	Citizen.Wait(wait)
    end
end)

--- Xed#1188
