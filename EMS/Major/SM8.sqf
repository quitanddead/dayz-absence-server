//Aircraft crash sidemission Created by TheSzerdi Edited by Falcyn [QF]
//Edited for EMS by Fuchs

private ["_position2","_dummymarker","_wait"];
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
diag_log "EMS: Major Mission Created (SM8)";

//Mission start
[nil,nil,rTitleText,localize "STR_MajorM8", "PLAIN",6] call RE;
missiontext = localize "STR_MajorM8short";
Ccoords = _position2;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

c130wreck = createVehicle ["C130J_wreck_EP1",[(_position2 select 0) + 30, (_position2 select 1) - 5,0],[], 0, "NONE"];

_crate = createVehicle ["USVehicleBox",[(_position2 select 0) - 10, _position2 select 1,0],[], 0, "NONE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes1.sqf";
_crate setVariable ["permaLoot",true];
wcgarbage = [_crate] spawn WC_fnc_protectobject;
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
_crate2 = createVehicle ["USVehicleBox",[(_position2 select 0) - 10, (_position2 select 1) - 10,0],[], 0, "NONE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesM.sqf";
_crate2 setVariable ["permaloot",true];


_aispawn = [[(_position2 select 0) + 2, _position2 select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_position2 select 0) + 2, _position2 select 1,0],80,6,6,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_position2 select 0) + 2, _position2 select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [[(_position2 select 0) + 2, _position2 select 1,0],40,4,4,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance c130wreck < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,localize "STR_MajorM8end", "PLAIN",6] call RE;
deletemarker "rescuezone2";
deletemarkerlocal "sidezone2";
deletemarkerlocal "bombzone2";
[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
