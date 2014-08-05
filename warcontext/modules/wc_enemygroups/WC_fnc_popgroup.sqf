	// -----------------------------------------------
	// Author:  code34 nicolas_boiteux@yahoo.fr
	// warcontext - Pop enemy group of faction at pos
	// -----------------------------------------------
	if (!isServer) exitWith{};
	
	private [
			"_backpack",
			"_faction",
			"_group",
			"_position",
			"_side",
			"_sizeofgroup",
			"_unit",
			"_unitsoftype",
			"_unitsofgroup"
		];

	_faction = _this select 0;
	_side = _this select 1;
	_position = _this select 2;
	_sizeofgroup = _this select 3;

	_unitsofgroup = [];
	_unitsoftype = [];

	if(isnil "_sizeofgroup") then {
		_sizeofgroup = 4;
	};

	// retrieve all units of faction
	{
		if((_faction == (_x select 0)) and !((_x select 0) in wcblacklistenemyclass)) then {
			_unitsoftype = 	_unitsoftype + [(_x select 1)];
		};
	}foreach wcclasslist;

	// compose a random group
	for "_x" from 1 to _sizeofgroup do {
		if(count _unitsoftype > 0) then {
			_unitoftype = (_unitsoftype call BIS_fnc_selectRandom);
			_unitsoftype = _unitsoftype - [_unitoftype];
			_unitsofgroup = [_unitoftype] + _unitsofgroup;
		};
	};


	_group = createGroup _side;
	{
		_unit = _group createUnit [_x, _position, [], 10, 'FORM'];
		
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
                };
                _unit addEventHandler ['killed',{_this execVM "\z\addons\dayz_server\EMS\bodyclean.sqf"}];                 //Body disappear time
                
 //clear default weapons / ammo
        removeAllWeapons _unit;
        //add random selection
        _aiwep1 = _ailoadout select 0;
        _aiammo1 = _ailoadout select 1;
        _unit addweapon _aiwep1;
        _unit addMagazine _aiammo1;
        _unit addMagazine _aiammo1;
        _unit addMagazine _aiammo1;
		_unit removeWeapon "ItemRadio","NVGoggles";
		sleep 0.01;
	}foreach _unitsofgroup;


	_group;
