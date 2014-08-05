	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - bring vehicle to a position

	private [
		"_unit", 
		"_enemy", 
		"_startpos", 
		"_missioncomplete"
	];
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_unit = _this select 0;
	_startpos = position (_this select 1);
	_missioncomplete = false;

	_unit setdamage floor(0.1 + random 0.7);
	_unit setVehicleInit "this setfuel 0;";
	processInitCommands;
	
	while {!_missioncomplete} do {
        	sleep 1;
		if((!alive _unit) or (damage _unit > 0.9)) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM68end1", "PLAIN",6] call RE;	
			wcmissionsuccess = true;
			_missioncomplete = true;
			{
			if ((isplayer _x) && (_x distance _unit < 400)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 5000;
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
		if(_startpos distance position _unit < 100) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM68end2", "PLAIN",6] call RE;
						{
			if ((isplayer _x) && (_x distance _unit < 400)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 5000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity + _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
		}foreach playableunits;
			wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 1;
			//wcenemyglobalfuel = wcenemyglobalfuel + wcbonusfuel;
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
		if(isplayer (driver _unit)) then {
			if(fuel _unit < 0.1) then {
				_unit setVehicleInit "this setfuel 1;";
				processInitCommands;
			};
		};
	};