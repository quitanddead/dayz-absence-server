	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - Heal a civilian

	private [
		"_arrayofpos", 
		"_buildings", 
		"_index",
		"_enemy", 
		"_enemys",
		"_missioncomplete", 
		"_position", 
		"_unit"
		];
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_unit = _this select 0;

	_arrayofpos = [];
	_missioncomplete = false;

	_unit setvariable ["wcprotected", true];
	_unit setcaptive true;
	_unit allowFleeing 0;
	_unit setUnitPos "Up"; 
	dostop _unit;
	removeallweapons _unit;

	_buildings = nearestObjects [position _unit, ["House"], 350];
	{
		if(getdammage _x == 0) then {
			_index = 0;
			while { format ["%1", _x buildingPos _index] != "[0,0,0]" } do {
				_position = _x buildingPos _index;
				_arrayofpos = _arrayofpos + [_position];
				_index = _index + 1;
				sleep 0.05;
			};
		};
	}foreach _buildings;

	_position = _arrayofpos call BIS_fnc_selectRandom;

	_unit setpos _position;
	_unit setdamage 0.9;
	processInitCommands;

	_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
	_unit setvariable ["wchostage", true, true];

	wcgarbage = [_unit] spawn {
		private ["_unit"];
		_unit = _this select 0;
		while { ((alive _unit) and (_unit getvariable "wchostage")) } do {
			wchostage = _unit;
			["wchostage", "client"] call WC_fnc_publicvariable;
			sleep (5 + random (15));
		};
	};

	while {!_missioncomplete} do {
		if(!alive _unit) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM65end1", "PLAIN",6] call RE;
			wcmissionsuccess = true;
			_missioncomplete = true;
			{
			if ((isplayer _x) && (_x distance _unit < 200)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 2000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity - _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
		}foreach playableunits;
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
		};
		if(getdammage _unit < 0.1) then {
			_unit setvariable ["wchostage", false, true];
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 1;
			_enemy = true;
			[nil,nil,rTitleText,localize "STR_MinorM65end2", "PLAIN",6] call RE;
			{
			if ((isplayer _x) && (_x distance _unit < 200)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 2000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity + _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
		}foreach playableunits;
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
		};

        	sleep 1;
	};

	sleep 120;

	_unit setdamage 1;
	deletevehicle _unit;
