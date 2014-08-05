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
	
_vehicle = wcallbaracks call BIS_fnc_selectRandom;
				_position = position _vehicle;
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
diag_log "EMS: Minor mission created (SM58)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM58", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM58short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

			_vehicle = (nearestObjects [_position, ["Land_Mil_Barracks_i"], 400]) call BIS_fnc_selectRandom;
						_vname = typeof _vehicle;
			_name = gettext (configFile >> "CfgVehicles" >> _vname >> "DisplayName");
			_picture = "\z\addons\dayz_code\pics\Land_Mil_Barracks_i.paa";
_text = parseText format ["<t color='#FFCC33'>+4000 humanity</t><br/><br/><img size='5' image='%1'/><br/><br/><t color='#FFCC33'>Defend</t>", _picture];
[nil,nil,rHINT,_text] call RE;
			_vehicle setVehicleInit "this addAction ['<t color=''#ff4500''>Defend the Barracks</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dobegindefend.sqf',[],6,false];";
			wcgarbage = [_vehicle] spawn WC_fnc_defend;
			processInitCommands;
			_missiontype = "defend";
			wcbonusfame = 0;
	

			
