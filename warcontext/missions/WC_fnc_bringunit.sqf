	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - bring unit to a position

	private [
		"_unit", 
		"_enemy", 
		"_targetpos", 
		"_missioncomplete"
	];

	_unit = _this select 0;
	_targetpos = _this select 1;
	_missioncomplete = false;
		wclastmissionposition = _position;
		wcmissionposition = _position;	
	while {!_missioncomplete} do {
        	sleep 1;
		if((!alive _unit) or (damage _unit > 0.9)) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM69end1", "PLAIN",6] call RE;
			wcmissionsuccess = true;
			_missioncomplete = true;
			{
			if ((isplayer _x) && (_x distance _unit < 400)) then {
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
		if(_targetpos distance position _unit < 50) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM69end2", "PLAIN",6] call RE;
			wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 1;
					{
			if ((isplayer _x) && (_x distance _unit < 400)) then {
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
	};