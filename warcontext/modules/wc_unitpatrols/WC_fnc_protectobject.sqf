	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext - defend an objet 
	// by patroling around with special force (side mission)

	private [
		"_areasize",
		"_class",
		"_dog",
		"_group", 
		"_newposition",
		"_number",
		"_sizeofgroup",
		"_aiwep1",
		"_aiammo1",
		"_unit", 
		"_vehicle", 
		"_vehicle2",
		"_position"
		];

	_unit = _this select 0;
	_number =  _this select 1;

	if(isnil "_number") then { _number = 2; };

	_position = position _unit;

	for "_a" from 1 to (ceil random _number) do {
		_areasize = 30 + (round (random 50));
		_sizeofgroup = 1 + (ceil (random 4));
	
		_group = creategroup east;
		for "_i" from 1 to _sizeofgroup do {
			_newposition = _position findEmptyPosition [2, 30];
			if(count _newposition == 0) then {
				diag_log "WARCONTEXT: NO FOUND EMPTY POSITION FOR PROTECT OBJECT PATROL";
			} else {
				_vehicle = _group createUnit [(wcspecialforces call BIS_fnc_selectRandom), _newposition, [], 5, "NONE"];
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
                  case 7: {["ACE_M4_RCO_GL_UP_F","ACE_30Rnd_556x45_SB_Stanag"]};
                  case 8: {["ACE_M60","100Rnd_762x51_M240"]};
                  case 9: {["ACE_AK74M_FL_F","ACE_30Rnd_545x39_AP_AK"]};
                  case 10: {["ACE_G36K_iron","ACE_30Rnd_556x45_AP_G36"]};
                };
                _vehicle addEventHandler ['killed',{_this execVM "\z\addons\dayz_server\EMS\bodyclean.sqf"}]; //Body disappear time
                
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

		};
		wcgarbage = [_group, _position, _areasize] spawn WC_fnc_patrol;
		wcgarbage = [_group] spawn WC_fnc_grouphandler;

		diag_log format ["WARCONTEXT: COMPUTING A SPECIAL FORCE GROUP OF %1 UNITS FOR PROTECT GOAL", _sizeofgroup];
	};

	// create dog
	if((random 1 > 0.2) and wcpatrolwithdogs) then {
		_newposition = position (leader _group);
		_group = creategroup civilian;
		_class = wcdogclass call BIS_fnc_selectRandom;
		_dog = _group createUnit [_class, _newposition, [], 3, "NONE"]; 
		wcgarbage = [_dog] spawn WC_fnc_dogpatrol;
	};