//Hillbilly mission  Created by TheSzerdi Edited by Falcyn [QF]

private ["_position","_iArray","_nearby","_index","_num","_itemType","_itemChance","_weights","_wait","_dummymarker","_marker"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
publicVariable "MissionGoMinor";
	

//_position =  [getMarkerPos "center",0,7000,10,0,20,0] call BIS_fnc_findSafePos;
_position = wctownlocations call bis_fnc_selectrandom;
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
diag_log "EMS: Minor mission created (SM9)";

//Mission start
[nil,nil,rTitleText,localize "STR_MinorM9", "PLAIN",6] call RE;
_nul = [objNull, player, rSAY, "hillbilly"] call RE;
[] execVM "debug\hillbilly.sqf";
missiontext75 = localize "STR_MinorM9short";
MCoords = _position;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

baserunover = createVehicle ["land_housev_1i4",[(_position select 0) +2, (_position select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
baserunover2 = createVehicle ["land_kbud",[(_position select 0) - 10, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
baserunover3 = createVehicle ["land_kbud",[(_position select 0) - 7, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
wcgarbage = [baserunover] spawn WC_fnc_protectobject;
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
[[(_position select 0) - 20, (_position select 1) - 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 3;
[[(_position select 0) + 20, (_position select 1) + 15,0],40,4,2,0] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards
sleep 3;

if (isDedicated) then {

	_num = round(random 5) + 3;
	_itemType =		[["SCAR_H_LNG_Sniper","weapon"], ["SCAR_H_LNG_Sniper_SD","weapon"], ["FN_FAL", "weapon"], ["bizon_silenced", "weapon"], ["M14_EP1", "weapon"], ["BAF_AS50_scoped", "weapon"], ["MakarovSD", "weapon"], ["Mk_48_DZ", "weapon"], ["M249_DZ", "weapon"], ["DMR", "weapon"], ["", "military"], ["", "medical"], ["MedBox0", "object"], ["NVGoggles", "weapon"], ["AmmoBoxSmall_556", "object"], ["AmmoBoxSmall_762", "object"], ["Skin_Sniper1_DZ", "magazine"]];
	_itemChance =	[0.08, 									0.08,										0.02,					 0.05,							 0.05, 					0.01, 				0.03, 						0.02, 					0.03, 				0.05, 				0.1, 				0.1, 			0.2, 						0.07, 					0.01, 							0.08, 							 0.05];
	
	waituntil {!isnil "fnc_buildWeightedArray"};
	
	_weights = [];
	_weights = 		[_itemType,_itemChance] call fnc_buildWeightedArray;
	//diag_log ("DW_DEBUG: _weights: " + str(_weights));	
	for "_x" from 1 to _num do {
		//create loot
		_index = _weights call BIS_fnc_selectRandom;
		sleep 1;
		if (count _itemType > _index) then {
			//diag_log ("DW_DEBUG: " + str(count (_itemType)) + " select " + str(_index));
			_iArray = _itemType select _index;
			_iArray set [2,_position];
			_iArray set [3,5];
			_iArray call spawn_loot;
			_nearby = _position nearObjects ["WeaponHolder",20];
			{
				_x setVariable ["permaLoot",true];
			} forEach _nearBy;
		};
	};
};

waitUntil{{isPlayer _x && _x distance baserunover < 30  } count playableunits > 0}; 

//Mission completed
[nil,nil,rTitleText,localize "STR_MinorM9end", "PLAIN",6] call RE;
deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
publicVariable "MissionGoMinor";
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
