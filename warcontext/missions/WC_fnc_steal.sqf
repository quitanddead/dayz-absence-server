	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - steal an object

	private [
		"_find",
		"_unit", 
		"_enemy", 
		"_sabotage", 
		"_sabotage2", 
		"_missioncomplete"
	];

	_unit = _this select 0;
	_unit allowdammage false;
	_missioncomplete = false;
		wclastmissionposition = _position;
		wcmissionposition = _position;
	while {!_missioncomplete} do {
        	sleep 1;
		if(wcalert > 99) then {
			[nil,nil,rTitleText,localize "STR_MinorM41end1", "PLAIN",10] call RE;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			{
			if (isplayer _x && _x distance _unit < 100) then {
	_humanityBoost = 3000;
	_humanity = _x getVariable ["humanity",0];
_humanity = _humanity - _humanityBoost;
_x setVariable["humanity", _humanity,true];
};
}foreach playableunits;
			wcmissionsuccess = true;
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
wcalert = 0;
		};

		_enemy = nearestObjects [_unit, ["All"], 2];
		_find = false;
		{
			if(isplayer _x) then {
				_find = true;
			};
		}foreach _enemy;

		if(_find) then {
			[nil,nil,rTitleText,localize "STR_MinorM41end2", "PLAIN",10] call RE;
			{
						if (isplayer _x && _x distance _unit < 100) then {
	_humanityBoost = 3000;
	_humanity = _x getVariable ["humanity",0];
_humanity = _humanity + _humanityBoost;
_x setVariable["humanity", _humanity,true];
};
}foreach playableunits;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			wcmissionsuccess = true;
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
wcalert = 0;
			//wcleveltoadd = 1;
		};
	};

	sleep 4;

	deletevehicle _unit;
	