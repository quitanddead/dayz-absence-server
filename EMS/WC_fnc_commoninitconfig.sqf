	// -----------------------------------------------
	// Author: team  code34 nicolas_boiteux@yahoo.fr
	// WARCONTEXT - Description: init configuration file share between server and client

	// wit version
	wcversion	= 1.60;

	// friendly side
	wcside 		=  [west];
	
	// enemy side
	wcenemyside	= [east, resistance];

	// Limit min of fps on server under no more units will be create for support
	wcminfpsonserver = 15;

	// Adress of teamspeak server
	wcteamspeak = "Join me on BIS forum: Code34";

	// put PLAYERUID of team members in array
	// will give same rights as the admin
	// uncomment line below
	wcteammembers = ["4897670"];

	// limit of playable map
	switch (tolower(worldname)) do {
		case "gsep_zernovo": {
			wcmaptopright 	= [4100, 4100];
			wcmapbottomleft = [0, 0];
		};

		case "mbg_celle2": {
			wcmaptopright 	= [12800, 12800];
			wcmapbottomleft = [0, 0];
		};

		case "nogova2010": {
			wcmaptopright 	= [12800, 12800];
			wcmapbottomleft = [0, 0];
		};

		case "tropica": {
			wcmaptopright 	= [20500, 20500];
			wcmapbottomleft = [0, 0];
		};

		case "clafghan": {
			wcmaptopright 	= [20500, 20500];
			wcmapbottomleft = [0, 0];
		};

		case "hellskitchen": {
			wcmaptopright 	= [5050, 5050];
			wcmapbottomleft = [0, 0];
		};

		case "isoladicapraia" : {
			wcmaptopright 	= [10000,10000];
			wcmapbottomleft = [0,0];
		};

		case "torabora" : {
			wcmaptopright 	= [10250,10250];
			wcmapbottomleft = [0,0];
		};

		case "tavi" : {
			wcmaptopright 	= [25600,25600];
			wcmapbottomleft = [0,0];
		};

		case "malden2010" : {
			wcmaptopright 	= [12800,12800];
			wcmapbottomleft = [0,0];
		};

		case "everon2010" : {
			wcmaptopright 	= [12800,12800];
			wcmapbottomleft = [0,0];
		};

		case "fallujah" : {
			wcmaptopright 	= [10250,10250];
			wcmapbottomleft = [0,0];
		};

		case "mcn_hazarkot" : {
			wcmaptopright 	= [4800,4800];
			wcmapbottomleft = [0,0];
		};

		case "mcn_aliabad" : {
			wcmaptopright 	= [4800,4800];
			wcmapbottomleft = [0,0];
		};

		case "chernarus" : {
			wcmaptopright 	= [14800,15000];
			wcmapbottomleft = [0,0];
		};

		case "zargabad" : {
			wcmaptopright 	= [5500,8200];
			wcmapbottomleft = [0,0];
		};

		case "panthera2" : {
			wcmaptopright 	= [10200,10200];
			wcmapbottomleft = [0,0];
		};


		case "dingor" : {
			wcmaptopright 	= [10240,10240];
			wcmapbottomleft = [0,0];
		};

		case "lingor" : {
			wcmaptopright 	= [10240,10240];
			wcmapbottomleft = [0,0];
		};

		case "fayshkhabur" : {
			wcmaptopright 	= [20400,20400];
			wcmapbottomleft = [0,0];
		};

		case "esbekistan": {
			wcmaptopright 	= [20500, 20500];
			wcmapbottomleft = [0, 0];
		};

		case "tigeria": {
			wcmaptopright 	= [20500, 20500];
			wcmapbottomleft = [0, 0];
		};
		case "napf": {
			wcmaptopright 	= [20500, 20500];
			wcmapbottomleft = [0, 0];
		};

		default {
			// retrieve map ressource
			_x = getNumber (configfile >> "cfgWorlds" >> worldname >> "Grid" >> "offsetX");
			_y = getNumber (configfile >> "cfgWorlds" >> worldname >> "Grid" >> "offsetY");

			if((_x == 0) or (_y ==0)) then {
				wcmaptopright 	= [20800, 20800];
			} else {
				wcmaptopright = [_x, _y];
			};
			wcmapbottomleft = [0, 0];
		};
	};
	
	// Position of map center
	wcmapcenter = [((wcmaptopright select 0) / 2), ((wcmaptopright select 0) / 2)];

	// safe Position where ai, or body can be teleport for wc purpose
	wcinitpos = getmarkerpos "initpos";

	// position where pop enemy sea patrol (left bottom corner)
	wcseainitpos = [400,400,0];

	// Rain max rate of the country - 0  (low) 1 (full)
	wcrainrate = 0.65;

	// mortar spawn percent probability at begin of mission (defaut 20%)
	wcmortarprobability = 0.2;

	// civilian terrorist percent - depending of lobby parameter (by default 20% hostile)
	//wcterroristprobability = (wccivilianfame / 100);

	// civilian driver percent (defaut 20%)
	//wcciviliandriverprobability = 0.2;

	// player can see marker of others player when they are at max x meters
	//wcplayermarkerdist = 2000;

	// weapons list of ammobox, you can add weapons in this array to add then to main ammobox
	//wclistofweapons = ["ACRE_PRC117F","ACRE_PRC119","ACRE_PRC148","ACRE_PRC343","Makarov","MakarovSD","PK","SVD","RPG7V","Strela","Igla","MetisLauncher","Binocular","Laserdesignator","NVGoggles","RPG18","AK_74","AK_74_GL","RPK_74","ItemWatch","ItemCompass","ItemGPS","ItemRadio","ItemMap","revolver_EP1","revolver_gold_EP1","SVD_NSPU_EP1","Binocular_Vector","AK_74_GL_kobra","ACE_Flaregun","ACE_MugLite","ACE_AK74M_SD_F","ACE_AK74M_SD_Kobra_F","bizon_silenced", "ACE_CharliePack_ACU_Medic", "ACE_CharliePack_WMARPAT", "ACE_CharliePack_Multicam", "ACE_PRC119_MAR", "ACE_Rucksack_MOLLE_Brown_Medic",  "ACE_AEK_971", "ACE_AEK_971_gp","VSS_vintorez","ACE_Val"];
	
	// Kind of engineer
	//wcengineerclass = ["AFR_Soldier_Engineer", "ACE_USMC_SoldierS_Engineer_D", "HEXA_Soldier_ISAf", "US_Soldier_Engineer_EP1", "BWMod_EngineerG", "BWMod_EngineerG_Desert", "BWMod_EngineerG_ISAF", "US_Soldier_Engineer_EP1_retex_ger_des", "US_Soldier_Engineer_EP1_retex_ger_wdl", "FR_Sykes", "US_Delta_Force_Night_EP1","ACE_RU_Soldier_Engineer","ACE_RU_Soldier_Engineer_D","RUS_Soldier2", "MVD_Soldier_GL"];

	// Kind of medics
	//wcmedicclass = ["AFR_Soldier_Medic", "ACE_USMC_Soldier_Medic_D", "HEXA_Soldier_ISAF_Medic", "FR_OHara", "USMC_Soldier_Medic", "GER_Soldier_Medic_EP1", "US_Delta_Force_Medic_EP1", "US_Soldier_Medic_EP1", "BWMod_MedicG", "BWMod_MedicG_Desert", "BWMod_MedicG_ISAF", "US_Delta_Force_Medic_EP1_retex_ger_des", "US_Soldier_Medic_EP1_retex_ger_des", "US_Delta_Force_Medic_EP1_retex_ger_wdl", "US_Soldier_Medic_EP1_retex_ger_wdl", "GER_Soldier_Medic_EP1_des", "GER_Soldier_Medic_EP1_wdl", "RU_Soldier_Medic", "Dr_Hladik_EP1", "RUS_Soldier1", "ACE_RU_Soldier_Medic_D", "MVD_Soldier"];

	// Kind of civils
	wccivilclass = ["RU_Assistant","RU_Citizen1","RU_Citizen2","RU_Citizen3","RU_Citizen4","RU_Policeman","RU_Profiteer1","RU_Profiteer2","RU_Profiteer3","RU_Profiteer4","RU_SchoolTeacher","RU_Villager1","RU_Villager2","RU_Villager3","RU_Villager4","RU_Woodlander1","RU_Woodlander2","RU_Woodlander3","RU_Woodlander4","RU_Worker1","RU_Worker2","RU_Worker3","RU_Worker4"];

	// civils without weapons
	wccivilwithoutweapons = ["RU_SchoolTeacher","RU_Worker1","RU_Worker2","RU_Worker3","RU_Worker4"];

	// blacklist of units that can pop dynamicly (exclude mission)
	wcblacklistenemyclass = ["TK_Soldier_Crew_EP1", "TK_Aziz_EP1", "TK_Special_Forces_EP1", "TK_Special_Forces_MG_EP1", "TK_Special_Forces_TL_EP1", "TK_Soldier_Pilot_EP1","INS_BARDAK","INS_Soldier_crew"];

	// blacklist of vehicles that can pop dynamicly (exclude mission)
	wcblacklistenemyvehicleclass = ["BRDM2_ATGM_TK_EP1","GRAD_TK_EP1", "BMP2_HQ_TK_EP1"];
	
	// kind of houses - computed village
	wcvillagehouses = ["Land_House_C_5_V3_EP1", "Land_House_C_5_EP1", "Land_House_L_8_EP1", "Land_House_K_3_EP1", "Land_House_C_5_V1_EP1", "Land_A_Mosque_small_2_EP1", "Land_Wall_L_Mosque_1_EP1", "Land_A_Mosque_small_1_EP1", "Land_House_L_7_EP1", "Land_House_K_5_EP1", "Land_House_K_1_EP1", "Land_House_L_6_EP1", "Land_House_L_9_EP1", "Land_House_L_4_EP1", "Land_House_L_3_EP1", "Land_Wall_L3_5m_EP1","Land_smd_dum_olez_istan1_open","Land_smd_bouda_plech_open","Land_smd_dum_olez_istan2_open2","Land_smd_dum_olez_istan1_open2","Land_smd_dum_olez_istan2_open","Land_smd_garaz_mala_open","Land_smd_dum_mesto_in_open"];

	// special forces
	wcspecialforces = ["ins_soldier_gl"];
	// commando group
	wccommando = ["GER_Soldier_EP1"];
	// kind of civil for rescue missions
	wcrescuecivils = ["RU_Assistant","RU_Citizen1","RU_Citizen2","RU_Citizen3","RU_Citizen4","RU_Policeman","RU_Profiteer1","RU_Profiteer2","RU_Profiteer3","RU_Profiteer4"];

	// kind of units crew of enemies vehicles
	wccrewforces = ["Bandit1_DZ"];

	// kind of dogs
	wcdogclass = ["Fin", "Pastor"];

	// kind of sheep
	wcsheeps = ["Sheep01_EP1", "Sheep02_EP1"];
	
	// kind of ied objects
	wciedobjects = ["Ikarus","SkodaBlue","SkodaGreen","SkodaRed","Skoda","VWGolf","tT650_Civ","MMT_Civ","hilux1_civil_2_covered","hilux1_civil_1_open","hilux1_civil_3_open","car_hatchback","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open","V3S_Civ","car_sedan","Tractor","UralCivil","UralCivil2","Lada_base","LadaLM","Lada2","Lada1","Barrels","Barrel4","Barrel1","Barrel5","Garbage_can","Fuel_can","Garbage_container","Land_Barrel_empty","Land_Pneu","Land_Toilet","Misc_TyreHeap"];

	// kind of barackment
	wckindofbarracks = ["Ins_WarfareBBarracks", "Land_Mil_Barracks_i"];

	// kind of airport hangar
	wckindofhangars = ["Land_Mil_hangar_EP1","Land_SS_hangar"];

	// kind of control tower
	wckindofcontroltowers = ["Land_Mil_ControlTower_EP1", "Land_Mil_ControlTower"];
	
	// kind of oil pump
	wckindofoilpumps = ["Land_Ind_Oil_Pump_EP1"];

	// kind of fuel station
	wckindoffuelstations = ["Land_Ind_FuelStation_Feed"];
	
	// anti air vehicles
	wcaavehicles = ["Zsu_ins", "Ural_ZU23_ins"];

	// vehicles escorted in convoy
	wcconvoyvehicles = ["KamazReammo", "KamazRefuel", "KamazRepair", "MtvrRefuel", "MtvrRepair"];

	// sea patrol
	wcseapatrol = ["RHIB"];

	// kind of enemies backpack
	wcenemybackpack = ["DZ_ALICE_Pack_EP1", "DZ_Assault_Pack_EP1", "DZ_Backpack_EP1", "DZ_British_ACU", "DZ_CivilBackpack_EP1", "DZ_CompactPack_EP1", "DZ_Czech_Vest_Puch", "DZ_GunBag_EP1", "DZ_LargeGunBag_EP1", "DZ_TerminalPack_EP1", "DZ_TK_Assault_Pack_EP1"];

	// change clothes - player can be civil
	wcchangeclothescivil = ["RU_Assistant","RU_Citizen1","RU_Citizen2","RU_Citizen3","RU_Citizen4","RU_Policeman", "Dr_Hladik_EP1", "Pilot_EP1", "Haris_Press_EP1"];

	// change clothes - player can be west
	wcchangeclotheswest = ["US_Pilot_Light_EP1"];

	// change clothes - player can be east - add clothes if you want in array
	wcchangeclotheseast = [];

	wcchangeclothes = wcchangeclothescivil + wcchangeclotheswest + wcchangeclotheseast;

	// type of plane
	wcairpatroltype = ["Mi17_ins", "Mi24_V", "Su25_Ins"];

	// kind of radio tower
	wcradiotype = ["ins_WarfareBUAVterminal"];

	// kind of repair point
	wcrepairpointtype = ["RU_WarfareBVehicleServicePoint"];

	// kind of grave
	wcgravetype = ["gravecross2_EP1", "GraveCrossHelmet_EP1"];

	// terrain ground details 0(full) - 50(low)
	wcterraingrid = 50;

	// default player view distance
	wcviewdist = 1500;

	// alert threshold begin to increase
	// when something happens at ... meters of the mission position
	wcalertzonesize = 3000;

	// Radio appear at x meter distance of goal (min & max)
	wcradiodistminofgoal = 150;
	wcradiodistmaxofgoal = 300;

	// Civils appear at x meter distance of player
	wccivildistancepop = 1000;

	// kind of generator
	wcgeneratortype = ["PowerGenerator"];


	// Generator appear at distance of goal (min & max)
	wcgeneratordistminofgoal = 150;
	wcgeneratordistmaxofgoal = 300;

	// time in seconds before to garbage dead body
	wctimetogarbagedeadbody = 360;

	// time in seconds before to respawn vehicle
	wctimetorespawnvehicle = 360;

	// probability of nuclear attack at begining of a mission - default 25%
	wcnuclearprobability = 0.85;

	// probability there is a static weapon in bunker - default 30%
	wcstaticinbunkerprobability = 0.3;

	// size of area to detect friendly units leave the zone at end of mission
	wcleaveareasizeatendofmission = 1000;

	// percent of players that must leave the zone at end of mission (by defaut 20%)
	wcleaversatendofmission = 0.2;

	// Simulation mode has a harder scoring system
//	if(wckindofgame == 1) then {
//		wcscorelimitmin = -80; 
//		wcscorelimitmax = 99;
//	} else {
//		wcscorelimitmin = -80; 
//		wcscorelimitmax = 99;
//	};

	// threshold of dammage to do, for enemy vehicle been damaged
	// this variable can affect ACE damaged threshold
	//if(wcwithACE == 1) then {
		wcdammagethreshold = 5;
	//} else {
//		wcdammagethreshold = 5;
	//};

	// patrols use  dogs
	wcpatrolwithdogs = true;

	// Goal cam uses color
	wccamgoalwithcolor = true;

	// Goal cam turn around goal
	wccamgoalanimate = false;

	// Ied false positive are off by default
	wciedfalsepositive = false;

	// contain all nuclear zone
	wcnuclearzone = [];

	// counter of day start at ..
	wcday = 1;

	// position of goal zone
	wcselectedzone = [0,0,0];

	// radio is alive or not  
	wcradioalive = true;

	// level start at .. 
	wclevel = 1;

	// IA skill
	//if(wckindofgame == 1) then {
	//	wccivilianskill = 0.1;
	//	wcskill = 0.38;
	//	wcskill = wcskill + (wclevel * 0.02);
	//} else {
		wccivilianskill = 0.1;
		wcskill = 0.68;
		wcskill = wcskill + (wclevel * 0.02);
	//};

	// maximun number of groups in town (depending of wcopposingforce lobby parameter)
	wcopposingforce = 3;
	switch (wcopposingforce) do {
		case 1: {
			wclevelmaxincity = 2;
		};

		case 2: {
			wclevelmaxincity = 4;
		};
		
		case 3: {
			wclevelmaxincity = 6;
		};

		case 4: {
			wclevelmaxincity = 8;
		};

		case 5: {
			wclevelmaxincity = 10;
		};
	};

	// number of enemy killed
	wcenemykilled = 0;
	wccivilkilled = 0;

	// count number of mission
	wcmissioncount = 1;

	// array of all players in team
	wcinteam = [];

	// objective informations - don't edit
	wcobjectiveindex = 0;
	wcobjective = [-1, objnull, 0, "", ""];	

	// vehicles avalaible at hq
	wcvehicleslistathq = ["ATV_US_EP1"];

	wccfgpatches = [];

	// autoload troops
//	if(wcautoloadtroops == 1) then {
//		wceastside = [east] call WC_fnc_enumfaction;
//		wcresistanceside = [resistance] call WC_fnc_enumfaction;
//		wcwestside = [west] call WC_fnc_enumfaction;
//	} else {
//		// by default only arrowhead content is supported
		wceastside = [["INS"],[["INS","ins_Soldier_1"],["INS","ins_Soldier_AT"],["ins","ins_Soldier_2"],["ins","ins_Soldier_AA"],["ins","ins_Soldier_AT"],["ins","ins_Soldier_Sniper"],["ins","ins_Soldier_AR"],["ins","ins_Soldier_MG"],["ins","ins_Soldier_GL"],["ins","ins_Soldier_Medic"],["ins","ins_Soldier_CO"],["ins","ins_Soldier_sab"],["ins","ins_Soldier_sapper"],["BIS_US","US_Soldier_EP1"],["BIS_US","US_Soldier_B_EP1"],["BIS_US","US_Soldier_AMG_EP1"],["BIS_US","US_Soldier_AAR_EP1"],["BIS_US","US_Soldier_AHAT_EP1"],["BIS_US","US_Soldier_AAT_EP1"],["BIS_US","US_Soldier_Light_EP1"],["BIS_US","US_Soldier_GL_EP1"],["BIS_US","US_Soldier_Officer_EP1"],["BIS_US","US_Soldier_SL_EP1"],["BIS_US","US_Soldier_TL_EP1"],["BIS_US","US_Soldier_LAT_EP1"],["BIS_US","US_Soldier_AT_EP1"],["BIS_US","US_Soldier_HAT_EP1"],["BIS_US","US_Soldier_AA_EP1"],["BIS_US","US_Soldier_Medic_EP1"],["BIS_US","US_Soldier_AR_EP1"],["BIS_US","US_Soldier_MG_EP1"],["BIS_US","US_Soldier_Spotter_EP1"],["BIS_US","US_Soldier_Sniper_EP1"],["BIS_US","US_Soldier_Sniper_NV_EP1"],["BIS_US","US_Soldier_SniperH_EP1"],["BIS_US","US_Soldier_Marksman_EP1"],["BIS_US","US_Soldier_Engineer_EP1"],["BIS_US","US_Soldier_Pilot_EP1"],["BIS_US","US_Soldier_Crew_EP1"],["BIS_US","US_Delta_Force_EP1"],["BIS_US","US_Delta_Force_TL_EP1"],["BIS_US","US_Delta_Force_Medic_EP1"],["BIS_US","US_Delta_Force_Assault_EP1"],["BIS_US","US_Delta_Force_SD_EP1"],["BIS_US","US_Delta_Force_MG_EP1"],["BIS_US","US_Delta_Force_AR_EP1"],["BIS_US","US_Delta_Force_Night_EP1"],["BIS_US","US_Delta_Force_Marksman_EP1"],["BIS_US","US_Delta_Force_M14_EP1"],["BIS_US","US_Delta_Force_Air_Controller_EP1"],["BIS_US","US_Pilot_Light_EP1"],["BIS_US","Drake"],["BIS_US","Herrera"],["BIS_US","Pierce"],["BIS_US","Graves"],["BIS_US","Drake_Light"],["BIS_US","Herrera_Light"],["BIS_US","Pierce_Light"],["BIS_US","Graves_Light"]]];
		wcresistanceside = [["BIS_TK_GUE","BIS_UN","PMC_BAF"],[["BIS_TK_GUE","TK_GUE_Soldier_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AAT_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_2_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_3_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_4_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_5_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AA_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AT_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_HAT_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_TL_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_Sniper_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AR_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_MG_EP1"],["BIS_TK_GUE","TK_GUE_Bonesetter_EP1"],["BIS_TK_GUE","TK_GUE_Warlord_EP1"],["BIS_UN","UN_CDF_Soldier_EP1"],["BIS_UN","UN_CDF_Soldier_B_EP1"],["BIS_UN","UN_CDF_Soldier_AAT_EP1"],["BIS_UN","UN_CDF_Soldier_AMG_EP1"],["BIS_UN","UN_CDF_Soldier_AT_EP1"],["BIS_UN","UN_CDF_Soldier_MG_EP1"],["BIS_UN","UN_CDF_Soldier_SL_EP1"],["BIS_UN","UN_CDF_Soldier_Officer_EP1"],["BIS_UN","UN_CDF_Soldier_Guard_EP1"],["BIS_UN","UN_CDF_Soldier_Pilot_EP1"],["BIS_UN","UN_CDF_Soldier_Crew_EP1"],["BIS_UN","UN_CDF_Soldier_Light_EP1"],["PMC_BAF","CIV_Contractor1_BAF"],["PMC_BAF","CIV_Contractor2_BAF"],["PMC_BAF","Soldier_PMC"],["PMC_BAF","Soldier_M4A3_PMC"],["PMC_BAF","Soldier_Engineer_PMC"],["PMC_BAF","Soldier_Crew_PMC"],["PMC_BAF","Soldier_Medic_PMC"],["PMC_BAF","Soldier_TL_PMC"],["PMC_BAF","Soldier_Pilot_PMC"],["PMC_BAF","Soldier_MG_PMC"],["PMC_BAF","Soldier_MG_PKM_PMC"],["PMC_BAF","Soldier_Sniper_PMC"],["PMC_BAF","Soldier_Sniper_KSVK_PMC"],["PMC_BAF","Soldier_GL_PMC"],["PMC_BAF","Soldier_GL_M16A2_PMC"],["PMC_BAF","Soldier_Bodyguard_M4_PMC"],["PMC_BAF","Soldier_Bodyguard_AA12_PMC"],["PMC_BAF","Soldier_AA_PMC"],["PMC_BAF","Soldier_AT_PMC"],["PMC_BAF","Poet_PMC"],["PMC_BAF","Ry_PMC"],["PMC_BAF","Reynolds_PMC"],["PMC_BAF","Tanny_PMC"],["PMC_BAF","Dixon_PMC"]]];
		wcwestside = ["Survivor1_DZ"];
//	};

	// autoload vehicles
//	if(wcautoloadvehicles == 1) then {
//		wcvehicleslistE = [east] call WC_fnc_enumvehicle;
//		wcvehicleslistC = [civilian] call WC_fnc_enumvehicle;
//		wcvehicleslistW = [west] call WC_fnc_enumvehicle;
//		wccompositions = [east] call WC_fnc_enumcompositions;
//	} else {
		wcvehicleslistE = ["BRDM2_INS","Offroad_DSHKM_INS","pickup_PK_INS","UAZ_INS","UAZ_AGS30_INS","UAZ_MG_INS","UAZ_SPG9_INS","btr90"];
		wcvehicleslistC = ["Ikarus","Lada1","Lada2","LadaLM","M1030","MMT_Civ","Skoda","SkodaBlue","SkodaGreen","SkodaRed","TT650_Civ","UAZ_INS","SUV_TK_CIV_EP1","UralCivil","UralCivil2","V3S_Civ","VWGolf","car_hatchback","car_sedan","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open","hilux1_civil_1_open","hilux1_civil_2_covered","hilux1_civil_3_open","tractor"];
		wcvehicleslistW = ["UAZ_AGS30_RU","UAZ_RU","KamazRepair","KamazReammo","KamazRefuel","WarfareSupplyTruck_RU","WarfareSalvageTruck_RU","M1030","GRAD_RU","BRDM2_CDF","BRDM2_ATGM_CDF","GAZ_Vodnik","GAZ_Vodnik_HMG","BTR90","Offroad_DSHKM_INS","Pickup_PK_INS","Offroad_SPG9_Gue","Offroad_SPG9_Gue","MMT_Civ","MAZ_543_SCUD_TK_EP1","SUV_TK_EP1","Kamaz","KamazOpen","BMP2_CDF","BMP2_HQ_CDF","T34","ZSU_CDF","T72_RU","BMP3","T90"];
		wccompositions = ["mediumtentcamp2_ru","mediumtentcamp3_ru","mediumtentcamp_ru","anti-air_ru1","firebase_ru1","fuel_dump_ru1","radar_site_ru1","vehicle_park_ru1","heli_park_ru1","airplane_park_ru1","weapon_store_ru1","camp_ru1","camp_ru2","camp_ins1","camp_ins2","firing_range_targets_wreck4","firing_range_targets_wreck5"];
//};
	wcallsides = wceastside + wcresistanceside;

	wcfactions = (wcallsides select 0);
	wcclasslist = wcallsides select 1;

	wcvehicleslistEmission = wcvehicleslistE;
	wcvehicleslistE = wcvehicleslistE - wcblacklistenemyvehicleclass;
	wcnumberofkilledofmissionW = 0;
	wcdefendzoneindex = 0;
		wcsecurezone = [getmarkerpos "safezone"];
	wcsecurezoneindex = 0;
	wcconvoylevel = 10;
			for "_x" from 1 to wcconvoylevel step 1 do {
			wcgarbage = [wcvehicleslistE, wcconvoyvehicles, (round random(3))] spawn WC_fnc_createconvoy;
			sleep 2;
		};
	wcallbaracks = nearestObjects [wcmapcenter, wckindofbarracks, 20000];
	{
		wcallbaracks = [wcallbaracks, _x, wcalertzonesize] call WC_fnc_farofpos;
	}foreach wcsecurezone;

	
	wcallhangars = nearestObjects [wcmapcenter, wckindofhangars, 20000];
	{
		wcallhangars = [wcallhangars, _x, wcalertzonesize] call WC_fnc_farofpos;
	}foreach wcsecurezone;

	
	wcalloilpumps = nearestObjects [wcmapcenter, wckindofoilpumps, 20000];
	{
		wcalloilpumps = [wcalloilpumps, _x, wcalertzonesize] call WC_fnc_farofpos;
	}foreach wcsecurezone;

	
	wcallfuelstations = nearestObjects [wcmapcenter, wckindoffuelstations, 20000];
	{
		wcallfuelstations = [wcallfuelstations, _x, wcalertzonesize] call WC_fnc_farofpos;
	}foreach wcsecurezone;
	
	wcallcontroltowers = nearestObjects [wcmapcenter, wckindofcontroltowers, 20000];
	{
		wcallcontroltowers = [wcallcontroltowers, _x, wcalertzonesize] call WC_fnc_farofpos;
	}foreach wcsecurezone;
	
	wcalert = 0;
	player addEventHandler ['Fired', '
		private ["_name"];
		if!(wcdetected) then {
			if((getmarkerpos "rescue") distance (position player) < 400) then {
				_name = _this select 5;
				_ammo = _this select 5;
				_name = getText (configFile >> "CfgMagazines" >> _name >> "displayNameShort");
				_ammo = getText (configFile >> "CfgMagazines" >> _ammo >> "ammo");
				_sammo = getnumber (configfile >> "CfgMagazines" >> _ammo >> "ace_suppressed");
		if!(_name == "SD" || _ammo == "B_9x39_SP5" || _ammo == "ACE_B_9x39_SP6" || _sammo == 1) then {
					wcalerttoadd =  random (10);
					publicVariable "wcalerttoadd";
					wcalert = wcalert + wcalerttoadd;
					
				};
			};
		};
		wcammoused = wcammoused + 1;
	'];	
// heartbeat of teamscore and detection
	wcgarbage = [] spawn {
		private ["_lastteamscore", "_lastalert"];
		_lastteamscore = 0;
		_lastalert = 0;
		while { true } do {
			if(wcalert > 100) then { wcalert = 100;};
			if(wcfame < 0) then { wcfame = 0;};		
			if(wcteamscore != _lastteamscore) then {
				//["wcteamscore", "client"] call WC_fnc_publicvariable;
				publicVariable "wcteamscore";
				_lastteamscore = wcteamscore;
				
			};
			if(wcalert != _lastalert) then {
				//["wcalert", "client"] call WC_fnc_publicvariable;
				publicVariable "wcalert";
				_lastalert = wcalert;
				
			};	
			sleep 5;
		};
	};


	// decrease alert level by time
	wcgarbage = [] spawn {
		private["_decrease", "_lastalert"];
		while { true } do {
			_decrease = ceil(random(10));
			if(wcalert > _decrease) then { 
				_enemys = nearestObjects[getmarkerpos "rescuezone",["Man"], 300];
				if((west countside _enemys) == 0) then {
					wcalert = wcalert - _decrease;
					if(wcalert < 0) then { wcalert = 0;};
					if(_lastalert != wcalert) then {
						//["wcalert", "client"] call WC_fnc_publicvariable;
						publicVariable "wcalert";
					};
				};
			};
			sleep 60;
		};
	};
// contains current mission position
	wcmissionposition = [0,0,0];
	
	// contains last mission position
	wclastmissionposition = [0,0,0];
	
	_minute = [format["%1", (date select 4)]] call WC_fnc_feelwithzero;
	_hour = [format["%1", (date select 3)]] call WC_fnc_feelwithzero;
	_day = [format["%1", (date select 2)]] call WC_fnc_feelwithzero;
	_month = [format["%1", (date select 1)]] call WC_fnc_feelwithzero;

	_date = _hour + ":" + _minute + " " + _day  + "/" + _month + "/" + format["%1", (date select 0)];
	_missiontext = [_date]  + _missiontext;
	true;