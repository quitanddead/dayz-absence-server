//Medical Supply Camp by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
//Edited for EMS by Fuchs

private ["_position2","_MainMarker","_base","_wait"];
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
diag_log "EMS: Major Mission Created (SM3)";

//Mission start
[nil,nil,rTitleText,localize "STR_MajorM3", "PLAIN",10] call RE;
missiontext = localize "STR_MajorM3short";
Ccoords = _position2;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";

_baserunover = createVehicle ["land_fortified_nest_big",[(_position2 select 0) - 20, (_position2 select 1) - 10,-0.2],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_Fort_Watchtower",[(_position2 select 0) - 10, (_position2 select 1) + 10,-0.2],[], 0, "CAN_COLLIDE"];
_hummer = createVehicle ["HMMWV_DZ",[(_position2 select 0) + 25, (_position2 select 1) - 5,0],[], 0, "CAN_COLLIDE"];

_baserunover2 setVariable ["Sarge",1,true];
_baserunover setVariable ["Sarge",1,true];
_hummer setVariable ["Sarge",1,true];
wcgarbage = [_baserunover] spawn WC_fnc_protectobject;
wcgarbage = [_position2] spawn WC_fnc_createstatic;
// CREATE ENEMIES ON TARGET
_numberofgroup = 4;
		for "_x" from 1 to _numberofgroup step 1 do {
			wcgarbage = [_marker3, wcfactions call BIS_fnc_selectRandom, false] spawn WC_fnc_creategroup;
			sleep 2;
		};
		_numberofvehicle = 3;
		// CREATE ENEMIES VEHICLES ON TARGET
		for "_x" from 1 to _numberofvehicle step 1 do {
			wcgarbage = [_marker3, (wcvehicleslistE call BIS_fnc_selectRandom), true] spawn WC_fnc_creategroup;
			sleep 2;
		};
_crate = createVehicle ["USVehicleBox",[(_position2 select 0) + 5, (_position2 select 1),0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesM.sqf";
_crate setVariable ["permaloot",true];


_crate2 = createVehicle ["USLaunchersBox",[(_position2 select 0) + 12, _position2 select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];

_aispawn = [_position2,80,6,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_position2,40,4,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 5;
_aispawn = [_position2,40,4,3,1] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards

waitUntil{{isPlayer _x && _x distance _baserunover < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,localize "STR_MajorM3end", "PLAIN",6] call RE;
deletemarker "rescuezone2";
deletemarkerlocal "sidezone2";
deletemarkerlocal "bombzone2";
[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
