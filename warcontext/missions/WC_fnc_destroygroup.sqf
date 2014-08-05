	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext - create a destroy group mission

	private [
		"_group", 
		"_missioncomplete",
		"_sizeofgroup",
		"_unit", 
		"_vehicle", 
		"_vehicle2",
		"_position",
		"_missioncomplete",
		"_counter"
		];

	_unit = _this select 0;

	_missioncomplete = false;
	_position = getpos _unit;
	_sizeofgroup = ceil (random 10);
		wclastmissionposition = _position;
		wcmissionposition = _position;
	_group = creategroup east;
	for "_i" from 1 to _sizeofgroup do {
		_position = (position _unit) findEmptyPosition [2, 30];
		if(count _position == 0) then {
			diag_log "WARCONTEXT: NO FOUND EMPTY POSITION FOR CREATE DESTROY GROUP";
		};

		_vehicle = _group createUnit [(wccommando call BIS_fnc_selectRandom), _position, [], 0, "NONE"];
		wcgarbage = [_vehicle] spawn WC_fnc_dosillything;
		_rndLOut=floor(random 7);
                _ailoadout=
                switch (_rndLOut) do
                {
                  case 0: {["ACE_AKM","ACE_30Rnd_762x39_AP_AK47"]};
                  case 1: {["ACE_G3A3_RSAS","ACE_20Rnd_762x51_B_G3"]};
                  case 2: {["ACE_HK416_D10_AIM","ACE_30Rnd_556x45_SB_Stanag"]};
                  case 3: {["ACE_SOC_M4A1","ACE_30Rnd_556x45_SB_Stanag"]};
                  case 4: {["G36_C_SD_CAMO","ACE_30Rnd_556x45_S_Stanag"]};
                  case 5: {["ACE_AK103_GL","ACE_30Rnd_545x39_EP_AK"]};
                  case 6: {["M4A1_AIM_SD_CAMO","ACE_30Rnd_556x45_S_Stanag"]};
                };
                _vehicle addEventHandler ['killed',{_this execVM "\z\addons\dayz_server\EMS\bodyclean2.sqf"}]; //Body disappear time
 //clear default weapons / ammo
        removeAllWeapons _vehicle;
        //add random selection
        _aiwep1 = _ailoadout select 0;
        _aiammo1 = _ailoadout select 1;
        _vehicle addweapon _aiwep1;
        _vehicle addMagazine _aiammo1;
        _vehicle addMagazine _aiammo1;
        _vehicle addMagazine _aiammo1;
		_vehicle removeWeapon "ItemRadio","NVGoggles";
	};
	wcgarbage = [_group, (position(leader _group)), 100] spawn WC_fnc_patrol;


	wcgarbage = [_group] spawn WC_fnc_grouphandler;
	diag_log format ["WARCONTEXT: COMPUTING A SPECIAL FORCE GROUP OF %1 UNITS AS DESTROY GOAL", _sizeofgroup];

	
	_missioncomplete = false;
	_counter = 0;
	while { !_missioncomplete } do {
		_counter = _counter + 1;
		if((count units _group == 0) or (damage _unit > 0.8)) then {
//Mission completed
[nil,nil,rTitleText,localize "STR_MinorM24end", "PLAIN",6] call RE;
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
			_missioncomplete = true;
		};
		if(_counter > 60) then {
			{
				if(position _x distance _position > 100) then {
					_x domove _position;
				};
			}foreach units _group;
			_counter = 0;
			[nil,nil,rtitletext,format["Still %1 enemies", count units _group]] call RE;
			//wcmessageW = [localize "STR_WC_MESSAGEMISSIONCOMMANDEMENT", format["Осталось %1 врагов", count units _group]];
			//["wcmessageW", "client"] call WC_fnc_publicvariable;
		};
		sleep 1;
	};
