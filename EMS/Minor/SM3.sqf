//Bandit Stash House by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)

private ["_position","_wait","_MainMarker75","_marker"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
publicVariable "MissionGoMinor";
//_position =  [getMarkerPos "center",0,5000,10,0,20,0] call BIS_fnc_findSafePos;

_position = wctownlocations call bis_fnc_selectrandom;
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
diag_log "EMS: Minor mission created (SM3)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM3", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM3short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_baserunover = createVehicle ["Land_HouseV_1I3",[(_position select 0) +2, (_position select 1) +5,-0.3],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["Land_hut06",[(_position select 0) - 10, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["Land_hut06",[(_position select 0) - 7, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer = createVehicle ["HMMWV_DZ",[(_position select 0) + 10, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer2 = createVehicle ["UAZ_Unarmed_UN_EP1",[(_position select 0) - 25, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer3 = createVehicle ["SUV_Camo",[(_position select 0) + 25, (_position select 1) - 15,0],[], 0, "CAN_COLLIDE"];

_baserunover setVariable ["Sarge",1,true];
_baserunover2 setVariable ["Sarge",1,true];
_baserunover3 setVariable ["Sarge",1,true];
_hummer setVariable ["Sarge",1,true];
_hummer2 setVariable ["Sarge",1,true];
_hummer3 setVariable ["Sarge",1,true];
wcgarbage = [_baserunover] spawn WC_fnc_protectobject;
wcgarbage = [_position] spawn WC_fnc_createstatic;
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
_crate = createVehicle ["USVehicleBox",[(_position select 0) - 3, _position select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxes.sqf";
_crate setVariable ["permaLoot",true];

[[(_position select 0) - 20, (_position select 1) - 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 3;
[[(_position select 0) + 20, (_position select 1) + 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 3;

waitUntil{{isPlayer _x && _x distance _baserunover < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,localize "STR_MinorM3end", "PLAIN",6] call RE;
deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
publicVariable "MissionGoMinor";
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
waitUntil{isPlayer _x && _x distance _baserunover > 800 };
deletevehicle _baserunover;
deletevehicle _baserunover2;
deletevehicle _baserunover3;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
