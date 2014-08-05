// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Artillery Functions
// Script by KeyCat
// Optimized and Enhanced by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Artillery_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Artillery Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Artillery
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (GL4_System select 4);

	GL4_Artillery set [1, False];

	if ( [_a, _b] call (GL4_Artillery_F select 1) ) then
	{
		sleep 10 + (random 30);

		_a doWatch [ (getPos _b select 0), (getPos _b select 1), 500];

		sleep 5 + (random 5);

		_a selectWeapon (typeOf _a);

		_a fire (typeOf _a);

		[getPos _b] spawn (GL4_Dubbing_F select 5);

		_c = [_a] call (GL4_Artillery_F select 2);

		if (_c == "") then
		{
			_c = (GL4_Global select 12);
		};

		_d = 10 + (random 10);

		while { (_d > 0) } do
		{
			_e = [_a, _b, _c, 70] call GL4_Artillery_Velocity_F;

			if (isDedicated) then
			{
				GL4_AddOn_PublicVariable = [7, _e]; publicVariable "GL4_AddOn_PublicVariable";
			}
			else
			{
				[_e] call (GL4_Artillery_FX_F select 0);
			};

			sleep (random 3);

			_d = _d - 1;
		};

		sleep 240 + (random 240);

		GL4_Artillery set [1, True];
	}
	else
	{
		sleep 30 + (random 30);

		GL4_Artillery set [1, True];
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Artillery Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Artillery
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = True;

	_d = nearestObjects [_b, ["Man","Car","Tank"], 100];

	if (count _d > 0) then
	{
		_e = 0;

		while { (_e < count _d) } do
		{
			_f = (_d select _e);

			if ( (alive _f) && (side _f != CIVILIAN) && (_a countFriendly [_f] > 0) ) exitWith
			{
				_c = False;
			};

			_e = _e + 1;
		};
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Artillery Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Artillery
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;

	_b = "";

	if (_a isKindOf "M119") then
	{
		_b = "Sh_105_HE";
	};

	if (_a isKindOf "D30") then
	{
		_b = "Sh_122_HE";
	};

	if (_a isKindOf "MLRS") then
	{
		_b = "R_MLRS";
	};

	_b

	}
];