	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - create side mission
	// -----------------------------------------------
	if (!isServer) exitWith{};

	private [
		"_vehicle", 
		"_location", 
		"_unit", 
		"_position", 
		"_group", 
		"_missiontype", 
		"_x", 
		"_building", 
		"_arrayofpos", 
		"_startposition", 
		"_index", 
		"_buildings", 
		"_missionname",
		"_missionnumber",
		"_missiontext",
		"_marker",
		"_count",
		"_watersafeposition"
		];

	_missionnumber	= _this select 0;
	_missionname	= _this select 1;

	_marker = ['sidezone', 100, getmarkerpos 'rescuezone', 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];

	_position = [1,1,0];
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};

	// create radio tower near side goal
	_newposition = [_position, wcradiodistminofgoal, wcradiodistmaxofgoal] call WC_fnc_createpositionaround;
	wcradio = [_newposition, wcradiotype] call WC_fnc_createradio;

	// create an electrical generator
	_newposition = [_position, wcgeneratordistminofgoal, wcgeneratordistmaxofgoal] call WC_fnc_createpositionaround;
	wcgenerator = [_newposition, wcgeneratortype] call WC_fnc_creategenerator;

	wcbonusfame = 0;
	wcbonusfuel = 0;
	wcbonuselectrical = 0;
	wcbonusnuclear = 0;

	switch (_missionnumber) do {
		case 0: {
			_missiontext = [_missionname, "Destroy a scud launcher"];
			_vehicle = createVehicle ["MAZ_543_SCUD_TK_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle, 0.15] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_vehicle action ["scudLaunch", _vehicle];
			_missiontype = "destroy";
		};

		case 1: {
			_missiontext = [_missionname, "Kill a gold trafficant"];
			_group = createGroup east;
			_vehicle = _group createUnit ["Functionary1", _position, [], 0, "NONE"];
			_arrayofpos = [_position, "bot"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle] spawn {
				private ["_unit"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
			};
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			wcbonusfame = -0.1;
		};

		case 2: {
			_missiontext = [_missionname, "Kill a nuclear scientist"];
			_group = createGroup east;
			_vehicle = _group createUnit ["Functionary1", _position, [], 0, "NONE"];
			_arrayofpos = [_position, "bot"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle] spawn {
				private ["_unit"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
			};
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			wcbonusfame = -0.1;
		};

		case 3: {
			_missiontext = [_missionname,"Destroy the barracks location"];
			_vehicle = createVehicle ["Land_Barrack2", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 4: {
			_missiontext = [_missionname, "Destroy the ural refuel"];
			_vehicle = createVehicle ["UralRefuel_INS", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle, 0, 0.1] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 5: {
			_missiontext = [_missionname, "Destroy the ural"];
			_vehicle = createVehicle ["Ural_ZU23_ins", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 6: {
			_missiontext = [_missionname, "Kill an insurgent commander"];
			_group = createGroup east;
			_vehicle = _group createUnit ["INS_bardak", _position, [], 0, "NONE"];
			_arrayofpos = [_position, "bot"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn {
				private ["_unit", "_enemy"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
				wcgarbage = [group _unit, position _unit, 50] spawn WC_fnc_patrol;
			};
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			wcbonusfame = 0.1;
		};

		case 7: {
			_missiontext = [_missionname, "Destroy a bmp2 HQ"];
			_vehicle = createVehicle ["BMP2_HQ_INS_unfolded", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 8: {
			_missiontext = [_missionname, "Destroy a small fuel location"];
			_vehicle = createVehicle ["Land_Ind_TankSmall2_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle, 0, 0.1] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 9: {
			_missiontext = [_missionname, "Destroy a big fuel location"];
			_vehicle = createVehicle ["Land_Fuel_tank_big", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle, 0, 0.2] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 10: {
			_missiontext = [_missionname, "Destroy the smuggled cargo"];
			_vehicle = createVehicle ["Land_Misc_Cargo1E_EP1", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 11: {
			_missiontext = [_missionname,"Destroy the enemy airfac"];
			_vehicle = createVehicle ["ins_WarfareBAircraftFactory", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 12: {
			_missiontext = [_missionname,"Destroy a commando group"];
			_vehicle = createVehicle ["Mi17_ins", _position, [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_destroygroup;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroygroup";
			wcbonusfame = 0;
		};

		case 13: {
			_missiontext = [_missionname, "Destroy a transport chopper"];
			_vehicle = createVehicle ["Mi17_medevac_Ins", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 14: {
			_missiontext = [_missionname, "Kill the spy"];
			_group = createGroup east;
			_vehicle = _group createUnit ["CIV_EuroMan01_EP1", _position, [], 0, "NONE"];
			_buildings = nearestObjects [position _vehicle, ["House"], 350];
			_arrayofpos = [_position, "all"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn {
				private ["_unit"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
			};
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			wcbonusfame = 0;
		};

		case 15: {
			_missiontext = [_missionname, "Destroy the radar"];
			_vehicle = createVehicle ["INS_WarfareBArtilleryRadar", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 16: {
			_missiontext = [_missionname, "Destroy the hospital"];
			_vehicle = createVehicle ["ins_WarfareBFieldhHospital", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 17: {
			_missiontext = [_missionname, "Destroy the heavy factory"];
			_vehicle = createVehicle ["ins_WarfareBHeavyFactory", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 18: {
			_missiontext = [_missionname, "Eliminate suicide bomber"];
			_group = createGroup east;
			_type = ["RU_SchoolTeacher", "GUE_Soldier_Sab", "Madam3", "GUE_Commander"] call BIS_fnc_selectRandom;
			_vehicle = _group createUnit [_type, _position, [], 0, "NONE"];
			_arrayofpos = [_position, "all"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn {
				private ["_unit", "_enemy"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
			};
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_createied;
			_missiontype = "eliminate";
			wcbonusfame = 0.1;
		};

		case 19: {
			_missiontext = [_missionname, "Kill a war lord"];
			_group = createGroup east;
			_vehicle = _group createUnit ["GUE_Commander", _position, [], 0, "NONE"];
			_arrayofpos = [_position, "bot"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn {
				private ["_unit", "_enemy"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
				wcgarbage = [group _unit, position _unit, 50] spawn WC_fnc_patrol;
			};
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			wcbonusfame = 0.1;
		};

		case 20: {
			_missiontext = [_missionname, "Kill an insurgent officer"];
			_group = createGroup east;
			_vehicle = _group createUnit ["Ins_Commander", _position, [], 0, "NONE"];
			_arrayofpos = [_position, "bot"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn {
				private ["_unit", "_enemy"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
				wcgarbage = [group _unit, position _unit, 50] spawn WC_fnc_patrol;
			};
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			wcbonusfame = -0.1;
		};

		case 21: {
			_missiontext = [_missionname, "Destroy an AA pod"];
			_vehicle = createVehicle ["ZU23_ins", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 22: {
			_missiontext = [_missionname, "Destroy a missile launcher"];
			_vehicle = createVehicle ["GRAD_ins", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 23: {
			_missiontext = [_missionname, "Defuse an IED"];
			_type = ["Ikarus","SkodaBlue","SkodaGreen","SkodaRed","Skoda","VWGolf","tT650_Civ","MMT_Civ","hilux1_civil_2_covered","hilux1_civil_1_open","hilux1_civil_3_open","car_hatchback","datsun1_civil_1_open","datsun1_civil_2_covered","datsun1_civil_3_open","V3S_Civ","car_sedan","Tractor","UralCivil","UralCivil2","Lada_base","LadaLM","Lada2","Lada1","Barrels","Barrel4","Barrel1","Barrel5","Garbage_can","Fuel_can","Garbage_container","Land_Barrel_empty","Land_Pneu","Land_Toilet","Misc_TyreHeap","Fort_Barricade_EP1","UH60_wreck_EP1","C130J_wreck_EP1"] call BIS_fnc_selectRandom;
			_vehicle = createVehicle [_type, _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_createied;
			_missiontype = "ied";
			wcbonusfame = 0.1;
		};

		case 24: {
			_missiontext = [_missionname, "Destroy a radio tower"];
			wcgarbage = [wcradio] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 25: {
			_missiontext = [_missionname, "Destroy an electrical station"];
			_vehicle = createVehicle ["PowGen_Big", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle, 0, 0, 0.15] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 26: {
			_missiontext = [_missionname, "Destroy a ZSU"];
			_vehicle = createVehicle ["ZSU_ins", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 27: {
			_missiontext = [_missionname, "Destroy a T72"];
			_vehicle = createVehicle ["T72_TK_EP1", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 28: {
			_missiontext = [_missionname, "Liberate the hostage"];
			_group = createGroup west;
			_vehicle = _group createUnit ["Haris_Press_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_liberatehotage;
			_missiontype = "liberate";
			wcbonusfame = 0;
		};

		case 29: {
			_missiontext = [_missionname, "Destroy an UAV terminal"];
			_vehicle = createVehicle ["ins_WarfareBUAVterminal", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 30: {
			_missiontext = [_missionname, "Liberate an officer"];
			_group = createGroup west;
			_vehicle = _group createUnit ["UN_CDF_Soldier_Officer_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_liberatehotage;
			_missiontype = "liberate";
			wcbonusfame = 0;
		};

		case 31: {
			_missiontext = [_missionname, "Liberate a tourist"];
			_group = createGroup west;
			_vehicle = _group createUnit ["CIV_EuroWoman01_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_liberatehotage;
			_missiontype = "liberate";
			wcbonusfame = 0;
		};

		case 32: {
			_missiontext = [_missionname, "Sabotage a ZSU"];
			_vehicle = createVehicle ["ZSU_ins", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_sabotage;
			_missiontype = "sabotage";
			wcbonusfame = 0;
		};

		case 33: {
			_missiontext = [_missionname, "Sabotage a T72"];
			_vehicle = createVehicle ["T72_TK_EP1", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_sabotage;
			_missiontype = "sabotage";
			wcbonusfame = 0;
		};

		case 34: {
			_missiontext = [_missionname, "Sabotage a radio tower"];
			wcgarbage = [wcradio] spawn WC_fnc_sabotage;
			_missiontype = "sabotage";
			wcbonusfame = 0;
		};

		case 35: {
			_missiontext = [_missionname, "Steal a secret document"];
			_house = nearestObjects [_position, ["House"], 500];
			_house = _house call BIS_fnc_selectRandom;
			_vehicle = createVehicle ["EvMoscow", position _house, [], 0, "NONE"];
			_arrayofpos = [_position, "all"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			_vehicle setpos _position;
			wcgarbage = [_vehicle] spawn WC_fnc_steal;
			_missiontype = "steal";
			wcbonusfame = 0;
		};

		case 36: {
			_missiontext = [_missionname, "Steal a BRDM2"];
			_vehicle = createVehicle ["BRDM2_ins", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 37: {
			_missiontext = [_missionname, "Steal a BTR90"];
			_vehicle = createVehicle ["BTR90", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 38: {
			_missiontext = [_missionname, "Steal an Ural"];
			_vehicle = createVehicle ["UralRefuel_ins", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_missiontype = "rob";
			wcbonusfame = 0;
			wcbonusfuel = -0.1;
		};

		case 39: {
			_missiontext = [_missionname, "Capture an insurgent commander"];
			_group = createGroup east;
			_vehicle = _group createUnit ["ins_bardak", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_jail;
			_missiontype = "jail";
			wcbonusfame = 0;
		};

		case 40: {
			_missiontext = [_missionname, "Capture an insurgent officer"];
			_group = createGroup east;
			_vehicle = _group createUnit ["ins_commander", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_jail;
			_missiontype = "jail";
			wcbonusfame = 0;
		};

		case 41: {
			_missiontext = [_missionname, "Capture a war lord"];
			_group = createGroup east;
			_vehicle = _group createUnit ["GUE_Commander", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_jail;
			_missiontype = "jail";
			wcbonusfame = 0.1;
		};

		case 42: {
			_missiontext = [_missionname, "Capture a civilian"];
			_group = createGroup east;
			_type = ["RU_Assistant","RU_Citizen1","RU_Citizen2","RU_Citizen3","RU_Citizen4","RU_Policeman","RU_Profiteer1","RU_Profiteer2","RU_Profiteer3","RU_Profiteer4","RU_SchoolTeacher","RU_Villager1","RU_Villager2","RU_Villager3","RU_Villager4","RU_Woodlander1","RU_Woodlander2","RU_Woodlander3","RU_Woodlander4","RU_Worker1","RU_Worker2","RU_Worker3","RU_Worker4"] call BIS_fnc_selectRandom;
			_vehicle = _group createUnit [_type, _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_jail;
			_missiontype = "jail";
			wcbonusfame = 0;
		};

		case 43: {
			_missiontext = [_missionname, "Retrieve an KA52"];
			_vehicle = createVehicle ["Ka52", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonusah64";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 44: {
			_missiontext = [_missionname, "Retrieve an UH1"];
			_vehicle = createVehicle ["UH1H_TK_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonusuh1";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 45: {
			_missiontext = [_missionname, "Retrieve a T90"];
			_vehicle = createVehicle ["T90", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonusm1";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 46: {
			_missiontext = [_missionname, "Retrieve a MI-8"];
			_vehicle = createVehicle ["Mi17_medevac_RU", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonusmh6";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 47: {
			_missiontext = [_missionname, "Destroy an ammo cache"];
			_vehicle = createVehicle ["TKVehicleBox_EP1", _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 48: {
			_missiontext = [_missionname, "Destroy a repair center"];
			_vehicle = createVehicle ["ins_WarfareBHeavyFactory", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
		};

		case 49: {
			_missiontext = [_missionname,"Retrieve a Mi17"];
			_vehicle = createVehicle ["ACE_Mi17_RU", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonuschinook";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 50: {
			_missiontext = [_missionname, "Kill a woman civil"];
			_group = createGroup civilian;
			_vehicle = _group createUnit ["Damsel4", _position, [], 0, "NONE"];
			_arrayofpos = [_position, "bot"] call WC_fnc_gethousespositions;
			_position = _arrayofpos call BIS_fnc_selectRandom;
			_vehicle setpos _position;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			wcgarbage = [_vehicle] spawn {
				private ["_unit"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
			};
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			_missiontype = "eliminate";
			wcbonusfame = -0.1;
		};

		case 51: {
			_vehicle = wcmissionvehicle;
			_name = getText (configFile >> "CfgVehicles" >> _vehicle >> "DisplayName");
			_missiontext = [_missionname, "Destroy a " + _name];
			_vehicle = createVehicle [_vehicle, _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 52: {
			_vehicle = wcmissionvehicle;
			_name = getText (configFile >> "CfgVehicles" >> _vehicle >> "DisplayName");
			_missiontext = [_missionname, "Rob a " + _name];
			_vehicle = createVehicle [_vehicle, _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 53: {
			_vehicle = wcmissionvehicle;
			_name = getText (configFile >> "CfgVehicles" >> _vehicle >> "DisplayName");
			_missiontext = [_missionname, "Sabotage a " + _name];
			_vehicle = createVehicle [_vehicle, _position, [], 0, "NONE"];
			_camo = createVehicle ["Land_CamoNetB_EAST", [0,0,0], [], 0, "NONE"];
			_camo allowdammage false;
			_camo setdir getdir _vehicle;
			_camo setpos (position _vehicle);
			wcgarbage = [_vehicle] spawn WC_fnc_sabotage;
			_missiontype = "sabotage";
			wcbonusfame = 0;
		};

		case 54: {
			_missiontext = [_missionname, "Rescue a pilot"];
			_group = createGroup west;
			_vehicle2 = "UH60_wreck_EP1" createvehicle _position;
			_vehicle = _group createUnit ["US_Pilot_Light_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_liberatehotage;
			_missiontype = "liberate";
			wcbonusfame = 0;
		};

		case 55: {
			_missiontext = [_missionname, "Defend an area"];
			_vehicle = "FlagCarrierUSA_EP1" createvehicle _position;
			_vehicle setVehicleInit "this addAction ['<t color=''#ff4500''>Защитить территорию</t>', 'warcontext\actions\WC_fnc_dobegindefend.sqf',[],6,false];";
			_vehicle = "Land_fortified_nest_big" createvehicle _position;
			wcgarbage = [_vehicle] spawn WC_fnc_defend;
			processInitCommands;
			_missiontype = "defend";
			wcbonusfame = 0;
			wcradio setdamage 1;
		};

		case 56: {
			_missiontext = [_missionname,"Defend the barracks"];
			_vehicle = (nearestObjects [_position, ["Land_Mil_Barracks_i"], 400]) call BIS_fnc_selectRandom;
			_vehicle setVehicleInit "this addAction ['<t color=''#ff4500''>Защитить барак</t>', 'warcontext\actions\WC_fnc_dobegindefend.sqf',[],6,false];";
			wcgarbage = [_vehicle] spawn WC_fnc_defend;
			processInitCommands;
			_missiontype = "defend";
			wcbonusfame = 0;
			wcradio setdamage 1;
		};

		case 57: {
			_missiontext = [_missionname, "Rescue a C130 pilot"];
			_group = createGroup west;
			_vehicle2 = "C130J_wreck_EP1" createvehicle _position;
			_vehicle = _group createUnit ["US_Pilot_Light_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_liberatehotage;
			_missiontype = "liberate";
			wcbonusfame = 0;
		};

		case 58: {
			_missiontext = [_missionname, "Retrieve an SU-34 aircraft"];
			_hangar = (nearestObjects [_position, ["Land_SS_hangar"], 400]) call BIS_fnc_selectRandom;
			_vehicle = "ACE_Su34" createvehicle position _hangar;
			_vehicle setdir (getdir _hangar + 180);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonusa10";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 59: {
			_missiontext = [_missionname, "Retrieve a Mi17"];
			_hangar = (nearestObjects [_position, ["Land_SS_hangar"], 400]) call BIS_fnc_selectRandom;
			_vehicle = "ACE_Mi17_RU" createvehicle position _hangar;
			_vehicle setdir (getdir _hangar + 180);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonusav8b";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 60: {
			_missiontext = [_missionname, "Retrieve an Mi24v"];
			_hangar = (nearestObjects [_position, ["Land_SS_hangar"], 400]) call BIS_fnc_selectRandom;
			_vehicle = "ACE_Mi24_V_FAB250_RU" createvehicle position _hangar;
			_vehicle setdir (getdir _hangar + 180);
			wcgarbage = [_vehicle] spawn WC_fnc_rob;
			_varname="bonusf35b";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_missiontype = "rob";
			wcbonusfame = 0;
		};

		case 61: {
			_missiontext = [_missionname, "Destroy a SU25"];
			_hangar = (nearestObjects [_position, ["Land_ss_hangar"], 400]) call BIS_fnc_selectRandom;
			_vehicle = "Su25_Ins" createvehicle position _hangar;
			_vehicle setdir (getdir _hangar + 180);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 62: {
			_missiontext = [_missionname, "Destroy a L39"];
			_hangar = (nearestObjects [_position, ["Land_ss_hangar"], 400]) call BIS_fnc_selectRandom;
			_vehicle = "L39_TK_EP1" createvehicle position _hangar;
			_vehicle setdir (getdir _hangar + 180);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
		};

		case 63: {
			_missiontext = [_missionname, "Defend an Oil Pump"];
			_vehicle = (nearestObjects [_position, ["Land_Ind_Oil_Pump_EP1"], 400]) call BIS_fnc_selectRandom;
			_vehicle setVehicleInit "this addAction ['<t color=''#ff4500''>Защитить барак</t>', 'warcontext\actions\WC_fnc_dobegindefend.sqf',[],6,false];";
			wcgarbage = [_vehicle] spawn WC_fnc_defend;
			processInitCommands;
			_missiontype = "defend";
			wcbonusfame = 0;
			wcradio setdamage 1;
		};

		case 64: {
			_missiontext = [_missionname, "Heal a civilian"];
			_type = ["RU_Assistant","RU_Citizen1","RU_Citizen2","RU_Citizen3","RU_Citizen4","RU_Policeman","RU_Profiteer1","RU_Profiteer2","RU_Profiteer3","RU_Profiteer4","RU_SchoolTeacher","RU_Villager1","RU_Villager2","RU_Villager3","RU_Villager4","RU_Woodlander1","RU_Woodlander2","RU_Woodlander3","RU_Woodlander4","RU_Worker1","RU_Worker2","RU_Worker3","RU_Worker4"] call BIS_fnc_selectRandom;
			_group = createGroup civilian;
			_vehicle = _group createUnit [_type, _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_heal;
			_missiontype = "heal";
			wcbonusfame = 0.1;
		};

		case 65: {
			_missiontext = [_missionname, "Destroy a fuel location"];
			_vehicle = (nearestObjects [_position, ["Land_Ind_FuelStation_Feed"], 400]) call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle, 0, 0.05] spawn WC_fnc_destroyvehicle;
			_missiontype = "destroy";
			wcbonusfame = 0;
		};

		case 66: {
			_missiontext = [_missionname, "Build a MASH"];
			_vehicle = "Land_Dirthump01" createvehicle _position;
			wcgarbage = [_vehicle, "MASH_EP1"] spawn WC_fnc_build;
			_missiontype = "build";
			wcbonusfame = 0.1;
		};

		case 67: {
			_missiontext = [_missionname, "Build a military hospital"];
			_vehicle = "Land_Dirthump01" createvehicle _position;
			wcgarbage = [_vehicle, "ins_WarfareBFieldhHospital"] spawn WC_fnc_build;
			_missiontype = "build";
			wcbonusfame = 0.1;
		};

		case 68: {
			_missiontext = [_missionname, "Build a radar"];
			_vehicle = "Land_Dirthump01" createvehicle _position;
			wcgarbage = [_vehicle, "ins_WarfareBAntiAirRadar"] spawn WC_fnc_build;
			_missiontype = "build";
			wcbonusfame = 0.1;
		};

		case 69: {
			_missiontext = [_missionname, "Build a service point"];
			_vehicle = "Land_Dirthump01" createvehicle _position;
			wcgarbage = [_vehicle, "ru_WarfareBVehicleServicePoint"] spawn WC_fnc_build;
			_missiontype = "build";
			wcbonusfame = 0.1;
		};

		case 70: {
			_missiontext = [_missionname, "Rescue 10 civilians"];
			_position = _position findEmptyPosition [10, wcdistance];
			if((count _position) == 0) then {
				diag_log "WARCONTEXT: NO FOUND EMPTY POSITION FOR CREATE MASH MISSION";
			};
			_vehicle = "MASH_EP1" createvehicle _position;
			wcgarbage = [_vehicle, 10] spawn WC_fnc_rescuecivil;
			_missiontype = "build";
			wcbonusfame = 0.1;
		};

		case 71: {
			_missiontext = [_missionname, "Secure an Airfield zone"];
			_vehicle = (nearestObjects [_position, ["Land_ss_hangar"], 400]) call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn WC_fnc_securezone;
			_missiontype = "secure";
			wcbonusfame = 0;
		};

		case 72: {
			_missiontext = [_missionname, "Secure an Oil Pump zone"];
			_vehicle = (nearestObjects [_position, ["Land_Ind_Oil_Pump_EP1"], 400]) call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn WC_fnc_securezone;
			_missiontype = "secure";
			wcbonusfame = 0;
		};

		case 73: {
			_missiontext = [_missionname,"Bring an ammo truck"];
			_vehicle = createVehicle ["ACE_UralReammo_RU", getmarkerpos "convoystart", [], 0, "NONE"];
			_varname = "ammotruck";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_unit = createVehicle ["ins_WarfareBBarracks", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, _unit] spawn WC_fnc_bringvehicle;
			_missiontype = "bring";
			wcbonusfame = 0;
		};

		case 74: {
			_missiontext = [_missionname,"Build a bunker"];
			_vehicle = "Land_Dirthump01" createvehicle _position;
			wcgarbage = [_vehicle, "Land_fortified_nest_big"] spawn WC_fnc_build;
			_missiontype = "build";
			wcbonusfame = 0.1;
		};

		case 75: {
			_missiontext = [_missionname,"Escort a medic on battlefield"];
			_group = createGroup civilian;
			_unit = _group createUnit ["Dr_Hladik_EP1", getmarkerpos "convoystart", [], 0, "NONE"];
			_unit setVehicleInit "this addAction ['<t color=''#ff4500''>Следуй за мной</t>', 'warcontext\actions\WC_fnc_dofollowme.sqf',[],6,false, true];";
			processinitcommands;
			_vehicle = createVehicle ["MASH_EP1", _position, [], 0, "NONE"];
			wcgarbage = [_unit, position _vehicle] spawn WC_fnc_bringunit;
			wcgarbage = [_unit] spawn WC_fnc_createmedic;
			_missiontype = "bringunit";
			wcbonusfame = 0;
		};

		case 76: {
			_missiontext = [_missionname,"Recording a conversation"];
			_group = createGroup east;
			_vehicle = _group createUnit ["ins_commander", _position, [], 0, "NONE"];
			_vehicle2 = _group createUnit ["gue_commander", _position, [], 0, "NONE"];
			wcgarbage = [_group] spawn WC_fnc_record;
			_missiontype = "record";
			wcbonusfame = 0;
		};

		case 77: {
			_missiontext = [_missionname, "Secure a Control Tower"];
			_vehicle = (nearestObjects [_position, ["Land_Mil_ControlTower_EP1", "Land_Mil_ControlTower"], 400]) call BIS_fnc_selectRandom;
			_position = position _vehicle;
			_group = createGroup west;
			{
				_unit = _group createUnit [_x, _position, [], 20, "NONE"];
			}foreach ["CZ_Special_Forces_Scout_DES_EP1","CZ_Special_Forces_MG_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_TL_DES_EP1"];
			wcgarbage = [_group, (position(leader _group)), 50] spawn WC_fnc_patrol;
			(leader _group) setVehicleInit "this addAction ['<t color=''#ff4500''>Заменить охрану</t>', 'warcontext\actions\WC_fnc_dobeginguard.sqf',[],6,false];";
			processInitCommands;
			wcgarbage = [_vehicle] spawn WC_fnc_defend;
			_missiontype = "defend";
			wcbonusfame = 0;			
		};

		case 100: {
			_missiontext = [_missionname," Kill the enemy leader"];
			_vehicle = imam;
			_vehicle addweapon "AKS_74";
			_vehicle addmagazine "30Rnd_545x39_AK";
			_vehicle addEventHandler ['Fired', '(_this select 0) setvehicleammo 1;'];
			_position = _position findEmptyPosition [3,100];
			if((count _position) == 0) then {
				diag_log "WARCONTEXT: NO FOUND EMPTY POSITION FOR CREATE LEADER MISSION";
				_position = _position findEmptyPosition [3, wcdistance];
			};
			_vehicle setpos _position;
			_vehicle setvehicleinit "this allowdammage true;";
			processInitCommands;
			wcgarbage = [group _vehicle, _position, wcdistance] spawn WC_fnc_patrol;
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			wcbonusfame = 0;
		};
	};

	_minute = [format["%1", (date select 4)]] call WC_fnc_feelwithzero;
	_hour = [format["%1", (date select 3)]] call WC_fnc_feelwithzero;
	_day = [format["%1", (date select 2)]] call WC_fnc_feelwithzero;
	_month = [format["%1", (date select 1)]] call WC_fnc_feelwithzero;

	_date = _hour + ":" + _minute + " " + _day  + "/" + _month + "/" + format["%1", (date select 0)];
	_missiontext = [_date]  + _missiontext;

	diag_log format ["WARCONTEXT: MISSION:%1 TYPE:%2 DESCRIPTION: %3", _missionnumber, _missiontype, _missiontext];

	// for debug purpose 
	wctarget = _vehicle;

	sleep 30;

	wcobjective = [wcobjectiveindex, _vehicle, _missionnumber, _missionname, _missiontext];
	["wcobjective", "client"] call WC_fnc_publicvariable;

	if(wcwithmarkerongoal == 2) then {
		"operationtext" setmarkerpos _position;
	};

	switch (_missiontype) do {
		case "eliminate": {
			_vehicle removeAllEventHandlers "HandleDamage";
			_vehicle addeventhandler ['HandleDamage', {
				if(isplayer (_this select 3)) then {
					(_this select 0) setdamage 1;
				};
			}];
			_vehicle addeventhandler ['killed', {
				wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
				["wcmessageW", "client"] call WC_fnc_publicvariable;
				wcmissionsuccess = true;
				wcleveltoadd = 1;
				wcfame = wcfame + wcbonusfame;
				wcenemyglobalelectrical = wcenemyglobalelectrical + wcbonuselectrical;
				wcenemyglobalfuel = wcenemyglobalfuel + wcbonusfuel;
				wcnuclearprobability = wcnuclearprobability + wcbonusnuclear;
			}];
		};

		case "ied": {
			_startposition = position _vehicle;
			sleep 10;
			waituntil {!(_vehicle getvariable "wciedactivate")};
			wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			["wcmessageW", "client"] call WC_fnc_publicvariable;
			wcmissionsuccess = true;
			wcleveltoadd = 1;
			wcfame = wcfame + wcbonusfame;
			wcenemyglobalelectrical = wcenemyglobalelectrical + wcbonuselectrical;
			wcenemyglobalfuel = wcenemyglobalfuel + wcbonusfuel;
			wcnuclearprobability = wcnuclearprobability + wcbonusnuclear;
		};

		case "jail": {
			_vehicle removeAllEventHandlers "HandleDamage";
			_vehicle addeventhandler ['HandleDamage', {
				private ["_distance"];
				if(isplayer (_this select 3)) then {
					//arcade = 1
					if(wckindofgame == 1) then {
						(_this select 0) setdamage (getdammage (_this select 0) + 0.1);
					} else {
						(_this select 0) setdamage 1;
					};
				};
			}];
		};

		case "sabotage": {

		};

		case "steal": {

		};

		case "rob": {

		};

		case "defend": {

		};

		case "build": {

		};

		case "secure": {

		};

		case "destroygroup" : {

		};

		case "bring" : {

		};

		case "bringunit" : {

		};
	};