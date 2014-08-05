	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext - arrest a prisonneer - side mission

	private [
		"_unit", 
		"_enemy", 
		"_missioncomplete", 
		"_group", 
		"_vehicle", 
		"_vehicle2",
		"_buildings",
		"_arrayofpos",
		"_position",
		"_index"
		];

	_unit = _this select 0;
	_unit setVehicleInit "this addAction ['<t color=''#ffcb00''>Follow me</t>', '\z\addons\dayz_code\warcontext\actions\WC_fnc_dofollowme.sqf',[],6,false, true];";
	_unit setvariable ["wcprotected", true];
		wclastmissionposition = _position;
		wcmissionposition = _position;
	processInitCommands;
	_arrayofpos = [];
	_missioncomplete = false;
	_unit setUnitPos "Up"; 
	dostop _unit;
	_group = group _unit;

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

	_vehicle = _group createUnit [(wcspecialforces call BIS_fnc_selectRandom), position _unit, [], 1, "NONE"];
	_vehicle2 = _group createUnit [(wcspecialforces call BIS_fnc_selectRandom), position _unit, [], 8, "NONE"];

	wcunits = wcunits + [_vehicle];
	wcunits = wcunits + [_vehicle2];

	// Prevent from initialisation crash, fall of roof etc.
	_vehicle allowdammage false;
	_vehicle2 allowdammage false;

	wcgarbage = [_unit, wcskill] spawn WC_fnc_setskill;
	wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
	wcgarbage = [_vehicle2, wcskill] spawn WC_fnc_setskill;

	wcgarbage = [_group, (position(leader _group)), 100] spawn WC_fnc_patrol;

	wcgarbage = [_vehicle] spawn WC_fnc_dosillything;
	wcgarbage = [_vehicle2] spawn WC_fnc_dosillything;

	sleep 10;

	_vehicle allowdammage true;
	_vehicle2 allowdammage true;

	while {!_missioncomplete} do {
			_enemy = _unit findNearestEnemy position _unit;
			if(_enemy distance _unit < 8) then {
				_unit setcaptive true;
				removeallweapons _unit;
				_unit allowfleeing 0;
				_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
			};
			if((getmarkerpos "jail") distance _unit < 20) then {
				[nil,nil,rTitleText,localize "STR_MinorM45end1", "PLAIN",6] call RE;
				//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
				//["wcmessageW", "client"] call WC_fnc_publicvariable;
			
			{
			if ((isplayer _x) && (_x distance _unit < 100)) then {
			_punit_name = name _x;
			_ainame = typeof _unit;
		_humanityBoost = 2000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity + _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
	diag_log format ["EMS: Hostage %1 was delivered to jail by %2 (+%3 humanity, new total %4)",_ainame,_punit_name,_humanityBoost,_humanity];
		}foreach playableunits;
		

	if(alive _unit) then {
		_unit setpos getmarkerpos "jail";
		[_unit] joinSilent group prisoner;
		_unit allowdammage false;
		_unit setUnitPos "Up"; 
		dostop _unit;
		_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
		_unit disableAI "MOVE";
		_unit disableAI "ANIM";
	};
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
				//wcfame = wcfame + wcbonusfame;
			};
			if((!alive _unit) or (damage _unit > 0.9)) then {
				[nil,nil,rTitleText,localize "STR_MinorM45end2", "PLAIN",6] call RE;
				//wcmessageW = [localize "STR_WC_MESSAGEMISSIONFAILED", localize "STR_WC_MESSAGELEAVEZONE"];
				//["wcmessageW", "client"] call WC_fnc_publicvariable;
//_unit addEventHandler ['killed',{_this execVM "\z\addons\dayz_server\EMS\bodyclean4.sqf"}]; //Body disappear time
{
			if ((isplayer _x) && (_x distance _unit < 150)) then {
			_punit_name = name _x;
			_ainame = typeof _unit;
		_humanityBoost = 2000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity - _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
	diag_log format ["EMS: Hostage %1 killed by %2 (+%3 humanity, new total %4)",_ainame,_punit_name,_humanityBoost,_humanity];
		}foreach playableunits;	
		
		wcmissionsuccess = true;
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
			if(damage _unit > 0.1) then {
				removeallweapons _unit;
			};
	        	sleep 1;
	};

//	if(alive _unit) then {
//		_unit setpos getmarkerpos "jail";
//		[_unit] joinSilent group prisoner;
//		_unit allowdammage false;
//		_unit setUnitPos "Up"; 
//		dostop _unit;
//		_unit playMoveNow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
//		_unit disableAI "MOVE";
//		_unit disableAI "ANIM";
//	};