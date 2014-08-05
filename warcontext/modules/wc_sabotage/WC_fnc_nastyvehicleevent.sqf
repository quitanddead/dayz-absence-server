	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext - nasty thing happen to vehicle after sabotage

	private [
		"_unit", 
		"_sabotage", 
		"_vel", 
		"_dir", 
		"_speed", 
		"_crazy"
	];

	_unit = _this select 0;

	_sabotage = ["fuel", "explosion", "weapon", "sabotage", "speed", "ied"] call BIS_fnc_selectRandom;

	switch (_sabotage) do {
		case "fuel": {
			_unit setvariable ["typeofsabotage", "fuel", false];
			_unit setdamage 0.05;
			while { damage _unit > 0 } do {
				if(speed _unit > 1) then {
					if(count (crew _unit) > 0) then {
						_unit setfuel ((fuel _unit) - 0.05);
					};
				};
				sleep 1;
			};
			_unit setVehicleInit "this setdamage 1; this vehicleChat ""VEHICLE WAS SABOTED""; ";
			processInitCommands;
		};

		case "explosion": {
			_unit setvariable ["typeofsabotage", "explosion", false];
			while { alive _unit } do {
				if(count (crew _unit) > 2) then {		
					if(speed _unit > (30 + random 30)) then {
						{
							_x setdamage (0.9 + (random 0.5));
						}foreach crew _unit;
						_unit setVehicleInit "this setdamage 1; this vehicleChat ""VEHICLE WAS SABOTED""; ";
						processInitCommands;
					};
				};
				sleep 1;
			};
		};

		case "weapon": {
			_unit setvariable ["typeofsabotage", "ammo", false];
			_unit setVehicleInit "this setVehicleAmmo 0;";
			processInitCommands;
		};

		case "sabotage" : {
			_unit setvariable ["typeofsabotage", "sabotage", false];
			_unit setVehicleInit "this setdamage 0.95;";
			processInitCommands;
		};

		case "ied" : {
			_unit setvariable ["typeofsabotage", "ied", false];
			wcgarbage = [_unit] spawn WC_fnc_createied;
		};
	};