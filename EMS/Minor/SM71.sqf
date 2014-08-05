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
	
				_vehicle = wcallcontroltowers call BIS_fnc_selectRandom;
				_position = position _vehicle;
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
diag_log "EMS: Minor mission created (SM71)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM71", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM71short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

			_missiontext = [_missionname, "Secure a Control Tower"];
			_vehicle = (nearestObjects [_position, ["Land_Mil_ControlTower_EP1", "Land_Mil_ControlTower"], 400]) call BIS_fnc_selectRandom;
						_vname = typeof _vehicle;
			_name = gettext (configFile >> "CfgVehicles" >> _vname >> "DisplayName");
			_picture = "\z\addons\dayz_code\pics\Land_Mil_ControlTower.paa";
_text = parseText format ["<t color='#FFCC33'>+4000 humanity</t><br/><br/><img size='5' image='%1'/><br/><br/><t color='#FFCC33'>Defend</t>", _picture];
[nil,nil,rHINT,_text] call RE;
			_position = position _vehicle;
			_group = createGroup west;
			{
				_unit = _group createUnit [_x, _position, [], 20, "NONE"];
			}foreach ["CZ_Special_Forces_Scout_DES_EP1","CZ_Special_Forces_MG_DES_EP1","CZ_Special_Forces_DES_EP1","CZ_Special_Forces_TL_DES_EP1"];
			wcgarbage = [_group, (position(leader _group)), 50] spawn WC_fnc_patrol;
			(leader _group) setVehicleInit "this addAction ['<t color=''#ff4500''>Change the guard</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dobeginguard.sqf',[],6,false];";
			processInitCommands;
			wcgarbage = [_vehicle] spawn WC_fnc_defend;
			_missiontype = "defend";
	

			
