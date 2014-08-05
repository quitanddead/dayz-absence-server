private [
		"_vehicle", 
		"_location", 
		"_unit", 
		"_position2", 
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

private ["_position2","_dummymarker","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_position2 = wctownlocations call bis_fnc_selectrandom;
_marker3 = ['rescuezone2', wcdistance, _position2, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker2;
_marker3 = ['sidezone2', 100, _position2, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal2;
	_marker4 = ["bombzone2", _marker3] call WC_fnc_copymarkerlocal2;
	_marker4 setMarkerSizeLocal [300, 300];
	_position2 = ["sidezone2", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker2;
		while { format ["%1", _position2] ==  "[1,1,0]"} do {
		_position2 = ["sidezone2", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker2;
	};
diag_log "EMS: Major Mission Created (SM17)";

//Mission start
[nil,nil,rTitleText,localize "STR_MajorM17", "PLAIN",6] call RE;
missiontext = localize "STR_MajorM17short";
Ccoords = _position2;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";
			_vehicle = createVehicle ["Barrack2", _position2, [], 0, "NONE"];
			_vehicle setVariable ["Sarge",1,true];
			_vname = typeof _vehicle;
			_name = gettext (configFile >> "CfgVehicles" >> _vname >> "DisplayName");
			_picture = "\z\addons\dayz_code\pics\Barrack2.paa";
_text = parseText format ["<t color='#FFCC33'>+1000 humanity</t><br/><br/><img size='5' image='%1'/><br/><br/><t color='#FFCC33'>Destroy</t>", _picture];
[nil,nil,rHINT,_text] call RE;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle2;
			wcgarbage = [_position2] spawn WC_fnc_createstatic;
			// CREATE ENEMIES ON TARGET
_numberofgroup = 4;
		for "_x" from 1 to _numberofgroup step 1 do {
			wcgarbage = [_marker3, wcfactions call BIS_fnc_selectRandom, false] spawn WC_fnc_creategroup2;
			sleep 2;
		};
		_numberofvehicle = 3;
		// CREATE ENEMIES VEHICLES ON TARGET
		for "_x" from 1 to _numberofvehicle step 1 do {
			wcgarbage = [_marker3, (wcvehicleslistE call BIS_fnc_selectRandom), true] spawn WC_fnc_creategroup2;
			sleep 2;
		};
			_missiontype = "destroy";
			


