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
	
_vehicle = wcallhangars call BIS_fnc_selectRandom;
				_position = position _vehicle;
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
diag_log "EMS: Minor mission created (SM64)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM64", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM64short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

			_missiontext = [_missionname, "Destroy a L39"];
			_hangar = (nearestObjects [_position, ["Land_ss_hangar"], 400]) call BIS_fnc_selectRandom;
			_vehicle = "L39_TK_EP1" createvehicle position _hangar;
						_vname = typeof _vehicle;
			_name = gettext (configFile >> "CfgVehicles" >> _vname >> "DisplayName");
			_picture = "\z\addons\dayz_code\pics\L39_TK_EP1.paa";
_text = parseText format ["<t color='#FFCC33'>+1000 humanity</t><br/><br/><img size='5' image='%1'/><br/><br/><t color='#FFCC33'>Destroy</t>", _picture];
[nil,nil,rHINT,_text] call RE;
			_vehicle setdir (getdir _hangar + 180);
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			wcgarbage = [_vehicle] spawn WC_fnc_destroyvehicle;
			_vehicle setVehicleInit "this lock true;";
			processInitCommands;
			_missiontype = "destroy";
			
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
			
