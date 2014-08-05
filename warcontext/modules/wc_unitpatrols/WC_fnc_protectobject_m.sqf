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

	if(isnil "_number") then { _number = 1; };

	_position = position _unit;

	for "_a" from 1 to (ceil random _number) do {
		_areasize = 200 + (round (random 50));
		_sizeofgroup = 1;
	
		_group = creategroup east;
		for "_i" from 1 to _sizeofgroup do {
			_newposition = _position findEmptyPosition [2, 30];
			if(count _newposition == 0) then {
				diag_log "WARCONTEXT: NO FOUND EMPTY POSITION FOR PROTECT OBJECT MUTANT";
			} else {
				_vehicle = _group createUnit ["ns_bloodsucker", _newposition, [], 5, "NONE"];
				
                _vehicle addEventHandler ['killed',{_this execVM "\z\addons\dayz_server\EMS\bodyclean2.sqf"}]; //Body disappear time
                
			};

		};
		wcgarbage = [_group, _position, _areasize] spawn WC_fnc_patrol;
		//wcgarbage = [_group] spawn WC_fnc_grouphandler;

		diag_log format ["WARCONTEXT: COMPUTING A MUTANT GROUP OF %1 UNITS FOR PROTECT GOAL", _sizeofgroup];
	};

	