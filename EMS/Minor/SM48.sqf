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
		"_missiontext75",
		"_marker",
		"_count",
		"_watersafeposition"
		];

private ["_position","_wait","_MainMarker75"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
	
_position = wctownlocations call bis_fnc_selectrandom;
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
diag_log "EMS: Minor mission created (SM48)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM48", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM48short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

			_group = createGroup east;
			_type = ["RU_Assistant","RU_Citizen1","RU_Citizen2","RU_Citizen3","RU_Citizen4","RU_Policeman","RU_Profiteer1","RU_Profiteer2","RU_Profiteer3","RU_Profiteer4","RU_SchoolTeacher","RU_Villager1","RU_Villager2","RU_Villager3","RU_Villager4","RU_Woodlander1","RU_Woodlander2","RU_Woodlander3","RU_Woodlander4","RU_Worker1","RU_Worker2","RU_Worker3","RU_Worker4"] call BIS_fnc_selectRandom;
						_vname = _type;
			_name = gettext (configFile >> "CfgVehicles" >> _vname >> "DisplayName");
			switch _type do {
							case "RU_Assistant": {
							_picture = "\z\addons\dayz_code\pics\RU_Assistant.paa";	
						};
						case "RU_Citizen1": {
							_picture = "\z\addons\dayz_code\pics\RU_Citizen1.paa";
						};
						case "RU_Citizen2": {
							_picture = "\z\addons\dayz_code\pics\RU_Citizen2.paa";
						};
						case "RU_Citizen3": {
							_picture = "\z\addons\dayz_code\pics\RU_Citizen3.paa";
						};
						case "RU_Citizen4": {
							_picture = "\z\addons\dayz_code\pics\RU_Citizen4.paa";
						};
						case "RU_Policeman": {
							_picture = "\z\addons\dayz_code\pics\RU_Policeman.paa";
						};
						case "RU_Profiteer1": {
							_picture = "\z\addons\dayz_code\pics\RU_Profiteer1.paa";
						};
						case "RU_Profiteer2": {
							_picture = "\z\addons\dayz_code\pics\RU_Profiteer2.paa";
						};
						case "RU_Profiteer3": {
							_picture = "\z\addons\dayz_code\pics\RU_Profiteer3.paa";
						};
						case "RU_Profiteer4": {
							_picture = "\z\addons\dayz_code\pics\RU_Profiteer4.paa";
						};
						case "RU_SchoolTeacher": {
							_picture = "\z\addons\dayz_code\pics\RU_SchoolTeacher.paa";
						};
						case "RU_Villager1": {
							_picture = "\z\addons\dayz_code\pics\RU_Villager1.paa";
						};
						case "RU_Villager2": {
							_picture = "\z\addons\dayz_code\pics\RU_Villager2.paa";
						};
						case "RU_Villager3": {
							_picture = "\z\addons\dayz_code\pics\RU_Villager3.paa";
						};
						case "RU_Villager4": {
							_picture = "\z\addons\dayz_code\pics\RU_Villager4.paa";
						};
						case "RU_Woodlander1": {
							_picture = "\z\addons\dayz_code\pics\RU_Woodlander1.paa";
						};
						case "RU_Woodlander2": {
							_picture = "\z\addons\dayz_code\pics\RU_Woodlander2.paa";
						};
						case "RU_Woodlander3": {
							_picture = "\z\addons\dayz_code\pics\RU_Woodlander3.paa";
						};
						case "RU_Woodlander4": {
							_picture = "\z\addons\dayz_code\pics\RU_Woodlander4.paa";
						};
						case "RU_Worker1": {
							_picture = "\z\addons\dayz_code\pics\RU_Worker1.paa";
						};
						case "RU_Worker2": {
							_picture = "\z\addons\dayz_code\pics\RU_Worker2.paa";
						};
						case "RU_Worker3": {
							_picture = "\z\addons\dayz_code\pics\RU_Worker3.paa";
						};
						case "RU_Worker4": {
							_picture = "\z\addons\dayz_code\pics\RU_Worker4.paa";
						};
					};
_text = parseText format ["<t color='#FFCC33'>+2000 humanity</t><br/><br/><img size='5' image='%1'/><br/><br/><t color='#FFCC33'>Jail</t>", _picture];
[nil,nil,rHINT,_text] call RE;
			_vehicle = _group createUnit [_type, _position, [], 0, "NONE"];
			wcgarbage = [_vehicle] spawn WC_fnc_jail;
			_missiontype = "jail";

	
// CREATE ENEMIES ON TARGET
_numberofgroup = 4;
		for "_x" from 1 to _numberofgroup step 1 do {
			wcgarbage = [_marker, wcfactions call BIS_fnc_selectRandom, false] spawn WC_fnc_creategroup;
			sleep 2;
		};
		_numberofvehicle = 3;
		// CREATE ENEMIES VEHICLES ON TARGET
		for "_x" from 1 to _numberofvehicle step 1 do {
			wcgarbage = [_marker, (wcvehicleslistE call BIS_fnc_selectRandom), true] spawn WC_fnc_creategroup;
			sleep 2;
		};
			



