	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext  - secure a zone

	private [
		"_counter",
		"_enemys",
		"_global",
		"_position",
		"_sizeofzone",
		"_unit"

	];

	_unit = _this select 0;
	_position = position _unit;
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_sizeofzone = 400;

	_missioncomplete = false;

	_enemys = [];

	// wait initialization
	sleep 120;

	_counter = 0;

	while {!_missioncomplete} do {
		_enemys = [];
		_counter = _counter + 1;
		_global = nearestObjects[_unit,["Man"], _sizeofzone];
		{
			if!(isplayer _x) then {
				if((side _x == east) or (side _x == resistance)) then {
					_enemys = _enemys + [_x];

				};
			};
		}foreach _global;

		_global = nearestObjects[_unit,["Landvehicle"], _sizeofzone];
		{
			{
				if!(isplayer _x) then {
					if((side _x == east) or (side _x == resistance)) then {
						_enemys = _enemys + [_x];
	
					};
				};
			}foreach (crew _x);
		}foreach _global;


		if(_counter > 20) then {
			_counter = 0;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMMANDEMENT", format["Осталось %1 врагов", count _enemys]];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,format["Still %1 enemies", (count _enemys)], "PLAIN",6] call RE;			
		};

		// if -5 of enemy stay on zone success
		if(count _enemys < 5) then {
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			[nil,nil,rTitleText,localize "STR_MinorM67end1", "PLAIN",6] call RE;
			{
			if ((isplayer _x) && (_x distance _unit < 400)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 3000;
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
			wcmissionsuccess = true;
			_missioncomplete = true;
			//wcleveltoadd = 1;
			//wcfame = wcfame + wcbonusfame;
			//wcenemyglobalelectrical = wcenemyglobalelectrical + wcbonuselectrical;
			//wcenemyglobalfuel = wcenemyglobalfuel + wcbonusfuel;
			wcsecurezoneindex = wcsecurezoneindex + 1;
			_marker = [format["wcsecurezone%1", wcsecurezoneindex], "rescuezone"] call WC_fnc_copymarker;
			_marker setMarkerColor "ColorBlue";
			_marker = [format["wcsecuretext%1", wcsecurezoneindex], _marker] call WC_fnc_copymarker;
			_marker setmarkertext "Secured Zone"; 
			_marker setMarkershape "ICON"; 
			_marker setMarkersize [1,1]; 
			_marker setMarkerType "Warning";
			_marker setMarkerColor "ColorBlue";			
			wcsecurezone = wcsecurezone + [_position];
			wcgarbage = [] spawn WC_fnc_deletemissioninsafezone;
			wcalert = 0;
		};
		sleep 4;
	};