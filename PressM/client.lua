-- PressM AIO
-- All (under contruction) In One Tool script
-- By github/nate_han
-- Just Press "M" btw

function showNote(msg)

	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
	
end

function giveWeapon(who, what, amount)

	showNote("Giving: ~g~" .. amount .. " of ~r~" .. what)
	GiveWeaponToPed(who, GetHashKey(what), amount, false)
	
end

function setHealth(who, state)
	
	SetEntityInvincible(who, state)
	
	if state then
	
		showNote("Godmode: ~g~ON")
	
	else
	
		showNote("Godmode: ~r~OFF")
		
	end
	
end

function getCoords(who)

	local coords = GetEntityCoords(who, true)
	local x, y, z = table.unpack(coords)
	
	Citizen.Trace("LOCATION: " .. x .. " " .. y .. " " .. z)
	
	return x, y, z
	
end

function wantedLevel(who, level)

	SetPlayerWantedLevel(who, level, false)
	SetPlayerWantedLevelNow(who, false)

end

function spawnVeh(who, model)

	local x, y, z = getCoords(who)
	
	-- RequestModel(model)
	
	while not HasModelLoaded(model) do
	
		RequestModel(model)
		Citizen.Trace("Loading Model...")
		Citizen.Wait(0)
		
	end
	
	local veh = CreateVehicle(model, x + 4, y + 4, z + 2, 0.0, true, false)
	
	ToggleVehicleMod(veh, 18, true)
	ToggleVehicleMod(veh, 22, true)
	SetVehicleCanBeVisiblyDamaged(veh, true)
	SetVehicleCanBreak(veh, true)
	SetVehicleModKit(veh, 0)
	SetVehicleNumberPlateText(veh, "PressM")
	SetVehicleNumberPlateTextIndex(veh, 5)
	
	-- local total = 1
	
	-- while total < 19 do
	
		-- Citizen.Trace("LOOP:" .. total)
		-- SetVehicleMod(veh, total, math.random(1, 3), true)
		
		-- total = total + 1
		
	-- end
	
	SetVehicleMod(veh, 0, math.random(0, 7), true)
	SetVehicleMod(veh, 1, math.random(0, 7), true)
	SetVehicleMod(veh, 2, math.random(0, 7), true)
	SetVehicleMod(veh, 3, math.random(0, 7), true)
	SetVehicleMod(veh, 4, math.random(0, 7), true)
	SetVehicleMod(veh, 5, math.random(0, 7), true)
	SetVehicleMod(veh, 6, math.random(0, 7), true)
	SetVehicleMod(veh, 7, math.random(0, 7), true)
	SetVehicleMod(veh, 8, math.random(0, 7), true)
	SetVehicleMod(veh, 9, math.random(0, 7), true)
	SetVehicleMod(veh, 10, math.random(0, 7), true)
	SetVehicleMod(veh, 11, 3, true)
	SetVehicleMod(veh, 12, 2, true)
	SetVehicleMod(veh, 13, 2, true)
	SetVehicleMod(veh, 14, math.random(0, 34), true)
	SetVehicleMod(veh, 14, 3, true)
	SetVehicleMod(veh, 16, 4, true)
	SetVehicleMod(veh, 23, math.random(0, 20), true)
	SetVehicleMod(veh, 46, 2, true)
	SetVehicleMod(veh, 62, math.random(0, 3), true)
	
end

function cosReroll(who)

	local veh = GetVehiclePedIsIn(who)

	SetVehicleMod(veh, 0, math.random(0, 7), true)
	SetVehicleMod(veh, 1, math.random(0, 7), true)
	SetVehicleMod(veh, 2, math.random(0, 7), true)
	SetVehicleMod(veh, 3, math.random(0, 7), true)
	SetVehicleMod(veh, 4, math.random(0, 7), true)
	SetVehicleMod(veh, 5, math.random(0, 7), true)
	SetVehicleMod(veh, 6, math.random(0, 7), true)
	SetVehicleMod(veh, 7, math.random(0, 7), true)
	SetVehicleMod(veh, 8, math.random(0, 7), true)
	SetVehicleMod(veh, 9, math.random(0, 7), true)
	SetVehicleMod(veh, 10, math.random(0, 7), true)
	SetVehicleMod(veh, 14, math.random(0, 34), true)
	SetVehicleMod(veh, 23, math.random(0, 20), true)
	SetVehicleMod(veh, 62, math.random(0, 3), true)
	SetVehicleNumberPlateTextIndex(veh, math.random(0, 7))

end

function setWeather(weather)

	ClearOverrideWeather()
	ClearWeatherTypePersist()
	SetWeatherTypePersist(weather)
	SetWeatherTypeNow(weather)
	SetWeatherTypeNowPersist(weather)
	showNote("Setting Weather: ~g~" .. weather)

end

function setTime(hour)

	AddToClockTime(hour, 00, 00)

end

function changeSkin(who, skin)

	local modelName = skin
    local modelHash = (GetHashKey(modelName))

    RequestModel(modelHash) 
    
    while not HasModelLoaded(modelHash) do
        RequestModel(modelHash)      
        Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), modelHash)    
    SetModelAsNoLongerNeeded(modelHash)

end

Citizen.CreateThread(function()

	local pistols = {"WEAPON_APPISTOL","WEAPON_COMBATPISTOL","WEAPON_FLAREGUN","WEAPON_HEAVYPISTOL","WEAPON_MARKSMANPISTOL","WEAPON_PISTOL","WEAPON_PISTOL50","WEAPON_REVOLVER","WEAPON_SNSPISTOL","WEAPON_STUNGUN","WEAPON_VINTAGEPISTOL"}
	local smgs = {"WEAPON_ASSAULTSMG","WEAPON_COMBATPDW","WEAPON_MACHINEPISTOL","WEAPON_MICROSMG","WEAPON_MINISMG","WEAPON_SMG"}
	local rifles = {"WEAPON_ADVANCEDRIFLE","WEAPON_ASSAULTRIFLE","WEAPON_BULLPUPRIFLE","WEAPON_CARBINERIFLE","WEAPON_COMPACTRIFLE","WEAPON_MUSKET","WEAPON_SPECIALCARBINE"}
	local machineGuns = {"WEAPON_COMBATMG","WEAPON_GUSENBERG","WEAPON_MG"}
	local shotguns = {"WEAPON_ASSAULTSHOTGUN","WEAPON_AUTOSHOTGUN","WEAPON_BULLPUPSHOTGUN","WEAPON_DBSHOTGUN","WEAPON_HEAVYSHOTGUN","WEAPON_PUMPSHOTGUN","WEAPON_SAWNOFFSHOTGUN"}
	local snipers = {"WEAPON_HEAVYSNIPER","WEAPON_MARKSMANRIFLE","WEAPON_SNIPERRIFLE"}
	local launchers = {"WEAPON_COMPACTLAUNCHER","WEAPON_FIREWORK","WEAPON_GRENADELAUNCHER","WEAPON_HOMINGLAUNCHER","WEAPON_RPG"}
	local thrown = {"WEAPON_BALL","WEAPON_BZGAS","WEAPON_FLARE","WEAPON_GRENADE","WEAPON_MOLOTOV","WEAPON_PIPEBOMB","WEAPON_PROXMINE","WEAPON_SMOKEGRENADE","WEAPON_SNOWBALL","WEAPON_STICKYBOMB"}
	local melee = {"WEAPON_BAT","WEAPON_BATTLEAXE","WEAPON_BOTTLE","WEAPON_CROWBAR","WEAPON_DAGGER","WEAPON_FIREEXTINGUISHER","WEAPON_GOLFCLUB","WEAPON_HAMMER","WEAPON_KNIFE","WEAPON_KNUCKLE","WEAPON_NIGHTSTICK","WEAPON_PETROLCAN","WEAPON_POOLCUE","WEAPON_SWITCHBLADE","WEAPON_WRENCH"}
	local gadgets = {"GADGET_PARACHUTE", "GADGET_NIGHTVISION"}
	local op = {"WEAPON_MINIGUN", "WEAPON_RAILGUN"}
	
	local super = {"adder","autarch","banshee2","bullet","cheetah","cyclone","entityxf","fmj", "gp1","italigtb","italigtb2","infernus","le7b","nero","nero2","osiris","penetrator","pfister811","prototipo","reaper","sc1","sheava","sultanrs","t20","tempesta","turismo2","tyrus","vacca","vagner","vigilante","visione","voltic","voltic2","xa21","zentorno"}
	local sports = {"alpha","banshee","bestiagts","blista2","blista3","buffalo","buffalo2","buffalo3","carbonizzare","comet2","comet4","comet5","coquette","elegy","elegy2","feltzer2","furoregt","fusilade","futo","jester","khamelion","kuruma","kuruma2","lynx","massacro","neon","ninef","ninef2","omnis","pariah","penumbra","rapidgt","rapidgt2","rapidgt3","raptor","revolter","ruston","schafter3","schafter4","schwarzer","seven70","specter","specter2","sultan","surano","tampa2","tampa3","tropos","verlierer2"}
	local sedan = {"asea","asea2","asterope","cog55","cog552","cognoscenti","cognoscenti2","emperor","emperor2","emperor3","fugitive","glendale","ingot","intruder","limo2","premier","primo","raiden","regina","romero","schafter2","schafter5","schafter6","stanier","stratum","stretch","superd","surge","tailgater","warrener","washington"}
	local muscle = {"blade","buccaneer","chino","coquette3","dominator","dominator2","dukes","dukes2","faction3","gauntlet","gauntlet2","hotknife","nightshade","phoenix","picador","ratloader","ruiner","ruiner2","ruiner3","sabregt","sabregt2","slamvan2","slamvan3","stalion","stalion2","vigero","virgo","virgo2","virgo3","voodoo2","yosemite"}
	local sportsClassic = {"ardent","btype","casco","cheetah2","coquette2","feltzer3","deluxo","gt500","hermes","hustler","infernus2","jb700","mamba","manana","monroe","peyote","pigalle","sentinel3","stinger","stingergt","stromberg","torero","tornado","tornado2","tornado3","tornado4","tornado5","tornado6","turismor","viseris","z190","ztype"}
	local utility = {"airtug","armytanker","armytrailer","armytrailer2","baletrailer","blazer5","boattrailer","caddy","caddy2","caddy3","docktrailer","docktug","forklift","freighttrailer","graintrailer","mower","phantom2","phantom3","proptrailer","raketrailer","ripley","sadler","sadler2","scrap","tanker","tanker2","thruster","towtruck","towtruck2","tr2","tr3","tr4","tractor","tractor2","tractor3","trailerlarge","trailerlogs","trailers","trailers2","trailers3","trailers4","trailersmall","trailersmall2","trflat","tvtrailer","utillitruck","utillitruck2","utillitruck3","wastelander"}
	local emergency = {"ambulance","fbi","fbi2","firetruk","lguard","pbus","police","police2","police3","police4","policeb","policeold1","policeold2","policet","pranger","riot","sheriff","sheriff2"}
	local compact = {"blista","brioso","dilettante","dilettante2","issi2","panto","prairie","retinue","rhapsody","savestra"}
	local service = {"airbus","brickade","bus","coach","rallytruck","rentalbus","taxi","tourbus","trash","trash2"}
	local military = {"apc","barracks","barracks2","barracks3","chernobog","crusader","halftrack","khanjali","riot2","rhino"}
	local suv = {"baller","baller2","baller3","baller4","baller5","baller6","bjxl","cavalcade","cavalcade2","contender","dubsta","dubsta2","fq2","granger","gresley","habanero","huntley","landstalker","mesa","mesa2","patriot","radi","rocoto","seminole","serrano","streiter","xls","xls2"}
	local commercial = {"benson","biff","hauler","hauler2","mule","mule2","mule3","packer","phantom","pounder","stockade","stockade3"}
	local offRoad = {"barrage","bfinjection","blazer","blazer2","blazer3","blazer4","bodhi2","brawler","dloader","dubsta3","dune","dune2","dune3","dune4","dune5","insurgent","insurgent2","insurgent3","kamacho","marshall","mesa3","monster","nightshark","rancherxl","rancherxl2","rebel","rebel2","riata","sandking","sandking2","technical","technical2","technical3","trophytruck","trophytruck2"}
	local van = {"bison","bison2","bison3","bobcatxl","boxville","boxville2","boxville3","boxville4","boxville5","burrito","burrito2","burrito3","burrito4","burrito5","camper","gburrito","gburrito2","journey","minivan","minivan2","pony","pony2","rumpo","rumpo2","rumpo3","speedo","speedo2","surfer","surfer2","taco","youga","youga2"}
	local industrial = {"bulldozer","cutter","dump","flatbed","guardian","handler","mixer","mixer2","rubble","tiptruck","tiptruck2"}
	local helicopter = {"akula","annihilator","buzzard","buzzard2","cargobob","cargobob2","cargobob3","cargobob4","frogger","frogger2","havok","hunter","maverick","polmav","savage","skylift","supervolito","supervolito2","swift","swift2","valkyrie","valkyrie2","volatus"}
	local plane = {"alphaz1","avenger","avenger2","besra","blimp","blimp2","bombushka","cargoplane","cuban800","dodo","duster","howard","hydra","jet","lazer","luxor","luxor2","mammatus","microlight","miljet","mogul","molotok","nimbus","nokota","pyro","rogue","seabreeze","shamal","starling","stunt","titan","tula","velum","velum2","velum2","vestra","volatol"}
	local motorcycle = {"akuma","avarus","bagger","bati","bati2","bf400","carbonrs","chimera","cliffhanger","daemon","daemon2","defiler","diablous","diablous2","double","enduro","esskey","faggio","faggio2","faggio3","fcr","fcr2","gargoyle","hakuchou","hakuchou2","hexer","innovation","lectro","manchez","nemesis","nightblade","oppressor","pcj","ratbike","ruffian","sanchez","sanchez2","sanctus","shotaro","sovereign","thrust","vader","vindicator","vortex","wolfsbane","zombiea","zombieb"}
	local rail = {"cablecar","freight","freightcar","freightcont1","freightcont2","freightgrain","metrotrain","tankercar"}
	local coupe = {"Jackal","cogcabrio","exemplar","f620","felon","felon2","oracle","oracle2","sentinel","sentinel2","windsor","windsor2","zion","zion2"}
	local cycle = {"BMX","cruiser","fixter","scorcher","tribike","tribike2","tribike3"}
	local boat = {"dinghy","dinghy2","dinghy3","dinghy4","jetmax","marquis","predator","seashark","seashark2","seashark3","speeder2","squalo","submersible","submersible2","suntrap","toro","toro2","tropic","tropic2","tug"}
	
	local animalSkin = {"a_c_boar", "a_c_cat_01", "a_c_chickenhawk", "a_c_chimp", "a_c_chop", "a_c_cormorant", "a_c_cow", "a_c_coyote", "a_c_crow", "a_c_deer", "a_c_dolphin", "a_c_fish", "a_c_hen", "a_c_humpback", "a_c_husky", "a_c_killerwhale", "a_c_mtlion", "a_c_pig", "a_c_pigeon", "a_c_poodle", "a_c_rabbit_01", "a_c_rat", "a_c_retriever", "a_c_rhesus", "a_c_rottweiler", "a_c_seagull", "a_c_sharkhammer", "a_c_sharktiger", "a_c_shepherd", "a_c_westy"}
	local femaleSkin = {"a_f_m_beach_01", "a_f_m_bevhills_01", "a_f_m_bevhills_02", "a_f_m_bodybuild_01", "a_f_m_business_02", "a_f_m_downtown_01", "a_f_m_eastsa_01", "a_f_m_eastsa_02", "a_f_m_fatbla_01", "a_f_m_fatcult_01", "a_f_m_fatwhite_01", "a_f_m_ktown_01", "a_f_m_ktown_02", "a_f_m_prolhost_01", "a_f_m_salton_01", "a_f_m_skidrow_01", "a_f_m_soucent_01", "a_f_m_soucent_02", "a_f_m_soucentmc_01", "a_f_m_tourist_01", "a_f_m_tramp_01", "a_f_m_trampbeac_01", "a_f_o_genstreet_01", "a_f_o_indian_01", "a_f_o_ktown_01", "a_f_o_salton_01", "a_f_o_soucent_01", "a_f_o_soucent_02", "a_f_y_beach_01", "a_f_y_bevhills_01", "a_f_y_bevhills_02", "a_f_y_bevhills_03", "a_f_y_bevhills_04", "a_f_y_business_01", "a_f_y_business_02", "a_f_y_business_03", "a_f_y_business_04", "a_f_y_eastsa_01", "a_f_y_eastsa_02", "a_f_y_eastsa_03", "a_f_y_epsilon_01", "a_f_y_fitness_01", "a_f_y_fitness_02", "a_f_y_genhot_01", "a_f_y_golfer_01", "a_f_y_hiker_01", "a_f_y_hippie_01", "a_f_y_hipster_01", "a_f_y_hipster_02", "a_f_y_hipster_03", "a_f_y_hipster_04", "a_f_y_indian_01", "a_f_y_juggalo_01", "a_f_y_runner_01", "a_f_y_rurmeth_01", "a_f_y_scdressy_01", "a_f_y_skater_01", "a_f_y_soucent_01", "a_f_y_soucent_02", "a_f_y_soucent_03", "a_f_y_tennis_01", "a_f_y_topless_01", "a_f_y_tourist_01", "a_f_y_tourist_02", "a_f_y_vinewood_01", "a_f_y_vinewood_02", "a_f_y_vinewood_03", "a_f_y_vinewood_04", "a_f_y_yoga_01", "g_f_importexport_01", "g_f_y_ballas_01", "g_f_y_families_01", "g_f_y_lost_01", "g_f_y_vagos_01", "mp_f_boatstaff_01", "mp_f_cardesign_01", "mp_f_chbar_01", "mp_f_cocaine_01", "mp_f_counterfeit_01", "mp_f_deadhooker", "mp_f_execpa_01", "mp_f_forgery_01", "mp_f_freemode_01", "mp_f_helistaff_01", "mp_f_meth_01", "mp_f_misty_01", "mp_f_stripperlite", "mp_f_weed_01", "s_f_m_fembarber", "s_f_m_maid_01", "s_f_m_shop_high", "s_f_m_sweatshop_01", "s_f_y_airhostess_01", "s_f_y_bartender_01", "s_f_y_baywatch_01", "s_f_y_cop_01", "s_f_y_factory_01", "s_f_y_hooker_01", "s_f_y_hooker_02", "s_f_y_hooker_03", "s_f_y_migrant_01", "s_f_y_movprem_01", "s_f_y_ranger_01", "s_f_y_scrubs_01", "s_f_y_sheriff_01", "s_f_y_shop_low", "s_f_y_shop_mid", "s_f_y_stripper_01", "s_f_y_stripper_02", "s_f_y_stripperlite", "s_f_y_sweatshop_01", "u_f_m_corpse_01", "u_f_m_miranda", "u_f_m_promourn_01", "u_f_o_moviestar", "u_f_o_prolhost_01", "u_f_y_bikerchic", "u_f_y_comjane", "u_f_y_corpse_01", "u_f_y_corpse_02", "u_f_y_hotposh_01", "u_f_y_jewelass_01", "u_f_y_mistress", "u_f_y_poppymich", "u_f_y_princess", "u_f_y_spyactress"}
	local maleSkin = {"a_m_m_acult_01", "a_m_m_afriamer_01", "a_m_m_beach_01", "a_m_m_beach_02", "a_m_m_bevhills_01", "a_m_m_bevhills_02", "a_m_m_business_01", "a_m_m_eastsa_01", "a_m_m_eastsa_02", "a_m_m_farmer_01", "a_m_m_fatlatin_01", "a_m_m_genfat_01", "a_m_m_genfat_02", "a_m_m_golfer_01", "a_m_m_hasjew_01", "a_m_m_hillbilly_01", "a_m_m_hillbilly_02", "a_m_m_indian_01", "a_m_m_ktown_01", "a_m_m_malibu_01", "a_m_m_mexcntry_01", "a_m_m_mexlabor_01", "a_m_m_og_boss_01", "a_m_m_paparazzi_01", "a_m_m_polynesian_01", "a_m_m_prolhost_01", "a_m_m_rurmeth_01", "a_m_m_salton_01", "a_m_m_salton_02", "a_m_m_salton_03", "a_m_m_salton_04", "a_m_m_skater_01", "a_m_m_skidrow_01", "a_m_m_socenlat_01", "a_m_m_soucent_01", "a_m_m_soucent_02", "a_m_m_soucent_03", "a_m_m_soucent_04", "a_m_m_stlat_02", "a_m_m_tennis_01", "a_m_m_tourist_01", "a_m_m_tramp_01", "a_m_m_trampbeac_01", "a_m_m_tranvest_01", "a_m_m_tranvest_02", "a_m_o_acult_01", "a_m_o_acult_02", "a_m_o_beach_01", "a_m_o_genstreet_01", "a_m_o_ktown_01", "a_m_o_salton_01", "a_m_o_soucent_01", "a_m_o_soucent_02", "a_m_o_soucent_03", "a_m_o_tramp_01", "a_m_y_acult_01", "a_m_y_acult_02", "a_m_y_beach_01", "a_m_y_beach_02", "a_m_y_beach_03", "a_m_y_beachvesp_01", "a_m_y_beachvesp_02", "a_m_y_bevhills_01", "a_m_y_bevhills_02", "a_m_y_breakdance_01", "a_m_y_busicas_01", "a_m_y_business_01", "a_m_y_business_02", "a_m_y_business_03", "a_m_y_cyclist_01", "a_m_y_dhill_01", "a_m_y_downtown_01", "a_m_y_eastsa_01", "a_m_y_eastsa_02", "a_m_y_epsilon_01", "a_m_y_epsilon_02", "a_m_y_gay_01", "a_m_y_gay_02", "a_m_y_genstreet_01", "a_m_y_genstreet_02", "a_m_y_golfer_01", "a_m_y_hasjew_01", "a_m_y_hiker_01", "a_m_y_hippy_01", "a_m_y_hipster_01", "a_m_y_hipster_02", "a_m_y_hipster_03", "a_m_y_indian_01", "a_m_y_jetski_01", "a_m_y_juggalo_01", "a_m_y_ktown_01", "a_m_y_ktown_02", "a_m_y_latino_01", "a_m_y_methhead_01", "a_m_y_mexthug_01", "a_m_y_motox_01", "a_m_y_motox_02", "a_m_y_musclbeac_01", "a_m_y_musclbeac_02", "a_m_y_polynesian_01", "a_m_y_roadcyc_01", "a_m_y_runner_01", "a_m_y_runner_02", "a_m_y_salton_01", "a_m_y_skater_01", "a_m_y_skater_02", "a_m_y_soucent_01", "a_m_y_soucent_02", "a_m_y_soucent_03", "a_m_y_soucent_04", "a_m_y_stbla_01", "a_m_y_stbla_02", "a_m_y_stlat_01", "a_m_y_stwhi_01", "a_m_y_stwhi_02", "a_m_y_sunbathe_01", "a_m_y_surfer_01", "a_m_y_vindouche_01", "a_m_y_vinewood_01", "a_m_y_vinewood_02", "a_m_y_vinewood_03", "a_m_y_vinewood_04", "a_m_y_yoga_01", "g_m_importexport_01", "g_m_m_armboss_01", "g_m_m_armgoon_01", "g_m_m_armlieut_01", "g_m_m_chemwork_01", "g_m_m_chiboss_01", "g_m_m_chicold_01", "g_m_m_chigoon_01", "g_m_m_chigoon_02", "g_m_m_korboss_01", "g_m_m_mexboss_01", "g_m_m_mexboss_02", "g_m_y_armgoon_02", "g_m_y_azteca_01", "g_m_y_ballaeast_01", "g_m_y_ballaorig_01", "g_m_y_ballasout_01", "g_m_y_famca_01", "g_m_y_famdnf_01", "g_m_y_famfor_01", "g_m_y_korean_01", "g_m_y_korean_02", "g_m_y_korlieut_01", "g_m_y_lost_01", "g_m_y_lost_02", "g_m_y_lost_03", "g_m_y_mexgang_01", "g_m_y_mexgoon_01", "g_m_y_mexgoon_02", "g_m_y_mexgoon_03", "g_m_y_pologoon_01", "g_m_y_pologoon_02", "g_m_y_salvaboss_01", "g_m_y_salvagoon_01", "g_m_y_salvagoon_02", "g_m_y_salvagoon_03", "g_m_y_strpunk_01", "g_m_y_strpunk_02", "mp_g_m_pros_01", "mp_headtargets", "mp_m_boatstaff_01", "mp_m_claude_01", "mp_m_cocaine_01", "mp_m_counterfeit_01", "mp_m_exarmy_01", "mp_m_execpa_01", "mp_m_famdd_01", "mp_m_fibsec_01", "mp_m_forgery_01", "mp_m_freemode_01", "mp_m_g_vagfun_01", "mp_m_marston_01", "mp_m_meth_01", "mp_m_niko_01", "mp_m_securoguard_01", "mp_m_shopkeep_01", "mp_m_waremech_01", "mp_m_weed_01", "mp_s_m_armoured_01", "player_one", "player_two", "player_zero", "s_m_m_ammucountry", "s_m_m_armoured_01", "s_m_m_armoured_02", "s_m_m_autoshop_01", "s_m_m_autoshop_02", "s_m_m_bouncer_01", "s_m_m_chemsec_01", "s_m_m_ciasec_01", "s_m_m_cntrybar_01", "s_m_m_dockwork_01", "s_m_m_doctor_01", "s_m_m_fiboffice_01", "s_m_m_fiboffice_02", "s_m_m_gaffer_01", "s_m_m_gardener_01", "s_m_m_gentransport", "s_m_m_hairdress_01", "s_m_m_highsec_01", "s_m_m_highsec_02", "s_m_m_janitor", "s_m_m_lathandy_01", "s_m_m_lifeinvad_01", "s_m_m_linecook", "s_m_m_lsmetro_01", "s_m_m_mariachi_01", "s_m_m_marine_01", "s_m_m_marine_02", "s_m_m_migrant_01", "s_m_m_movalien_01", "s_m_m_movprem_01", "s_m_m_movspace_01", "s_m_m_paramedic_01", "s_m_m_pilot_01", "s_m_m_pilot_02", "s_m_m_postal_01", "s_m_m_postal_02", "s_m_m_prisguard_01", "s_m_m_scientist_01", "s_m_m_security_01", "s_m_m_snowcop_01", "s_m_m_strperf_01", "s_m_m_strpreach_01", "s_m_m_strvend_01", "s_m_m_trucker_01", "s_m_m_ups_01", "s_m_m_ups_02", "s_m_o_busker_01", "s_m_y_airworker", "s_m_y_ammucity_01", "s_m_y_armymech_01", "s_m_y_autopsy_01", "s_m_y_barman_01", "s_m_y_baywatch_01", "s_m_y_blackops_01", "s_m_y_blackops_02", "s_m_y_busboy_01", "s_m_y_chef_01", "s_m_y_clown_01", "s_m_y_construct_01", "s_m_y_construct_02", "s_m_y_cop_01", "s_m_y_dealer_01", "s_m_y_devinsec_01", "s_m_y_dockwork_01", "s_m_y_doorman_01", "s_m_y_dwservice_01", "s_m_y_dwservice_02", "s_m_y_factory_01", "s_m_y_fireman_01", "s_m_y_garbage", "s_m_y_grip_01", "s_m_y_hwaycop_01", "s_m_y_marine_01", "s_m_y_marine_02", "s_m_y_marine_03", "s_m_y_mime", "s_m_y_pestcont_01", "s_m_y_pilot_01", "s_m_y_prismuscl_01", "s_m_y_prisoner_01", "s_m_y_ranger_01", "s_m_y_robber_01", "s_m_y_sheriff_01", "s_m_y_shop_mask", "s_m_y_strvend_01", "s_m_y_swat_01", "s_m_y_uscg_01", "s_m_y_valet_01", "s_m_y_waiter_01", "s_m_y_winclean_01", "s_m_y_xmech_01", "s_m_y_xmech_02", "s_m_y_xmech_02_mp", "u_m_m_aldinapoli", "u_m_m_bankman", "u_m_m_bikehire_01", "u_m_m_fibarchitect", "u_m_m_filmdirector", "u_m_m_glenstank_01", "u_m_m_griff_01", "u_m_m_jesus_01", "u_m_m_jewelsec_01", "u_m_m_jewelthief", "u_m_m_markfost", "u_m_m_partytarget", "u_m_m_prolsec_01", "u_m_m_promourn_01", "u_m_m_rivalpap", "u_m_m_spyactor", "u_m_m_willyfist", "u_m_o_finguru_01", "u_m_o_taphillbilly", "u_m_o_tramp_01", "u_m_y_abner", "u_m_y_antonb", "u_m_y_babyd", "u_m_y_baygor", "u_m_y_burgerdrug_01", "u_m_y_chip", "u_m_y_cyclist_01", "u_m_y_fibmugger_01", "u_m_y_guido_01", "u_m_y_gunvend_01", "u_m_y_hippie_01", "u_m_y_imporage", "u_m_y_justin", "u_m_y_mani", "u_m_y_militarybum", "u_m_y_paparazzi", "u_m_y_party_01", "u_m_y_pogo_01", "u_m_y_prisoner_01", "u_m_y_proldriver_01", "u_m_y_rsranger_01", "u_m_y_sbike", "u_m_y_staggrm_01", "u_m_y_tattoo_01", "u_m_y_zombie_01"}
	local charSkin = {"cs_amandatownley", "cs_andreas", "cs_ashley", "cs_bankman", "cs_barry", "cs_beverly", "cs_brad", "cs_bradcadaver", "cs_carbuyer", "cs_casey", "cs_chengsr", "cs_chrisformage", "cs_clay", "cs_dale", "cs_davenorton", "cs_debra", "cs_denise", "cs_devin", "cs_dom", "cs_dreyfuss", "cs_drfriedlander", "cs_fabien", "cs_fbisuit_01", "cs_floyd", "cs_guadalope", "cs_gurk", "cs_hunter", "cs_janet", "cs_jewelass", "cs_jimmyboston", "cs_jimmydisanto", "cs_joeminuteman", "cs_johnnyklebitz", "cs_josef", "cs_josh", "cs_lamardavis", "cs_lazlow", "cs_lestercrest", "cs_lifeinvad_01", "cs_magenta", "cs_manuel", "cs_marnie", "cs_martinmadrazo", "cs_maryann", "cs_michelle", "cs_milton", "cs_molly", "cs_movpremf_01", "cs_movpremmale", "cs_mrk", "cs_mrs_thornhill", "cs_mrsphillips", "cs_natalia", "cs_nervousron", "cs_nigel", "cs_old_man1a", "cs_old_man2", "cs_omega", "cs_orleans", "cs_paper", "cs_patricia", "cs_priest", "cs_prolsec_02", "cs_russiandrunk", "cs_siemonyetarian", "cs_solomon", "cs_stevehains", "cs_stretch", "cs_tanisha", "cs_taocheng", "cs_taostranslator", "cs_tenniscoach", "cs_terry", "cs_tom", "cs_tomepsilon", "cs_tracydisanto", "cs_wade", "cs_zimbor", "csb_abigail", "csb_anita", "csb_anton", "csb_ballasog", "csb_bride", "csb_burgerdrug", "csb_car3guy1", "csb_car3guy2", "csb_chef", "csb_chin_goon", "csb_cletus", "csb_cop", "csb_customer", "csb_denise_friend", "csb_fos_rep", "csb_g", "csb_groom", "csb_grove_str_dlr", "csb_hao", "csb_hugh", "csb_imran", "csb_janitor", "csb_maude", "csb_mweather", "csb_ortega", "csb_oscar", "csb_porndudes", "csb_prologuedriver", "csb_prolsec", "csb_ramp_gang", "csb_ramp_hic", "csb_ramp_hipster", "csb_ramp_marine", "csb_ramp_mex", "csb_reporter", "csb_roccopelosi", "csb_screen_writer", "csb_stripper_01", "csb_stripper_02", "csb_tonya", "csb_trafficwarden", "csb_vagspeak", "hc_driver", "hc_gunman", "hc_hacker", "ig_abigail", "ig_amandatownley", "ig_andreas", "ig_ashley", "ig_ballasog", "ig_bankman", "ig_barry", "ig_benny", "ig_bestmen", "ig_beverly", "ig_brad", "ig_bride", "ig_car3guy1", "ig_car3guy2", "ig_casey", "ig_chef", "ig_chengsr", "ig_chrisformage", "ig_clay", "ig_claypain", "ig_cletus", "ig_dale", "ig_davenorton", "ig_denise", "ig_devin", "ig_dom", "ig_dreyfuss", "ig_drfriedlander", "ig_fabien", "ig_fbisuit_01", "ig_floyd", "ig_g", "ig_groom", "ig_hao", "ig_hunter", "ig_janet", "ig_jay_norris", "ig_jewelass", "ig_jimmyboston", "ig_jimmydisanto", "ig_joeminuteman", "ig_johnnyklebitz", "ig_josef", "ig_josh", "ig_kerrymcintosh", "ig_lamardavis", "ig_lazlow", "ig_lestercrest", "ig_lifeinvad_01", "ig_lifeinvad_02", "ig_magenta", "ig_malc", "ig_manuel", "ig_marnie", "ig_maryann", "ig_maude", "ig_michelle", "ig_milton", "ig_molly", "ig_mrk", "ig_mrs_thornhill", "ig_mrsphillips", "ig_natalia", "ig_nervousron", "ig_nigel", "ig_old_man1a", "ig_old_man2", "ig_omega", "ig_oneil", "ig_orleans", "ig_ortega", "ig_paper", "ig_patricia", "ig_priest", "ig_prolsec_02", "ig_ramp_gang", "ig_ramp_hic", "ig_ramp_hipster", "ig_ramp_mex", "ig_roccopelosi", "ig_russiandrunk", "ig_screen_writer", "ig_siemonyetarian", "ig_solomon", "ig_stevehains", "ig_stretch", "ig_talina", "ig_tanisha", "ig_taocheng", "ig_taostranslator", "ig_tenniscoach", "ig_terry", "ig_tomepsilon", "ig_tonya", "ig_tracydisanto", "ig_trafficwarden", "ig_tylerdix", "ig_vagspeak", "ig_wade", "ig_zimbor"}
	
	local weather = {"Random","BLIZZARD","CLEAR","CLEARING","CLOUDS","EXTRASUNNY","FOGGY","OVERCAST","RAIN","SMOG","SNOWLIGHT","THUNDER","XMAS"}
	
	local hour = {"00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"}
	
    WarMenu.CreateMenu('PressM', 'PressM')
	
	-- SET STATE
	WarMenu.CreateSubMenu('Invincibility', 'PressM', 'Set Invincibility')
	WarMenu.CreateSubMenu('Wanted', 'PressM', 'Set Wanted Level')
	WarMenu.CreateSubMenu('Weather', 'PressM', 'Set Weather')
	WarMenu.CreateSubMenu('Time', 'PressM', 'Set Time')
	
	--PED
	
	WarMenu.CreateSubMenu('Ped', 'PressM', 'Choose Your Skin')
	
	WarMenu.CreateSubMenu('Male', 'Ped', 'Male List')
	WarMenu.CreateSubMenu('Female', 'Ped', 'Female List')
	WarMenu.CreateSubMenu('Animals', 'Ped', 'Animal List')
	WarMenu.CreateSubMenu('Characters', 'Ped', 'Characters List')
	
	--WEAPONS
	WarMenu.CreateSubMenu('Weapons', 'PressM', 'Choose Your Weapons')
	
	WarMenu.CreateSubMenu('Pistols', 'Weapons', 'Pistol List')
	WarMenu.CreateSubMenu('SMGs', 'Weapons', 'SMG List')
	WarMenu.CreateSubMenu('Rifles', 'Weapons', 'Rifle List')
	WarMenu.CreateSubMenu('Machine Guns', 'Weapons', 'Machine Guns List')
	WarMenu.CreateSubMenu('Shotguns', 'Weapons', 'Shotguns List')
	WarMenu.CreateSubMenu('Sniper Rifles', 'Weapons', 'Sniper Rifle List')
	WarMenu.CreateSubMenu('Launchers', 'Weapons', 'Launchers List')
	WarMenu.CreateSubMenu('Thrown', 'Weapons', 'Thrown List')
	WarMenu.CreateSubMenu('Melee', 'Weapons', 'Melee List')
	WarMenu.CreateSubMenu('Gadgets', 'Weapons', 'Gadgets List')
	WarMenu.CreateSubMenu('OP', 'Weapons', 'OP List')
	
	--VEHICLES
	
	WarMenu.CreateSubMenu('Vehicles', 'PressM', 'Choose Your Vehicles')
	
	WarMenu.CreateSubMenu('Gravity', 'Vehicles', 'Toggle Gravity')
	WarMenu.CreateSubMenu('Super', 'Vehicles', 'Super List')
	WarMenu.CreateSubMenu('Sports', 'Vehicles', 'Sports List')
	WarMenu.CreateSubMenu('Sports Classic', 'Vehicles', 'Sports Classic List')
	WarMenu.CreateSubMenu('Muscle', 'Vehicles', 'Muscle List')
	WarMenu.CreateSubMenu('Sedan', 'Vehicles', 'Sedan List')
	WarMenu.CreateSubMenu('Utility', 'Vehicles', 'Utility List')
	WarMenu.CreateSubMenu('Emergency', 'Vehicles', 'Emergency List')
	WarMenu.CreateSubMenu('Compact', 'Vehicles', 'Compact List')
	WarMenu.CreateSubMenu('Service', 'Vehicles', 'Service List')
	WarMenu.CreateSubMenu('Military', 'Vehicles', 'Military List')
	WarMenu.CreateSubMenu('SUV', 'Vehicles', 'SUV List')
	WarMenu.CreateSubMenu('Commercial', 'Vehicles', 'Commercial List')
	WarMenu.CreateSubMenu('Off Road', 'Vehicles', 'Off Road List')
	WarMenu.CreateSubMenu('Van', 'Vehicles', 'Van List')
	WarMenu.CreateSubMenu('Industrial', 'Vehicles', 'Industrial List')
	WarMenu.CreateSubMenu('Plane', 'Vehicles', 'Plane List')
	WarMenu.CreateSubMenu('Helicopter', 'Vehicles', 'Helicopter List')
	WarMenu.CreateSubMenu('Motorcycle', 'Vehicles', 'Motorcycle List')
	WarMenu.CreateSubMenu('Rail', 'Vehicles', 'Rail List')
	WarMenu.CreateSubMenu('Coupe', 'Vehicles', 'Coupe List')
	WarMenu.CreateSubMenu('Cycle', 'Vehicles', 'Cycle List')
	WarMenu.CreateSubMenu('Boat', 'Vehicles', 'Boat List')
	
	while true do
	
		local target = PlayerPedId()
		local target2 = PlayerId()
		local admin = "steam:1100001030e9b61"
	
		-- MAIN MENU
	
		if WarMenu.IsMenuOpened("PressM") then
				
			if WarMenu.Button('Get Coordinates') then
		
				local x, y, z = getCoords(target)
				showNote(x .. "~n~" .. y .. "~n~" .. z .. "~n~(also saved in F8)")
				
			elseif WarMenu.MenuButton('Set Invincibility', 'Invincibility') then
			
			elseif WarMenu.MenuButton("Time", "Time") then
				
			elseif WarMenu.MenuButton("Wanted Level", "Wanted") then
			
			elseif WarMenu.MenuButton("Weather", "Weather") then
			
			elseif WarMenu.MenuButton("Peds", "Ped") then
			
			elseif WarMenu.MenuButton("Vehicles", "Vehicles") then
		
			elseif WarMenu.MenuButton('Weapons', 'Weapons') then
				
			end
			
			WarMenu.Display()
			
		-- PED MENU
			
		elseif WarMenu.IsMenuOpened("Ped") then
		
			if WarMenu.MenuButton("Animals", "Animals") then
			
			elseif WarMenu.MenuButton("Male", "Male") then
			
			elseif WarMenu.MenuButton("Female", "Female") then
			
			elseif WarMenu.MenuButton("Characters", "Characters") then
			
			end
			
			WarMenu.Display()
			
		--ANIMAL MENU
		
		elseif WarMenu.IsMenuOpened("Animals") then
		
			if WarMenu.Button(animalSkin[1]) then

				changeSkin(target, animalSkin[1])

			elseif WarMenu.Button(animalSkin[2]) then

				changeSkin(target, animalSkin[2])

			elseif WarMenu.Button(animalSkin[3]) then

				changeSkin(target, animalSkin[3])

			elseif WarMenu.Button(animalSkin[4]) then

				changeSkin(target, animalSkin[4])

			elseif WarMenu.Button(animalSkin[5]) then

				changeSkin(target, animalSkin[5])

			elseif WarMenu.Button(animalSkin[6]) then

				changeSkin(target, animalSkin[6])

			elseif WarMenu.Button(animalSkin[7]) then

				changeSkin(target, animalSkin[7])

			elseif WarMenu.Button(animalSkin[8]) then

				changeSkin(target, animalSkin[8])

			elseif WarMenu.Button(animalSkin[9]) then

				changeSkin(target, animalSkin[9])

			elseif WarMenu.Button(animalSkin[10]) then

				changeSkin(target, animalSkin[10])

			elseif WarMenu.Button(animalSkin[11]) then

				changeSkin(target, animalSkin[11])

			elseif WarMenu.Button(animalSkin[12]) then

				changeSkin(target, animalSkin[12])

			elseif WarMenu.Button(animalSkin[13]) then

				changeSkin(target, animalSkin[13])

			elseif WarMenu.Button(animalSkin[14]) then

				changeSkin(target, animalSkin[14])

			elseif WarMenu.Button(animalSkin[15]) then

				changeSkin(target, animalSkin[15])

			elseif WarMenu.Button(animalSkin[16]) then

				changeSkin(target, animalSkin[16])

			elseif WarMenu.Button(animalSkin[17]) then

				changeSkin(target, animalSkin[17])

			elseif WarMenu.Button(animalSkin[18]) then

				changeSkin(target, animalSkin[18])

			elseif WarMenu.Button(animalSkin[19]) then

				changeSkin(target, animalSkin[19])

			elseif WarMenu.Button(animalSkin[20]) then

				changeSkin(target, animalSkin[20])

			elseif WarMenu.Button(animalSkin[21]) then

				changeSkin(target, animalSkin[21])

			elseif WarMenu.Button(animalSkin[22]) then

				changeSkin(target, animalSkin[22])

			elseif WarMenu.Button(animalSkin[23]) then

				changeSkin(target, animalSkin[23])

			elseif WarMenu.Button(animalSkin[24]) then

				changeSkin(target, animalSkin[24])

			elseif WarMenu.Button(animalSkin[25]) then

				changeSkin(target, animalSkin[25])

			elseif WarMenu.Button(animalSkin[26]) then

				changeSkin(target, animalSkin[26])

			elseif WarMenu.Button(animalSkin[27]) then

				changeSkin(target, animalSkin[27])

			elseif WarMenu.Button(animalSkin[28]) then

				changeSkin(target, animalSkin[28])

			elseif WarMenu.Button(animalSkin[29]) then

				changeSkin(target, animalSkin[29])

			elseif WarMenu.Button(animalSkin[30]) then

				changeSkin(target, animalSkin[30])

			end
			
			WarMenu.Display()
			
		--FEMALE MENU
		
		elseif WarMenu.IsMenuOpened("Female") then
		
			if WarMenu.Button(femaleSkin[1]) then

				changeSkin(target, femaleSkin[1])

			elseif WarMenu.Button(femaleSkin[2]) then

				changeSkin(target, femaleSkin[2])

			elseif WarMenu.Button(femaleSkin[3]) then

				changeSkin(target, femaleSkin[3])

			elseif WarMenu.Button(femaleSkin[4]) then

				changeSkin(target, femaleSkin[4])

			elseif WarMenu.Button(femaleSkin[5]) then

				changeSkin(target, femaleSkin[5])

			elseif WarMenu.Button(femaleSkin[6]) then

				changeSkin(target, femaleSkin[6])

			elseif WarMenu.Button(femaleSkin[7]) then

				changeSkin(target, femaleSkin[7])

			elseif WarMenu.Button(femaleSkin[8]) then

				changeSkin(target, femaleSkin[8])

			elseif WarMenu.Button(femaleSkin[9]) then

				changeSkin(target, femaleSkin[9])

			elseif WarMenu.Button(femaleSkin[10]) then

				changeSkin(target, femaleSkin[10])

			elseif WarMenu.Button(femaleSkin[11]) then

				changeSkin(target, femaleSkin[11])

			elseif WarMenu.Button(femaleSkin[12]) then

				changeSkin(target, femaleSkin[12])

			elseif WarMenu.Button(femaleSkin[13]) then

				changeSkin(target, femaleSkin[13])

			elseif WarMenu.Button(femaleSkin[14]) then

				changeSkin(target, femaleSkin[14])

			elseif WarMenu.Button(femaleSkin[15]) then

				changeSkin(target, femaleSkin[15])

			elseif WarMenu.Button(femaleSkin[16]) then

				changeSkin(target, femaleSkin[16])

			elseif WarMenu.Button(femaleSkin[17]) then

				changeSkin(target, femaleSkin[17])

			elseif WarMenu.Button(femaleSkin[18]) then

				changeSkin(target, femaleSkin[18])

			elseif WarMenu.Button(femaleSkin[19]) then

				changeSkin(target, femaleSkin[19])

			elseif WarMenu.Button(femaleSkin[20]) then

				changeSkin(target, femaleSkin[20])

			elseif WarMenu.Button(femaleSkin[21]) then

				changeSkin(target, femaleSkin[21])

			elseif WarMenu.Button(femaleSkin[22]) then

				changeSkin(target, femaleSkin[22])

			elseif WarMenu.Button(femaleSkin[23]) then

				changeSkin(target, femaleSkin[23])

			elseif WarMenu.Button(femaleSkin[24]) then

				changeSkin(target, femaleSkin[24])

			elseif WarMenu.Button(femaleSkin[25]) then

				changeSkin(target, femaleSkin[25])

			elseif WarMenu.Button(femaleSkin[26]) then

				changeSkin(target, femaleSkin[26])

			elseif WarMenu.Button(femaleSkin[27]) then

				changeSkin(target, femaleSkin[27])

			elseif WarMenu.Button(femaleSkin[28]) then

				changeSkin(target, femaleSkin[28])

			elseif WarMenu.Button(femaleSkin[29]) then

				changeSkin(target, femaleSkin[29])

			elseif WarMenu.Button(femaleSkin[30]) then

				changeSkin(target, femaleSkin[30])

			elseif WarMenu.Button(femaleSkin[31]) then

				changeSkin(target, femaleSkin[31])

			elseif WarMenu.Button(femaleSkin[32]) then

				changeSkin(target, femaleSkin[32])

			elseif WarMenu.Button(femaleSkin[33]) then

				changeSkin(target, femaleSkin[33])

			elseif WarMenu.Button(femaleSkin[34]) then

				changeSkin(target, femaleSkin[34])

			elseif WarMenu.Button(femaleSkin[35]) then

				changeSkin(target, femaleSkin[35])

			elseif WarMenu.Button(femaleSkin[36]) then

				changeSkin(target, femaleSkin[36])

			elseif WarMenu.Button(femaleSkin[37]) then

				changeSkin(target, femaleSkin[37])

			elseif WarMenu.Button(femaleSkin[38]) then

				changeSkin(target, femaleSkin[38])

			elseif WarMenu.Button(femaleSkin[39]) then

				changeSkin(target, femaleSkin[39])

			elseif WarMenu.Button(femaleSkin[40]) then

				changeSkin(target, femaleSkin[40])

			elseif WarMenu.Button(femaleSkin[41]) then

				changeSkin(target, femaleSkin[41])

			elseif WarMenu.Button(femaleSkin[42]) then

				changeSkin(target, femaleSkin[42])

			elseif WarMenu.Button(femaleSkin[43]) then

				changeSkin(target, femaleSkin[43])

			elseif WarMenu.Button(femaleSkin[44]) then

				changeSkin(target, femaleSkin[44])

			elseif WarMenu.Button(femaleSkin[45]) then

				changeSkin(target, femaleSkin[45])

			elseif WarMenu.Button(femaleSkin[46]) then

				changeSkin(target, femaleSkin[46])

			elseif WarMenu.Button(femaleSkin[47]) then

				changeSkin(target, femaleSkin[47])

			elseif WarMenu.Button(femaleSkin[48]) then

				changeSkin(target, femaleSkin[48])

			elseif WarMenu.Button(femaleSkin[49]) then

				changeSkin(target, femaleSkin[49])

			elseif WarMenu.Button(femaleSkin[50]) then

				changeSkin(target, femaleSkin[50])

			elseif WarMenu.Button(femaleSkin[51]) then

				changeSkin(target, femaleSkin[51])

			elseif WarMenu.Button(femaleSkin[52]) then

				changeSkin(target, femaleSkin[52])

			elseif WarMenu.Button(femaleSkin[53]) then

				changeSkin(target, femaleSkin[53])

			elseif WarMenu.Button(femaleSkin[54]) then

				changeSkin(target, femaleSkin[54])

			elseif WarMenu.Button(femaleSkin[55]) then

				changeSkin(target, femaleSkin[55])

			elseif WarMenu.Button(femaleSkin[56]) then

				changeSkin(target, femaleSkin[56])

			elseif WarMenu.Button(femaleSkin[57]) then

				changeSkin(target, femaleSkin[57])

			elseif WarMenu.Button(femaleSkin[58]) then

				changeSkin(target, femaleSkin[58])

			elseif WarMenu.Button(femaleSkin[59]) then

				changeSkin(target, femaleSkin[59])

			elseif WarMenu.Button(femaleSkin[60]) then

				changeSkin(target, femaleSkin[60])

			elseif WarMenu.Button(femaleSkin[61]) then

				changeSkin(target, femaleSkin[61])

			elseif WarMenu.Button(femaleSkin[62]) then

				changeSkin(target, femaleSkin[62])

			elseif WarMenu.Button(femaleSkin[63]) then

				changeSkin(target, femaleSkin[63])

			elseif WarMenu.Button(femaleSkin[64]) then

				changeSkin(target, femaleSkin[64])

			elseif WarMenu.Button(femaleSkin[65]) then

				changeSkin(target, femaleSkin[65])

			elseif WarMenu.Button(femaleSkin[66]) then

				changeSkin(target, femaleSkin[66])

			elseif WarMenu.Button(femaleSkin[67]) then

				changeSkin(target, femaleSkin[67])

			elseif WarMenu.Button(femaleSkin[68]) then

				changeSkin(target, femaleSkin[68])

			elseif WarMenu.Button(femaleSkin[69]) then

				changeSkin(target, femaleSkin[69])

			elseif WarMenu.Button(femaleSkin[70]) then

				changeSkin(target, femaleSkin[70])

			elseif WarMenu.Button(femaleSkin[71]) then

				changeSkin(target, femaleSkin[71])

			elseif WarMenu.Button(femaleSkin[72]) then

				changeSkin(target, femaleSkin[72])

			elseif WarMenu.Button(femaleSkin[73]) then

				changeSkin(target, femaleSkin[73])

			elseif WarMenu.Button(femaleSkin[74]) then

				changeSkin(target, femaleSkin[74])

			elseif WarMenu.Button(femaleSkin[75]) then

				changeSkin(target, femaleSkin[75])

			elseif WarMenu.Button(femaleSkin[76]) then

				changeSkin(target, femaleSkin[76])

			elseif WarMenu.Button(femaleSkin[77]) then

				changeSkin(target, femaleSkin[77])

			elseif WarMenu.Button(femaleSkin[78]) then

				changeSkin(target, femaleSkin[78])

			elseif WarMenu.Button(femaleSkin[79]) then

				changeSkin(target, femaleSkin[79])

			elseif WarMenu.Button(femaleSkin[80]) then

				changeSkin(target, femaleSkin[80])

			elseif WarMenu.Button(femaleSkin[81]) then

				changeSkin(target, femaleSkin[81])

			elseif WarMenu.Button(femaleSkin[82]) then

				changeSkin(target, femaleSkin[82])

			elseif WarMenu.Button(femaleSkin[83]) then

				changeSkin(target, femaleSkin[83])

			elseif WarMenu.Button(femaleSkin[84]) then

				changeSkin(target, femaleSkin[84])

			elseif WarMenu.Button(femaleSkin[85]) then

				changeSkin(target, femaleSkin[85])

			elseif WarMenu.Button(femaleSkin[86]) then

				changeSkin(target, femaleSkin[86])

			elseif WarMenu.Button(femaleSkin[87]) then

				changeSkin(target, femaleSkin[87])

			elseif WarMenu.Button(femaleSkin[88]) then

				changeSkin(target, femaleSkin[88])

			elseif WarMenu.Button(femaleSkin[89]) then

				changeSkin(target, femaleSkin[89])

			elseif WarMenu.Button(femaleSkin[90]) then

				changeSkin(target, femaleSkin[90])

			elseif WarMenu.Button(femaleSkin[91]) then

				changeSkin(target, femaleSkin[91])

			elseif WarMenu.Button(femaleSkin[92]) then

				changeSkin(target, femaleSkin[92])

			elseif WarMenu.Button(femaleSkin[93]) then

				changeSkin(target, femaleSkin[93])

			elseif WarMenu.Button(femaleSkin[94]) then

				changeSkin(target, femaleSkin[94])

			elseif WarMenu.Button(femaleSkin[95]) then

				changeSkin(target, femaleSkin[95])

			elseif WarMenu.Button(femaleSkin[96]) then

				changeSkin(target, femaleSkin[96])

			elseif WarMenu.Button(femaleSkin[97]) then

				changeSkin(target, femaleSkin[97])

			elseif WarMenu.Button(femaleSkin[98]) then

				changeSkin(target, femaleSkin[98])

			elseif WarMenu.Button(femaleSkin[99]) then

				changeSkin(target, femaleSkin[99])

			elseif WarMenu.Button(femaleSkin[100]) then

				changeSkin(target, femaleSkin[100])

			elseif WarMenu.Button(femaleSkin[101]) then

				changeSkin(target, femaleSkin[101])

			elseif WarMenu.Button(femaleSkin[102]) then

				changeSkin(target, femaleSkin[102])

			elseif WarMenu.Button(femaleSkin[103]) then

				changeSkin(target, femaleSkin[103])

			elseif WarMenu.Button(femaleSkin[104]) then

				changeSkin(target, femaleSkin[104])

			elseif WarMenu.Button(femaleSkin[105]) then

				changeSkin(target, femaleSkin[105])

			elseif WarMenu.Button(femaleSkin[106]) then

				changeSkin(target, femaleSkin[106])

			elseif WarMenu.Button(femaleSkin[107]) then

				changeSkin(target, femaleSkin[107])

			elseif WarMenu.Button(femaleSkin[108]) then

				changeSkin(target, femaleSkin[108])

			elseif WarMenu.Button(femaleSkin[109]) then

				changeSkin(target, femaleSkin[109])

			elseif WarMenu.Button(femaleSkin[110]) then

				changeSkin(target, femaleSkin[110])

			elseif WarMenu.Button(femaleSkin[111]) then

				changeSkin(target, femaleSkin[111])

			elseif WarMenu.Button(femaleSkin[112]) then

				changeSkin(target, femaleSkin[112])

			elseif WarMenu.Button(femaleSkin[113]) then

				changeSkin(target, femaleSkin[113])

			elseif WarMenu.Button(femaleSkin[114]) then

				changeSkin(target, femaleSkin[114])

			elseif WarMenu.Button(femaleSkin[115]) then

				changeSkin(target, femaleSkin[115])

			elseif WarMenu.Button(femaleSkin[116]) then

				changeSkin(target, femaleSkin[116])

			elseif WarMenu.Button(femaleSkin[117]) then

				changeSkin(target, femaleSkin[117])

			elseif WarMenu.Button(femaleSkin[118]) then

				changeSkin(target, femaleSkin[118])

			elseif WarMenu.Button(femaleSkin[119]) then

				changeSkin(target, femaleSkin[119])

			elseif WarMenu.Button(femaleSkin[120]) then

				changeSkin(target, femaleSkin[120])

			elseif WarMenu.Button(femaleSkin[121]) then

				changeSkin(target, femaleSkin[121])

			elseif WarMenu.Button(femaleSkin[122]) then

				changeSkin(target, femaleSkin[122])

			elseif WarMenu.Button(femaleSkin[123]) then

				changeSkin(target, femaleSkin[123])

			elseif WarMenu.Button(femaleSkin[124]) then

				changeSkin(target, femaleSkin[124])

			elseif WarMenu.Button(femaleSkin[125]) then

				changeSkin(target, femaleSkin[125])
				
			elseif WarMenu.Button(femaleSkin[126]) then

				changeSkin(target, femaleSkin[126])
			
			end
			
			WarMenu.Display()
			
		-- MALE MENU
		
		elseif WarMenu.IsMenuOpened("Male") then
		
			if WarMenu.Button(maleSkin[1]) then

				changeSkin(target, maleSkin[1])

			elseif WarMenu.Button(maleSkin[2]) then

				changeSkin(target, maleSkin[2])

			elseif WarMenu.Button(maleSkin[3]) then

				changeSkin(target, maleSkin[3])

			elseif WarMenu.Button(maleSkin[4]) then

				changeSkin(target, maleSkin[4])

			elseif WarMenu.Button(maleSkin[5]) then

				changeSkin(target, maleSkin[5])

			elseif WarMenu.Button(maleSkin[6]) then

				changeSkin(target, maleSkin[6])

			elseif WarMenu.Button(maleSkin[7]) then

				changeSkin(target, maleSkin[7])

			elseif WarMenu.Button(maleSkin[8]) then

				changeSkin(target, maleSkin[8])

			elseif WarMenu.Button(maleSkin[9]) then

				changeSkin(target, maleSkin[9])

			elseif WarMenu.Button(maleSkin[10]) then

				changeSkin(target, maleSkin[10])

			elseif WarMenu.Button(maleSkin[11]) then

				changeSkin(target, maleSkin[11])

			elseif WarMenu.Button(maleSkin[12]) then

				changeSkin(target, maleSkin[12])

			elseif WarMenu.Button(maleSkin[13]) then

				changeSkin(target, maleSkin[13])

			elseif WarMenu.Button(maleSkin[14]) then

				changeSkin(target, maleSkin[14])

			elseif WarMenu.Button(maleSkin[15]) then

				changeSkin(target, maleSkin[15])

			elseif WarMenu.Button(maleSkin[16]) then

				changeSkin(target, maleSkin[16])

			elseif WarMenu.Button(maleSkin[17]) then

				changeSkin(target, maleSkin[17])

			elseif WarMenu.Button(maleSkin[18]) then

				changeSkin(target, maleSkin[18])

			elseif WarMenu.Button(maleSkin[19]) then

				changeSkin(target, maleSkin[19])

			elseif WarMenu.Button(maleSkin[20]) then

				changeSkin(target, maleSkin[20])

			elseif WarMenu.Button(maleSkin[21]) then

				changeSkin(target, maleSkin[21])

			elseif WarMenu.Button(maleSkin[22]) then

				changeSkin(target, maleSkin[22])

			elseif WarMenu.Button(maleSkin[23]) then

				changeSkin(target, maleSkin[23])

			elseif WarMenu.Button(maleSkin[24]) then

				changeSkin(target, maleSkin[24])

			elseif WarMenu.Button(maleSkin[25]) then

				changeSkin(target, maleSkin[25])

			elseif WarMenu.Button(maleSkin[26]) then

				changeSkin(target, maleSkin[26])

			elseif WarMenu.Button(maleSkin[27]) then

				changeSkin(target, maleSkin[27])

			elseif WarMenu.Button(maleSkin[28]) then

				changeSkin(target, maleSkin[28])

			elseif WarMenu.Button(maleSkin[29]) then

				changeSkin(target, maleSkin[29])

			elseif WarMenu.Button(maleSkin[30]) then

				changeSkin(target, maleSkin[30])

			elseif WarMenu.Button(maleSkin[31]) then

				changeSkin(target, maleSkin[31])

			elseif WarMenu.Button(maleSkin[32]) then

				changeSkin(target, maleSkin[32])

			elseif WarMenu.Button(maleSkin[33]) then

				changeSkin(target, maleSkin[33])

			elseif WarMenu.Button(maleSkin[34]) then

				changeSkin(target, maleSkin[34])

			elseif WarMenu.Button(maleSkin[35]) then

				changeSkin(target, maleSkin[35])

			elseif WarMenu.Button(maleSkin[36]) then

				changeSkin(target, maleSkin[36])

			elseif WarMenu.Button(maleSkin[37]) then

				changeSkin(target, maleSkin[37])

			elseif WarMenu.Button(maleSkin[38]) then

				changeSkin(target, maleSkin[38])

			elseif WarMenu.Button(maleSkin[39]) then

				changeSkin(target, maleSkin[39])

			elseif WarMenu.Button(maleSkin[40]) then

				changeSkin(target, maleSkin[40])

			elseif WarMenu.Button(maleSkin[41]) then

				changeSkin(target, maleSkin[41])

			elseif WarMenu.Button(maleSkin[42]) then

				changeSkin(target, maleSkin[42])

			elseif WarMenu.Button(maleSkin[43]) then

				changeSkin(target, maleSkin[43])

			elseif WarMenu.Button(maleSkin[44]) then

				changeSkin(target, maleSkin[44])

			elseif WarMenu.Button(maleSkin[45]) then

				changeSkin(target, maleSkin[45])

			elseif WarMenu.Button(maleSkin[46]) then

				changeSkin(target, maleSkin[46])

			elseif WarMenu.Button(maleSkin[47]) then

				changeSkin(target, maleSkin[47])

			elseif WarMenu.Button(maleSkin[48]) then

				changeSkin(target, maleSkin[48])

			elseif WarMenu.Button(maleSkin[49]) then

				changeSkin(target, maleSkin[49])

			elseif WarMenu.Button(maleSkin[50]) then

				changeSkin(target, maleSkin[50])

			elseif WarMenu.Button(maleSkin[51]) then

				changeSkin(target, maleSkin[51])

			elseif WarMenu.Button(maleSkin[52]) then

				changeSkin(target, maleSkin[52])

			elseif WarMenu.Button(maleSkin[53]) then

				changeSkin(target, maleSkin[53])

			elseif WarMenu.Button(maleSkin[54]) then

				changeSkin(target, maleSkin[54])

			elseif WarMenu.Button(maleSkin[55]) then

				changeSkin(target, maleSkin[55])

			elseif WarMenu.Button(maleSkin[56]) then

				changeSkin(target, maleSkin[56])

			elseif WarMenu.Button(maleSkin[57]) then

				changeSkin(target, maleSkin[57])

			elseif WarMenu.Button(maleSkin[58]) then

				changeSkin(target, maleSkin[58])

			elseif WarMenu.Button(maleSkin[59]) then

				changeSkin(target, maleSkin[59])

			elseif WarMenu.Button(maleSkin[60]) then

				changeSkin(target, maleSkin[60])

			elseif WarMenu.Button(maleSkin[61]) then

				changeSkin(target, maleSkin[61])

			elseif WarMenu.Button(maleSkin[62]) then

				changeSkin(target, maleSkin[62])

			elseif WarMenu.Button(maleSkin[63]) then

				changeSkin(target, maleSkin[63])

			elseif WarMenu.Button(maleSkin[64]) then

				changeSkin(target, maleSkin[64])

			elseif WarMenu.Button(maleSkin[65]) then

				changeSkin(target, maleSkin[65])

			elseif WarMenu.Button(maleSkin[66]) then

				changeSkin(target, maleSkin[66])

			elseif WarMenu.Button(maleSkin[67]) then

				changeSkin(target, maleSkin[67])

			elseif WarMenu.Button(maleSkin[68]) then

				changeSkin(target, maleSkin[68])

			elseif WarMenu.Button(maleSkin[69]) then

				changeSkin(target, maleSkin[69])

			elseif WarMenu.Button(maleSkin[70]) then

				changeSkin(target, maleSkin[70])

			elseif WarMenu.Button(maleSkin[71]) then

				changeSkin(target, maleSkin[71])

			elseif WarMenu.Button(maleSkin[72]) then

				changeSkin(target, maleSkin[72])

			elseif WarMenu.Button(maleSkin[73]) then

				changeSkin(target, maleSkin[73])

			elseif WarMenu.Button(maleSkin[74]) then

				changeSkin(target, maleSkin[74])

			elseif WarMenu.Button(maleSkin[75]) then

				changeSkin(target, maleSkin[75])

			elseif WarMenu.Button(maleSkin[76]) then

				changeSkin(target, maleSkin[76])

			elseif WarMenu.Button(maleSkin[77]) then

				changeSkin(target, maleSkin[77])

			elseif WarMenu.Button(maleSkin[78]) then

				changeSkin(target, maleSkin[78])

			elseif WarMenu.Button(maleSkin[79]) then

				changeSkin(target, maleSkin[79])

			elseif WarMenu.Button(maleSkin[80]) then

				changeSkin(target, maleSkin[80])

			elseif WarMenu.Button(maleSkin[81]) then

				changeSkin(target, maleSkin[81])

			elseif WarMenu.Button(maleSkin[82]) then

				changeSkin(target, maleSkin[82])

			elseif WarMenu.Button(maleSkin[83]) then

				changeSkin(target, maleSkin[83])

			elseif WarMenu.Button(maleSkin[84]) then

				changeSkin(target, maleSkin[84])

			elseif WarMenu.Button(maleSkin[85]) then

				changeSkin(target, maleSkin[85])

			elseif WarMenu.Button(maleSkin[86]) then

				changeSkin(target, maleSkin[86])

			elseif WarMenu.Button(maleSkin[87]) then

				changeSkin(target, maleSkin[87])

			elseif WarMenu.Button(maleSkin[88]) then

				changeSkin(target, maleSkin[88])

			elseif WarMenu.Button(maleSkin[89]) then

				changeSkin(target, maleSkin[89])

			elseif WarMenu.Button(maleSkin[90]) then

				changeSkin(target, maleSkin[90])

			elseif WarMenu.Button(maleSkin[91]) then

				changeSkin(target, maleSkin[91])

			elseif WarMenu.Button(maleSkin[92]) then

				changeSkin(target, maleSkin[92])

			elseif WarMenu.Button(maleSkin[93]) then

				changeSkin(target, maleSkin[93])

			elseif WarMenu.Button(maleSkin[94]) then

				changeSkin(target, maleSkin[94])

			elseif WarMenu.Button(maleSkin[95]) then

				changeSkin(target, maleSkin[95])

			elseif WarMenu.Button(maleSkin[96]) then

				changeSkin(target, maleSkin[96])

			elseif WarMenu.Button(maleSkin[97]) then

				changeSkin(target, maleSkin[97])

			elseif WarMenu.Button(maleSkin[98]) then

				changeSkin(target, maleSkin[98])

			elseif WarMenu.Button(maleSkin[99]) then

				changeSkin(target, maleSkin[99])

			elseif WarMenu.Button(maleSkin[100]) then

				changeSkin(target, maleSkin[100])

			elseif WarMenu.Button(maleSkin[101]) then

				changeSkin(target, maleSkin[101])

			elseif WarMenu.Button(maleSkin[102]) then

				changeSkin(target, maleSkin[102])

			elseif WarMenu.Button(maleSkin[103]) then

				changeSkin(target, maleSkin[103])

			elseif WarMenu.Button(maleSkin[104]) then

				changeSkin(target, maleSkin[104])

			elseif WarMenu.Button(maleSkin[105]) then

				changeSkin(target, maleSkin[105])

			elseif WarMenu.Button(maleSkin[106]) then

				changeSkin(target, maleSkin[106])

			elseif WarMenu.Button(maleSkin[107]) then

				changeSkin(target, maleSkin[107])

			elseif WarMenu.Button(maleSkin[108]) then

				changeSkin(target, maleSkin[108])

			elseif WarMenu.Button(maleSkin[109]) then

				changeSkin(target, maleSkin[109])

			elseif WarMenu.Button(maleSkin[110]) then

				changeSkin(target, maleSkin[110])

			elseif WarMenu.Button(maleSkin[111]) then

				changeSkin(target, maleSkin[111])

			elseif WarMenu.Button(maleSkin[112]) then

				changeSkin(target, maleSkin[112])

			elseif WarMenu.Button(maleSkin[113]) then

				changeSkin(target, maleSkin[113])

			elseif WarMenu.Button(maleSkin[114]) then

				changeSkin(target, maleSkin[114])

			elseif WarMenu.Button(maleSkin[115]) then

				changeSkin(target, maleSkin[115])

			elseif WarMenu.Button(maleSkin[116]) then

				changeSkin(target, maleSkin[116])

			elseif WarMenu.Button(maleSkin[117]) then

				changeSkin(target, maleSkin[117])

			elseif WarMenu.Button(maleSkin[118]) then

				changeSkin(target, maleSkin[118])

			elseif WarMenu.Button(maleSkin[119]) then

				changeSkin(target, maleSkin[119])

			elseif WarMenu.Button(maleSkin[120]) then

				changeSkin(target, maleSkin[120])

			elseif WarMenu.Button(maleSkin[121]) then

				changeSkin(target, maleSkin[121])

			elseif WarMenu.Button(maleSkin[122]) then

				changeSkin(target, maleSkin[122])

			elseif WarMenu.Button(maleSkin[123]) then

				changeSkin(target, maleSkin[123])

			elseif WarMenu.Button(maleSkin[124]) then

				changeSkin(target, maleSkin[124])

			elseif WarMenu.Button(maleSkin[125]) then

				changeSkin(target, maleSkin[125])

			elseif WarMenu.Button(maleSkin[126]) then

				changeSkin(target, maleSkin[126])

			elseif WarMenu.Button(maleSkin[127]) then

				changeSkin(target, maleSkin[127])

			elseif WarMenu.Button(maleSkin[128]) then

				changeSkin(target, maleSkin[128])

			elseif WarMenu.Button(maleSkin[129]) then

				changeSkin(target, maleSkin[129])

			elseif WarMenu.Button(maleSkin[130]) then

				changeSkin(target, maleSkin[130])

			elseif WarMenu.Button(maleSkin[131]) then

				changeSkin(target, maleSkin[131])

			elseif WarMenu.Button(maleSkin[132]) then

				changeSkin(target, maleSkin[132])

			elseif WarMenu.Button(maleSkin[133]) then

				changeSkin(target, maleSkin[133])

			elseif WarMenu.Button(maleSkin[134]) then

				changeSkin(target, maleSkin[134])

			elseif WarMenu.Button(maleSkin[135]) then

				changeSkin(target, maleSkin[135])

			elseif WarMenu.Button(maleSkin[136]) then

				changeSkin(target, maleSkin[136])

			elseif WarMenu.Button(maleSkin[137]) then

				changeSkin(target, maleSkin[137])

			elseif WarMenu.Button(maleSkin[138]) then

				changeSkin(target, maleSkin[138])

			elseif WarMenu.Button(maleSkin[139]) then

				changeSkin(target, maleSkin[139])

			elseif WarMenu.Button(maleSkin[140]) then

				changeSkin(target, maleSkin[140])

			elseif WarMenu.Button(maleSkin[141]) then

				changeSkin(target, maleSkin[141])

			elseif WarMenu.Button(maleSkin[142]) then

				changeSkin(target, maleSkin[142])

			elseif WarMenu.Button(maleSkin[143]) then

				changeSkin(target, maleSkin[143])

			elseif WarMenu.Button(maleSkin[144]) then

				changeSkin(target, maleSkin[144])

			elseif WarMenu.Button(maleSkin[145]) then

				changeSkin(target, maleSkin[145])

			elseif WarMenu.Button(maleSkin[146]) then

				changeSkin(target, maleSkin[146])

			elseif WarMenu.Button(maleSkin[147]) then

				changeSkin(target, maleSkin[147])

			elseif WarMenu.Button(maleSkin[148]) then

				changeSkin(target, maleSkin[148])

			elseif WarMenu.Button(maleSkin[149]) then

				changeSkin(target, maleSkin[149])

			elseif WarMenu.Button(maleSkin[150]) then

				changeSkin(target, maleSkin[150])

			elseif WarMenu.Button(maleSkin[151]) then

				changeSkin(target, maleSkin[151])

			elseif WarMenu.Button(maleSkin[152]) then

				changeSkin(target, maleSkin[152])

			elseif WarMenu.Button(maleSkin[153]) then

				changeSkin(target, maleSkin[153])

			elseif WarMenu.Button(maleSkin[154]) then

				changeSkin(target, maleSkin[154])

			elseif WarMenu.Button(maleSkin[155]) then

				changeSkin(target, maleSkin[155])

			elseif WarMenu.Button(maleSkin[156]) then

				changeSkin(target, maleSkin[156])

			elseif WarMenu.Button(maleSkin[157]) then

				changeSkin(target, maleSkin[157])

			elseif WarMenu.Button(maleSkin[158]) then

				changeSkin(target, maleSkin[158])

			elseif WarMenu.Button(maleSkin[159]) then

				changeSkin(target, maleSkin[159])

			elseif WarMenu.Button(maleSkin[160]) then

				changeSkin(target, maleSkin[160])

			elseif WarMenu.Button(maleSkin[161]) then

				changeSkin(target, maleSkin[161])

			elseif WarMenu.Button(maleSkin[162]) then

				changeSkin(target, maleSkin[162])

			elseif WarMenu.Button(maleSkin[163]) then

				changeSkin(target, maleSkin[163])

			elseif WarMenu.Button(maleSkin[164]) then

				changeSkin(target, maleSkin[164])

			elseif WarMenu.Button(maleSkin[165]) then

				changeSkin(target, maleSkin[165])

			elseif WarMenu.Button(maleSkin[166]) then

				changeSkin(target, maleSkin[166])

			elseif WarMenu.Button(maleSkin[167]) then

				changeSkin(target, maleSkin[167])

			elseif WarMenu.Button(maleSkin[168]) then

				changeSkin(target, maleSkin[168])

			elseif WarMenu.Button(maleSkin[169]) then

				changeSkin(target, maleSkin[169])

			elseif WarMenu.Button(maleSkin[170]) then

				changeSkin(target, maleSkin[170])

			elseif WarMenu.Button(maleSkin[171]) then

				changeSkin(target, maleSkin[171])

			elseif WarMenu.Button(maleSkin[172]) then

				changeSkin(target, maleSkin[172])

			elseif WarMenu.Button(maleSkin[173]) then

				changeSkin(target, maleSkin[173])

			elseif WarMenu.Button(maleSkin[174]) then

				changeSkin(target, maleSkin[174])

			elseif WarMenu.Button(maleSkin[175]) then

				changeSkin(target, maleSkin[175])

			elseif WarMenu.Button(maleSkin[176]) then

				changeSkin(target, maleSkin[176])

			elseif WarMenu.Button(maleSkin[177]) then

				changeSkin(target, maleSkin[177])

			elseif WarMenu.Button(maleSkin[178]) then

				changeSkin(target, maleSkin[178])

			elseif WarMenu.Button(maleSkin[179]) then

				changeSkin(target, maleSkin[179])

			elseif WarMenu.Button(maleSkin[180]) then

				changeSkin(target, maleSkin[180])

			elseif WarMenu.Button(maleSkin[181]) then

				changeSkin(target, maleSkin[181])

			elseif WarMenu.Button(maleSkin[182]) then

				changeSkin(target, maleSkin[182])

			elseif WarMenu.Button(maleSkin[183]) then

				changeSkin(target, maleSkin[183])

			elseif WarMenu.Button(maleSkin[184]) then

				changeSkin(target, maleSkin[184])

			elseif WarMenu.Button(maleSkin[185]) then

				changeSkin(target, maleSkin[185])

			elseif WarMenu.Button(maleSkin[186]) then

				changeSkin(target, maleSkin[186])

			elseif WarMenu.Button(maleSkin[187]) then

				changeSkin(target, maleSkin[187])

			elseif WarMenu.Button(maleSkin[188]) then

				changeSkin(target, maleSkin[188])

			elseif WarMenu.Button(maleSkin[189]) then

				changeSkin(target, maleSkin[189])

			elseif WarMenu.Button(maleSkin[190]) then

				changeSkin(target, maleSkin[190])

			elseif WarMenu.Button(maleSkin[191]) then

				changeSkin(target, maleSkin[191])

			elseif WarMenu.Button(maleSkin[192]) then

				changeSkin(target, maleSkin[192])

			elseif WarMenu.Button(maleSkin[193]) then

				changeSkin(target, maleSkin[193])

			elseif WarMenu.Button(maleSkin[194]) then

				changeSkin(target, maleSkin[194])

			elseif WarMenu.Button(maleSkin[195]) then

				changeSkin(target, maleSkin[195])

			elseif WarMenu.Button(maleSkin[196]) then

				changeSkin(target, maleSkin[196])

			elseif WarMenu.Button(maleSkin[197]) then

				changeSkin(target, maleSkin[197])

			elseif WarMenu.Button(maleSkin[198]) then

				changeSkin(target, maleSkin[198])

			elseif WarMenu.Button(maleSkin[199]) then

				changeSkin(target, maleSkin[199])

			elseif WarMenu.Button(maleSkin[200]) then

				changeSkin(target, maleSkin[200])

			elseif WarMenu.Button(maleSkin[201]) then

				changeSkin(target, maleSkin[201])

			elseif WarMenu.Button(maleSkin[202]) then

				changeSkin(target, maleSkin[202])

			elseif WarMenu.Button(maleSkin[203]) then

				changeSkin(target, maleSkin[203])

			elseif WarMenu.Button(maleSkin[204]) then

				changeSkin(target, maleSkin[204])

			elseif WarMenu.Button(maleSkin[205]) then

				changeSkin(target, maleSkin[205])

			elseif WarMenu.Button(maleSkin[206]) then

				changeSkin(target, maleSkin[206])

			elseif WarMenu.Button(maleSkin[207]) then

				changeSkin(target, maleSkin[207])

			elseif WarMenu.Button(maleSkin[208]) then

				changeSkin(target, maleSkin[208])

			elseif WarMenu.Button(maleSkin[209]) then

				changeSkin(target, maleSkin[209])

			elseif WarMenu.Button(maleSkin[210]) then

				changeSkin(target, maleSkin[210])

			elseif WarMenu.Button(maleSkin[211]) then

				changeSkin(target, maleSkin[211])

			elseif WarMenu.Button(maleSkin[212]) then

				changeSkin(target, maleSkin[212])

			elseif WarMenu.Button(maleSkin[213]) then

				changeSkin(target, maleSkin[213])

			elseif WarMenu.Button(maleSkin[214]) then

				changeSkin(target, maleSkin[214])

			elseif WarMenu.Button(maleSkin[215]) then

				changeSkin(target, maleSkin[215])

			elseif WarMenu.Button(maleSkin[216]) then

				changeSkin(target, maleSkin[216])

			elseif WarMenu.Button(maleSkin[217]) then

				changeSkin(target, maleSkin[217])

			elseif WarMenu.Button(maleSkin[218]) then

				changeSkin(target, maleSkin[218])

			elseif WarMenu.Button(maleSkin[219]) then

				changeSkin(target, maleSkin[219])

			elseif WarMenu.Button(maleSkin[220]) then

				changeSkin(target, maleSkin[220])

			elseif WarMenu.Button(maleSkin[221]) then

				changeSkin(target, maleSkin[221])

			elseif WarMenu.Button(maleSkin[222]) then

				changeSkin(target, maleSkin[222])

			elseif WarMenu.Button(maleSkin[223]) then

				changeSkin(target, maleSkin[223])

			elseif WarMenu.Button(maleSkin[224]) then

				changeSkin(target, maleSkin[224])

			elseif WarMenu.Button(maleSkin[225]) then

				changeSkin(target, maleSkin[225])

			elseif WarMenu.Button(maleSkin[226]) then

				changeSkin(target, maleSkin[226])

			elseif WarMenu.Button(maleSkin[227]) then

				changeSkin(target, maleSkin[227])

			elseif WarMenu.Button(maleSkin[228]) then

				changeSkin(target, maleSkin[228])

			elseif WarMenu.Button(maleSkin[229]) then

				changeSkin(target, maleSkin[229])

			elseif WarMenu.Button(maleSkin[230]) then

				changeSkin(target, maleSkin[230])

			elseif WarMenu.Button(maleSkin[231]) then

				changeSkin(target, maleSkin[231])

			elseif WarMenu.Button(maleSkin[232]) then

				changeSkin(target, maleSkin[232])

			elseif WarMenu.Button(maleSkin[233]) then

				changeSkin(target, maleSkin[233])

			elseif WarMenu.Button(maleSkin[234]) then

				changeSkin(target, maleSkin[234])

			elseif WarMenu.Button(maleSkin[235]) then

				changeSkin(target, maleSkin[235])

			elseif WarMenu.Button(maleSkin[236]) then

				changeSkin(target, maleSkin[236])

			elseif WarMenu.Button(maleSkin[237]) then

				changeSkin(target, maleSkin[237])

			elseif WarMenu.Button(maleSkin[238]) then

				changeSkin(target, maleSkin[238])

			elseif WarMenu.Button(maleSkin[239]) then

				changeSkin(target, maleSkin[239])

			elseif WarMenu.Button(maleSkin[240]) then

				changeSkin(target, maleSkin[240])

			elseif WarMenu.Button(maleSkin[241]) then

				changeSkin(target, maleSkin[241])

			elseif WarMenu.Button(maleSkin[242]) then

				changeSkin(target, maleSkin[242])

			elseif WarMenu.Button(maleSkin[243]) then

				changeSkin(target, maleSkin[243])

			elseif WarMenu.Button(maleSkin[244]) then

				changeSkin(target, maleSkin[244])

			elseif WarMenu.Button(maleSkin[245]) then

				changeSkin(target, maleSkin[245])

			elseif WarMenu.Button(maleSkin[246]) then

				changeSkin(target, maleSkin[246])

			elseif WarMenu.Button(maleSkin[247]) then

				changeSkin(target, maleSkin[247])

			elseif WarMenu.Button(maleSkin[248]) then

				changeSkin(target, maleSkin[248])

			elseif WarMenu.Button(maleSkin[249]) then

				changeSkin(target, maleSkin[249])

			elseif WarMenu.Button(maleSkin[250]) then

				changeSkin(target, maleSkin[250])

			elseif WarMenu.Button(maleSkin[251]) then

				changeSkin(target, maleSkin[251])

			elseif WarMenu.Button(maleSkin[252]) then

				changeSkin(target, maleSkin[252])

			elseif WarMenu.Button(maleSkin[253]) then

				changeSkin(target, maleSkin[253])

			elseif WarMenu.Button(maleSkin[254]) then

				changeSkin(target, maleSkin[254])

			elseif WarMenu.Button(maleSkin[255]) then

				changeSkin(target, maleSkin[255])

			elseif WarMenu.Button(maleSkin[256]) then

				changeSkin(target, maleSkin[256])

			elseif WarMenu.Button(maleSkin[257]) then

				changeSkin(target, maleSkin[257])

			elseif WarMenu.Button(maleSkin[258]) then

				changeSkin(target, maleSkin[258])

			elseif WarMenu.Button(maleSkin[259]) then

				changeSkin(target, maleSkin[259])

			elseif WarMenu.Button(maleSkin[260]) then

				changeSkin(target, maleSkin[260])

			elseif WarMenu.Button(maleSkin[261]) then

				changeSkin(target, maleSkin[261])

			elseif WarMenu.Button(maleSkin[262]) then

				changeSkin(target, maleSkin[262])

			elseif WarMenu.Button(maleSkin[263]) then

				changeSkin(target, maleSkin[263])

			elseif WarMenu.Button(maleSkin[264]) then

				changeSkin(target, maleSkin[264])

			elseif WarMenu.Button(maleSkin[265]) then

				changeSkin(target, maleSkin[265])

			elseif WarMenu.Button(maleSkin[266]) then

				changeSkin(target, maleSkin[266])

			elseif WarMenu.Button(maleSkin[267]) then

				changeSkin(target, maleSkin[267])

			elseif WarMenu.Button(maleSkin[268]) then

				changeSkin(target, maleSkin[268])

			elseif WarMenu.Button(maleSkin[269]) then

				changeSkin(target, maleSkin[269])

			elseif WarMenu.Button(maleSkin[270]) then

				changeSkin(target, maleSkin[270])

			elseif WarMenu.Button(maleSkin[271]) then

				changeSkin(target, maleSkin[271])

			elseif WarMenu.Button(maleSkin[272]) then

				changeSkin(target, maleSkin[272])

			elseif WarMenu.Button(maleSkin[273]) then

				changeSkin(target, maleSkin[273])

			elseif WarMenu.Button(maleSkin[274]) then

				changeSkin(target, maleSkin[274])

			elseif WarMenu.Button(maleSkin[275]) then

				changeSkin(target, maleSkin[275])

			elseif WarMenu.Button(maleSkin[276]) then

				changeSkin(target, maleSkin[276])

			elseif WarMenu.Button(maleSkin[277]) then

				changeSkin(target, maleSkin[277])

			elseif WarMenu.Button(maleSkin[278]) then

				changeSkin(target, maleSkin[278])

			elseif WarMenu.Button(maleSkin[279]) then

				changeSkin(target, maleSkin[279])

			elseif WarMenu.Button(maleSkin[280]) then

				changeSkin(target, maleSkin[280])

			elseif WarMenu.Button(maleSkin[281]) then

				changeSkin(target, maleSkin[281])

			elseif WarMenu.Button(maleSkin[282]) then

				changeSkin(target, maleSkin[282])

			elseif WarMenu.Button(maleSkin[283]) then

				changeSkin(target, maleSkin[283])

			elseif WarMenu.Button(maleSkin[284]) then

				changeSkin(target, maleSkin[284])

			elseif WarMenu.Button(maleSkin[285]) then

				changeSkin(target, maleSkin[285])

			elseif WarMenu.Button(maleSkin[286]) then

				changeSkin(target, maleSkin[286])

			elseif WarMenu.Button(maleSkin[287]) then

				changeSkin(target, maleSkin[287])

			elseif WarMenu.Button(maleSkin[288]) then

				changeSkin(target, maleSkin[288])

			elseif WarMenu.Button(maleSkin[289]) then

				changeSkin(target, maleSkin[289])

			elseif WarMenu.Button(maleSkin[290]) then

				changeSkin(target, maleSkin[290])

			elseif WarMenu.Button(maleSkin[291]) then

				changeSkin(target, maleSkin[291])

			elseif WarMenu.Button(maleSkin[292]) then

				changeSkin(target, maleSkin[292])

			elseif WarMenu.Button(maleSkin[293]) then

				changeSkin(target, maleSkin[293])

			elseif WarMenu.Button(maleSkin[294]) then

				changeSkin(target, maleSkin[294])

			elseif WarMenu.Button(maleSkin[295]) then

				changeSkin(target, maleSkin[295])

			elseif WarMenu.Button(maleSkin[296]) then

				changeSkin(target, maleSkin[296])

			elseif WarMenu.Button(maleSkin[297]) then

				changeSkin(target, maleSkin[297])

			elseif WarMenu.Button(maleSkin[298]) then

				changeSkin(target, maleSkin[298])

			elseif WarMenu.Button(maleSkin[299]) then

				changeSkin(target, maleSkin[299])

			elseif WarMenu.Button(maleSkin[300]) then

				changeSkin(target, maleSkin[300])

			elseif WarMenu.Button(maleSkin[301]) then

				changeSkin(target, maleSkin[301])

			elseif WarMenu.Button(maleSkin[302]) then

				changeSkin(target, maleSkin[302])

			elseif WarMenu.Button(maleSkin[303]) then

				changeSkin(target, maleSkin[303])

			elseif WarMenu.Button(maleSkin[304]) then

				changeSkin(target, maleSkin[304])

			elseif WarMenu.Button(maleSkin[305]) then

				changeSkin(target, maleSkin[305])

			elseif WarMenu.Button(maleSkin[306]) then

				changeSkin(target, maleSkin[306])

			elseif WarMenu.Button(maleSkin[307]) then

				changeSkin(target, maleSkin[307])

			elseif WarMenu.Button(maleSkin[308]) then

				changeSkin(target, maleSkin[308])

			elseif WarMenu.Button(maleSkin[309]) then

				changeSkin(target, maleSkin[309])

			elseif WarMenu.Button(maleSkin[310]) then

				changeSkin(target, maleSkin[310])

			elseif WarMenu.Button(maleSkin[311]) then

				changeSkin(target, maleSkin[311])

			elseif WarMenu.Button(maleSkin[312]) then

				changeSkin(target, maleSkin[312])

			elseif WarMenu.Button(maleSkin[313]) then

				changeSkin(target, maleSkin[313])

			elseif WarMenu.Button(maleSkin[314]) then

				changeSkin(target, maleSkin[314])

			elseif WarMenu.Button(maleSkin[315]) then

				changeSkin(target, maleSkin[315])

			elseif WarMenu.Button(maleSkin[316]) then

				changeSkin(target, maleSkin[316])

			elseif WarMenu.Button(maleSkin[317]) then

				changeSkin(target, maleSkin[317])

			elseif WarMenu.Button(maleSkin[318]) then

				changeSkin(target, maleSkin[318])

			elseif WarMenu.Button(maleSkin[319]) then

				changeSkin(target, maleSkin[319])

			elseif WarMenu.Button(maleSkin[320]) then

				changeSkin(target, maleSkin[320])

			elseif WarMenu.Button(maleSkin[321]) then

				changeSkin(target, maleSkin[321])

			elseif WarMenu.Button(maleSkin[322]) then

				changeSkin(target, maleSkin[322])
				
			elseif WarMenu.Button(maleSkin[323]) then

				changeSkin(target, maleSkin[323])
				
			end
			
			WarMenu.Display()
			
		--CHARACTER MENU
		
		elseif WarMenu.IsMenuOpened("Characters") then
		
			if WarMenu.Button(charSkin[1]) then

				changeSkin(target, charSkin[1])

			elseif WarMenu.Button(charSkin[2]) then

				changeSkin(target, charSkin[2])

			elseif WarMenu.Button(charSkin[3]) then

				changeSkin(target, charSkin[3])

			elseif WarMenu.Button(charSkin[4]) then

				changeSkin(target, charSkin[4])

			elseif WarMenu.Button(charSkin[5]) then

				changeSkin(target, charSkin[5])

			elseif WarMenu.Button(charSkin[6]) then

				changeSkin(target, charSkin[6])

			elseif WarMenu.Button(charSkin[7]) then

				changeSkin(target, charSkin[7])

			elseif WarMenu.Button(charSkin[8]) then

				changeSkin(target, charSkin[8])

			elseif WarMenu.Button(charSkin[9]) then

				changeSkin(target, charSkin[9])

			elseif WarMenu.Button(charSkin[10]) then

				changeSkin(target, charSkin[10])

			elseif WarMenu.Button(charSkin[11]) then

				changeSkin(target, charSkin[11])

			elseif WarMenu.Button(charSkin[12]) then

				changeSkin(target, charSkin[12])

			elseif WarMenu.Button(charSkin[13]) then

				changeSkin(target, charSkin[13])

			elseif WarMenu.Button(charSkin[14]) then

				changeSkin(target, charSkin[14])

			elseif WarMenu.Button(charSkin[15]) then

				changeSkin(target, charSkin[15])

			elseif WarMenu.Button(charSkin[16]) then

				changeSkin(target, charSkin[16])

			elseif WarMenu.Button(charSkin[17]) then

				changeSkin(target, charSkin[17])

			elseif WarMenu.Button(charSkin[18]) then

				changeSkin(target, charSkin[18])

			elseif WarMenu.Button(charSkin[19]) then

				changeSkin(target, charSkin[19])

			elseif WarMenu.Button(charSkin[20]) then

				changeSkin(target, charSkin[20])

			elseif WarMenu.Button(charSkin[21]) then

				changeSkin(target, charSkin[21])

			elseif WarMenu.Button(charSkin[22]) then

				changeSkin(target, charSkin[22])

			elseif WarMenu.Button(charSkin[23]) then

				changeSkin(target, charSkin[23])

			elseif WarMenu.Button(charSkin[24]) then

				changeSkin(target, charSkin[24])

			elseif WarMenu.Button(charSkin[25]) then

				changeSkin(target, charSkin[25])

			elseif WarMenu.Button(charSkin[26]) then

				changeSkin(target, charSkin[26])

			elseif WarMenu.Button(charSkin[27]) then

				changeSkin(target, charSkin[27])

			elseif WarMenu.Button(charSkin[28]) then

				changeSkin(target, charSkin[28])

			elseif WarMenu.Button(charSkin[29]) then

				changeSkin(target, charSkin[29])

			elseif WarMenu.Button(charSkin[30]) then

				changeSkin(target, charSkin[30])

			elseif WarMenu.Button(charSkin[31]) then

				changeSkin(target, charSkin[31])

			elseif WarMenu.Button(charSkin[32]) then

				changeSkin(target, charSkin[32])

			elseif WarMenu.Button(charSkin[33]) then

				changeSkin(target, charSkin[33])

			elseif WarMenu.Button(charSkin[34]) then

				changeSkin(target, charSkin[34])

			elseif WarMenu.Button(charSkin[35]) then

				changeSkin(target, charSkin[35])

			elseif WarMenu.Button(charSkin[36]) then

				changeSkin(target, charSkin[36])

			elseif WarMenu.Button(charSkin[37]) then

				changeSkin(target, charSkin[37])

			elseif WarMenu.Button(charSkin[38]) then

				changeSkin(target, charSkin[38])

			elseif WarMenu.Button(charSkin[39]) then

				changeSkin(target, charSkin[39])

			elseif WarMenu.Button(charSkin[40]) then

				changeSkin(target, charSkin[40])

			elseif WarMenu.Button(charSkin[41]) then

				changeSkin(target, charSkin[41])

			elseif WarMenu.Button(charSkin[42]) then

				changeSkin(target, charSkin[42])

			elseif WarMenu.Button(charSkin[43]) then

				changeSkin(target, charSkin[43])

			elseif WarMenu.Button(charSkin[44]) then

				changeSkin(target, charSkin[44])

			elseif WarMenu.Button(charSkin[45]) then

				changeSkin(target, charSkin[45])

			elseif WarMenu.Button(charSkin[46]) then

				changeSkin(target, charSkin[46])

			elseif WarMenu.Button(charSkin[47]) then

				changeSkin(target, charSkin[47])

			elseif WarMenu.Button(charSkin[48]) then

				changeSkin(target, charSkin[48])

			elseif WarMenu.Button(charSkin[49]) then

				changeSkin(target, charSkin[49])

			elseif WarMenu.Button(charSkin[50]) then

				changeSkin(target, charSkin[50])

			elseif WarMenu.Button(charSkin[51]) then

				changeSkin(target, charSkin[51])

			elseif WarMenu.Button(charSkin[52]) then

				changeSkin(target, charSkin[52])

			elseif WarMenu.Button(charSkin[53]) then

				changeSkin(target, charSkin[53])

			elseif WarMenu.Button(charSkin[54]) then

				changeSkin(target, charSkin[54])

			elseif WarMenu.Button(charSkin[55]) then

				changeSkin(target, charSkin[55])

			elseif WarMenu.Button(charSkin[56]) then

				changeSkin(target, charSkin[56])

			elseif WarMenu.Button(charSkin[57]) then

				changeSkin(target, charSkin[57])

			elseif WarMenu.Button(charSkin[58]) then

				changeSkin(target, charSkin[58])

			elseif WarMenu.Button(charSkin[59]) then

				changeSkin(target, charSkin[59])

			elseif WarMenu.Button(charSkin[60]) then

				changeSkin(target, charSkin[60])

			elseif WarMenu.Button(charSkin[61]) then

				changeSkin(target, charSkin[61])

			elseif WarMenu.Button(charSkin[62]) then

				changeSkin(target, charSkin[62])

			elseif WarMenu.Button(charSkin[63]) then

				changeSkin(target, charSkin[63])

			elseif WarMenu.Button(charSkin[64]) then

				changeSkin(target, charSkin[64])

			elseif WarMenu.Button(charSkin[65]) then

				changeSkin(target, charSkin[65])

			elseif WarMenu.Button(charSkin[66]) then

				changeSkin(target, charSkin[66])

			elseif WarMenu.Button(charSkin[67]) then

				changeSkin(target, charSkin[67])

			elseif WarMenu.Button(charSkin[68]) then

				changeSkin(target, charSkin[68])

			elseif WarMenu.Button(charSkin[69]) then

				changeSkin(target, charSkin[69])

			elseif WarMenu.Button(charSkin[70]) then

				changeSkin(target, charSkin[70])

			elseif WarMenu.Button(charSkin[71]) then

				changeSkin(target, charSkin[71])

			elseif WarMenu.Button(charSkin[72]) then

				changeSkin(target, charSkin[72])

			elseif WarMenu.Button(charSkin[73]) then

				changeSkin(target, charSkin[73])

			elseif WarMenu.Button(charSkin[74]) then

				changeSkin(target, charSkin[74])

			elseif WarMenu.Button(charSkin[75]) then

				changeSkin(target, charSkin[75])

			elseif WarMenu.Button(charSkin[76]) then

				changeSkin(target, charSkin[76])

			elseif WarMenu.Button(charSkin[77]) then

				changeSkin(target, charSkin[77])

			elseif WarMenu.Button(charSkin[78]) then

				changeSkin(target, charSkin[78])

			elseif WarMenu.Button(charSkin[79]) then

				changeSkin(target, charSkin[79])

			elseif WarMenu.Button(charSkin[80]) then

				changeSkin(target, charSkin[80])

			elseif WarMenu.Button(charSkin[81]) then

				changeSkin(target, charSkin[81])

			elseif WarMenu.Button(charSkin[82]) then

				changeSkin(target, charSkin[82])

			elseif WarMenu.Button(charSkin[83]) then

				changeSkin(target, charSkin[83])

			elseif WarMenu.Button(charSkin[84]) then

				changeSkin(target, charSkin[84])

			elseif WarMenu.Button(charSkin[85]) then

				changeSkin(target, charSkin[85])

			elseif WarMenu.Button(charSkin[86]) then

				changeSkin(target, charSkin[86])

			elseif WarMenu.Button(charSkin[87]) then

				changeSkin(target, charSkin[87])

			elseif WarMenu.Button(charSkin[88]) then

				changeSkin(target, charSkin[88])

			elseif WarMenu.Button(charSkin[89]) then

				changeSkin(target, charSkin[89])

			elseif WarMenu.Button(charSkin[90]) then

				changeSkin(target, charSkin[90])

			elseif WarMenu.Button(charSkin[91]) then

				changeSkin(target, charSkin[91])

			elseif WarMenu.Button(charSkin[92]) then

				changeSkin(target, charSkin[92])

			elseif WarMenu.Button(charSkin[93]) then

				changeSkin(target, charSkin[93])

			elseif WarMenu.Button(charSkin[94]) then

				changeSkin(target, charSkin[94])

			elseif WarMenu.Button(charSkin[95]) then

				changeSkin(target, charSkin[95])

			elseif WarMenu.Button(charSkin[96]) then

				changeSkin(target, charSkin[96])

			elseif WarMenu.Button(charSkin[97]) then

				changeSkin(target, charSkin[97])

			elseif WarMenu.Button(charSkin[98]) then

				changeSkin(target, charSkin[98])

			elseif WarMenu.Button(charSkin[99]) then

				changeSkin(target, charSkin[99])

			elseif WarMenu.Button(charSkin[100]) then

				changeSkin(target, charSkin[100])

			elseif WarMenu.Button(charSkin[101]) then

				changeSkin(target, charSkin[101])

			elseif WarMenu.Button(charSkin[102]) then

				changeSkin(target, charSkin[102])

			elseif WarMenu.Button(charSkin[103]) then

				changeSkin(target, charSkin[103])

			elseif WarMenu.Button(charSkin[104]) then

				changeSkin(target, charSkin[104])

			elseif WarMenu.Button(charSkin[105]) then

				changeSkin(target, charSkin[105])

			elseif WarMenu.Button(charSkin[106]) then

				changeSkin(target, charSkin[106])

			elseif WarMenu.Button(charSkin[107]) then

				changeSkin(target, charSkin[107])

			elseif WarMenu.Button(charSkin[108]) then

				changeSkin(target, charSkin[108])

			elseif WarMenu.Button(charSkin[109]) then

				changeSkin(target, charSkin[109])

			elseif WarMenu.Button(charSkin[110]) then

				changeSkin(target, charSkin[110])

			elseif WarMenu.Button(charSkin[111]) then

				changeSkin(target, charSkin[111])

			elseif WarMenu.Button(charSkin[112]) then

				changeSkin(target, charSkin[112])

			elseif WarMenu.Button(charSkin[113]) then

				changeSkin(target, charSkin[113])

			elseif WarMenu.Button(charSkin[114]) then

				changeSkin(target, charSkin[114])

			elseif WarMenu.Button(charSkin[115]) then

				changeSkin(target, charSkin[115])

			elseif WarMenu.Button(charSkin[116]) then

				changeSkin(target, charSkin[116])

			elseif WarMenu.Button(charSkin[117]) then

				changeSkin(target, charSkin[117])

			elseif WarMenu.Button(charSkin[118]) then

				changeSkin(target, charSkin[118])

			elseif WarMenu.Button(charSkin[119]) then

				changeSkin(target, charSkin[119])

			elseif WarMenu.Button(charSkin[120]) then

				changeSkin(target, charSkin[120])

			elseif WarMenu.Button(charSkin[121]) then

				changeSkin(target, charSkin[121])

			elseif WarMenu.Button(charSkin[122]) then

				changeSkin(target, charSkin[122])

			elseif WarMenu.Button(charSkin[123]) then

				changeSkin(target, charSkin[123])

			elseif WarMenu.Button(charSkin[124]) then

				changeSkin(target, charSkin[124])

			elseif WarMenu.Button(charSkin[125]) then

				changeSkin(target, charSkin[125])

			elseif WarMenu.Button(charSkin[126]) then

				changeSkin(target, charSkin[126])

			elseif WarMenu.Button(charSkin[127]) then

				changeSkin(target, charSkin[127])

			elseif WarMenu.Button(charSkin[128]) then

				changeSkin(target, charSkin[128])

			elseif WarMenu.Button(charSkin[129]) then

				changeSkin(target, charSkin[129])

			elseif WarMenu.Button(charSkin[130]) then

				changeSkin(target, charSkin[130])

			elseif WarMenu.Button(charSkin[131]) then

				changeSkin(target, charSkin[131])

			elseif WarMenu.Button(charSkin[132]) then

				changeSkin(target, charSkin[132])

			elseif WarMenu.Button(charSkin[133]) then

				changeSkin(target, charSkin[133])

			elseif WarMenu.Button(charSkin[134]) then

				changeSkin(target, charSkin[134])

			elseif WarMenu.Button(charSkin[135]) then

				changeSkin(target, charSkin[135])

			elseif WarMenu.Button(charSkin[136]) then

				changeSkin(target, charSkin[136])

			elseif WarMenu.Button(charSkin[137]) then

				changeSkin(target, charSkin[137])

			elseif WarMenu.Button(charSkin[138]) then

				changeSkin(target, charSkin[138])

			elseif WarMenu.Button(charSkin[139]) then

				changeSkin(target, charSkin[139])

			elseif WarMenu.Button(charSkin[140]) then

				changeSkin(target, charSkin[140])

			elseif WarMenu.Button(charSkin[141]) then

				changeSkin(target, charSkin[141])

			elseif WarMenu.Button(charSkin[142]) then

				changeSkin(target, charSkin[142])

			elseif WarMenu.Button(charSkin[143]) then

				changeSkin(target, charSkin[143])

			elseif WarMenu.Button(charSkin[144]) then

				changeSkin(target, charSkin[144])

			elseif WarMenu.Button(charSkin[145]) then

				changeSkin(target, charSkin[145])

			elseif WarMenu.Button(charSkin[146]) then

				changeSkin(target, charSkin[146])

			elseif WarMenu.Button(charSkin[147]) then

				changeSkin(target, charSkin[147])

			elseif WarMenu.Button(charSkin[148]) then

				changeSkin(target, charSkin[148])

			elseif WarMenu.Button(charSkin[149]) then

				changeSkin(target, charSkin[149])

			elseif WarMenu.Button(charSkin[150]) then

				changeSkin(target, charSkin[150])

			elseif WarMenu.Button(charSkin[151]) then

				changeSkin(target, charSkin[151])

			elseif WarMenu.Button(charSkin[152]) then

				changeSkin(target, charSkin[152])

			elseif WarMenu.Button(charSkin[153]) then

				changeSkin(target, charSkin[153])

			elseif WarMenu.Button(charSkin[154]) then

				changeSkin(target, charSkin[154])

			elseif WarMenu.Button(charSkin[155]) then

				changeSkin(target, charSkin[155])

			elseif WarMenu.Button(charSkin[156]) then

				changeSkin(target, charSkin[156])

			elseif WarMenu.Button(charSkin[157]) then

				changeSkin(target, charSkin[157])

			elseif WarMenu.Button(charSkin[158]) then

				changeSkin(target, charSkin[158])

			elseif WarMenu.Button(charSkin[159]) then

				changeSkin(target, charSkin[159])

			elseif WarMenu.Button(charSkin[160]) then

				changeSkin(target, charSkin[160])

			elseif WarMenu.Button(charSkin[161]) then

				changeSkin(target, charSkin[161])

			elseif WarMenu.Button(charSkin[162]) then

				changeSkin(target, charSkin[162])

			elseif WarMenu.Button(charSkin[163]) then

				changeSkin(target, charSkin[163])

			elseif WarMenu.Button(charSkin[164]) then

				changeSkin(target, charSkin[164])

			elseif WarMenu.Button(charSkin[165]) then

				changeSkin(target, charSkin[165])

			elseif WarMenu.Button(charSkin[166]) then

				changeSkin(target, charSkin[166])

			elseif WarMenu.Button(charSkin[167]) then

				changeSkin(target, charSkin[167])

			elseif WarMenu.Button(charSkin[168]) then

				changeSkin(target, charSkin[168])

			elseif WarMenu.Button(charSkin[169]) then

				changeSkin(target, charSkin[169])

			elseif WarMenu.Button(charSkin[170]) then

				changeSkin(target, charSkin[170])

			elseif WarMenu.Button(charSkin[171]) then

				changeSkin(target, charSkin[171])

			elseif WarMenu.Button(charSkin[172]) then

				changeSkin(target, charSkin[172])

			elseif WarMenu.Button(charSkin[173]) then

				changeSkin(target, charSkin[173])

			elseif WarMenu.Button(charSkin[174]) then

				changeSkin(target, charSkin[174])

			elseif WarMenu.Button(charSkin[175]) then

				changeSkin(target, charSkin[175])

			elseif WarMenu.Button(charSkin[176]) then

				changeSkin(target, charSkin[176])

			elseif WarMenu.Button(charSkin[177]) then

				changeSkin(target, charSkin[177])

			elseif WarMenu.Button(charSkin[178]) then

				changeSkin(target, charSkin[178])

			elseif WarMenu.Button(charSkin[179]) then

				changeSkin(target, charSkin[179])

			elseif WarMenu.Button(charSkin[180]) then

				changeSkin(target, charSkin[180])

			elseif WarMenu.Button(charSkin[181]) then

				changeSkin(target, charSkin[181])

			elseif WarMenu.Button(charSkin[182]) then

				changeSkin(target, charSkin[182])

			elseif WarMenu.Button(charSkin[183]) then

				changeSkin(target, charSkin[183])

			elseif WarMenu.Button(charSkin[184]) then

				changeSkin(target, charSkin[184])

			elseif WarMenu.Button(charSkin[185]) then

				changeSkin(target, charSkin[185])

			elseif WarMenu.Button(charSkin[186]) then

				changeSkin(target, charSkin[186])

			elseif WarMenu.Button(charSkin[187]) then

				changeSkin(target, charSkin[187])

			elseif WarMenu.Button(charSkin[188]) then

				changeSkin(target, charSkin[188])

			elseif WarMenu.Button(charSkin[189]) then

				changeSkin(target, charSkin[189])

			elseif WarMenu.Button(charSkin[190]) then

				changeSkin(target, charSkin[190])

			elseif WarMenu.Button(charSkin[191]) then

				changeSkin(target, charSkin[191])

			elseif WarMenu.Button(charSkin[192]) then

				changeSkin(target, charSkin[192])

			elseif WarMenu.Button(charSkin[193]) then

				changeSkin(target, charSkin[193])

			elseif WarMenu.Button(charSkin[194]) then

				changeSkin(target, charSkin[194])

			elseif WarMenu.Button(charSkin[195]) then

				changeSkin(target, charSkin[195])

			elseif WarMenu.Button(charSkin[196]) then

				changeSkin(target, charSkin[196])

			elseif WarMenu.Button(charSkin[197]) then

				changeSkin(target, charSkin[197])

			elseif WarMenu.Button(charSkin[198]) then

				changeSkin(target, charSkin[198])

			elseif WarMenu.Button(charSkin[199]) then

				changeSkin(target, charSkin[199])

			elseif WarMenu.Button(charSkin[200]) then

				changeSkin(target, charSkin[200])

			elseif WarMenu.Button(charSkin[201]) then

				changeSkin(target, charSkin[201])

			elseif WarMenu.Button(charSkin[202]) then

				changeSkin(target, charSkin[202])

			elseif WarMenu.Button(charSkin[203]) then

				changeSkin(target, charSkin[203])

			elseif WarMenu.Button(charSkin[204]) then

				changeSkin(target, charSkin[204])

			elseif WarMenu.Button(charSkin[205]) then

				changeSkin(target, charSkin[205])

			elseif WarMenu.Button(charSkin[206]) then

				changeSkin(target, charSkin[206])

			elseif WarMenu.Button(charSkin[207]) then

				changeSkin(target, charSkin[207])

			elseif WarMenu.Button(charSkin[208]) then

				changeSkin(target, charSkin[208])

			elseif WarMenu.Button(charSkin[209]) then

				changeSkin(target, charSkin[209])

			elseif WarMenu.Button(charSkin[210]) then

				changeSkin(target, charSkin[210])

			elseif WarMenu.Button(charSkin[211]) then

				changeSkin(target, charSkin[211])

			elseif WarMenu.Button(charSkin[212]) then

				changeSkin(target, charSkin[212])

			elseif WarMenu.Button(charSkin[213]) then

				changeSkin(target, charSkin[213])

			elseif WarMenu.Button(charSkin[214]) then

				changeSkin(target, charSkin[214])

			elseif WarMenu.Button(charSkin[215]) then

				changeSkin(target, charSkin[215])

			elseif WarMenu.Button(charSkin[216]) then

				changeSkin(target, charSkin[216])

			elseif WarMenu.Button(charSkin[217]) then

				changeSkin(target, charSkin[217])

			elseif WarMenu.Button(charSkin[218]) then

				changeSkin(target, charSkin[218])

			elseif WarMenu.Button(charSkin[219]) then

				changeSkin(target, charSkin[219])

			elseif WarMenu.Button(charSkin[220]) then

				changeSkin(target, charSkin[220])

			elseif WarMenu.Button(charSkin[221]) then

				changeSkin(target, charSkin[221])

			elseif WarMenu.Button(charSkin[222]) then

				changeSkin(target, charSkin[222])
			
			elseif WarMenu.Button(charSkin[223]) then

				changeSkin(target, charSkin[223])
			
			end
			
			WarMenu.Display()
			
		-- TIME MENU
		
		elseif WarMenu.IsMenuOpened("Time") then
				
			if WarMenu.Button(hour[1] .. ":00") then
		
				setTime(hour[1])
				
			elseif WarMenu.Button(hour[2] .. ":00") then
			
				setTime(hour[2])
				
			elseif WarMenu.Button(hour[3] .. ":00") then
			
				setTime(hour[3])
				
			elseif WarMenu.Button(hour[4] .. ":00") then
			
				setTime(hour[4])
				
			elseif WarMenu.Button(hour[5] .. ":00") then
			
				setTime(hour[5])
				
			elseif WarMenu.Button(hour[6] .. ":00") then
			
				setTime(hour[6])
				
			elseif WarMenu.Button(hour[7] .. ":00") then
			
				setTime(hour[7])
				
			elseif WarMenu.Button(hour[8] .. ":00") then
			
				setTime(hour[8])
				
			elseif WarMenu.Button(hour[9] .. ":00") then
			
				setTime(hour[9])
				
			elseif WarMenu.Button(hour[10] .. ":00") then
			
				setTime(hour[10])
				
			elseif WarMenu.Button(hour[11] .. ":00") then
			
				setTime(hour[11])
				
			elseif WarMenu.Button(hour[12] .. ":00") then
			
				setTime(hour[12])
				
			elseif WarMenu.Button(hour[13] .. ":00") then
			
				setTime(hour[13])
				
			elseif WarMenu.Button(hour[14] .. ":00") then
			
				setTime(hour[14])
				
			elseif WarMenu.Button(hour[15] .. ":00") then
			
				setTime(hour[15])
				
			elseif WarMenu.Button(hour[16] .. ":00") then
			
				setTime(hour[16])
				
			elseif WarMenu.Button(hour[17] .. ":00") then
			
				setTime(hour[17])
				
			elseif WarMenu.Button(hour[18] .. ":00") then
			
				setTime(hour[18])
				
			elseif WarMenu.Button(hour[19] .. ":00") then
			
				setTime(hour[19])
				
			elseif WarMenu.Button(hour[20] .. ":00") then
			
				setTime(hour[20])
				
			elseif WarMenu.Button(hour[21] .. ":00") then
			
				setTime(hour[21])
				
			elseif WarMenu.Button(hour[22] .. ":00") then
			
				setTime(hour[22])
				
			elseif WarMenu.Button(hour[23] .. ":00") then
			
				setTime(hour[23])
				
			elseif WarMenu.Button(hour[24] .. ":00") then
			
				setTime(hour[24])
				
			end
			
			WarMenu.Display()

		-- INVINCIBILITY MENU
			
		elseif WarMenu.IsMenuOpened("Invincibility") then
				
			if WarMenu.Button('On') then
		
				setHealth(target, true)
				
			elseif WarMenu.Button("Off") then
			
				setHealth(target, false)
				
			end
			
			WarMenu.Display()
			
		-- WEATHER MENU
			
		elseif WarMenu.IsMenuOpened("Weather") then
				
			if WarMenu.Button(weather[1]) then
				
				local i = math.random(2, #weather)
				
				setWeather(weather[i])
				
			elseif WarMenu.Button(weather[2]) then
			
				setWeather(weather[2])
				
			elseif WarMenu.Button(weather[3]) then
			
				setWeather(weather[3])
				
			elseif WarMenu.Button(weather[4]) then
			
				setWeather(weather[4])
				
			elseif WarMenu.Button(weather[5]) then
			
				setWeather(weather[5])
				
			elseif WarMenu.Button(weather[6]) then
			
				setWeather(weather[6])
				
			elseif WarMenu.Button(weather[7]) then
			
				setWeather(weather[7])
				
			elseif WarMenu.Button(weather[8]) then
			
				setWeather(weather[8])
				
			elseif WarMenu.Button(weather[9]) then
			
				setWeather(weather[9])
				
			elseif WarMenu.Button(weather[10]) then
			
				setWeather(weather[10])
				
			elseif WarMenu.Button(weather[11]) then
			
				setWeather(weather[11])
				
			elseif WarMenu.Button(weather[12]) then
			
				setWeather(weather[12])
				
			elseif WarMenu.Button(weather[13]) then
			
				setWeather(weather[13])
				
			end
			
			WarMenu.Display()
			
			
		-- WEAPONS MENU
			
		elseif WarMenu.IsMenuOpened("Weapons") then
		
			if WarMenu.Button("Full Loadout") then
			
				for i = 1, #pistols do
				
					giveWeapon(target, pistols[i], 100)
					
				end
			
				for i = 1, #smgs do
				
					giveWeapon(target, smgs[i], 100)
					
				end
			
				for i = 1, #rifles do
				
					giveWeapon(target, rifles[i], 100)
					
				end
			
				for i = 1, #machineGuns do
				
					giveWeapon(target, machineGuns[i], 100)
					
				end
			
				for i = 1, #shotguns do
				
					giveWeapon(target, shotguns[i], 100)
					
				end
			
				for i = 1, #snipers do
				
					giveWeapon(target, snipers[i], 100)
					
				end
			
				for i = 1, #launchers do
				
					giveWeapon(target, launchers[i], 100)
					
				end
			
				for i = 1, #thrown do
				
					giveWeapon(target, thrown[i], 100)
					
				end
			
				for i = 1, #melee do
				
					giveWeapon(target, melee[i], 100)
					
				end
			
				for i = 1, #gadgets do
				
					giveWeapon(target, gadgets[i], 100)
					
				end
			
				for i = 1, #op do
				
					giveWeapon(target, op[i], 100)
					
				end
			
			elseif WarMenu.MenuButton("Gadgets", "Gadgets") then
			
			elseif WarMenu.MenuButton("Launchers", "Launchers") then
			
			elseif WarMenu.MenuButton("Machine Guns", "Machine Guns") then
			
			elseif WarMenu.MenuButton("Melee", "Melee") then
			
			elseif WarMenu.MenuButton("OP", "OP") then
			
			elseif WarMenu.MenuButton("Rifles", "Rifles") then
			
			elseif WarMenu.MenuButton("SMGs", "SMGs") then	
			
			elseif WarMenu.MenuButton("Shotguns", "Shotguns") then
			
			elseif WarMenu.MenuButton("Sniper Rifles", "Sniper Rifles") then
			
			elseif WarMenu.MenuButton("Thrown", "Thrown") then
			
			elseif WarMenu.MenuButton("Pistols", "Pistols") then
			
			end
				
			WarMenu.Display()
			
		-- PISTOLS MENU
			
		elseif WarMenu.IsMenuOpened("Pistols") then
		
			if WarMenu.Button(pistols[1]) then
				
				giveWeapon(target, pistols[1], 100)
				
			elseif WarMenu.Button(pistols[2]) then
				
				giveWeapon(target, pistols[2], 100)
				
			elseif WarMenu.Button(pistols[3]) then
				
				giveWeapon(target, pistols[3], 100)
				
			elseif WarMenu.Button(pistols[4]) then
				
				giveWeapon(target, pistols[4], 100)
				
			elseif WarMenu.Button(pistols[5]) then
				
				giveWeapon(target, pistols[5], 100)
				
			elseif WarMenu.Button(pistols[6]) then
				
				giveWeapon(target, pistols[6], 100)
				
			elseif WarMenu.Button(pistols[7]) then
				
				giveWeapon(target, pistols[7], 100)
				
			elseif WarMenu.Button(pistols[8]) then
				
				giveWeapon(target, pistols[8], 100)
				
			elseif WarMenu.Button(pistols[9]) then
				
				giveWeapon(target, pistols[9], 100)
				
			elseif WarMenu.Button(pistols[10]) then
			
				giveWeapon(target, pistols[10], 100)
				
			elseif WarMenu.Button(pistols[11]) then
			
				giveWeapon(target, pistols[11], 100)
				
			end
			
			WarMenu.Display()
			
		-- SMGs MENU
				
		elseif WarMenu.IsMenuOpened("SMGs") then
		
			if WarMenu.Button(smgs[1]) then
				
				giveWeapon(target, smgs[1], 100)
				
			elseif WarMenu.Button(smgs[2]) then
				
				giveWeapon(target, smgs[2], 100)
			
			elseif WarMenu.Button(smgs[3]) then
				
				giveWeapon(target, smgs[3], 100)
			
			elseif WarMenu.Button(smgs[4]) then
				
				giveWeapon(target, smgs[4], 100)
			
			elseif WarMenu.Button(smgs[5]) then
				
				giveWeapon(target, smgs[5], 100)
			
			elseif WarMenu.Button(smgs[6]) then
				
				giveWeapon(target, smgs[6], 100)
			
			end
			
			WarMenu.Display()
			
		-- RIFLES MENU
		
		elseif WarMenu.IsMenuOpened("Rifles") then
		
			if WarMenu.Button(rifles[1]) then
				
				giveWeapon(target, rifles[1], 100)
				
			elseif WarMenu.Button(rifles[2]) then
				
				giveWeapon(target, rifles[2], 100)
			
			elseif WarMenu.Button(rifles[3]) then
				
				giveWeapon(target, rifles[3], 100)
			
			elseif WarMenu.Button(rifles[4]) then
				
				giveWeapon(target, rifles[4], 100)
			
			elseif WarMenu.Button(rifles[5]) then
				
				giveWeapon(target, rifles[5], 100)
			
			elseif WarMenu.Button(rifles[6]) then
				
				giveWeapon(target, rifles[6], 100)
			
			elseif WarMenu.Button(rifles[7]) then
				
				giveWeapon(target, rifles[7], 100)
			
			end
			
			WarMenu.Display()
			
		-- MACHINE GUNS
		
		elseif WarMenu.IsMenuOpened("Machine Guns") then
		
			if WarMenu.Button(machineGuns[1]) then
				
				giveWeapon(target, machineGuns[1], 100)
				
			elseif WarMenu.Button(machineGuns[2]) then
				
				giveWeapon(target, machineGuns[2], 100)
				
			elseif WarMenu.Button(machineGuns[3]) then
			
				giveWeapon(target, machineGuns[3], 100)
			
			end
			
			WarMenu.Display()
			
		-- SHOTGUNS MENU
			
		elseif WarMenu.IsMenuOpened("Shotguns") then
		
			if WarMenu.Button(shotguns[1]) then
				
				giveWeapon(target, shotguns[1], 100)
				
			elseif WarMenu.Button(shotguns[2]) then
				
				giveWeapon(target, shotguns[2], 100)
			
			elseif WarMenu.Button(shotguns[3]) then
				
				giveWeapon(target, shotguns[3], 100)
			
			elseif WarMenu.Button(shotguns[4]) then
				
				giveWeapon(target, shotguns[4], 100)
			
			elseif WarMenu.Button(shotguns[5]) then
				
				giveWeapon(target, shotguns[5], 100)
			
			elseif WarMenu.Button(shotguns[6]) then
				
				giveWeapon(target, shotguns[6], 100)
			
			elseif WarMenu.Button(shotguns[7]) then
				
				giveWeapon(target, shotguns[7], 100)
			
			end
			
			WarMenu.Display()
			
		-- SNIPER MENU

		elseif WarMenu.IsMenuOpened("Sniper Rifles") then
		
			if WarMenu.Button(snipers[1]) then
				
				giveWeapon(target, snipers[1], 100)
				
			elseif WarMenu.Button(snipers[2]) then
				
				giveWeapon(target, snipers[2], 100)
			
			elseif WarMenu.Button(snipers[3]) then
				
				giveWeapon(target, snipers[3], 100)
			
			end
			
			WarMenu.Display()
			
		-- LAUNCHER MENU
		
		elseif WarMenu.IsMenuOpened("Launchers") then
		
			if WarMenu.Button(launchers[1]) then
				
				giveWeapon(target, launchers[1], 100)
				
			elseif WarMenu.Button(launchers[2]) then
				
				giveWeapon(target, launchers[2], 100)
			
			elseif WarMenu.Button(launchers[3]) then
				
				giveWeapon(target, launchers[3], 100)
			
			elseif WarMenu.Button(launchers[4]) then
				
				giveWeapon(target, launchers[4], 100)
			
			elseif WarMenu.Button(launchers[5]) then
				
				giveWeapon(target, launchers[5], 100)
			
			end
			
			WarMenu.Display()
			
		-- MELEE MENU
			
		elseif WarMenu.IsMenuOpened("Melee") then
		
			if WarMenu.Button(melee[1]) then
				
				giveWeapon(target, melee[1], 100)
				
			elseif WarMenu.Button(melee[2]) then
				
				giveWeapon(target, melee[2], 100)
			
			elseif WarMenu.Button(melee[3]) then
				
				giveWeapon(target, melee[3], 100)
			
			elseif WarMenu.Button(melee[4]) then
				
				giveWeapon(target, melee[4], 100)
			
			elseif WarMenu.Button(melee[5]) then
				
				giveWeapon(target, melee[5], 100)
			
			elseif WarMenu.Button(melee[6]) then
				
				giveWeapon(target, melee[6], 100)
			
			elseif WarMenu.Button(melee[7]) then
				
				giveWeapon(target, melee[7], 100)
			
			elseif WarMenu.Button(melee[8]) then
				
				giveWeapon(target, melee[8], 100)
			
			elseif WarMenu.Button(melee[9]) then
				
				giveWeapon(target, melee[9], 100)
			
			elseif WarMenu.Button(melee[10]) then
				
				giveWeapon(target, melee[10], 100)
			
			elseif WarMenu.Button(melee[11]) then
				
				giveWeapon(target, melee[11], 100)
			
			elseif WarMenu.Button(melee[12]) then
				
				giveWeapon(target, melee[12], 100)
			
			elseif WarMenu.Button(melee[13]) then
				
				giveWeapon(target, melee[13], 100)
			
			elseif WarMenu.Button(melee[14]) then
				
				giveWeapon(target, melee[14], 100)
			
			elseif WarMenu.Button(melee[15]) then
				
				giveWeapon(target, melee[15], 100)
			
			end
			
			WarMenu.Display()
			
		-- THROWN MENU
		
		elseif WarMenu.IsMenuOpened("Thrown") then
		
			if WarMenu.Button(thrown[1]) then
				
				giveWeapon(target, thrown[1], 100)
				
			elseif WarMenu.Button(thrown[2]) then
				
				giveWeapon(target, thrown[2], 100)
			
			elseif WarMenu.Button(thrown[3]) then
				
				giveWeapon(target, thrown[3], 100)
			
			elseif WarMenu.Button(thrown[4]) then
				
				giveWeapon(target, thrown[4], 100)
			
			elseif WarMenu.Button(thrown[5]) then
				
				giveWeapon(target, thrown[5], 100)
			
			elseif WarMenu.Button(thrown[6]) then
				
				giveWeapon(target, thrown[6], 100)
			
			elseif WarMenu.Button(thrown[7]) then
				
				giveWeapon(target, thrown[7], 100)
			
			elseif WarMenu.Button(thrown[8]) then
				
				giveWeapon(target, thrown[8], 100)
			
			elseif WarMenu.Button(thrown[9]) then
				
				giveWeapon(target, thrown[9], 100)
			
			elseif WarMenu.Button(thrown[10]) then
				
				giveWeapon(target, thrown[10], 100)
			
			end
			
			WarMenu.Display()
			
		-- GADGETS MENU

		elseif WarMenu.IsMenuOpened("Gadgets") then
		
			if WarMenu.Button(gadgets[1]) then
				
				giveWeapon(target, gadgets[1], 100)
				
			end
			
			WarMenu.Display()
			
		-- OP MENU
			
		elseif WarMenu.IsMenuOpened("OP") then
		
			if WarMenu.Button(op[1]) then
				
				giveWeapon(target, op[1], 1000)
			
			elseif WarMenu.Button(op[2]) then
				
				giveWeapon(target, op[2], 100)
			
			end
			
			WarMenu.Display()
			
		-- WANTED LEVEL MENU
		
		elseif WarMenu.IsMenuOpened("Wanted") then
				
			if WarMenu.Button('Off') then
		
				wantedLevel(target2, 0)
				showNote("Wanted Level: ~g~OFF")
				
			elseif WarMenu.Button("1 Star") then
			
				wantedLevel(target2, 1)
				showNote("Wanted Level: ~r~1")
				
			elseif WarMenu.Button("2 Star") then
			
				wantedLevel(target2, 2)
				showNote("Wanted Level: ~r~2")
				
			elseif WarMenu.Button("3 Star") then
			
				wantedLevel(target2, 3)
				showNote("Wanted Level: ~r~3")
				
			elseif WarMenu.Button("4 Star") then
			
				wantedLevel(target2, 4)
				showNote("Wanted Level: ~r~4")
				
			elseif WarMenu.Button("5 Star") then
			
				wantedLevel(target2, 5)
				showNote("Wanted Level: ~r~5")
				
			end
			
			WarMenu.Display()
			
		-- VEHICLE MENU
		
		elseif WarMenu.IsMenuOpened("Vehicles") then
		
			if WarMenu.Button("Repair Vehicle") then
			
				if IsPedInVehicle(target, GetVehiclePedIsIn(target), true) then
				
					SetVehicleFixed(GetVehiclePedIsIn(target))
				
				else
				
					showNote("You are not in a vehicle")
					
				end
				
			elseif WarMenu.Button("Reroll Cosmetics") then
			
				if IsPedInVehicle(target, GetVehiclePedIsIn(target), true) then
					
					cosReroll(target)
				
				else
				
					showNote("You are not in a vehicle")
					
				end
				
			elseif WarMenu.MenuButton("Gravity", "Gravity") then
		
			elseif WarMenu.MenuButton("Boat", "Boat") then
			
			elseif WarMenu.MenuButton("Commercial", "Commercial") then
			
			elseif WarMenu.MenuButton("Compact", "Compact") then
			
			elseif WarMenu.MenuButton("Coupe", "Coupe") then
			
			elseif WarMenu.MenuButton("Cycle", "Cycle") then
			
			elseif WarMenu.MenuButton("Emergency", "Emergency") then
			
			elseif WarMenu.MenuButton("Helicopter", "Helicopter") then
			
			elseif WarMenu.MenuButton("Industrial", "Industrial") then
			
			elseif WarMenu.MenuButton("Military", "Military") then
			
			elseif WarMenu.MenuButton("Motorcycle", "Motorcycle") then
			
			elseif WarMenu.MenuButton("Muscle", "Muscle") then
			
			elseif WarMenu.MenuButton("Off Road", "Off Road") then
			
			elseif WarMenu.MenuButton("Plane", "Plane") then
			
			elseif WarMenu.MenuButton("Rail", "Rail") then
			
			elseif WarMenu.MenuButton("Sedan", "Sedan") then
			
			elseif WarMenu.MenuButton("Service", "Service") then
			
			elseif WarMenu.MenuButton("SUV", "SUV") then
			
			elseif WarMenu.MenuButton("Super", "Super") then
				
			elseif WarMenu.MenuButton("Sports", "Sports") then
			
			elseif WarMenu.MenuButton("Sports Classic", "Sports Classic") then
			
			elseif WarMenu.MenuButton("Utility", "Utility") then

			elseif WarMenu.MenuButton("Van", "Van") then

			end
			
			WarMenu.Display()
			
		--GRAVITY MENU
		
		elseif WarMenu.IsMenuOpened("Gravity") then
		
			if WarMenu.Button("On") then
			
				SetVehicleGravity(GetVehiclePedIsIn(target), true)
			
			elseif WarMenu.Button("Off", "DON'T DO IT!") then
		
				SetVehicleGravity(GetVehiclePedIsIn(target), false)
				
			end
		
			WarMenu.Display()
		
		-- SUPER MENU
		
		elseif WarMenu.IsMenuOpened("Super") then
			
			if WarMenu.Button(super[1]) then
			
				spawnVeh(target, super[1])
				showNote("Spawning: ~g~" .. super[1])
			
			elseif WarMenu.Button(super[3]) then
			
				spawnVeh(target, super[2])
				showNote("Spawning: ~g~" .. super[2])
			
			elseif WarMenu.Button(super[3]) then
			
				spawnVeh(target, super[3])
				showNote("Spawning: ~g~" .. super[3])
			
			elseif WarMenu.Button(super[4]) then
			
				spawnVeh(target, super[4])
				showNote("Spawning: ~g~" .. super[4])
			
			elseif WarMenu.Button(super[5]) then
			
				spawnVeh(target, super[5])
				showNote("Spawning: ~g~" .. super[5])
			
			elseif WarMenu.Button(super[6]) then
			
				spawnVeh(target, super[6])
				showNote("Spawning: ~g~" .. super[6])
			
			elseif WarMenu.Button(super[7]) then
			
				spawnVeh(target, super[7])
				showNote("Spawning: ~g~" .. super[7])
			
			elseif WarMenu.Button(super[8]) then
			
				spawnVeh(target, super[8])
				showNote("Spawning: ~g~" .. super[8])
						
			elseif WarMenu.Button(super[9]) then
			
				spawnVeh(target, super[9])
				showNote("Spawning: ~g~" .. super[9])
			
			elseif WarMenu.Button(super[10]) then
			
				spawnVeh(target, super[10])
				showNote("Spawning: ~g~" .. super[10])
			
			elseif WarMenu.Button(super[11]) then
			
				spawnVeh(target, super[11])
				showNote("Spawning: ~g~" .. super[11])
			
			elseif WarMenu.Button(super[12]) then
			
				spawnVeh(target, super[12])
				showNote("Spawning: ~g~" .. super[12])
			
			elseif WarMenu.Button(super[13]) then
			
				spawnVeh(target, super[13])
				showNote("Spawning: ~g~" .. super[13])
			
			elseif WarMenu.Button(super[14]) then
			
				spawnVeh(target, super[14])
				showNote("Spawning: ~g~" .. super[14])
			
			elseif WarMenu.Button(super[15]) then
			
				spawnVeh(target, super[15])
				showNote("Spawning: ~g~" .. super[15])
			
			elseif WarMenu.Button(super[16]) then
			
				spawnVeh(target, super[16])
				showNote("Spawning: ~g~" .. super[16])
			
			elseif WarMenu.Button(super[17]) then
			
				spawnVeh(target, super[17])
				showNote("Spawning: ~g~" .. super[17])
			
			elseif WarMenu.Button(super[18]) then
			
				spawnVeh(target, super[18])
				showNote("Spawning: ~g~" .. super[18])
			
			elseif WarMenu.Button(super[19]) then
			
				spawnVeh(target, super[19])
				showNote("Spawning: ~g~" .. super[19])
			
			elseif WarMenu.Button(super[20]) then
			
				spawnVeh(target, super[20])
				showNote("Spawning: ~g~" .. super[20])
			
			elseif WarMenu.Button(super[21]) then
			
				spawnVeh(target, super[21])
				showNote("Spawning: ~g~" .. super[21])
			
			elseif WarMenu.Button(super[22]) then
			
				spawnVeh(target, super[22])
				showNote("Spawning: ~g~" .. super[22])
			
			elseif WarMenu.Button(super[23]) then
			
				spawnVeh(target, super[23])
				showNote("Spawning: ~g~" .. super[23])
			
			elseif WarMenu.Button(super[24]) then
			
				spawnVeh(target, super[24])
				showNote("Spawning: ~g~" .. super[24])
			
			elseif WarMenu.Button(super[25]) then
			
				spawnVeh(target, super[25])
				showNote("Spawning: ~g~" .. super[25])
			
			elseif WarMenu.Button(super[26]) then
			
				spawnVeh(target, super[26])
				showNote("Spawning: ~g~" .. super[26])
			
			elseif WarMenu.Button(super[27]) then
			
				spawnVeh(target, super[27])
				showNote("Spawning: ~g~" .. super[27])
			
			elseif WarMenu.Button(super[28]) then
			
				spawnVeh(target, super[28])
				showNote("Spawning: ~g~" .. super[28])
			
			elseif WarMenu.Button(super[29]) then
			
				spawnVeh(target, super[29])
				showNote("Spawning: ~g~" .. super[29])
			
			elseif WarMenu.Button(super[30]) then
			
				spawnVeh(target, super[30])
				showNote("Spawning: ~g~" .. super[30])
			
			elseif WarMenu.Button(super[31]) then
			
				spawnVeh(target, super[31])
				showNote("Spawning: ~g~" .. super[31])
			
			elseif WarMenu.Button(super[32]) then
			
				spawnVeh(target, super[32])
				showNote("Spawning: ~g~" .. super[32])
			
			elseif WarMenu.Button(super[33]) then
			
				spawnVeh(target, super[33])
				showNote("Spawning: ~g~" .. super[33])
			
			elseif WarMenu.Button(super[34]) then
			
				spawnVeh(target, super[34])
				showNote("Spawning: ~g~" .. super[34])
			
			elseif WarMenu.Button(super[35]) then
			
				spawnVeh(target, super[35])
				showNote("Spawning: ~g~" .. super[35])
			
			end
			
			WarMenu.Display()
		
		--SPORTS MENU
		
		elseif WarMenu.IsMenuOpened("Sports") then
			
			if WarMenu.Button(sports[1]) then
			
				spawnVeh(target, sports[1])
				showNote("Spawning: ~g~" .. sports[1])
			
			elseif WarMenu.Button(sports[2]) then
			
				spawnVeh(target, sports[2])
				showNote("Spawning: ~g~" .. sports[2])
			
			elseif WarMenu.Button(sports[3]) then
			
				spawnVeh(target, sports[3])
				showNote("Spawning: ~g~" .. sports[3])
			
			elseif WarMenu.Button(sports[4]) then
			
				spawnVeh(target, sports[4])
				showNote("Spawning: ~g~" .. sports[4])
			
			elseif WarMenu.Button(sports[5]) then
			
				spawnVeh(target, sports[5])
				showNote("Spawning: ~g~" .. sports[5])
			
			elseif WarMenu.Button(sports[6]) then
			
				spawnVeh(target, sports[6])
				showNote("Spawning: ~g~" .. sports[6])
			
			elseif WarMenu.Button(sports[7]) then
			
				spawnVeh(target, sports[7])
				showNote("Spawning: ~g~" .. sports[7])
			
			elseif WarMenu.Button(sports[8]) then
			
				spawnVeh(target, sports[8])
				showNote("Spawning: ~g~" .. sports[8])
			
			elseif WarMenu.Button(sports[9]) then
			
				spawnVeh(target, sports[9])
				showNote("Spawning: ~g~" .. sports[9])
			
			elseif WarMenu.Button(sports[10]) then
			
				spawnVeh(target, sports[10])
				showNote("Spawning: ~g~" .. sports[10])
			
			elseif WarMenu.Button(sports[11]) then
			
				spawnVeh(target, sports[11])
				showNote("Spawning: ~g~" .. sports[11])
			
			elseif WarMenu.Button(sports[12]) then
			
				spawnVeh(target, sports[12])
				showNote("Spawning: ~g~" .. sports[12])
			
			elseif WarMenu.Button(sports[13]) then
			
				spawnVeh(target, sports[13])
				showNote("Spawning: ~g~" .. sports[13])
			
			elseif WarMenu.Button(sports[14]) then
			
				spawnVeh(target, sports[14])
				showNote("Spawning: ~g~" .. sports[14])
			
			elseif WarMenu.Button(sports[15]) then
			
				spawnVeh(target, sports[15])
				showNote("Spawning: ~g~" .. sports[15])
			
			elseif WarMenu.Button(sports[16]) then
			
				spawnVeh(target, sports[16])
				showNote("Spawning: ~g~" .. sports[16])
			
			elseif WarMenu.Button(sports[17]) then
			
				spawnVeh(target, sports[17])
				showNote("Spawning: ~g~" .. sports[17])
			
			elseif WarMenu.Button(sports[18]) then
			
				spawnVeh(target, sports[18])
				showNote("Spawning: ~g~" .. sports[18])
			
			elseif WarMenu.Button(sports[19]) then
			
				spawnVeh(target, sports[19])
				showNote("Spawning: ~g~" .. sports[19])
			
			elseif WarMenu.Button(sports[20]) then
			
				spawnVeh(target, sports[20])
				showNote("Spawning: ~g~" .. sports[20])
			
			elseif WarMenu.Button(sports[21]) then
			
				spawnVeh(target, sports[21])
				showNote("Spawning: ~g~" .. sports[21])
			
			elseif WarMenu.Button(sports[22]) then
			
				spawnVeh(target, sports[22])
				showNote("Spawning: ~g~" .. sports[22])
			
			elseif WarMenu.Button(sports[23]) then
			
				spawnVeh(target, sports[23])
				showNote("Spawning: ~g~" .. sports[23])
			
			elseif WarMenu.Button(sports[24]) then
			
				spawnVeh(target, sports[24])
				showNote("Spawning: ~g~" .. sports[24])
			
			elseif WarMenu.Button(sports[25]) then
			
				spawnVeh(target, sports[25])
				showNote("Spawning: ~g~" .. sports[25])
			
			elseif WarMenu.Button(sports[26]) then
			
				spawnVeh(target, sports[26])
				showNote("Spawning: ~g~" .. sports[26])
			
			elseif WarMenu.Button(sports[27]) then
			
				spawnVeh(target, sports[27])
				showNote("Spawning: ~g~" .. sports[27])
			
			elseif WarMenu.Button(sports[28]) then
			
				spawnVeh(target, sports[28])
				showNote("Spawning: ~g~" .. sports[28])
			
			elseif WarMenu.Button(sports[29]) then
			
				spawnVeh(target, sports[29])
				showNote("Spawning: ~g~" .. sports[29])
			
			elseif WarMenu.Button(sports[30]) then
			
				spawnVeh(target, sports[30])
				showNote("Spawning: ~g~" .. sports[30])
			
			elseif WarMenu.Button(sports[31]) then
			
				spawnVeh(target, sports[31])
				showNote("Spawning: ~g~" .. sports[31])
			
			elseif WarMenu.Button(sports[32]) then
			
				spawnVeh(target, sports[32])
				showNote("Spawning: ~g~" .. sports[32])
			
			elseif WarMenu.Button(sports[33]) then
			
				spawnVeh(target, sports[33])
				showNote("Spawning: ~g~" .. sports[33])
			
			elseif WarMenu.Button(sports[34]) then
			
				spawnVeh(target, sports[34])
				showNote("Spawning: ~g~" .. sports[34])
			
			elseif WarMenu.Button(sports[35]) then
			
				spawnVeh(target, sports[35])
				showNote("Spawning: ~g~" .. sports[35])
			
			elseif WarMenu.Button(sports[36]) then
			
				spawnVeh(target, sports[36])
				showNote("Spawning: ~g~" .. sports[36])
			
			elseif WarMenu.Button(sports[37]) then
			
				spawnVeh(target, sports[37])
				showNote("Spawning: ~g~" .. sports[37])
			
			elseif WarMenu.Button(sports[38]) then
			
				spawnVeh(target, sports[38])
				showNote("Spawning: ~g~" .. sports[38])
			
			elseif WarMenu.Button(sports[39]) then
			
				spawnVeh(target, sports[39])
				showNote("Spawning: ~g~" .. sports[39])
			
			elseif WarMenu.Button(sports[40]) then
			
				spawnVeh(target, sports[40])
				showNote("Spawning: ~g~" .. sports[40])
			
			elseif WarMenu.Button(sports[41]) then
			
				spawnVeh(target, sports[41])
				showNote("Spawning: ~g~" .. sports[41])
			
			elseif WarMenu.Button(sports[42]) then
			
				spawnVeh(target, sports[42])
				showNote("Spawning: ~g~" .. sports[42])
			
			elseif WarMenu.Button(sports[43]) then
			
				spawnVeh(target, sports[43])
				showNote("Spawning: ~g~" .. sports[43])
			
			elseif WarMenu.Button(sports[44]) then
			
				spawnVeh(target, sports[44])
				showNote("Spawning: ~g~" .. sports[44])
			
			elseif WarMenu.Button(sports[45]) then
			
				spawnVeh(target, sports[45])
				showNote("Spawning: ~g~" .. sports[45])
			
			elseif WarMenu.Button(sports[46]) then
			
				spawnVeh(target, sports[46])
				showNote("Spawning: ~g~" .. sports[46])
			
			elseif WarMenu.Button(sports[47]) then
			
				spawnVeh(target, sports[47])
				showNote("Spawning: ~g~" .. sports[47])
			
			elseif WarMenu.Button(sports[48]) then
			
				spawnVeh(target, sports[48])
				showNote("Spawning: ~g~" .. sports[48])
			
			elseif WarMenu.Button(sports[49]) then
			
				spawnVeh(target, sports[49])
				showNote("Spawning: ~g~" .. sports[49])
			
			end
			
			WarMenu.Display()
		
		--SPORTS CLASSIC MENU
		
		elseif WarMenu.IsMenuOpened("Sports Classic") then
			
			if WarMenu.Button(sportsClassic[1]) then
			
				spawnVeh(target, sportsClassic[1])
				showNote("Spawning: ~g~" .. sportsClassic[1])
			
			elseif WarMenu.Button(sportsClassic[2]) then
			
				spawnVeh(target, sportsClassic[2])
				showNote("Spawning: ~g~" .. sportsClassic[2])
			
			elseif WarMenu.Button(sportsClassic[3]) then
			
				spawnVeh(target, sportsClassic[3])
				showNote("Spawning: ~g~" .. sportsClassic[3])
			
			elseif WarMenu.Button(sportsClassic[4]) then
			
				spawnVeh(target, sportsClassic[4])
				showNote("Spawning: ~g~" .. sportsClassic[4])
			
			elseif WarMenu.Button(sportsClassic[5]) then
			
				spawnVeh(target, sportsClassic[5])
				showNote("Spawning: ~g~" .. sportsClassic[5])
			
			elseif WarMenu.Button(sportsClassic[6]) then
			
				spawnVeh(target, sportsClassic[6])
				showNote("Spawning: ~g~" .. sportsClassic[6])
			
			elseif WarMenu.Button(sportsClassic[7]) then
			
				spawnVeh(target, sportsClassic[7])
				showNote("Spawning: ~g~" .. sportsClassic[7])
			
			elseif WarMenu.Button(sportsClassic[8]) then
			
				spawnVeh(target, sportsClassic[8])
				showNote("Spawning: ~g~" .. sportsClassic[8])
			
			elseif WarMenu.Button(sportsClassic[9]) then
			
				spawnVeh(target, sportsClassic[9])
				showNote("Spawning: ~g~" .. sportsClassic[9])
			
			elseif WarMenu.Button(sportsClassic[10]) then
			
				spawnVeh(target, sportsClassic[10])
				showNote("Spawning: ~g~" .. sportsClassic[10])
			
			elseif WarMenu.Button(sportsClassic[11]) then
			
				spawnVeh(target, sportsClassic[11])
				showNote("Spawning: ~g~" .. sportsClassic[11])
			
			elseif WarMenu.Button(sportsClassic[12]) then
			
				spawnVeh(target, sportsClassic[12])
				showNote("Spawning: ~g~" .. sportsClassic[12])
			
			elseif WarMenu.Button(sportsClassic[13]) then
			
				spawnVeh(target, sportsClassic[13])
				showNote("Spawning: ~g~" .. sportsClassic[13])
			
			elseif WarMenu.Button(sportsClassic[14]) then
			
				spawnVeh(target, sportsClassic[14])
				showNote("Spawning: ~g~" .. sportsClassic[14])
			
			elseif WarMenu.Button(sportsClassic[15]) then
			
				spawnVeh(target, sportsClassic[15])
				showNote("Spawning: ~g~" .. sportsClassic[15])
			
			elseif WarMenu.Button(sportsClassic[16]) then
			
				spawnVeh(target, sportsClassic[16])
				showNote("Spawning: ~g~" .. sportsClassic[16])
			
			elseif WarMenu.Button(sportsClassic[17]) then
			
				spawnVeh(target, sportsClassic[17])
				showNote("Spawning: ~g~" .. sportsClassic[17])
			
			elseif WarMenu.Button(sportsClassic[18]) then
			
				spawnVeh(target, sportsClassic[18])
				showNote("Spawning: ~g~" .. sportsClassic[18])
			
			elseif WarMenu.Button(sportsClassic[19]) then
			
				spawnVeh(target, sportsClassic[19])
				showNote("Spawning: ~g~" .. sportsClassic[19])
			
			elseif WarMenu.Button(sportsClassic[20]) then
			
				spawnVeh(target, sportsClassic[20])
				showNote("Spawning: ~g~" .. sportsClassic[20])
			
			elseif WarMenu.Button(sportsClassic[21]) then
			
				spawnVeh(target, sportsClassic[21])
				showNote("Spawning: ~g~" .. sportsClassic[21])
			
			elseif WarMenu.Button(sportsClassic[22]) then
			
				spawnVeh(target, sportsClassic[22])
				showNote("Spawning: ~g~" .. sportsClassic[22])
			
			elseif WarMenu.Button(sportsClassic[23]) then
			
				spawnVeh(target, sportsClassic[23])
				showNote("Spawning: ~g~" .. sportsClassic[23])
			
			elseif WarMenu.Button(sportsClassic[24]) then
			
				spawnVeh(target, sportsClassic[24])
				showNote("Spawning: ~g~" .. sportsClassic[24])
			
			elseif WarMenu.Button(sportsClassic[25]) then
			
				spawnVeh(target, sportsClassic[25])
				showNote("Spawning: ~g~" .. sportsClassic[25])
			
			elseif WarMenu.Button(sportsClassic[26]) then
			
				spawnVeh(target, sportsClassic[26])
				showNote("Spawning: ~g~" .. sportsClassic[26])
			
			elseif WarMenu.Button(sportsClassic[27]) then
			
				spawnVeh(target, sportsClassic[27])
				showNote("Spawning: ~g~" .. sportsClassic[27])
			
			elseif WarMenu.Button(sportsClassic[28]) then
			
				spawnVeh(target, sportsClassic[28])
				showNote("Spawning: ~g~" .. sportsClassic[28])
			
			elseif WarMenu.Button(sportsClassic[29]) then
			
				spawnVeh(target, sportsClassic[29])
				showNote("Spawning: ~g~" .. sportsClassic[29])
			
			elseif WarMenu.Button(sportsClassic[30]) then
			
				spawnVeh(target, sportsClassic[30])
				showNote("Spawning: ~g~" .. sportsClassic[30])
			
			elseif WarMenu.Button(sportsClassic[31]) then
			
				spawnVeh(target, sportsClassic[31])
				showNote("Spawning: ~g~" .. sportsClassic[31])
			
			elseif WarMenu.Button(sportsClassic[32]) then
			
				spawnVeh(target, sportsClassic[32])
				showNote("Spawning: ~g~" .. sportsClassic[32])
			
			end
			
			WarMenu.Display()
		
		--MOTORCYCLE MENU
		
		elseif WarMenu.IsMenuOpened("Motorcycle") then
			
			if WarMenu.Button(motorcycle[1]) then
			
				spawnVeh(target, motorcycle[1])
				showNote("Spawning: ~g~" .. motorcycle[1])
			
			elseif WarMenu.Button(motorcycle[2]) then
			
				spawnVeh(target, motorcycle[2])
				showNote("Spawning: ~g~" .. motorcycle[2])
			
			elseif WarMenu.Button(motorcycle[3]) then
			
				spawnVeh(target, motorcycle[3])
				showNote("Spawning: ~g~" .. motorcycle[3])
			
			elseif WarMenu.Button(motorcycle[4]) then
			
				spawnVeh(target, motorcycle[4])
				showNote("Spawning: ~g~" .. motorcycle[4])
			
			elseif WarMenu.Button(motorcycle[5]) then
			
				spawnVeh(target, motorcycle[5])
				showNote("Spawning: ~g~" .. motorcycle[5])
			
			elseif WarMenu.Button(motorcycle[6]) then
			
				spawnVeh(target, motorcycle[6])
				showNote("Spawning: ~g~" .. motorcycle[6])
			
			elseif WarMenu.Button(motorcycle[7]) then
			
				spawnVeh(target, motorcycle[7])
				showNote("Spawning: ~g~" .. motorcycle[7])
			
			elseif WarMenu.Button(motorcycle[8]) then
			
				spawnVeh(target, motorcycle[8])
				showNote("Spawning: ~g~" .. motorcycle[8])
			
			elseif WarMenu.Button(motorcycle[9]) then
			
				spawnVeh(target, motorcycle[9])
				showNote("Spawning: ~g~" .. motorcycle[9])
			
			elseif WarMenu.Button(motorcycle[10]) then
			
				spawnVeh(target, motorcycle[10])
				showNote("Spawning: ~g~" .. motorcycle[10])
			
			elseif WarMenu.Button(motorcycle[11]) then
			
				spawnVeh(target, motorcycle[11])
				showNote("Spawning: ~g~" .. motorcycle[11])
			
			elseif WarMenu.Button(motorcycle[12]) then
			
				spawnVeh(target, motorcycle[12])
				showNote("Spawning: ~g~" .. motorcycle[12])
			
			elseif WarMenu.Button(motorcycle[13]) then
			
				spawnVeh(target, motorcycle[13])
				showNote("Spawning: ~g~" .. motorcycle[13])
			
			elseif WarMenu.Button(motorcycle[14]) then
			
				spawnVeh(target, motorcycle[14])
				showNote("Spawning: ~g~" .. motorcycle[14])
			
			elseif WarMenu.Button(motorcycle[15]) then
			
				spawnVeh(target, motorcycle[15])
				showNote("Spawning: ~g~" .. motorcycle[15])
			
			elseif WarMenu.Button(motorcycle[16]) then
			
				spawnVeh(target, motorcycle[16])
				showNote("Spawning: ~g~" .. motorcycle[16])
			
			elseif WarMenu.Button(motorcycle[17]) then
			
				spawnVeh(target, motorcycle[17])
				showNote("Spawning: ~g~" .. motorcycle[17])
			
			elseif WarMenu.Button(motorcycle[18]) then
			
				spawnVeh(target, motorcycle[18])
				showNote("Spawning: ~g~" .. motorcycle[18])
			
			elseif WarMenu.Button(motorcycle[19]) then
			
				spawnVeh(target, motorcycle[19])
				showNote("Spawning: ~g~" .. motorcycle[19])
			
			elseif WarMenu.Button(motorcycle[20]) then
			
				spawnVeh(target, motorcycle[20])
				showNote("Spawning: ~g~" .. motorcycle[20])
			
			elseif WarMenu.Button(motorcycle[21]) then
			
				spawnVeh(target, motorcycle[21])
				showNote("Spawning: ~g~" .. motorcycle[21])
			
			elseif WarMenu.Button(motorcycle[22]) then
			
				spawnVeh(target, motorcycle[22])
				showNote("Spawning: ~g~" .. motorcycle[22])
			
			elseif WarMenu.Button(motorcycle[23]) then
			
				spawnVeh(target, motorcycle[23])
				showNote("Spawning: ~g~" .. motorcycle[23])
			
			elseif WarMenu.Button(motorcycle[24]) then
			
				spawnVeh(target, motorcycle[24])
				showNote("Spawning: ~g~" .. motorcycle[24])
			
			elseif WarMenu.Button(motorcycle[25]) then
			
				spawnVeh(target, motorcycle[25])
				showNote("Spawning: ~g~" .. motorcycle[25])
			
			elseif WarMenu.Button(motorcycle[26]) then
			
				spawnVeh(target, motorcycle[26])
				showNote("Spawning: ~g~" .. motorcycle[26])
			
			elseif WarMenu.Button(motorcycle[27]) then
			
				spawnVeh(target, motorcycle[27])
				showNote("Spawning: ~g~" .. motorcycle[27])
			
			elseif WarMenu.Button(motorcycle[28]) then
			
				spawnVeh(target, motorcycle[28])
				showNote("Spawning: ~g~" .. motorcycle[28])
			
			elseif WarMenu.Button(motorcycle[29]) then
			
				spawnVeh(target, motorcycle[29])
				showNote("Spawning: ~g~" .. motorcycle[29])
			
			elseif WarMenu.Button(motorcycle[30]) then
			
				spawnVeh(target, motorcycle[30])
				showNote("Spawning: ~g~" .. motorcycle[30])
			
			elseif WarMenu.Button(motorcycle[31]) then
			
				spawnVeh(target, motorcycle[31])
				showNote("Spawning: ~g~" .. motorcycle[31])
			
			elseif WarMenu.Button(motorcycle[32]) then
			
				spawnVeh(target, motorcycle[32])
				showNote("Spawning: ~g~" .. motorcycle[32])
			
			elseif WarMenu.Button(motorcycle[33]) then
			
				spawnVeh(target, motorcycle[33])
				showNote("Spawning: ~g~" .. motorcycle[33])
			
			elseif WarMenu.Button(motorcycle[34]) then
			
				spawnVeh(target, motorcycle[34])
				showNote("Spawning: ~g~" .. motorcycle[34])
			
			elseif WarMenu.Button(motorcycle[35]) then
			
				spawnVeh(target, motorcycle[35])
				showNote("Spawning: ~g~" .. motorcycle[35])
			
			elseif WarMenu.Button(motorcycle[36]) then
			
				spawnVeh(target, motorcycle[36])
				showNote("Spawning: ~g~" .. motorcycle[36])
			
			elseif WarMenu.Button(motorcycle[37]) then
			
				spawnVeh(target, motorcycle[37])
				showNote("Spawning: ~g~" .. motorcycle[37])
			
			elseif WarMenu.Button(motorcycle[38]) then
			
				spawnVeh(target, motorcycle[38])
				showNote("Spawning: ~g~" .. motorcycle[38])
			
			elseif WarMenu.Button(motorcycle[39]) then
			
				spawnVeh(target, motorcycle[39])
				showNote("Spawning: ~g~" .. motorcycle[39])
			
			elseif WarMenu.Button(motorcycle[40]) then
			
				spawnVeh(target, motorcycle[40])
				showNote("Spawning: ~g~" .. motorcycle[40])
			
			elseif WarMenu.Button(motorcycle[41]) then
			
				spawnVeh(target, motorcycle[41])
				showNote("Spawning: ~g~" .. motorcycle[41])
			
			elseif WarMenu.Button(motorcycle[42]) then
			
				spawnVeh(target, motorcycle[42])
				showNote("Spawning: ~g~" .. motorcycle[42])
			
			elseif WarMenu.Button(motorcycle[43]) then
			
				spawnVeh(target, motorcycle[43])
				showNote("Spawning: ~g~" .. motorcycle[43])
			
			elseif WarMenu.Button(motorcycle[44]) then
			
				spawnVeh(target, motorcycle[44])
				showNote("Spawning: ~g~" .. motorcycle[44])
			
			elseif WarMenu.Button(motorcycle[45]) then
			
				spawnVeh(target, motorcycle[45])
				showNote("Spawning: ~g~" .. motorcycle[45])
			
			elseif WarMenu.Button(motorcycle[46]) then
			
				spawnVeh(target, motorcycle[46])
				showNote("Spawning: ~g~" .. motorcycle[46])
			
			elseif WarMenu.Button(motorcycle[47]) then
			
				spawnVeh(target, motorcycle[47])
				showNote("Spawning: ~g~" .. motorcycle[47])
			
			end
			
			WarMenu.Display()
		
		--COUPE MENU
		
		elseif WarMenu.IsMenuOpened("Coupe") then
			
			if WarMenu.Button(coupe[1]) then
			
				spawnVeh(target, coupe[1])
				showNote("Spawning: ~g~" .. coupe[1])
			
			elseif WarMenu.Button(coupe[2]) then
			
				spawnVeh(target, coupe[2])
				showNote("Spawning: ~g~" .. coupe[2])
			
			elseif WarMenu.Button(coupe[3]) then
			
				spawnVeh(target, coupe[3])
				showNote("Spawning: ~g~" .. coupe[3])
			
			elseif WarMenu.Button(coupe[4]) then
			
				spawnVeh(target, coupe[4])
				showNote("Spawning: ~g~" .. coupe[4])
			
			elseif WarMenu.Button(coupe[5]) then
			
				spawnVeh(target, coupe[5])
				showNote("Spawning: ~g~" .. coupe[5])
			
			elseif WarMenu.Button(coupe[6]) then
			
				spawnVeh(target, coupe[6])
				showNote("Spawning: ~g~" .. coupe[6])
			
			elseif WarMenu.Button(coupe[7]) then
			
				spawnVeh(target, coupe[7])
				showNote("Spawning: ~g~" .. coupe[7])
			
			elseif WarMenu.Button(coupe[8]) then
			
				spawnVeh(target, coupe[8])
				showNote("Spawning: ~g~" .. coupe[8])
			
			elseif WarMenu.Button(coupe[9]) then
			
				spawnVeh(target, coupe[9])
				showNote("Spawning: ~g~" .. coupe[9])
			
			elseif WarMenu.Button(coupe[10]) then
			
				spawnVeh(target, coupe[10])
				showNote("Spawning: ~g~" .. coupe[10])
			
			elseif WarMenu.Button(coupe[11]) then
			
				spawnVeh(target, coupe[11])
				showNote("Spawning: ~g~" .. coupe[11])
			
			elseif WarMenu.Button(coupe[12]) then
			
				spawnVeh(target, coupe[12])
				showNote("Spawning: ~g~" .. coupe[12])
			
			elseif WarMenu.Button(coupe[13]) then
			
				spawnVeh(target, coupe[13])
				showNote("Spawning: ~g~" .. coupe[13])
			
			elseif WarMenu.Button(coupe[14]) then
			
				spawnVeh(target, coupe[14])
				showNote("Spawning: ~g~" .. coupe[14])
			
			end
			
			WarMenu.Display()
		
		--COMPACT MENU
		
		elseif WarMenu.IsMenuOpened("Compact") then
		
			if WarMenu.Button(compact[1]) then
			
				spawnVeh(target, compact[1])
				showNote("Spawning: ~g~" .. compact[1])
			
			elseif WarMenu.Button(compact[2]) then
			
				spawnVeh(target, compact[2])
				showNote("Spawning: ~g~" .. compact[2])
			
			elseif WarMenu.Button(compact[3]) then
			
				spawnVeh(target, compact[3])
				showNote("Spawning: ~g~" .. compact[3])
			
			elseif WarMenu.Button(compact[4]) then
			
				spawnVeh(target, compact[4])
				showNote("Spawning: ~g~" .. compact[4])
			
			elseif WarMenu.Button(compact[5]) then
			
				spawnVeh(target, compact[5])
				showNote("Spawning: ~g~" .. compact[5])
			
			elseif WarMenu.Button(compact[6]) then
			
				spawnVeh(target, compact[6])
				showNote("Spawning: ~g~" .. compact[6])
			
			elseif WarMenu.Button(compact[7]) then
			
				spawnVeh(target, compact[7])
				showNote("Spawning: ~g~" .. compact[7])
			
			elseif WarMenu.Button(compact[8]) then
			
				spawnVeh(target, compact[8])
				showNote("Spawning: ~g~" .. compact[8])
			
			elseif WarMenu.Button(compact[9]) then
			
				spawnVeh(target, compact[9])
				showNote("Spawning: ~g~" .. compact[9])
			
			elseif WarMenu.Button(compact[10]) then
			
				spawnVeh(target, compact[10])
				showNote("Spawning: ~g~" .. compact[10])
			
			end
			
			WarMenu.Display()
			
		
		--SEDAN MENU
		
		elseif WarMenu.IsMenuOpened("Sedan") then
			
			if WarMenu.Button(sedan[1]) then
			
				spawnVeh(target, sedan[1])
				showNote("Spawning: ~g~" .. sedan[1])
			
			elseif WarMenu.Button(sedan[2]) then
			
				spawnVeh(target, sedan[2])
				showNote("Spawning: ~g~" .. sedan[2])
			
			elseif WarMenu.Button(sedan[3]) then
			
				spawnVeh(target, sedan[3])
				showNote("Spawning: ~g~" .. sedan[3])
			
			elseif WarMenu.Button(sedan[4]) then
			
				spawnVeh(target, sedan[4])
				showNote("Spawning: ~g~" .. sedan[4])
			
			elseif WarMenu.Button(sedan[5]) then
			
				spawnVeh(target, sedan[5])
				showNote("Spawning: ~g~" .. sedan[5])
			
			elseif WarMenu.Button(sedan[6]) then
			
				spawnVeh(target, sedan[6])
				showNote("Spawning: ~g~" .. sedan[6])
			
			elseif WarMenu.Button(sedan[7]) then
			
				spawnVeh(target, sedan[7])
				showNote("Spawning: ~g~" .. sedan[7])
			
			elseif WarMenu.Button(sedan[8]) then
			
				spawnVeh(target, sedan[8])
				showNote("Spawning: ~g~" .. sedan[8])
			
			elseif WarMenu.Button(sedan[9]) then
			
				spawnVeh(target, sedan[9])
				showNote("Spawning: ~g~" .. sedan[9])
			
			elseif WarMenu.Button(sedan[10]) then
			
				spawnVeh(target, sedan[10])
				showNote("Spawning: ~g~" .. sedan[10])
			
			elseif WarMenu.Button(sedan[11]) then
			
				spawnVeh(target, sedan[11])
				showNote("Spawning: ~g~" .. sedan[11])
			
			elseif WarMenu.Button(sedan[12]) then
			
				spawnVeh(target, sedan[12])
				showNote("Spawning: ~g~" .. sedan[12])
			
			elseif WarMenu.Button(sedan[13]) then
			
				spawnVeh(target, sedan[13])
				showNote("Spawning: ~g~" .. sedan[13])
			
			elseif WarMenu.Button(sedan[14]) then
			
				spawnVeh(target, sedan[14])
				showNote("Spawning: ~g~" .. sedan[14])
			
			elseif WarMenu.Button(sedan[15]) then
			
				spawnVeh(target, sedan[15])
				showNote("Spawning: ~g~" .. sedan[15])
			
			elseif WarMenu.Button(sedan[16]) then
			
				spawnVeh(target, sedan[16])
				showNote("Spawning: ~g~" .. sedan[16])
			
			elseif WarMenu.Button(sedan[17]) then
			
				spawnVeh(target, sedan[17])
				showNote("Spawning: ~g~" .. sedan[17])
			
			elseif WarMenu.Button(sedan[18]) then
			
				spawnVeh(target, sedan[18])
				showNote("Spawning: ~g~" .. sedan[18])
			
			elseif WarMenu.Button(sedan[19]) then
			
				spawnVeh(target, sedan[19])
				showNote("Spawning: ~g~" .. sedan[19])
			
			elseif WarMenu.Button(sedan[20]) then
			
				spawnVeh(target, sedan[20])
				showNote("Spawning: ~g~" .. sedan[20])
			
			elseif WarMenu.Button(sedan[21]) then
			
				spawnVeh(target, sedan[21])
				showNote("Spawning: ~g~" .. sedan[21])
			
			elseif WarMenu.Button(sedan[22]) then
			
				spawnVeh(target, sedan[22])
				showNote("Spawning: ~g~" .. sedan[22])
			
			elseif WarMenu.Button(sedan[23]) then
			
				spawnVeh(target, sedan[23])
				showNote("Spawning: ~g~" .. sedan[23])
			
			elseif WarMenu.Button(sedan[24]) then
			
				spawnVeh(target, sedan[24])
				showNote("Spawning: ~g~" .. sedan[24])
			
			elseif WarMenu.Button(sedan[25]) then
			
				spawnVeh(target, sedan[25])
				showNote("Spawning: ~g~" .. sedan[25])
			
			elseif WarMenu.Button(sedan[26]) then
			
				spawnVeh(target, sedan[26])
				showNote("Spawning: ~g~" .. sedan[26])
			
			elseif WarMenu.Button(sedan[27]) then
			
				spawnVeh(target, sedan[27])
				showNote("Spawning: ~g~" .. sedan[27])
			
			elseif WarMenu.Button(sedan[28]) then
			
				spawnVeh(target, sedan[28])
				showNote("Spawning: ~g~" .. sedan[28])
			
			elseif WarMenu.Button(sedan[29]) then
			
				spawnVeh(target, sedan[29])
				showNote("Spawning: ~g~" .. sedan[29])
			
			elseif WarMenu.Button(sedan[30]) then
			
				spawnVeh(target, sedan[30])
				showNote("Spawning: ~g~" .. sedan[30])
			
			elseif WarMenu.Button(sedan[31]) then
			
				spawnVeh(target, sedan[31])
				showNote("Spawning: ~g~" .. sedan[31])
			
			end
			
			WarMenu.Display()
		
		--CYCLE MENU
		
		elseif WarMenu.IsMenuOpened("Cycle") then
			
			if WarMenu.Button(cycle[1]) then
			
				spawnVeh(target, cycle[1])
				showNote("Spawning: ~g~" .. cycle[1])
			
			elseif WarMenu.Button(cycle[2]) then
			
				spawnVeh(target, cycle[2])
				showNote("Spawning: ~g~" .. cycle[2])
			
			elseif WarMenu.Button(cycle[3]) then
			
				spawnVeh(target, cycle[3])
				showNote("Spawning: ~g~" .. cycle[3])
			
			elseif WarMenu.Button(cycle[4]) then
			
				spawnVeh(target, cycle[4])
				showNote("Spawning: ~g~" .. cycle[4])
			
			elseif WarMenu.Button(cycle[5]) then
			
				spawnVeh(target, cycle[5])
				showNote("Spawning: ~g~" .. cycle[5])
			
			elseif WarMenu.Button(cycle[6]) then
			
				spawnVeh(target, cycle[6])
				showNote("Spawning: ~g~" .. cycle[6])
			
			elseif WarMenu.Button(cycle[6]) then
			
				spawnVeh(target, cycle[6])
				showNote("Spawning: ~g~" .. cycle[6])
			
			end
			
			WarMenu.Display()
		
		--OFFROAD MENU
		
		elseif WarMenu.IsMenuOpened("Off Road") then
			
			if WarMenu.Button(offRoad[1]) then
			
				spawnVeh(target, offRoad[1])
				showNote("Spawning: ~g~" .. offRoad[1])
			
			elseif WarMenu.Button(offRoad[2]) then
			
				spawnVeh(target, offRoad[2])
				showNote("Spawning: ~g~" .. offRoad[2])
			
			elseif WarMenu.Button(offRoad[3]) then
			
				spawnVeh(target, offRoad[3])
				showNote("Spawning: ~g~" .. offRoad[3])
			
			elseif WarMenu.Button(offRoad[4]) then
			
				spawnVeh(target, offRoad[4])
				showNote("Spawning: ~g~" .. offRoad[4])
			
			elseif WarMenu.Button(offRoad[5]) then
			
				spawnVeh(target, offRoad[5])
				showNote("Spawning: ~g~" .. offRoad[5])
			
			elseif WarMenu.Button(offRoad[6]) then
			
				spawnVeh(target, offRoad[6])
				showNote("Spawning: ~g~" .. offRoad[6])
			
			elseif WarMenu.Button(offRoad[7]) then
			
				spawnVeh(target, offRoad[7])
				showNote("Spawning: ~g~" .. offRoad[7])
			
			elseif WarMenu.Button(offRoad[8]) then
			
				spawnVeh(target, offRoad[8])
				showNote("Spawning: ~g~" .. offRoad[8])
			
			elseif WarMenu.Button(offRoad[9]) then
			
				spawnVeh(target, offRoad[9])
				showNote("Spawning: ~g~" .. offRoad[9])
			
			elseif WarMenu.Button(offRoad[10]) then
			
				spawnVeh(target, offRoad[10])
				showNote("Spawning: ~g~" .. offRoad[10])
			
			elseif WarMenu.Button(offRoad[11]) then
			
				spawnVeh(target, offRoad[11])
				showNote("Spawning: ~g~" .. offRoad[11])
			
			elseif WarMenu.Button(offRoad[12]) then
			
				spawnVeh(target, offRoad[12])
				showNote("Spawning: ~g~" .. offRoad[12])
			
			elseif WarMenu.Button(offRoad[13]) then
			
				spawnVeh(target, offRoad[13])
				showNote("Spawning: ~g~" .. offRoad[13])
			
			elseif WarMenu.Button(offRoad[14]) then
			
				spawnVeh(target, offRoad[14])
				showNote("Spawning: ~g~" .. offRoad[14])
			
			elseif WarMenu.Button(offRoad[15]) then
			
				spawnVeh(target, offRoad[15])
				showNote("Spawning: ~g~" .. offRoad[15])
			
			elseif WarMenu.Button(offRoad[16]) then
			
				spawnVeh(target, offRoad[16])
				showNote("Spawning: ~g~" .. offRoad[16])
			
			elseif WarMenu.Button(offRoad[17]) then
			
				spawnVeh(target, offRoad[17])
				showNote("Spawning: ~g~" .. offRoad[17])
			
			elseif WarMenu.Button(offRoad[18]) then
			
				spawnVeh(target, offRoad[18])
				showNote("Spawning: ~g~" .. offRoad[18])
			
			elseif WarMenu.Button(offRoad[19]) then
			
				spawnVeh(target, offRoad[19])
				showNote("Spawning: ~g~" .. offRoad[19])
			
			elseif WarMenu.Button(offRoad[20]) then
			
				spawnVeh(target, offRoad[20])
				showNote("Spawning: ~g~" .. offRoad[20])
			
			elseif WarMenu.Button(offRoad[21]) then
			
				spawnVeh(target, offRoad[21])
				showNote("Spawning: ~g~" .. offRoad[21])
			
			elseif WarMenu.Button(offRoad[22]) then
			
				spawnVeh(target, offRoad[22])
				showNote("Spawning: ~g~" .. offRoad[22])
			
			elseif WarMenu.Button(offRoad[23]) then
			
				spawnVeh(target, offRoad[23])
				showNote("Spawning: ~g~" .. offRoad[23])
			
			elseif WarMenu.Button(offRoad[24]) then
			
				spawnVeh(target, offRoad[24])
				showNote("Spawning: ~g~" .. offRoad[24])
			
			elseif WarMenu.Button(offRoad[25]) then
			
				spawnVeh(target, offRoad[25])
				showNote("Spawning: ~g~" .. offRoad[25])
			
			elseif WarMenu.Button(offRoad[26]) then
			
				spawnVeh(target, offRoad[26])
				showNote("Spawning: ~g~" .. offRoad[26])
			
			elseif WarMenu.Button(offRoad[27]) then
			
				spawnVeh(target, offRoad[27])
				showNote("Spawning: ~g~" .. offRoad[27])
			
			elseif WarMenu.Button(offRoad[28]) then
			
				spawnVeh(target, offRoad[28])
				showNote("Spawning: ~g~" .. offRoad[28])
			
			elseif WarMenu.Button(offRoad[29]) then
			
				spawnVeh(target, offRoad[29])
				showNote("Spawning: ~g~" .. offRoad[29])
			
			elseif WarMenu.Button(offRoad[30]) then
			
				spawnVeh(target, offRoad[30])
				showNote("Spawning: ~g~" .. offRoad[30])
			
			elseif WarMenu.Button(offRoad[31]) then
			
				spawnVeh(target, offRoad[31])
				showNote("Spawning: ~g~" .. offRoad[31])
			
			elseif WarMenu.Button(offRoad[32]) then
			
				spawnVeh(target, offRoad[32])
				showNote("Spawning: ~g~" .. offRoad[32])
			
			elseif WarMenu.Button(offRoad[33]) then
			
				spawnVeh(target, offRoad[33])
				showNote("Spawning: ~g~" .. offRoad[33])
			
			elseif WarMenu.Button(offRoad[34]) then
			
				spawnVeh(target, offRoad[34])
				showNote("Spawning: ~g~" .. offRoad[34])
			
			elseif WarMenu.Button(offRoad[35]) then
			
				spawnVeh(target, offRoad[35])
				showNote("Spawning: ~g~" .. offRoad[35])
			
			end
			
			WarMenu.Display()
		
		--SUV MENU
		
		elseif WarMenu.IsMenuOpened("SUV") then
			
			if WarMenu.Button(suv[1]) then
			
				spawnVeh(target, suv[1])
				showNote("Spawning: ~g~" .. suv[1])
			
			elseif WarMenu.Button(suv[2]) then
			
				spawnVeh(target, suv[2])
				showNote("Spawning: ~g~" .. suv[2])
			
			elseif WarMenu.Button(suv[3]) then
			
				spawnVeh(target, suv[3])
				showNote("Spawning: ~g~" .. suv[3])
			
			elseif WarMenu.Button(suv[4]) then
			
				spawnVeh(target, suv[4])
				showNote("Spawning: ~g~" .. suv[4])
			
			elseif WarMenu.Button(suv[5]) then
			
				spawnVeh(target, suv[5])
				showNote("Spawning: ~g~" .. suv[5])
			
			elseif WarMenu.Button(suv[6]) then
			
				spawnVeh(target, suv[6])
				showNote("Spawning: ~g~" .. suv[6])
			
			elseif WarMenu.Button(suv[7]) then
			
				spawnVeh(target, suv[7])
				showNote("Spawning: ~g~" .. suv[7])
			
			elseif WarMenu.Button(suv[8]) then
			
				spawnVeh(target, suv[8])
				showNote("Spawning: ~g~" .. suv[8])
			
			elseif WarMenu.Button(suv[9]) then
			
				spawnVeh(target, suv[9])
				showNote("Spawning: ~g~" .. suv[9])
			
			elseif WarMenu.Button(suv[10]) then
			
				spawnVeh(target, suv[10])
				showNote("Spawning: ~g~" .. suv[10])
			
			elseif WarMenu.Button(suv[11]) then
			
				spawnVeh(target, suv[11])
				showNote("Spawning: ~g~" .. suv[11])
			
			elseif WarMenu.Button(suv[12]) then
			
				spawnVeh(target, suv[12])
				showNote("Spawning: ~g~" .. suv[12])
			
			elseif WarMenu.Button(suv[13]) then
			
				spawnVeh(target, suv[13])
				showNote("Spawning: ~g~" .. suv[13])
			
			elseif WarMenu.Button(suv[14]) then
			
				spawnVeh(target, suv[14])
				showNote("Spawning: ~g~" .. suv[14])
			
			elseif WarMenu.Button(suv[15]) then
			
				spawnVeh(target, suv[15])
				showNote("Spawning: ~g~" .. suv[15])
			
			elseif WarMenu.Button(suv[16]) then
			
				spawnVeh(target, suv[16])
				showNote("Spawning: ~g~" .. suv[16])
			
			elseif WarMenu.Button(suv[17]) then
			
				spawnVeh(target, suv[17])
				showNote("Spawning: ~g~" .. suv[17])
			
			elseif WarMenu.Button(suv[18]) then
			
				spawnVeh(target, suv[18])
				showNote("Spawning: ~g~" .. suv[18])
			
			elseif WarMenu.Button(suv[19]) then
			
				spawnVeh(target, suv[19])
				showNote("Spawning: ~g~" .. suv[19])
			
			elseif WarMenu.Button(suv[20]) then
			
				spawnVeh(target, suv[20])
				showNote("Spawning: ~g~" .. suv[20])
			
			elseif WarMenu.Button(suv[21]) then
			
				spawnVeh(target, suv[21])
				showNote("Spawning: ~g~" .. suv[21])
			
			elseif WarMenu.Button(suv[22]) then
			
				spawnVeh(target, suv[22])
				showNote("Spawning: ~g~" .. suv[22])
			
			elseif WarMenu.Button(suv[23]) then
			
				spawnVeh(target, suv[23])
				showNote("Spawning: ~g~" .. suv[23])
			
			elseif WarMenu.Button(suv[24]) then
			
				spawnVeh(target, suv[24])
				showNote("Spawning: ~g~" .. suv[24])
			
			elseif WarMenu.Button(suv[25]) then
			
				spawnVeh(target, suv[25])
				showNote("Spawning: ~g~" .. suv[25])
			
			elseif WarMenu.Button(suv[26]) then
			
				spawnVeh(target, suv[26])
				showNote("Spawning: ~g~" .. suv[26])
			
			elseif WarMenu.Button(suv[27]) then
			
				spawnVeh(target, suv[27])
				showNote("Spawning: ~g~" .. suv[27])
			
			elseif WarMenu.Button(suv[28]) then
			
				spawnVeh(target, suv[28])
				showNote("Spawning: ~g~" .. suv[28])
			
			end
			
			WarMenu.Display()
		
		--HELICOPTER MENU
		
		elseif WarMenu.IsMenuOpened("Helicopter") then
			
			if WarMenu.Button(helicopter[1]) then
			
				spawnVeh(target, helicopter[1])
				showNote("Spawning: ~g~" .. helicopter[1])
			
			elseif WarMenu.Button(helicopter[2]) then
			
				spawnVeh(target, helicopter[2])
				showNote("Spawning: ~g~" .. helicopter[2])
			
			elseif WarMenu.Button(helicopter[3]) then
			
				spawnVeh(target, helicopter[3])
				showNote("Spawning: ~g~" .. helicopter[3])
			
			elseif WarMenu.Button(helicopter[4]) then
			
				spawnVeh(target, helicopter[4])
				showNote("Spawning: ~g~" .. helicopter[4])
			
			elseif WarMenu.Button(helicopter[5]) then
			
				spawnVeh(target, helicopter[5])
				showNote("Spawning: ~g~" .. helicopter[5])
			
			elseif WarMenu.Button(helicopter[6]) then
			
				spawnVeh(target, helicopter[6])
				showNote("Spawning: ~g~" .. helicopter[6])
			
			elseif WarMenu.Button(helicopter[7]) then
			
				spawnVeh(target, helicopter[7])
				showNote("Spawning: ~g~" .. helicopter[7])
			
			elseif WarMenu.Button(helicopter[8]) then
			
				spawnVeh(target, helicopter[8])
				showNote("Spawning: ~g~" .. helicopter[8])
			
			elseif WarMenu.Button(helicopter[9]) then
			
				spawnVeh(target, helicopter[9])
				showNote("Spawning: ~g~" .. helicopter[9])
			
			elseif WarMenu.Button(helicopter[10]) then
			
				spawnVeh(target, helicopter[10])
				showNote("Spawning: ~g~" .. helicopter[10])
			
			elseif WarMenu.Button(helicopter[11]) then
			
				spawnVeh(target, helicopter[11])
				showNote("Spawning: ~g~" .. helicopter[11])
			
			elseif WarMenu.Button(helicopter[12]) then
			
				spawnVeh(target, helicopter[12])
				showNote("Spawning: ~g~" .. helicopter[12])
			
			elseif WarMenu.Button(helicopter[13]) then
			
				spawnVeh(target, helicopter[13])
				showNote("Spawning: ~g~" .. helicopter[13])
			
			elseif WarMenu.Button(helicopter[14]) then
			
				spawnVeh(target, helicopter[14])
				showNote("Spawning: ~g~" .. helicopter[14])
			
			elseif WarMenu.Button(helicopter[15]) then
			
				spawnVeh(target, helicopter[15])
				showNote("Spawning: ~g~" .. helicopter[15])
			
			elseif WarMenu.Button(helicopter[16]) then
			
				spawnVeh(target, helicopter[16])
				showNote("Spawning: ~g~" .. helicopter[16])
			
			elseif WarMenu.Button(helicopter[17]) then
			
				spawnVeh(target, helicopter[17])
				showNote("Spawning: ~g~" .. helicopter[17])
			
			elseif WarMenu.Button(helicopter[18]) then
			
				spawnVeh(target, helicopter[18])
				showNote("Spawning: ~g~" .. helicopter[18])
			
			elseif WarMenu.Button(helicopter[19]) then
			
				spawnVeh(target, helicopter[19])
				showNote("Spawning: ~g~" .. helicopter[19])
			
			elseif WarMenu.Button(helicopter[20]) then
			
				spawnVeh(target, helicopter[20])
				showNote("Spawning: ~g~" .. helicopter[20])
			
			elseif WarMenu.Button(helicopter[21]) then
			
				spawnVeh(target, helicopter[21])
				showNote("Spawning: ~g~" .. helicopter[21])
			
			elseif WarMenu.Button(helicopter[22]) then
			
				spawnVeh(target, helicopter[22])
				showNote("Spawning: ~g~" .. helicopter[22])
			
			elseif WarMenu.Button(helicopter[23]) then
			
				spawnVeh(target, helicopter[23])
				showNote("Spawning: ~g~" .. helicopter[23])
			
			end
			
			WarMenu.Display()
		
		--PLANE MENU
		
		elseif WarMenu.IsMenuOpened("Plane") then
			
			if WarMenu.Button(plane[1]) then
			
				spawnVeh(target, plane[1])
				showNote("Spawning: ~g~" .. plane[1])
			
			elseif WarMenu.Button(plane[2]) then
			
				spawnVeh(target, plane[2])
				showNote("Spawning: ~g~" .. plane[2])
			
			elseif WarMenu.Button(plane[3]) then
			
				spawnVeh(target, plane[3])
				showNote("Spawning: ~g~" .. plane[3])
			
			elseif WarMenu.Button(plane[4]) then
			
				spawnVeh(target, plane[4])
				showNote("Spawning: ~g~" .. plane[4])
			
			elseif WarMenu.Button(plane[5]) then
			
				spawnVeh(target, plane[5])
				showNote("Spawning: ~g~" .. plane[5])
			
			elseif WarMenu.Button(plane[6]) then
			
				spawnVeh(target, plane[6])
				showNote("Spawning: ~g~" .. plane[6])
			
			elseif WarMenu.Button(plane[7]) then
			
				spawnVeh(target, plane[7])
				showNote("Spawning: ~g~" .. plane[7])
			
			elseif WarMenu.Button(plane[8]) then
			
				spawnVeh(target, plane[8])
				showNote("Spawning: ~g~" .. plane[8])
			
			elseif WarMenu.Button(plane[9]) then
			
				spawnVeh(target, plane[9])
				showNote("Spawning: ~g~" .. plane[9])
			
			elseif WarMenu.Button(plane[10]) then
			
				spawnVeh(target, plane[10])
				showNote("Spawning: ~g~" .. plane[10])
			
			elseif WarMenu.Button(plane[11]) then
			
				spawnVeh(target, plane[11])
				showNote("Spawning: ~g~" .. plane[11])
			
			elseif WarMenu.Button(plane[12]) then
			
				spawnVeh(target, plane[12])
				showNote("Spawning: ~g~" .. plane[12])
			
			elseif WarMenu.Button(plane[13]) then
			
				spawnVeh(target, plane[13])
				showNote("Spawning: ~g~" .. plane[13])
			
			elseif WarMenu.Button(plane[14]) then
			
				spawnVeh(target, plane[14])
				showNote("Spawning: ~g~" .. plane[14])
			
			elseif WarMenu.Button(plane[15]) then
			
				spawnVeh(target, plane[15])
				showNote("Spawning: ~g~" .. plane[15])
			
			elseif WarMenu.Button(plane[16]) then
			
				spawnVeh(target, plane[16])
				showNote("Spawning: ~g~" .. plane[16])
			
			elseif WarMenu.Button(plane[17]) then
			
				spawnVeh(target, plane[17])
				showNote("Spawning: ~g~" .. plane[17])
			
			elseif WarMenu.Button(plane[18]) then
			
				spawnVeh(target, plane[18])
				showNote("Spawning: ~g~" .. plane[18])
			
			elseif WarMenu.Button(plane[19]) then
			
				spawnVeh(target, plane[19])
				showNote("Spawning: ~g~" .. plane[19])
			
			elseif WarMenu.Button(plane[20]) then
			
				spawnVeh(target, plane[20])
				showNote("Spawning: ~g~" .. plane[20])
			
			elseif WarMenu.Button(plane[21]) then
			
				spawnVeh(target, plane[21])
				showNote("Spawning: ~g~" .. plane[21])
			
			elseif WarMenu.Button(plane[22]) then
			
				spawnVeh(target, plane[22])
				showNote("Spawning: ~g~" .. plane[22])
			
			elseif WarMenu.Button(plane[23]) then
			
				spawnVeh(target, plane[23])
				showNote("Spawning: ~g~" .. plane[23])
			
			elseif WarMenu.Button(plane[24]) then
			
				spawnVeh(target, plane[24])
				showNote("Spawning: ~g~" .. plane[24])
			
			elseif WarMenu.Button(plane[25]) then
			
				spawnVeh(target, plane[25])
				showNote("Spawning: ~g~" .. plane[25])
			
			elseif WarMenu.Button(plane[26]) then
			
				spawnVeh(target, plane[26])
				showNote("Spawning: ~g~" .. plane[26])
			
			elseif WarMenu.Button(plane[27]) then
			
				spawnVeh(target, plane[27])
				showNote("Spawning: ~g~" .. plane[27])
			
			elseif WarMenu.Button(plane[28]) then
			
				spawnVeh(target, plane[28])
				showNote("Spawning: ~g~" .. plane[28])
			
			elseif WarMenu.Button(plane[29]) then
			
				spawnVeh(target, plane[29])
				showNote("Spawning: ~g~" .. plane[29])
			
			elseif WarMenu.Button(plane[30]) then
			
				spawnVeh(target, plane[30])
				showNote("Spawning: ~g~" .. plane[30])
			
			elseif WarMenu.Button(plane[31]) then
			
				spawnVeh(target, plane[31])
				showNote("Spawning: ~g~" .. plane[31])
			
			elseif WarMenu.Button(plane[32]) then
			
				spawnVeh(target, plane[32])
				showNote("Spawning: ~g~" .. plane[32])
			
			elseif WarMenu.Button(plane[33]) then
			
				spawnVeh(target, plane[33])
				showNote("Spawning: ~g~" .. plane[33])
			
			elseif WarMenu.Button(plane[34]) then
			
				spawnVeh(target, plane[34])
				showNote("Spawning: ~g~" .. plane[34])
			
			elseif WarMenu.Button(plane[35]) then
			
				spawnVeh(target, plane[35])
				showNote("Spawning: ~g~" .. plane[35])
			
			elseif WarMenu.Button(plane[36]) then
			
				spawnVeh(target, plane[36])
				showNote("Spawning: ~g~" .. plane[36])
			
			elseif WarMenu.Button(plane[37]) then
			
				spawnVeh(target, plane[37])
				showNote("Spawning: ~g~" .. plane[37])
			
			end
			
			WarMenu.Display()
		
		--EMERGENCY MENU
		
		elseif WarMenu.IsMenuOpened("Emergency") then
			
			if WarMenu.Button(emergency[1]) then
			
				spawnVeh(target, emergency[1])
				showNote("Spawning: ~g~" .. emergency[1])
			
			elseif WarMenu.Button(emergency[2]) then
			
				spawnVeh(target, emergency[2])
				showNote("Spawning: ~g~" .. emergency[2])
			
			elseif WarMenu.Button(emergency[3]) then
			
				spawnVeh(target, emergency[3])
				showNote("Spawning: ~g~" .. emergency[3])
			
			elseif WarMenu.Button(emergency[4]) then
			
				spawnVeh(target, emergency[4])
				showNote("Spawning: ~g~" .. emergency[4])
			
			elseif WarMenu.Button(emergency[5]) then
			
				spawnVeh(target, emergency[5])
				showNote("Spawning: ~g~" .. emergency[5])
			
			elseif WarMenu.Button(emergency[6]) then
			
				spawnVeh(target, emergency[6])
				showNote("Spawning: ~g~" .. emergency[6])
			
			elseif WarMenu.Button(emergency[7]) then
			
				spawnVeh(target, emergency[7])
				showNote("Spawning: ~g~" .. emergency[7])
			
			elseif WarMenu.Button(emergency[8]) then
			
				spawnVeh(target, emergency[8])
				showNote("Spawning: ~g~" .. emergency[8])
			
			elseif WarMenu.Button(emergency[9]) then
			
				spawnVeh(target, emergency[9])
				showNote("Spawning: ~g~" .. emergency[9])
			
			elseif WarMenu.Button(emergency[10]) then
			
				spawnVeh(target, emergency[10])
				showNote("Spawning: ~g~" .. emergency[10])
			
			elseif WarMenu.Button(emergency[11]) then
			
				spawnVeh(target, emergency[11])
				showNote("Spawning: ~g~" .. emergency[11])
			
			elseif WarMenu.Button(emergency[12]) then
			
				spawnVeh(target, emergency[12])
				showNote("Spawning: ~g~" .. emergency[12])
			
			elseif WarMenu.Button(emergency[13]) then
			
				spawnVeh(target, emergency[13])
				showNote("Spawning: ~g~" .. emergency[13])
			
			elseif WarMenu.Button(emergency[14]) then
			
				spawnVeh(target, emergency[14])
				showNote("Spawning: ~g~" .. emergency[14])
			
			elseif WarMenu.Button(emergency[15]) then
			
				spawnVeh(target, emergency[15])
				showNote("Spawning: ~g~" .. emergency[15])
			
			elseif WarMenu.Button(emergency[16]) then
			
				spawnVeh(target, emergency[16])
				showNote("Spawning: ~g~" .. emergency[16])
			
			elseif WarMenu.Button(emergency[17]) then
			
				spawnVeh(target, emergency[17])
				showNote("Spawning: ~g~" .. emergency[17])
			
			elseif WarMenu.Button(emergency[18]) then
			
				spawnVeh(target, emergency[18])
				showNote("Spawning: ~g~" .. emergency[18])
			
			end
			
			WarMenu.Display()
		
		--SERVICE MENU
		
		elseif WarMenu.IsMenuOpened("Service") then
			
			if WarMenu.Button(service[1]) then
			
				spawnVeh(target, service[1])
				showNote("Spawning: ~g~" .. service[1])
			
			elseif WarMenu.Button(service[2]) then
			
				spawnVeh(target, service[2])
				showNote("Spawning: ~g~" .. service[2])
			
			elseif WarMenu.Button(service[3]) then
			
				spawnVeh(target, service[3])
				showNote("Spawning: ~g~" .. service[3])
			
			elseif WarMenu.Button(service[4]) then
			
				spawnVeh(target, service[4])
				showNote("Spawning: ~g~" .. service[4])
			
			elseif WarMenu.Button(service[5]) then
			
				spawnVeh(target, service[5])
				showNote("Spawning: ~g~" .. service[5])
			
			elseif WarMenu.Button(service[6]) then
			
				spawnVeh(target, service[6])
				showNote("Spawning: ~g~" .. service[6])
			
			elseif WarMenu.Button(service[7]) then
			
				spawnVeh(target, service[7])
				showNote("Spawning: ~g~" .. service[7])
			
			elseif WarMenu.Button(service[8]) then
			
				spawnVeh(target, service[8])
				showNote("Spawning: ~g~" .. service[8])
			
			elseif WarMenu.Button(service[9]) then
			
				spawnVeh(target, service[9])
				showNote("Spawning: ~g~" .. service[9])
			
			elseif WarMenu.Button(service[10]) then
			
				spawnVeh(target, service[10])
				showNote("Spawning: ~g~" .. service[10])
			
			end
			
			WarMenu.Display()
		
		--MILITARY MENU
		
		elseif WarMenu.IsMenuOpened("Military") then
			
			if WarMenu.Button(military[1]) then
			
				spawnVeh(target, military[1])
				showNote("Spawning: ~g~" .. military[1])
			
			elseif WarMenu.Button(military[2]) then
			
				spawnVeh(target, military[2])
				showNote("Spawning: ~g~" .. military[2])
			
			elseif WarMenu.Button(military[3]) then
			
				spawnVeh(target, military[3])
				showNote("Spawning: ~g~" .. military[3])
			
			elseif WarMenu.Button(military[4]) then
			
				spawnVeh(target, military[4])
				showNote("Spawning: ~g~" .. military[4])
			
			elseif WarMenu.Button(military[5]) then
			
				spawnVeh(target, military[5])
				showNote("Spawning: ~g~" .. military[5])
			
			elseif WarMenu.Button(military[6]) then
			
				spawnVeh(target, military[6])
				showNote("Spawning: ~g~" .. military[6])
			
			elseif WarMenu.Button(military[7]) then
			
				spawnVeh(target, military[7])
				showNote("Spawning: ~g~" .. military[7])
			
			elseif WarMenu.Button(military[8]) then
			
				spawnVeh(target, military[8])
				showNote("Spawning: ~g~" .. military[8])
			
			elseif WarMenu.Button(military[9]) then
			
				spawnVeh(target, military[9])
				showNote("Spawning: ~g~" .. military[9])
			
			elseif WarMenu.Button(military[10]) then
			
				spawnVeh(target, military[10])
				showNote("Spawning: ~g~" .. military[10])
			
			end
			
			WarMenu.Display()
		
		--COMMERCIAL MENU
		
		elseif WarMenu.IsMenuOpened("Commercial") then
			
			if WarMenu.Button(commercial[1]) then
			
				spawnVeh(target, commercial[1])
				showNote("Spawning: ~g~" .. commercial[1])
			
			elseif WarMenu.Button(commercial[2]) then
			
				spawnVeh(target, commercial[2])
				showNote("Spawning: ~g~" .. commercial[2])
			
			elseif WarMenu.Button(commercial[3]) then
			
				spawnVeh(target, commercial[3])
				showNote("Spawning: ~g~" .. commercial[3])
			
			elseif WarMenu.Button(commercial[4]) then
			
				spawnVeh(target, commercial[4])
				showNote("Spawning: ~g~" .. commercial[4])
			
			elseif WarMenu.Button(commercial[5]) then
			
				spawnVeh(target, commercial[5])
				showNote("Spawning: ~g~" .. commercial[5])
			
			elseif WarMenu.Button(commercial[6]) then
			
				spawnVeh(target, commercial[6])
				showNote("Spawning: ~g~" .. commercial[6])
			
			elseif WarMenu.Button(commercial[7]) then
			
				spawnVeh(target, commercial[7])
				showNote("Spawning: ~g~" .. commercial[7])
			
			elseif WarMenu.Button(commercial[8]) then
			
				spawnVeh(target, commercial[8])
				showNote("Spawning: ~g~" .. commercial[8])
			
			elseif WarMenu.Button(commercial[9]) then
			
				spawnVeh(target, commercial[9])
				showNote("Spawning: ~g~" .. commercial[9])
			
			elseif WarMenu.Button(commercial[10]) then
			
				spawnVeh(target, commercial[10])
				showNote("Spawning: ~g~" .. commercial[10])
			
			elseif WarMenu.Button(commercial[11]) then
			
				spawnVeh(target, commercial[11])
				showNote("Spawning: ~g~" .. commercial[11])
			
			elseif WarMenu.Button(commercial[12]) then
			
				spawnVeh(target, commercial[12])
				showNote("Spawning: ~g~" .. commercial[12])
			
			end
			
			WarMenu.Display()
		
		--VAN MENU
		
		elseif WarMenu.IsMenuOpened("Van") then
			
			if WarMenu.Button(van[1]) then
			
				spawnVeh(target, van[1])
				showNote("Spawning: ~g~" .. van[1])
			
			elseif WarMenu.Button(van[2]) then
			
				spawnVeh(target, van[2])
				showNote("Spawning: ~g~" .. van[2])
			
			elseif WarMenu.Button(van[3]) then
			
				spawnVeh(target, van[3])
				showNote("Spawning: ~g~" .. van[3])
			
			elseif WarMenu.Button(van[4]) then
			
				spawnVeh(target, van[4])
				showNote("Spawning: ~g~" .. van[4])
			
			elseif WarMenu.Button(van[5]) then
			
				spawnVeh(target, van[5])
				showNote("Spawning: ~g~" .. van[5])
			
			elseif WarMenu.Button(van[6]) then
			
				spawnVeh(target, van[6])
				showNote("Spawning: ~g~" .. van[6])
			
			elseif WarMenu.Button(van[7]) then
			
				spawnVeh(target, van[7])
				showNote("Spawning: ~g~" .. van[7])
			
			elseif WarMenu.Button(van[8]) then
			
				spawnVeh(target, van[8])
				showNote("Spawning: ~g~" .. van[8])
			
			elseif WarMenu.Button(van[9]) then
			
				spawnVeh(target, van[9])
				showNote("Spawning: ~g~" .. van[9])
			
			elseif WarMenu.Button(van[10]) then
			
				spawnVeh(target, van[10])
				showNote("Spawning: ~g~" .. van[10])
			
			elseif WarMenu.Button(van[11]) then
			
				spawnVeh(target, van[11])
				showNote("Spawning: ~g~" .. van[11])
			
			elseif WarMenu.Button(van[12]) then
			
				spawnVeh(target, van[12])
				showNote("Spawning: ~g~" .. van[12])
			
			elseif WarMenu.Button(van[13]) then
			
				spawnVeh(target, van[13])
				showNote("Spawning: ~g~" .. van[13])
			
			elseif WarMenu.Button(van[14]) then
			
				spawnVeh(target, van[14])
				showNote("Spawning: ~g~" .. van[14])
			
			elseif WarMenu.Button(van[15]) then
			
				spawnVeh(target, van[15])
				showNote("Spawning: ~g~" .. van[15])
			
			elseif WarMenu.Button(van[16]) then
			
				spawnVeh(target, van[16])
				showNote("Spawning: ~g~" .. van[16])
			
			elseif WarMenu.Button(van[17]) then
			
				spawnVeh(target, van[17])
				showNote("Spawning: ~g~" .. van[17])
			
			elseif WarMenu.Button(van[18]) then
			
				spawnVeh(target, van[18])
				showNote("Spawning: ~g~" .. van[18])
			
			elseif WarMenu.Button(van[19]) then
			
				spawnVeh(target, van[19])
				showNote("Spawning: ~g~" .. van[19])
			
			elseif WarMenu.Button(van[20]) then
			
				spawnVeh(target, van[20])
				showNote("Spawning: ~g~" .. van[20])
			
			elseif WarMenu.Button(van[21]) then
			
				spawnVeh(target, van[21])
				showNote("Spawning: ~g~" .. van[21])
			
			elseif WarMenu.Button(van[22]) then
			
				spawnVeh(target, van[22])
				showNote("Spawning: ~g~" .. van[22])
			
			elseif WarMenu.Button(van[23]) then
			
				spawnVeh(target, van[23])
				showNote("Spawning: ~g~" .. van[23])
			
			elseif WarMenu.Button(van[24]) then
			
				spawnVeh(target, van[24])
				showNote("Spawning: ~g~" .. van[24])
			
			elseif WarMenu.Button(van[25]) then
			
				spawnVeh(target, van[25])
				showNote("Spawning: ~g~" .. van[25])
			
			elseif WarMenu.Button(van[26]) then
			
				spawnVeh(target, van[26])
				showNote("Spawning: ~g~" .. van[26])
			
			elseif WarMenu.Button(van[27]) then
			
				spawnVeh(target, van[27])
				showNote("Spawning: ~g~" .. van[27])
			
			elseif WarMenu.Button(van[28]) then
			
				spawnVeh(target, van[28])
				showNote("Spawning: ~g~" .. van[28])
			
			elseif WarMenu.Button(van[29]) then
			
				spawnVeh(target, van[29])
				showNote("Spawning: ~g~" .. van[29])
			
			elseif WarMenu.Button(van[30]) then
			
				spawnVeh(target, van[30])
				showNote("Spawning: ~g~" .. van[30])
			
			elseif WarMenu.Button(van[31]) then
			
				spawnVeh(target, van[31])
				showNote("Spawning: ~g~" .. van[31])
			
			elseif WarMenu.Button(van[32]) then
			
				spawnVeh(target, van[32])
				showNote("Spawning: ~g~" .. van[32])
			
			end
			
			WarMenu.Display()
		
		--INDUSTRIAL MENU
		
		elseif WarMenu.IsMenuOpened("Industrial") then
			
			if WarMenu.Button(industrial[1]) then
			
				spawnVeh(target, industrial[1])
				showNote("Spawning: ~g~" .. industrial[1])
			
			elseif WarMenu.Button(industrial[2]) then
			
				spawnVeh(target, industrial[2])
				showNote("Spawning: ~g~" .. industrial[2])
			
			elseif WarMenu.Button(industrial[3]) then
			
				spawnVeh(target, industrial[3])
				showNote("Spawning: ~g~" .. industrial[3])
			
			elseif WarMenu.Button(industrial[4]) then
			
				spawnVeh(target, industrial[4])
				showNote("Spawning: ~g~" .. industrial[4])
			
			elseif WarMenu.Button(industrial[5]) then
			
				spawnVeh(target, industrial[5])
				showNote("Spawning: ~g~" .. industrial[5])
			
			elseif WarMenu.Button(industrial[6]) then
			
				spawnVeh(target, industrial[6])
				showNote("Spawning: ~g~" .. industrial[6])
			
			elseif WarMenu.Button(industrial[7]) then
			
				spawnVeh(target, industrial[7])
				showNote("Spawning: ~g~" .. industrial[7])
			
			elseif WarMenu.Button(industrial[8]) then
			
				spawnVeh(target, industrial[8])
				showNote("Spawning: ~g~" .. industrial[8])
			
			elseif WarMenu.Button(industrial[9]) then
			
				spawnVeh(target, industrial[9])
				showNote("Spawning: ~g~" .. industrial[9])
			
			elseif WarMenu.Button(industrial[10]) then
			
				spawnVeh(target, industrial[10])
				showNote("Spawning: ~g~" .. industrial[10])
			
			elseif WarMenu.Button(industrial[11]) then
			
				spawnVeh(target, industrial[11])
				showNote("Spawning: ~g~" .. industrial[11])
			
			end
			
			WarMenu.Display()
		
		--BOAT MENU
		
		elseif WarMenu.IsMenuOpened("Boat") then
			
			if WarMenu.Button(boat[1]) then
			
				spawnVeh(target, boat[1])
				showNote("Spawning: ~g~" .. boat[1])
			
			elseif WarMenu.Button(boat[2]) then
			
				spawnVeh(target, boat[2])
				showNote("Spawning: ~g~" .. boat[2])
			
			elseif WarMenu.Button(boat[3]) then
			
				spawnVeh(target, boat[3])
				showNote("Spawning: ~g~" .. boat[3])
			
			elseif WarMenu.Button(boat[4]) then
			
				spawnVeh(target, boat[4])
				showNote("Spawning: ~g~" .. boat[4])
			
			elseif WarMenu.Button(boat[5]) then
			
				spawnVeh(target, boat[5])
				showNote("Spawning: ~g~" .. boat[5])
			
			elseif WarMenu.Button(boat[6]) then
			
				spawnVeh(target, boat[6])
				showNote("Spawning: ~g~" .. boat[6])
			
			elseif WarMenu.Button(boat[7]) then
			
				spawnVeh(target, boat[7])
				showNote("Spawning: ~g~" .. boat[7])
			
			elseif WarMenu.Button(boat[8]) then
			
				spawnVeh(target, boat[8])
				showNote("Spawning: ~g~" .. boat[8])
			
			elseif WarMenu.Button(boat[9]) then
			
				spawnVeh(target, boat[9])
				showNote("Spawning: ~g~" .. boat[9])
			
			elseif WarMenu.Button(boat[10]) then
			
				spawnVeh(target, boat[10])
				showNote("Spawning: ~g~" .. boat[10])
			
			elseif WarMenu.Button(boat[11]) then
			
				spawnVeh(target, boat[11])
				showNote("Spawning: ~g~" .. boat[11])
			
			elseif WarMenu.Button(boat[12]) then
			
				spawnVeh(target, boat[12])
				showNote("Spawning: ~g~" .. boat[12])
			
			elseif WarMenu.Button(boat[13]) then
			
				spawnVeh(target, boat[13])
				showNote("Spawning: ~g~" .. boat[13])
			
			elseif WarMenu.Button(boat[14]) then
			
				spawnVeh(target, boat[14])
				showNote("Spawning: ~g~" .. boat[14])
			
			elseif WarMenu.Button(boat[15]) then
			
				spawnVeh(target, boat[15])
				showNote("Spawning: ~g~" .. boat[15])
			
			elseif WarMenu.Button(boat[16]) then
			
				spawnVeh(target, boat[16])
				showNote("Spawning: ~g~" .. boat[16])
			
			elseif WarMenu.Button(boat[17]) then
			
				spawnVeh(target, boat[17])
				showNote("Spawning: ~g~" .. boat[17])
			
			elseif WarMenu.Button(boat[18]) then
			
				spawnVeh(target, boat[18])
				showNote("Spawning: ~g~" .. boat[18])
			
			elseif WarMenu.Button(boat[19]) then
			
				spawnVeh(target, boat[19])
				showNote("Spawning: ~g~" .. boat[19])
			
			elseif WarMenu.Button(boat[20]) then
			
				spawnVeh(target, boat[20])
				showNote("Spawning: ~g~" .. boat[20])
			
			end
			
			WarMenu.Display()
		
		--RAIL MENU
		
		elseif WarMenu.IsMenuOpened("Rail") then
			
			if WarMenu.Button(rail[1]) then
			
				spawnVeh(target, rail[1])
				showNote("Spawning: ~g~" .. rail[1])
			
			elseif WarMenu.Button(rail[2]) then
			
				spawnVeh(target, rail[2])
				showNote("Spawning: ~g~" .. rail[2])
			
			elseif WarMenu.Button(rail[3]) then
			
				spawnVeh(target, rail[3])
				showNote("Spawning: ~g~" .. rail[3])
			
			elseif WarMenu.Button(rail[4]) then
			
				spawnVeh(target, rail[4])
				showNote("Spawning: ~g~" .. rail[4])
			
			elseif WarMenu.Button(rail[5]) then
			
				spawnVeh(target, rail[5])
				showNote("Spawning: ~g~" .. rail[5])
			
			elseif WarMenu.Button(rail[6]) then
			
				spawnVeh(target, rail[6])
				showNote("Spawning: ~g~" .. rail[6])
			
			elseif WarMenu.Button(rail[7]) then
			
				spawnVeh(target, rail[7])
				showNote("Spawning: ~g~" .. rail[7])
			
			elseif WarMenu.Button(rail[8]) then
			
				spawnVeh(target, rail[8])
				showNote("Spawning: ~g~" .. rail[8])
			
			end
			
			WarMenu.Display()
		
		--UTILITY MENU
		
		elseif WarMenu.IsMenuOpened("Utility") then
			
			if WarMenu.Button(utility[1]) then
			
				spawnVeh(target, utility[1])
				showNote("Spawning: ~g~" .. utility[1])
			
			elseif WarMenu.Button(utility[2]) then
			
				spawnVeh(target, utility[2])
				showNote("Spawning: ~g~" .. utility[2])
			
			elseif WarMenu.Button(utility[3]) then
			
				spawnVeh(target, utility[3])
				showNote("Spawning: ~g~" .. utility[3])
			
			elseif WarMenu.Button(utility[4]) then
			
				spawnVeh(target, utility[4])
				showNote("Spawning: ~g~" .. utility[4])
			
			elseif WarMenu.Button(utility[5]) then
			
				spawnVeh(target, utility[5])
				showNote("Spawning: ~g~" .. utility[5])
			
			elseif WarMenu.Button(utility[6]) then
			
				spawnVeh(target, utility[6])
				showNote("Spawning: ~g~" .. utility[6])
			
			elseif WarMenu.Button(utility[7]) then
			
				spawnVeh(target, utility[7])
				showNote("Spawning: ~g~" .. utility[7])
			
			elseif WarMenu.Button(utility[8]) then
			
				spawnVeh(target, utility[8])
				showNote("Spawning: ~g~" .. utility[8])
			
			elseif WarMenu.Button(utility[9]) then
			
				spawnVeh(target, utility[9])
				showNote("Spawning: ~g~" .. utility[9])
			
			elseif WarMenu.Button(utility[10]) then
			
				spawnVeh(target, utility[10])
				showNote("Spawning: ~g~" .. utility[10])
			
			elseif WarMenu.Button(utility[11]) then
			
				spawnVeh(target, utility[11])
				showNote("Spawning: ~g~" .. utility[11])
			
			elseif WarMenu.Button(utility[12]) then
			
				spawnVeh(target, utility[12])
				showNote("Spawning: ~g~" .. utility[12])
			
			elseif WarMenu.Button(utility[13]) then
			
				spawnVeh(target, utility[13])
				showNote("Spawning: ~g~" .. utility[13])
			
			elseif WarMenu.Button(utility[14]) then
			
				spawnVeh(target, utility[14])
				showNote("Spawning: ~g~" .. utility[14])
			
			elseif WarMenu.Button(utility[15]) then
			
				spawnVeh(target, utility[15])
				showNote("Spawning: ~g~" .. utility[15])
			
			elseif WarMenu.Button(utility[16]) then
			
				spawnVeh(target, utility[16])
				showNote("Spawning: ~g~" .. utility[16])
			
			elseif WarMenu.Button(utility[17]) then
			
				spawnVeh(target, utility[17])
				showNote("Spawning: ~g~" .. utility[17])
			
			elseif WarMenu.Button(utility[18]) then
			
				spawnVeh(target, utility[18])
				showNote("Spawning: ~g~" .. utility[18])
			
			elseif WarMenu.Button(utility[19]) then
			
				spawnVeh(target, utility[19])
				showNote("Spawning: ~g~" .. utility[19])
			
			elseif WarMenu.Button(utility[20]) then
			
				spawnVeh(target, utility[20])
				showNote("Spawning: ~g~" .. utility[20])
			
			elseif WarMenu.Button(utility[21]) then
			
				spawnVeh(target, utility[21])
				showNote("Spawning: ~g~" .. utility[21])
			
			elseif WarMenu.Button(utility[22]) then
			
				spawnVeh(target, utility[22])
				showNote("Spawning: ~g~" .. utility[22])
			
			elseif WarMenu.Button(utility[23]) then
			
				spawnVeh(target, utility[23])
				showNote("Spawning: ~g~" .. utility[23])
			
			elseif WarMenu.Button(utility[24]) then
			
				spawnVeh(target, utility[24])
				showNote("Spawning: ~g~" .. utility[24])
			
			elseif WarMenu.Button(utility[25]) then
			
				spawnVeh(target, utility[25])
				showNote("Spawning: ~g~" .. utility[25])
			
			elseif WarMenu.Button(utility[26]) then
			
				spawnVeh(target, utility[26])
				showNote("Spawning: ~g~" .. utility[26])
			
			elseif WarMenu.Button(utility[27]) then
			
				spawnVeh(target, utility[27])
				showNote("Spawning: ~g~" .. utility[27])
			
			elseif WarMenu.Button(utility[28]) then
			
				spawnVeh(target, utility[28])
				showNote("Spawning: ~g~" .. utility[28])
			
			elseif WarMenu.Button(utility[29]) then
			
				spawnVeh(target, utility[29])
				showNote("Spawning: ~g~" .. utility[29])
			
			elseif WarMenu.Button(utility[30]) then
			
				spawnVeh(target, utility[30])
				showNote("Spawning: ~g~" .. utility[30])
			
			elseif WarMenu.Button(utility[31]) then
			
				spawnVeh(target, utility[31])
				showNote("Spawning: ~g~" .. utility[31])
			
			elseif WarMenu.Button(utility[32]) then
			
				spawnVeh(target, utility[32])
				showNote("Spawning: ~g~" .. utility[32])
			
			elseif WarMenu.Button(utility[33]) then
			
				spawnVeh(target, utility[33])
				showNote("Spawning: ~g~" .. utility[33])
			
			elseif WarMenu.Button(utility[34]) then
			
				spawnVeh(target, utility[34])
				showNote("Spawning: ~g~" .. utility[34])
			
			elseif WarMenu.Button(utility[35]) then
			
				spawnVeh(target, utility[35])
				showNote("Spawning: ~g~" .. utility[35])
			
			elseif WarMenu.Button(utility[36]) then
			
				spawnVeh(target, utility[36])
				showNote("Spawning: ~g~" .. utility[36])
			
			elseif WarMenu.Button(utility[37]) then
			
				spawnVeh(target, utility[37])
				showNote("Spawning: ~g~" .. utility[37])
			
			elseif WarMenu.Button(utility[38]) then
			
				spawnVeh(target, utility[38])
				showNote("Spawning: ~g~" .. utility[38])
			
			elseif WarMenu.Button(utility[39]) then
			
				spawnVeh(target, utility[39])
				showNote("Spawning: ~g~" .. utility[39])
			
			elseif WarMenu.Button(utility[40]) then
			
				spawnVeh(target, utility[40])
				showNote("Spawning: ~g~" .. utility[40])
			
			elseif WarMenu.Button(utility[41]) then
			
				spawnVeh(target, utility[41])
				showNote("Spawning: ~g~" .. utility[41])
			
			elseif WarMenu.Button(utility[42]) then
			
				spawnVeh(target, utility[42])
				showNote("Spawning: ~g~" .. utility[42])
			
			elseif WarMenu.Button(utility[43]) then
			
				spawnVeh(target, utility[43])
				showNote("Spawning: ~g~" .. utility[43])
			
			elseif WarMenu.Button(utility[44]) then
			
				spawnVeh(target, utility[44])
				showNote("Spawning: ~g~" .. utility[44])
			
			elseif WarMenu.Button(utility[45]) then
			
				spawnVeh(target, utility[45])
				showNote("Spawning: ~g~" .. utility[45])
			
			elseif WarMenu.Button(utility[46]) then
			
				spawnVeh(target, utility[46])
				showNote("Spawning: ~g~" .. utility[46])
			
			elseif WarMenu.Button(utility[47]) then
			
				spawnVeh(target, utility[47])
				showNote("Spawning: ~g~" .. utility[47])
			
			elseif WarMenu.Button(utility[48]) then
			
				spawnVeh(target, utility[48])
				showNote("Spawning: ~g~" .. utility[48])
			
			elseif WarMenu.Button(utility[49]) then
			
				spawnVeh(target, utility[49])
				showNote("Spawning: ~g~" .. utility[49])
			
			end
			
			WarMenu.Display()
		
		--MUSCLE MENU
		
		elseif WarMenu.IsMenuOpened("Muscle") then
			
			if WarMenu.Button(muscle[1]) then
			
				spawnVeh(target, muscle[1])
				showNote("Spawning: ~g~" .. muscle[1])
			
			elseif WarMenu.Button(muscle[2]) then
			
				spawnVeh(target, muscle[2])
				showNote("Spawning: ~g~" .. muscle[2])
			
			elseif WarMenu.Button(muscle[3]) then
			
				spawnVeh(target, muscle[3])
				showNote("Spawning: ~g~" .. muscle[3])
			
			elseif WarMenu.Button(muscle[4]) then
			
				spawnVeh(target, muscle[4])
				showNote("Spawning: ~g~" .. muscle[4])
			
			elseif WarMenu.Button(muscle[5]) then
			
				spawnVeh(target, muscle[5])
				showNote("Spawning: ~g~" .. muscle[5])
			
			elseif WarMenu.Button(muscle[6]) then
			
				spawnVeh(target, muscle[6])
				showNote("Spawning: ~g~" .. muscle[6])
			
			elseif WarMenu.Button(muscle[7]) then
			
				spawnVeh(target, muscle[7])
				showNote("Spawning: ~g~" .. muscle[7])
			
			elseif WarMenu.Button(muscle[8]) then
			
				spawnVeh(target, muscle[8])
				showNote("Spawning: ~g~" .. muscle[8])
			
			elseif WarMenu.Button(muscle[9]) then
			
				spawnVeh(target, muscle[9])
				showNote("Spawning: ~g~" .. muscle[9])
			
			elseif WarMenu.Button(muscle[10]) then
			
				spawnVeh(target, muscle[10])
				showNote("Spawning: ~g~" .. muscle[10])
			
			elseif WarMenu.Button(muscle[11]) then
			
				spawnVeh(target, muscle[11])
				showNote("Spawning: ~g~" .. muscle[11])
			
			elseif WarMenu.Button(muscle[12]) then
			
				spawnVeh(target, muscle[12])
				showNote("Spawning: ~g~" .. muscle[12])
			
			elseif WarMenu.Button(muscle[13]) then
			
				spawnVeh(target, muscle[13])
				showNote("Spawning: ~g~" .. muscle[13])
			
			elseif WarMenu.Button(muscle[14]) then
			
				spawnVeh(target, muscle[14])
				showNote("Spawning: ~g~" .. muscle[14])
			
			elseif WarMenu.Button(muscle[15]) then
			
				spawnVeh(target, muscle[15])
				showNote("Spawning: ~g~" .. muscle[15])
			
			elseif WarMenu.Button(muscle[16]) then
			
				spawnVeh(target, muscle[16])
				showNote("Spawning: ~g~" .. muscle[16])
			
			elseif WarMenu.Button(muscle[17]) then
			
				spawnVeh(target, muscle[17])
				showNote("Spawning: ~g~" .. muscle[17])
			
			elseif WarMenu.Button(muscle[18]) then
			
				spawnVeh(target, muscle[18])
				showNote("Spawning: ~g~" .. muscle[18])
			
			elseif WarMenu.Button(muscle[19]) then
			
				spawnVeh(target, muscle[19])
				showNote("Spawning: ~g~" .. muscle[19])
			
			elseif WarMenu.Button(muscle[20]) then
			
				spawnVeh(target, muscle[20])
				showNote("Spawning: ~g~" .. muscle[20])
			
			elseif WarMenu.Button(muscle[21]) then
			
				spawnVeh(target, muscle[21])
				showNote("Spawning: ~g~" .. muscle[21])
			
			elseif WarMenu.Button(muscle[22]) then
			
				spawnVeh(target, muscle[22])
				showNote("Spawning: ~g~" .. muscle[22])
			
			elseif WarMenu.Button(muscle[23]) then
			
				spawnVeh(target, muscle[23])
				showNote("Spawning: ~g~" .. muscle[23])
			
			elseif WarMenu.Button(muscle[24]) then
			
				spawnVeh(target, muscle[24])
				showNote("Spawning: ~g~" .. muscle[24])
			
			elseif WarMenu.Button(muscle[25]) then
			
				spawnVeh(target, muscle[25])
				showNote("Spawning: ~g~" .. muscle[25])
			
			elseif WarMenu.Button(muscle[26]) then
			
				spawnVeh(target, muscle[26])
				showNote("Spawning: ~g~" .. muscle[26])
			
			elseif WarMenu.Button(muscle[27]) then
			
				spawnVeh(target, muscle[27])
				showNote("Spawning: ~g~" .. muscle[27])
			
			elseif WarMenu.Button(muscle[28]) then
			
				spawnVeh(target, muscle[28])
				showNote("Spawning: ~g~" .. muscle[28])
			
			elseif WarMenu.Button(muscle[29]) then
			
				spawnVeh(target, muscle[29])
				showNote("Spawning: ~g~" .. muscle[29])
			
			elseif WarMenu.Button(muscle[30]) then
			
				spawnVeh(target, muscle[30])
				showNote("Spawning: ~g~" .. muscle[30])
			
			elseif WarMenu.Button(muscle[31]) then
			
				spawnVeh(target, muscle[31])
				showNote("Spawning: ~g~" .. muscle[31])
			
			end
			
			WarMenu.Display()
		
		-- OPEN MENU
		
		elseif IsControlJustReleased(0, 244) then
		
			WarMenu.OpenMenu("PressM")
			
		end
		
		Citizen.Wait(0)
		
	end
	
end)