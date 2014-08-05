// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Garrison Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Garrison_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Garrison Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Garrison
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	if (count _a > 0) then
	{
		if (count (GL4_Reinforcement select 1) > 0) then
		{
			_a = _a - (GL4_Reinforcement select 1);
		};

		if (count (GL4_Advancing select 0) > 0) then
		{
			_a = _a - (GL4_Advancing select 0);
		};

		if (count (GL4_Suppressed select 0) > 0) then
		{
			_a = _a - (GL4_Suppressed select 0);
		};

		if (count (GL4_Patrol select 0) > 0) then
		{
			_a = _a - (GL4_Patrol select 0);
		};

		if (count _a > 0) then
		{
			_b = 0;

			while { (_b < count _a) } do
			{
				_c = (_a select _b);

				_d = (vehicle leader _c);

				if (_d isKindOf "Man") then
				{
					[_c] call (GL4_Garrison_F select 1);
				};

				_b = _b + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Garrison Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Garrison
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	if ( (_a in (GL4_Garrison select 0) ) && (_b distance (nearestBuilding _b) > 100) ) then
	{
		_c = (GL4_Garrison select 0);

		_d = _c find _a;

		_d = _d + 1;

		_e = (_c select _d);

		if ( (_b distance _e > 100) || ( { (alive _x) } count (units _a) == 0) ) then
		{ 
			GL4_Garrison set [0, (GL4_Garrison select 0) - [_a, _e] ];
		};
	}
	else
	{
		if (count waypoints _a == 1) then
		{
			_c = [_a] call (GL4_Garrison_F select 2);

			if (count _c > 0) then
			{
				_d = (_c select 0);
				_e = (_c select 1);

				if (_d isKindOf "House") then
				{
					GL4_Garrison set [0, (GL4_Garrison select 0) + [_a, _d] ];

					[_a, _d, _e] call (GL4_Garrison_F select 3);
				};
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Garrison Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Garrison
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	_c = [];

	_d = nearestObjects [_b, ["House"], 100];

	if (count (GL4_Garrison select 0) > 0) then
	{
		_d = _d - (GL4_Garrison select 0);
	};

	if (count _d > 0) then
	{
		_e = 0;

		while { ( (_e < count _d) && (count _c == 0) ) } do
		{
			_f = (_d select _e);

			_g = 0;

			while { (format ["%1", _f buildingPos _g] != "[0,0,0]") } do
			{
				_g = _g + 1;
			};

			_g = _g - 1;

			if ( (_g == 2) && ( { (_f buildingPos _x select 2 > 5) } count [0,1,2] > 0) ) then
			{
				_c = [_f, _g];
			};

			if (_g > 7) then
			{
				_c = [_f, _g];
			};

			_e = _e + 1;
		};
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Garrison Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Garrison
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_d = [];

	_e = 0;

	while { (_e < count units _a) } do
	{
		_f = (units _a select _e);

		if (alive _f) then
		{
			_g = (_b buildingPos random _c);

			if (_f distance _g < 100) then
			{
				if (count _d == 0) then
				{
					_d = _d + [_g];

					_f doMove _g;

					[_f, _g] spawn (GL4_Garrison_F select 4);
				}
				else
				{
					if ( { (_g distance _x > 5) } count _d > 0) then
					{
						_d = _d + [_g];

						_f doMove _g;

						[_f, _g] spawn (GL4_Garrison_F select 4);
					}
					else
					{
						_d = [_b, _c, _d, _f] call (GL4_Garrison_F select 5);
					};
				};
			};
		};

		_e = _e + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Garrison Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Garrison
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	_c = time + 50;

	while { ( (alive _a) && (_a distance _b >= 1) && (time < _c) ) } do
	{
		sleep 1;
	};

	if ( (alive _a) && (_a distance _b <= 1) && (time < _c) ) exitWith
	{
		if (_b select 2 > 5) then
		{
			sleep 5;

			doStop _a;
		}
		else
		{
			doStop _a;
		};
	};

	if ( (alive _a) && (_a distance _b >= 1) ) then
	{
		_a doMove (getPos leader _a);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Garrison Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Garrison
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;
	_d = _this select 3;

	while { (_b >= 0) } do
	{
		_e = (_a buildingPos _b);

		if ( !(_e in _c) && ( { (_e distance _x > 5) } count _c > 0) ) exitWith
		{
			_c = _c + [_e];

			_d doMove _e;

			[_d, _e] spawn (GL4_Garrison_F select 4);
		};

		_b = _b - 1;
	};

	_c

	}
];