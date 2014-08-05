	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - defend an area

	private [
		"_arrayofvehicle", 
		"_count", 
		"_countdead", 
		"_counter",
		"_delta",
		"_object", 
		"_markerdest", 
		"_missioncomplete", 
		"_position", 
		"_scriptinit", 
		"_timer", 
		"_units",
		"_vehicle"
	];
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_object = _this select 0;

	_missioncomplete = false;
	_timer = 300 + random (600);
	_count = 0;
	_countdead = 0;
	_counter = 0;
	_delta = wcnumberofkilledofmissionW;

	_markerdest = [format['defendzone%1', wcdefendzoneindex], 300, position _object, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	wcdefendzoneindex = wcdefendzoneindex  + 1;

	//for "_x" from 0 to floor(random 2) step 1 do {
		_position = (position _object) findEmptyPosition [5, 100];
		if(count _position == 0) then {
			diag_log "WARCONTEXT: NO FOUND EMPTY POSITION FOR CREATE FRIENDLY DEFEND GROUP";
		};

		_type = ["T72_RU", "ACE_T90A"] call BIS_fnc_selectRandom;
		_arrayofvehicle =[ _position, 0, _type, west] call BIS_fnc_spawnVehicle;
		_vehicle 	= _arrayofvehicle select 0;
		_arrayofpilot 	= _arrayofvehicle select 1;
		_group 		= _arrayofvehicle select 2;
		wcgarbage = [_vehicle, _markerdest, 'showmarker'] execVM '\z\addons\dayz_server\extern\ups.sqf';
		processInitCommands;
	//};

	wcbegindefend = false;
	waituntil {wcbegindefend};
wclevelmaxincity = 10;
	for "_x" from 0 to ceil(random wclevelmaxincity) step 1 do {
		_position = [_position, 500, 700] call WC_fnc_createpositionaround;
		_position = _position findEmptyPosition [5, 100];
		wcgarbage = [_position, _markerdest, (wcfactions call BIS_fnc_selectRandom), false] spawn WC_fnc_creategroupdefend;
		sleep 1;
	};

	for "_x" from 0 to ceil(random wclevelmaxincity) step 1 do {
		_position = [_position, 500, 700] call WC_fnc_createpositionaround;
		_position = _position findEmptyPosition [5, 100];
		wcgarbage = [_position, _markerdest, (wcvehicleslistE call BIS_fnc_selectRandom), true] spawn WC_fnc_creategroupdefend;
		sleep 1;
	};

	while {!_missioncomplete} do {
        	sleep 1;
		_timer = _timer - 1;
		_countdead = _countdead + 1;
		if(_timer < 1) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM57end1", "PLAIN",6] call RE;
			{
			if ((isplayer _x) && (_x distance _object < 200)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 4000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity + _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
		}foreach playableunits;
			//wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 1;
				deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
		};
		if((wcnumberofkilledofmissionW - _delta) > (playersNumber west)) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", "Слишком большие потери"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM57end2", "PLAIN",6] call RE;
			//wcmissionsuccess = true;
			_missioncomplete = true;
				deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
		};
	
{
	_counter = _counter + 1;
	if ((side _x == east) && (alive _x) && (_x distance _object < 20) && (_counter > 5)) then {
	       _counter = 0;	
		_object setdamage 1;
	};
} foreach allunits;
		if(!(alive _object) or (damage _object > 0.8)) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", "Объект уничтожен"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM57end3", "PLAIN",6] call RE;
						{
			if ((isplayer _x) && (_x distance _object < 200)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 4000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity - _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
} foreach playableunits;
			//wcmissionsuccess = true;
			_missioncomplete = true;
			_vehicle setdamage 1;	
				deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";		
		};

		_units = nearestObjects[_object,["Man"], 1000];
		if ((west countside _units) < (ceil((playersNumber west) * 0.2))) then {
			_count = _count + 1;
		};
		if((_count == 60) or (_count == 120))then {
			//wcmessageW = ["Commandement", "Все игроки должны оставаться в зоне!"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM57allp", "PLAIN",6] call RE;
		};
		if (_count > 180) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", "Слишком много игроков вне зоны"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM57out", "PLAIN",6] call RE;
			//wcmissionsuccess = true;
			_missioncomplete = true;
				deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
		};
		if (_countdead > 60) then {
			_countdead = 0;
			//wcmessageW = [format["Осталось %1 минут", floor(_timer / 60)], format["%1/%2 игроков умерло", (wcnumberofkilledofmissionW - _delta), (playersNumber west)]];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			//titletext [[format["Still %1 minutes�", floor(_timer / 60)], format["%1/%2 players died", (wcnumberofkilledofmissionW - _delta), (playersNumber west)]],"PLAIN",6];
			[nil,nil,rTitleText,format["Still %1 minutes�", floor(_timer / 60)], "PLAIN",6] call RE;
			sleep 6;
			[nil,nil,rTitleText,format["%1/%2 players died", (wcnumberofkilledofmissionW - _delta), (playersNumber west)], "PLAIN",6] call RE;
			// if less than 2 members lefts (base on uaz members number), we consider we should send new reinforcment

			{
				if(count (units _x) < 2) then {
					wcdefendgroup = wcdefendgroup - [_x];
				};
			}foreach wcdefendgroup;

			while { (count wcdefendgroup < wclevelmaxincity) } do {
				_position = [_position, 700, 1000] call WC_fnc_createpositionaround;
				_position = _position findEmptyPosition [5, 100];

				if(random 1 > 0.5) then {
					wcgarbage = [_position, _markerdest, (wcfactions call BIS_fnc_selectRandom), false] spawn WC_fnc_creategroupdefend;
				} else {
					if(wcwithenemyvehicle == 0) then {
						wcgarbage = [_position, _markerdest, (wcvehicleslistE call BIS_fnc_selectRandom), true] spawn WC_fnc_creategroupdefend;
					};
				};
				sleep 4;
			};
		};
	};