//Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)??
??
private ["_wait","_MainMarker75","_position","_marker"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMinor.sqf";
WaitUntil {MissionGoMinor == 1};
??
//_position = [getMarkerPos "center",0,5500,2,0,2000,0] call BIS_fnc_findSafePos;??
??
_position = wctownlocations call bis_fnc_selectrandom;
diag_log "EMS: Minor mission created (SM1)";
_marker = ['rescuezone', wcdistance, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker;
_marker = ['sidezone', 100, _position, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	_marker2 = ["bombzone", _marker] call WC_fnc_copymarkerlocal;
	_marker2 setMarkerSizeLocal [300, 300];
	_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
		while { format ["%1", _position] ==  "[1,1,0]"} do {
		_position = ["sidezone", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker;
	};
//Mission start??
[nil,nil,rTitleText,localize "STR_MinorM1", "PLAIN",10] call RE;
missiontext75 = localize "STR_MinorM1short";
MCoords = _position;
//_position = Mcoords;
publicVariable "MCoords";
[] execVM "debug\addmarkers75.sqf";

_hummer = createVehicle ["UAZ_Unarmed_UN_EP1",[(_position select 0) + 10, (_position select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_hummer setVariable ["Sarge",1,true];
wcgarbage = [_hummer] spawn WC_fnc_protectobject;
wcgarbage = [_position] spawn WC_fnc_createstatic;
// CREATE ENEMIES ON TARGET??
_numberofgroup = 4;
		for "_x" from 1 to _numberofgroup step 1 do {
			wcgarbage = [_marker, wcfactions call BIS_fnc_selectRandom, false] spawn WC_fnc_creategroup;
			sleep 2;
		};
		_numberofvehicle = 3;
		// CREATE ENEMIES VEHICLES ON TARGET??
		for "_x" from 1 to _numberofvehicle step 1 do {
			wcgarbage = [_marker, (wcvehicleslistE call BIS_fnc_selectRandom), true] spawn WC_fnc_creategroup;
			sleep 2;
		};
[_position,80,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards??
sleep 5;
[_position,80,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards??
sleep 5;
[_position,80,4,2,1] execVM "\z\addons\dayz_server\EMS\add_unit_server2.sqf";//AI Guards??
sleep 1;

waitUntil{({alive _x} count (units SniperTeam)) < 1};

//Mission completed??
[nil,nil,rTitleText,localize "STR_MinorM1end", "PLAIN",6] call RE;
deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
