	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext - create a destroy vehicle mission

	private [
		"_electricalmalus", 
		"_fuelmalus", 
		"_missioncomplete",
		"_nuclearmalus",
		"_vehicle"
	];
		wclastmissionposition = _position2;
		wcmissionposition = _position2;
	_vehicle = _this select 0;
	
	_name = typeof _vehicle;
	_vname = getText (configFile >> "CfgVehicles" >> _name >> "DisplayName");
	//_nuclearmalus 		= _this select 1;
	//_fuelmalus 		= _this select 2;
	//_electricalmalus 	= _this select 3;

	_missioncomplete = false;

	while {!_missioncomplete} do {
		if((!alive _vehicle) or (damage _vehicle > 0.9)) then {
			_vehicle setdamage 1;
			[nil,nil,rTitleText,format ["%1 destroyed", _vname], "PLAIN",6] call RE;
			{
			if ((isplayer _x) && (_x distance _vehicle < 300)) then {
			_punit_name = name _x;
			//_ainame = typeof _vehicle;
		_humanityBoost = 1000;
		_humanity = _x getVariable ["humanity",0];
		_humanity = _humanity + _humanityBoost;
		_x setVariable["humanity", _humanity,true];
	};
		}foreach playableunits;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMPLETED", localize "STR_WC_MESSAGELEAVEZONE"];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
			wcmissionsuccess = true;
			//wcleveltoadd = 1;
			_missioncomplete = true;
			deletemarker "rescuezone2";
deletemarkerlocal "sidezone2";
deletemarkerlocal "bombzone2";
[] execVM "debug\remmarkers.sqf";
MissionGo = 0;
CCoords = 0;
publicVariable "CCoords";

SM1 = 1;
[0] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf";
wcalert = 0;
		};
		sleep 5;
	};


	//wcnuclearprobability = wcnuclearprobability - _nuclearmalus;
	//wcenemyglobalfuel = wcenemyglobalfuel - _fuelmalus;
	//wcenemyglobalelectrical = wcenemyglobalelectrical - _electricalmalus;