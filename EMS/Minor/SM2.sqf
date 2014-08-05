//Medical Outpost by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
//edited for [EMS] by Fuchs

private ["_position","_wait","_MainMarker75","_marker"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};

//_position =  [getMarkerPos "center",0,5500,10,0,20,0] call BIS_fnc_findSafePos;
_position = wctownlocations call bis_fnc_selectrandom;
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
diag_log "EMS: Minor mission created (SM2)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM2", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM2short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_baserunover = createVehicle ["US_WarfareBFieldhHospital_Base_EP1",[(_position select 0) +2, (_position select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
_baserunover1 = createVehicle ["MASH_EP1",[(_position select 0) - 24, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover2 = createVehicle ["MASH_EP1",[(_position select 0) - 17, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover3 = createVehicle ["MASH_EP1",[(_position select 0) - 10, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover4 = createVehicle ["UAZ_Unarmed_UN_EP1",[(_position select 0) + 10, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover5 = createVehicle ["HMMWV_DZ",[(_position select 0) + 15, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_baserunover6 = createVehicle ["SUV_Camo",[(_position select 0) + 25, (_position select 1) - 15,0],[], 0, "CAN_COLLIDE"];

_baserunover setVariable ["Sarge",1,true];
_baserunover1 setVariable ["Sarge",1,true];
_baserunover2 setVariable ["Sarge",1,true];
_baserunover3 setVariable ["Sarge",1,true];
_baserunover4 setVariable ["Sarge",1,true];
_baserunover5 setVariable ["Sarge",1,true];
_baserunover6 setVariable ["Sarge",1,true];
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
[_crate] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesM.sqf";
_crate setVariable ["permaLoot",true];

_crate2 = createVehicle ["USLaunchersBox",[(_position select 0) - 8, _position select 1,0],[], 0, "CAN_COLLIDE"];
[_crate2] execVM "\z\addons\dayz_server\EMS\misc\fillBoxesS.sqf";
_crate2 setVariable ["permaLoot",true];


[[(_position select 0) - 20, (_position select 1) - 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 3;
[[(_position select 0) + 10, (_position select 1) + 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 3;
[[(_position select 0) - 10, (_position select 1) - 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 3;
[[(_position select 0) + 20, (_position select 1) + 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server.sqf";//AI Guards
sleep 3;

waitUntil{{isPlayer _x && _x distance _baserunover < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,localize "STR_MinorM2end", "PLAIN",6] call RE;
deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
waitUntil{isplayer _x && _x distance _baserunover > 800};
deletevehicle _baserunover;
deletevehicle _baserunover1;
deletevehicle _baserunover2;
deletevehicle _baserunover3;
deletevehicle _baserunover4;
deletevehicle _baserunover5;
deletevehicle _baserunover6;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
