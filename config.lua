Config = {}

Config.Shop = {

	-- Cordonnées des supérettes disponbiles
	Position = {
		vector3(374.44, 327.75, 103.57),
		vector3(2557.458, 382.282, 108.622),
		vector3(-3040.96, 585.48, 7.91),
		vector3(-3243.95, 1001.68, 12.83),
		vector3(547.68, 2669.188, 42.16),
		vector3(1960.47, 3742.27, 32.34),
		vector3(2677.27, 3281.55, 55.24),
		vector3(1729.8, 6414.14, 35.04),
		vector3(1135.808, -982.281, 46.415),
		vector3(-1222.915, -906.983, 12.326),
		vector3(-1487.553, -379.107, 40.163),
		vector3(-2968.243, 390.910, 15.043),
		vector3(1166.024, 2708.930, 38.157),
		vector3(1392.562, 3604.684, 34.980),
		vector3(-48.519, -1757.514, 29.421),
		vector3(1163.42, -322.61, 69.205),
		vector3(-707.49, -912.87, 19.21),
		vector3(-1820.523, 792.518, 138.118),
		vector3(1698.388, 4924.404, 42.063),
		vector3(25.82, -1345.22, 29.5),
	},

	-- Texte pour ouvrir le menu superette
	TextSuperette = "Appuyez sur ~r~[E]~s~ pour ~r~intéragir~s~", 
	
	-- Listes des items disponbiles aux superette
    Type = {

		Nourritures = {
			{Label = 'Baguette de pain', item = 'bread', prix = 2},
			{Label = 'Burger', item = 'burger', prix = 4},
		},
		Boissons = {
			{Label = 'Bouteille d\'eau', item = 'water', prix = 1},
			{Label = 'Test', item = 'water', prix = 1},
			{Label = 'Bouteille de Soda', item = 'soda', prix = 2},
			{Label = 'Sprunk', item = 'sprunk', prix = 2},
			{Label = 'Pepsi', item = 'pepsi', prix = 2},
		},
	},
	-- Blips 
	Couleur = 43,
	Taille = 0.7,
	Model = 59,
}

--- Xed#1188