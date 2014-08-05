	// -----------------------------------------------
	// Author:   code34 nicolas_boiteux@yahoo.fr
	// WARCONTEXT - virtualize marker

	private [
		"_marker",
		"_position",
		"_lastroad",
		"_road"
	];

	_position = _this select 0;
	_lastroad = [];
	_roads = [];

	_marker = [format["virtualvehicle%1", wcvirtualindex], 100, _position, 'ColorRed', 'ELLIPSE', 'FDIAGONAL', '', 0, '', false] call WC_fnc_createmarkerlocal;
	wcvirtualindex = wcvirtualindex + 1;
	_road = ((_position  nearroads 10) select 0);

	while { true } do {
		_roads = roadsconnectedto _road;
		if(count _roads > 1) then {
			_road = objnull;
			while {isnull _road} do {
				_x = _roads call BIS_fnc_selectRandom;
				_roads = _roads - [_x];
				if!(_x in _lastroad) then {
					_road = _x;
				};
				sleep 0.01;
			};
			_lastroad = _lastroad + [_road];
		} else {
			_lastroad = [];
			_road = _roads select 0;
		};
		if(count _lastroad > 5) then {
			_lastroad = _lastroad - [(_lastroad select 0)];
		};
		_marker setmarkerpos (position _road);
		sleep 0.01;
	};