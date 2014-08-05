// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Car Weapon
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Car_Weapon_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Car Weapon Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Car Weapon
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_d = 0;

	while { (_d < count _c) } do
	{
		_e = (_c select _d);

		if ( (sizeOf typeOf _e > 1) && (canMove _e) && (count (crew _e) == 0) && (someAmmo _e) ) exitWith
		{
			GL4_Car_Weapon set [0, (GL4_Car_Weapon select 0) + [_e] ];

			[_a, _b, _e] spawn (GL4_Car_Weapon_F select 1);
		};

		_d = _d + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Car Weapon Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Car Weapon
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_b setUnitPos "UP";

	[_b] join grpNull;

	[group _b] spawn (GL4_Marker_F select 1);

	GL4_Car_Weapon set [1, (GL4_Car_Weapon select 1) + [group _b] ];

	_b setSpeedMode "FULL";
	_b setBehaviour "AWARE";

	_b assignAsGunner _c; [_b] orderGetIn True;

	_d = time + 50;

	while { ( (alive _b) && (_b != gunner _c) && (time < _d) && (GL4_System select 0) ) } do
	{
		sleep 1;
	};

	if ( (alive _b) && (_b == gunner _c) ) then
	{
		_e = (GL4_System select 2);

		_f = (vehicle _e);

		_b doWatch _f;

		_b doTarget _f;

		_b doFire _f;

		_d = time + 50;

		while { ( (alive _b) && (alive _c) && (canFire _c) && (someAmmo _c) && (_b == gunner _c) && (time < _d) && (GL4_System select 0) ) } do
		{
			sleep 1;
		};

		_b doWatch objNull;

		_b doTarget objNull;

		_b doFire objNull;
	};

	GL4_Car_Weapon set [1, (GL4_Car_Weapon select 1) - [group _b] ];

	if (alive _b) then
	{
		unAssignVehicle _b;

		_b setUnitPos "AUTO";

		if ( { (alive _x) } count (units _a) > 0) then
		{
			[_b] join _a;
		};

		sleep 50 + (random 70);
	};

	GL4_Car_Weapon set [0, (GL4_Car_Weapon select 0) - [_c] ];

	}
];