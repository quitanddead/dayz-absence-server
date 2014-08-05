//Firebase mission Created by TheSzerdi Edited by Falcyn [QF]
//Modified by Mimic for Epoch Mission System

private ["_position2","_dummymarker","_base","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

//_position2 = [getMarkerPos "center",0,5500,50,0,20,0] call BIS_fnc_findSafePos;
_position2 = wctownlocations call bis_fnc_selectrandom;
_marker3 = ['rescuezone2', wcdistance, _position2, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker2;
_marker3 = ['sidezone2', 100, _position2, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal2;
	_marker4 = ["bombzone2", _marker3] call WC_fnc_copymarkerlocal2;
	_marker4 setMarkerSizeLocal [300, 300];
	_position2 = ["sidezone2", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker2;
		while { format ["%1", _position2] ==  "[1,1,0]"} do {
		_position2 = ["sidezone2", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker2;
	};
diag_log "EMS: Major Mission Created (SM9)";

//Mission accomplished
[nil,nil,rTitleText,localize "STR_MajorM9", "PLAIN",6] call RE;
missiontext = localize "STR_MajorM9short";
Ccoords = _position2;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_base = ["land_fortified_nest_big","Land_Fort_Watchtower"] call BIS_fnc_selectRandom;
baserunover = createVehicle [_base,[(_position2 select 0) - 20, (_position2 select 1) - 10,-0.2],[], 0, "NONE"];
wcgarbage = [baserunover] spawn WC_fnc_protectobject;
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
_crate = createVehicle ["USLaunchersBox",[(_position2 select 0) + 2, (_position2 select 1),0],[], 0, "NONE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillConstructionMajor.sqf";
_crate setVariable ["permaLoot",true];

_aispawn = [_position2,20,3,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 2;
_aispawn = [_position2,40,3,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 2;
_aispawn = [_position2,60,4,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards
sleep 2;
_aispawn = [_position2,80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server3.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance baserunover < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,localize "STR_MajorM9end", "PLAIN",6] call RE;
deletemarker "rescuezone2";
deletemarkerlocal "sidezone2";
deletemarkerlocal "bombzone2";
[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
