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
diag_log "EMS: Minor mission created (SM68)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM68", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM68short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

			_missiontext = [_missionname,"Bring an ammo truck"];
			_vehicle = createVehicle ["KamazReammo", getmarkerpos "safezone", [], 0, "NONE"];
						_vname = typeof _vehicle;
			_name = gettext (configFile >> "CfgVehicles" >> _vname >> "DisplayName");
			_picture = "\z\addons\dayz_code\pics\kamazreammo.paa";
_text = parseText format ["<t color='#FFCC33'>+5000 humanity</t><br/><br/><img size='5' image='%1'/><br/><br/><t color='#FFCC33'>Bring a vehicle</t>", _picture];
[nil,nil,rHINT,_text] call RE;
			_vehicle setvariable ["Sarge",1,true];
			_varname = "ammotruck";
			_vehicle setvehicleinit format["this setvehiclevarname %1;", _varname];
			processinitcommands;
			_unit = createVehicle ["ins_WarfareBBarracks", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, _unit] spawn WC_fnc_bringvehicle;
			_missiontype = "bring";
	
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
			
