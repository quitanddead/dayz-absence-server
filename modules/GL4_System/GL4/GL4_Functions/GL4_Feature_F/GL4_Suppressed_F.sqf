// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Suppressed Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Suppressed_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Fire
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	if (count _b > 0) then
	{
		if (count (GL4_Suppressed select 0) > 0) then
		{
			_b = _b - (GL4_Suppressed select 0);
		};

		if (count _b > 0) then
		{
			_c = 0;

			while { (_c < count _b) } do
			{
				_d = (_b select _c);

				_e = (vehicle leader _d);

				if (_e isKindOf "Man") then
				{
					[_a, _d] call (GL4_Suppressed_F select 1);
				};

				_c = _c + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Fire
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _b);

	_d = 200 + (random 100);

	if ( (_c knowsAbout (vehicle _a) > 0) && (_c distance (vehicle _a) < _d) ) then
	{
		_e = [_a, getPos _c] call GL4_Rel_Dir_To_F;

		if ( (_e >= 340) || (_e <= 20) ) then
		{
			GL4_Suppressed set [0, (GL4_Suppressed select 0) + [_b] ];

			[_b] spawn (GL4_Suppressed_F select 2);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Fire
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = behaviour (leader _a);

	_a setBehaviour "STEALTH";

	{_x setUnitPos "DOWN"} foreach units _a;

	(leader _a) doWatch (getPos (GL4_System select 3) );

	sleep 1 + (random 1);

	["Suppressed", _a] call (GL4_Dubbing_F select 4);

	_c = 1 + (random 1);

	while { ( ( { (alive _x) } count (units _a) > 0) && (_c > 0) ) } do
	{
		_d = 0;

		while { (_d < count units _a) } do
		{
			_e = (units _a select _d);

			if (alive _e) then
			{
				_f = (GL4_System select 3);

				_g = (vehicle _f);

				if ( (alive _g) && (_e knowsAbout _g > 0) && (_e countEnemy [_g] > 0) ) then
				{
					if (floor (random 100) < 50) then
					{
						if ( [_e] call (GL4_Suppressed_F select 3) ) then
						{
							_e doWatch _g;

							_e doTarget _g;

							_e doFire _g;
						};
					}
					else
					{
						_e doWatch _g;
					};
				};
			};

			sleep 1 + (random 2);

			_d = _d + 1;
		};

		sleep 10 + (random 10);

		_e doWatch objNull;

		_e doTarget objNull;

		_e doFire objNull;

		_c = _c - 1;
	};

	if ( { (alive _x) } count (units _a) > 0) then
	{
		_a setBehaviour _b;

		{_x setUnitPos "AUTO"} foreach units _a;
	};

	GL4_Suppressed set [0, (GL4_Suppressed select 0) - [_a] ];

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Suppressed Fire
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = True;

	_c = (GL4_Resource select 36);

	_d = magazines _a;

	_e = 0;

	while { ( (_e < count magazines _a) && (count _d > 3) ) } do
	{
		_f = (magazines _a select _e);

		if (_f in _c) then
		{
			_d = _d - [_f];
		};

		_e = _e + 1;
	};

	if (count _d <= 3) then
	{
		_b = False;
	};

	_b

	}
];