	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - liberate hotage -  side mission
	// locality: server side

	private [
		"_arrayofpos", 
		"_buildings", 
		"_index",
		"_enemy", 
		"_enemys",
		"_missioncomplete", 
		"_position", 
		"_unit", 
		"_vehicle", 
		"_vehicle2"
		];

	_unit = _this select 0;
	_unit setVehicleInit "this addAction ['<t color=''#ffcb00''>follow me</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dofollowme.sqf',[],6,false, true];";
	processInitCommands;
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_arrayofpos = [];
	_missioncomplete = false;

	_unit setvariable ["wcprotected", true];
	_unit setcaptive true;
	_unit allowFleeing 0;
	_unit setUnitPos "Up"; 
	removeallweapons _unit;

	_arrayofpos = [position _unit, "all"] call WC_fnc_gethousespositions;
	_position = _arrayofpos call BIS_fnc_selectRandom;

	_unit setpos _position;
	_unit setdamage 0;
	_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	_unit setvariable ["wchostage", true, true];
	_unit stop true;

	_group = createGroup east;
	_vehicle = _group createUnit [(wcspecialforces call BIS_fnc_selectRandom), position _unit, [], 1, "NONE"];
	_vehicle2 = _group createUnit [(wcspecialforces call BIS_fnc_selectRandom), position _unit, [], 8, "NONE"];

	_vehicle allowdammage false;
	_vehicle2 allowdammage false;

	wcgarbage = [_group] spawn WC_fnc_grouphandler;
	wcgarbage = [_group, (position(leader _group)), 30] spawn WC_fnc_patrol;

	wcgarbage = [_vehicle] spawn WC_fnc_dosillything;
	wcgarbage = [_vehicle2] spawn WC_fnc_dosillything;

	sleep 10;
	
	_vehicle allowdammage true;
	_vehicle2 allowdammage true;

	wcgarbage = [_unit] spawn {
		private ["_unit"];
		_unit = _this select 0;
		while { ((alive _unit) and (_unit getvariable "wchostage")) } do {
			wchostage = _unit;
			publicVariable "wchostage";
			//["wchostage", "client"] call WC_fnc_publicvariable;
			sleep (5 + random (15));
		};
	};
//	if(_x getvariable "wchostage") then {
//						_countscream = _countscream + 1;
//						if(_countscream > 20) then {
//							_countscream = 0;
//							if(_x distance player < 20) then {
//								playsound "help1";
//							} else {
//								if(_x distance player < 60) then {
//									playsound "help2";
//								} else {
//									if(_x distance player < 100) then {
//										playsound "help3";
//									};
//								};
//							};
//						};
//					};
//					
//if((!alive _unit) or (damage _unit > 0.7)) then {
//	[nil,nil,rTitleText,"������ ��������� - �������� ����", "PLAIN",6] call RE;
//};

//if((getmarkerpos "safezone") distance _unit < 100) then {
//	[nil,nil,rTitleText,"������ ��������� - �������� � ������������", "PLAIN",6] call RE;
//};
		_missioncomplete = false;
	while {!_missioncomplete} do {
		if((!alive _unit) or (damage _unit > 0.7)) then {
			[nil,nil,rTitleText,localize "STR_MinorM36end1", "PLAIN",6] call RE;
			{
			if (isplayer _x && _x distance _unit < 100) then {
				_humanityBoost = 2000;
	_humanity = _x getVariable ["humanity",0];
_humanity = _humanity - _humanityBoost;
_x setVariable["humanity", _humanity,true];
};
} foreach playableunits;
	deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
wcalert = 0;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			_missioncomplete = true;
		};
		if((getmarkerpos "safezone") distance _unit < 100) then {
			_unit setvariable ["wchostage", false, true];
			[nil,nil,rTitleText,localize "STR_MinorM36end2", "PLAIN",6] call RE;
			{
			if (isplayer _x && _x distance _unit < 100) then {
				_humanityBoost = 2000;
	_humanity = _x getVariable ["humanity",0];
_humanity = _humanity + _humanityBoost;
_x setVariable["humanity", _humanity,true];
};
} foreach playableunits;
	deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
wcalert = 0;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			_missioncomplete = true;
			_enemy = true;
		};

        	sleep 1;
	};

	sleep 120;

	_unit setdamage 1;
	_vehicle setdamage 1;
	_vehicle2 setdamage 1;

	deletevehicle _unit;
	deletevehicle _vehicle;
	deletevehicle _vehicle2;
