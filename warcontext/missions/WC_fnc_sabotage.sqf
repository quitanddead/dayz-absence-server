	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - sabotage - mission file

	private [
		"_unit", 
		"_enemy", 
		"_enemy", 
		"_missioncomplete"
	];
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_unit = _this select 0;
	_unit setVehicleInit "this lock true;";
	_unit setvariable ["wcsabotage", false, true];
	_unit setVehicleInit "this lock true; this addAction ['<t color=''#ff4500''>Sabotage</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dosabotage.sqf',[],6,false];";
	processInitCommands;

	_missioncomplete = false;

	while {!_missioncomplete} do {
        	sleep 1;
		if(wcalert > 99) then {
			[nil,nil,rTitleText,localize "STR_MinorM39end1", "PLAIN",6] call RE;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			//wcmissionsuccess = true;
			{
			if (isplayer _x && _x distance _unit < 100) then {
	_humanityBoost = 3000;
	_humanity = _x getVariable ["humanity",0];
_humanity = _humanity - _humanityBoost;
_x setVariable["humanity", _humanity,true];
};
} foreach playableunits;
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
		if((!alive _unit) or (damage _unit > 0.9)) then {
			[nil,nil,rTitleText,localize "STR_MinorM39end2", "PLAIN",6] call RE;
			{
	if (isplayer _x && _x distance _unit < 100) then {
	_humanityBoost = 3000;
	_humanity = _x getVariable ["humanity",0];
_humanity = _humanity - _humanityBoost;
_x setVariable["humanity", _humanity,true];
};
} foreach playableunits;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			//wcmissionsuccess = true;
			_missioncomplete = true;
			_unit setdamage 1;
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
		if(_unit getvariable "wcsabotage") then {
			[nil,nil,rTitleText,localize "STR_MinorM39end3", "PLAIN",6] call RE;
						if (isplayer _x && _x distance _unit < 100) then {
	_humanityBoost = 3000;
	_humanity = _x getVariable ["humanity",0];
_humanity = _humanity + _humanityBoost;
_x setVariable["humanity", _humanity,true];
};
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			//wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 1;
			wcsabotagelist = wcsabotagelist + [(typeof _unit)];
			//wcfame = wcfame + wcbonusfame;
			//wcenemyglobalelectrical = wcenemyglobalelectrical + wcbonuselectrical;
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
	};

	sleep 60;

	deletevehicle _unit;
	