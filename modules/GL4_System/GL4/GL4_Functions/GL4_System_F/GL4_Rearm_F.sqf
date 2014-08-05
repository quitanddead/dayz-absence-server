// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Rearm Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Rearm_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Rearm Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Rearm
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;

	_b = True;

	if (GL4_Global select 26) then
	{
		if ( { (isPlayer _x) } count (units _a) > 0) then
		{
			if (GL4_Global select 67) then
			{
				_b = True;
			}
			else
			{
				_b = False;
			};
		};

		if (_b) then
		{
			while { (alive _a) } do
			{
				_c = (vehicle _a);

				if ( (_c isKindOf "Man") && (_c != leader _c) && (side _c != CIVILIAN) ) then
				{
					if ( (alive _c) && ( ( [_c] call (GL4_Rearm_F select 1) ) || (primaryWeapon _c == "") ) ) then
					{
						[_c] call (GL4_Rearm_F select 2);
					};
				};

				sleep 70 + (random 70);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Rearm Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Rearm
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = False;

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
		_b = True;
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Rearm Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Rearm
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = nearestObjects [_a, ["Man"], 100];

	if (count (GL4_Rearm select 0) > 0) then
	{
		_b = _b - (GL4_Rearm select 0);
	};

	if (count _b > 0) then
	{
		_c = 0;

		while { (_c < count _b) } do
		{
			_d = (_b select _c);

			if ( !(alive _d) && (local _d) && (_d ammo (primaryWeapon _d) > 0) ) exitWith
			{
				GL4_Rearm set [0, (GL4_Rearm select 0) + [_d] ];

				[_a, _d] spawn (GL4_Rearm_F select 3);
			};

			_c = _c + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Rearm Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Rearm
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (primaryWeapon _b);

	_d = group _a;

	[_a] join grpNull;

	if (stopped _a) then
	{
		_a stop False;
	};

	_a doMove (getPos _b);

	while { ( (alive _a) && (_a distance _b > 3) ) } do
	{
		sleep 1;
	};

	if (alive _a) then
	{
		_a action ["TAKEWEAPON", _b, _c];

		if ( { (alive _x) } count (units _d) > 0) then
		{
			[_a] join _d;
		};
	};

	}
];