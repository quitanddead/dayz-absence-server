	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - rescue some civils

	private [
		"_unit", 
		"_enemy", 
		"_enemy", 
		"_missioncomplete",
		"_typeof",
		"_position",
		"_civilrescue",
		"_civilrescuenumber",
		"_civils",
		"_civil",
		"_group",
		"_type",
		"_vehicle",
		"_vehicles",
		"_count",
		"_number",
		"_counter",
		"_dcivils"
	];
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_unit = _this select 0;
	_number = _this select 1;

	_civils = [];
	_civilrescue = [];
	_civilrescuenumber = 0;

	_missioncomplete = false;

	_group = creategroup civilian;
	for "_i" from 1 to _number do {
		_type = wcrescuecivils call BIS_fnc_selectRandom;
		_civil = _group createUnit [_type, position _unit, [], 5, "FORM"];
		_civil setVehicleInit "this addAction ['<t color=''#ffcb00''>Hands UP</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dohandsup.sqf',[],6,false, true];";
		_civil setVehicleInit "this addAction ['<t color=''#ffcb00''>Follow me</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dofollowme.sqf',[],6,false, true];";
		_civil setVehicleInit "this addAction ['<t color=''#ffcb00''>Search civilian</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dosearchsomeone.sqf',[],6,false, true];";
		processInitCommands;
		_civil stop true;
		_civil setcaptive true;
		sleep 0.5;
	};

	_civils = units _group;
	_dcivils = 0;
	_group allowFleeing 0;

	wcgarbage = [_group] spawn WC_fnc_civilhandler;	

	_counter = 20;
	while {!_missioncomplete} do {
		if (player distance _unit < 50) then {
			_civil setcaptive false;
		};
		_count = 0;
		{
			if(_x distance getmarkerpos "safezone" < 100) then {
				_x domove getmarkerpos "safezone";
				_count = _count + 1;
			};
			if!(alive _x) then {
				_civils = _civils - [_x];
				_dcivils = _dcivils + 1;
			};
		}foreach _civils;

		if(_count == count _civils) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM66end1", "PLAIN",6] call RE;
			{
			if ((isplayer _x) && (_x distance _civil < 200)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 1000 * (count _civils);
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity + _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
		}foreach playableunits;
			wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 1;
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
sleep 30;
_unit setdamage 1;
deletevehicle _unit;
{
_x setdamage 1;
deletevehicle _x;
} foreach _civils;
wcalert = 0;
		};

		if(count _civils < floor(0.80 * _number)) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM66end2", "PLAIN",6] call RE;
			{
			if ((isplayer _x) && (_x distance _civil < 200)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 1000 * _dcivils;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity - _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
		}foreach playableunits;
			wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 0;
			deletemarker "rescuezone";
deletemarkerlocal "sidezone";
deletemarkerlocal "bombzone";
[] execVM "debug\remmarkers75.sqf";
MissionGoMinor = 0;
MCoords = 0;
publicVariable "MCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf";
sleep 30;
_unit setdamage 1;
deletevehicle _unit;
{
_x setdamage 1;
deletevehicle _x;
} foreach _civils;
wcalert = 0;
		};

		if(_counter > 20) then {
			_position = (position (leader _group)) findEmptyPosition[ 1 , 20];
			"SmokeShellRed" createVehicle _position;
			//wcmessageW = [format["Still %1 civils to rescue", (count _civils - _count)]];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,format["Still %1 civils to rescue", (count _civils - _count)], "PLAIN",6] call RE;
			_counter = 0;
		};
		_counter = _counter + 1;
		sleep 5;
	};