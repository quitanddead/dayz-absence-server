// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// House Search Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_House_Search_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// House Search Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// House Search
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_d = 0;

	while { (_d < count _c) } do
	{
		_e = (_c select _d);

		_f = 0;

		while { (format ["%1", _e buildingPos _f] != "[0,0,0]") } do
		{
			_f = _f + 1;
		};

		_f = _f - 1;

		if (_f > 7) exitWith
		{
			GL4_House_Search set [0, (GL4_House_Search select 0) + [_e] ];

			[_a, _b, _e, _f] spawn (GL4_House_Search_F select 1);
		};

		_d = _d + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// House Search Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// House Search
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;
	_d = _this select 3;

	[_b] join grpNull;

	_b setUnitPos "UP";

	_b doMove (getPos _c);

	[group _b] spawn (GL4_Marker_F select 1);

	GL4_House_Search set [1, (GL4_House_Search select 1) + [group _b] ];

	while { ( (alive _b) && (_b distance _c > 30) ) } do
	{
		sleep 5;

		_b doMove (getPos _c);
	};

	if (alive _b) then
	{
		while { ( (alive _b) && (_d > 0) && (GL4_System select 0) ) } do
		{
			_e = (_c buildingPos _d);

			_b doMove _e;

			_f = time + 30;

			while { ( (alive _b) && (_b distance _e > 5) && (_b distance _e < 100) && (time < _f) && (GL4_System select 0) ) } do
			{
				sleep 1;
			};

			if (alive _b) then
			{
				doStop _b;

				sleep 5 + (random 10);
			};

			_d = _d - 1;
		};
	};

	GL4_House_Search set [1, (GL4_House_Search select 1) - [group _b] ];

	if (alive _b) then
	{
		_b setUnitPos "AUTO";

		if ( { (alive _x) } count (units _a) > 0) then
		{
			[_b] join _a;
		};

		sleep 50 + (random 70);
	};

	GL4_House_Search set [0, (GL4_House_Search select 0) - [_c] ];

	}
];