// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Spawn Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Spawn_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Spawn Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Spawn
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	if (isServer) then
	{
		_a = _this select 0;
		_b = _this select 1;
		_c = _this select 2;

		_d = getNumber (configFile >> "CfgVehicles" >> (_c select 0) >> "side");

		switch (_d) do
		{
			case 0 :
			{
				_e = EAST;
			};

			case 1 :
			{
				_e = WEST;
			};

			case 2 :
			{
				_e = RESISTANCE;
			};
		};

		createCenter _e;

		_f = 0;

		while { (_f < _b) } do
		{
			[_a, _b, _c, _e] call (GL4_Spawn_F select 1);

			_f = _f + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Spawn Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Spawn
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;
	_d = _this select 3;

	_e = [_a] call (GL4_Spawn_F select 2);

	_f = createGroup _d;

	_g = 0;

	while { (_g < count _c) } do
	{
		_h = (_c select _g);

		switch (_d) do
		{
			case EAST :
			{
				_h createUnit [_e, _f];
			};

			case WEST :
			{
				_h createUnit [_e, _f];
			};

			case RESISTANCE :
			{
				_h createUnit [_e, _f];
			};
		};

		_g = _g + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Spawn Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Spawn
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = triggerArea _a;

	_c = (_b select 0);
	_d = (_b select 1);

	_e = [ ( (getPos _a select 0) + ( (random _c) - (random _c) ) ), ( (getPos _a select 1) + ( (random _d) - (random _d) ) ), 0];

	_e

	}
];