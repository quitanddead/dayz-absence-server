// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Static Weapon
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Static_Weapon_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	if (count _a > 0) then
	{
		if (count (GL4_Static select 0) > 0) then
		{
			_a = _a - (GL4_Static select 0);
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
					[_c] call (GL4_Static_Weapon_F select 1);
				};

				_b = _b + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = 0;

	while { (_b < count units _a) } do
	{
		_c = (units _a select _b);

		_d = (vehicle _c);

		if ( (_d isKindOf "Man") && (alive _d) && (_d != leader _d) && (floor (random 100) < 50) ) then
		{
			_e = [_d] call (GL4_Static_Weapon_F select 2);

			if (_e isKindOf "StaticWeapon") then
			{
				[_a, _d, _e] spawn (GL4_Static_Weapon_F select 3);
			};
		};

		_b = _b + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = objNull;

	_c = nearestObjects [_a, ["StaticWeapon"], 100];

	if (count (GL4_Static_Weapon select 0) > 0) then
	{
		_c = _c - (GL4_Static_Weapon select 0);
	};

	if (count _c > 0) then
	{
		_d = True;

		_e = 0;

		while { ( (_e < count _c) && (_d) ) } do
		{
			_f = (_c select _e);

			if (_f isKindOf "SearchLight") then
			{
				if !( (dayTime > 5.00) && (dayTime < 18.00) ) then
				{
					_d = False;

					GL4_Static_Weapon set [0, (GL4_Static_Weapon select 0) + [_f] ];

					_b = _f;
				};
			}
			else
			{
				_d = False;

				GL4_Static_Weapon set [0, (GL4_Static_Weapon select 0) + [_f] ];

				_b = _f;
			};

			_e = _e + 1;
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_b assignAsGunner _c; [_b] orderGetIn True;

	while { ( (alive _b) && (_b != gunner _c) ) } do
	{
		sleep 1;
	};

	if ( (alive _b) && (_b == gunner _c) ) then
	{
		[_b, _c] spawn (GL4_Static_Weapon_F select 4);

		if (_c isKindOf "StaticCannon") then
		{
			[_b] join grpNull;

			GL4_Artillery set [0, (GL4_Artillery select 0) + [group _b] ];
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Static Weapon
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	while { ( (alive _a) && (_a == gunner _b) ) } do
	{
		_c = (GL4_System select 2);

		_d = (vehicle _c);

		if ( (alive _d) && (_a knowsAbout _d > 0) && (_a countEnemy [_d] > 0) ) then
		{
			if ( (canFire _b) && (someAmmo _b) ) then
			{
				_a doWatch _d;

				_a doTarget _d;

				_a doFire _d;

				sleep 10 + (random 20);

				_a doWatch objNull;
			}
			else
			{
				if (floor (random 100) < 75) then
				{
					{unassignVehicle _x} forEach (crew _b);
				}
				else
				{
					_a doWatch _d;
				};
			};
		};

		sleep 30 + (random 50);
	};

	GL4_Static_Weapon set [0, (GL4_Static_Weapon select 0) - [_b] ];

	}
];