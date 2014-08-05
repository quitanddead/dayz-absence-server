// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Body Remove Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Body_Remove_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	if (count (GL4_Body_Detect select 1) > 0) then
	{
		_a = _a - (GL4_Body_Detect select 1);
	};

	if (count _a > 0) then
	{
		_b = 0;

		while { (_b < count _a) } do
		{
			_c = (_a select _b);

			_d = [_c] call (GL4_Body_Remove_F select 1);

			if (typeName _d == "String") then
			{
				[_c, _d] spawn (GL4_Body_Remove_F select 2);
			};

			_b = _b + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = "";

	if (count (GL4_Player select 0) > 0) then
	{
		_c = (GL4_Player select 0);

		_d = 0;

		while { ( (_d < count _c) && (typeName _b == "String") ) } do
		{
			_e = (_c select _d);

			_f = (vehicle _e);

			if (alive _f) then
			{
				if ( (_f knowsAbout _a > 0) || (_f distance _a < 500) ) then
				{
					_b = False;
				}
				else
				{
					_b = format ["Respawn_%1", side _f];
				};
			};

			_d = _d + 1;
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = getMarkerSize _b;

	_d = (_c select 0);

	switch (_d) do
	{
		case 0 :
		{
			hideBody _a;

			GL4_Killed set [0, (GL4_Killed select 0) - [_a] ];

			sleep 5;

			deleteVehicle _a;
		};

		default
		{
			if ( [_b] call (GL4_Body_Remove_F select 3) ) then
			{
				hideBody _a;

				GL4_Killed set [0, (GL4_Killed select 0) - [_a] ];

				sleep 5;

				deleteVehicle _a;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = True;

	if (count (GL4_Player select 0) > 0) then
	{
		_c = (GL4_Player select 0);

		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			_f = (vehicle _e);

			if (_f distance (getMarkerPos _a) < 100) exitWith
			{
				_b = False;
			};

			_d = _d + 1;
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Body Remove
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;

	if (count (GL4_Body_Detect select 1) > 0) then
	{
		_a = _a - (GL4_Body_Detect select 1);
	};

	if (count _a > 0) then
	{
		_b = count _a / 2;

		while { (count _a > _b) } do
		{
			_a = (GL4_Killed select 0);

			_c = (_a select 0);

			hideBody _c;

			GL4_Killed set [0, (GL4_Killed select 0) - [_c] ];

			sleep 5;

			deleteVehicle _c;
		};
	};

	}
];