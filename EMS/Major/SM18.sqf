private [
		"_vehicle", 
		"_location", 
		"_unit", 
		"_position2", 
		"_group", 
		"_missiontype", 
		"_x", 
		"_building", 
		"_arrayofpos", 
		"_startposition", 
		"_index", 
		"_buildings", 
		"_missionname",
		"_missionnumber",
		"_missiontext",
		"_marker",
		"_count",
		"_watersafeposition"
		];

private ["_position2","_dummymarker","_wait"];
[] execVM "\z\addons\dayz_server\EMS\SMGoMajor.sqf";
WaitUntil {MissionGo == 1};

_position2 = wctownlocations call bis_fnc_selectrandom;
_marker3 = ['rescuezone2', wcdistance, _position2, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarker2;
_marker3 = ['sidezone2', 100, _position2, 'ColorRED', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal2;
	_marker4 = ["bombzone2", _marker3] call WC_fnc_copymarkerlocal2;
	_marker4 setMarkerSizeLocal [300, 300];
	_position2 = ["sidezone2", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker2;
		while { format ["%1", _position2] ==  "[1,1,0]"} do {
		_position2 = ["sidezone2", "onground", "onflat", "empty"] call WC_fnc_createpositioninmarker2;
	};
diag_log "EMS: Major Mission Created (SM18)";

//Mission start
[nil,nil,rTitleText,localize "STR_MajorM18", "PLAIN",6] call RE;
missiontext = localize "STR_MajorM18short";
Ccoords = _position2;
publicVariable "Ccoords";
[] execVM "debug\addmarkers.sqf";
			_group = createGroup east;
			_vehicle = _group createUnit ["INS_bardak", _position2, [], 0, "NONE"];
			_vname = typeof _vehicle;
			_name = gettext (configFile >> "CfgVehicles" >> _vname >> "DisplayName");
			_picture = "\z\addons\dayz_code\pics\bardak.paa";
_text = parseText format ["<t color='#FFCC33'>+1000 humanity</t><br/><br/><img size='5' image='%1'/><br/><br/><t color='#FFCC33'>Eliminate</t>", _picture];
[nil,nil,rHINT,_text] call RE;
			_arrayofpos = [_position2, "bot"] call WC_fnc_gethousespositions;
			_position2 = _arrayofpos call BIS_fnc_selectRandom;
			wcgarbage = [_vehicle] spawn {
				private ["_unit", "_enemy"];
				_unit = _this select 0;
				while {wcalert < 99} do {
					sleep 5;
				};
				_unit stop false;
				wcgarbage = [group _unit, position _unit, 50] spawn WC_fnc_patrol;
			};
			_vehicle setpos _position2;
			_vehicle setUnitPos "Up"; 
			_vehicle stop true;
			_vehicle addEventHandler ['killed',{_this execVM "\z\addons\dayz_server\EMS\bodyclean2.sqf"}]; //Body disappear time
			wcgarbage = [_vehicle, wcskill] spawn WC_fnc_setskill;
			wcgarbage = [_vehicle] spawn WC_fnc_protectobject;
			_missiontype = "eliminate";
			// CREATE ENEMIES ON TARGET
_numberofgroup = 4;
		for "_x" from 1 to _numberofgroup step 1 do {
			wcgarbage = [_marker3, wcfactions call BIS_fnc_selectRandom, false] spawn WC_fnc_creategroup2;
			sleep 2;
		};
		_numberofvehicle = 3;
		// CREATE ENEMIES VEHICLES ON TARGET
		for "_x" from 1 to _numberofvehicle step 1 do {
			wcgarbage = [_marker3, (wcvehicleslistE call BIS_fnc_selectRandom), true] spawn WC_fnc_creategroup2;
			sleep 2;
		};
			

   
waitUntil{!alive _vehicle}; 

//Mission completed
[nil,nil,rTitleText,localize "STR_MajorM18end", "PLAIN",6] call RE;
deletemarker "rescuezone2";
deletemarkerlocal "sidezone2";
deletemarkerlocal "bombzone2";
[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
Ccoords = 0;
publicVariable "Ccoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
