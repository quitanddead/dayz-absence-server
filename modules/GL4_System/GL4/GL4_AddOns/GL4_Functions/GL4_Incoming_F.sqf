// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Incoming Function
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Incoming_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Incoming Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Incoming
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	if !(isNull _b) then
	{
		_c = time + 5;

		_d = getPos _b;

		while { ( !(isNull _b) && (time < _c) ) } do
		{
			_d = getPos _b;

			sleep 0.01;
		};

		if (isNull _b) then
		{
			_e = nearestObjects [_d, ["Man"], 100];

			if (count (GL4_Sound_FX select 3) > 0) then
			{
				_e = _e - (GL4_Sound_FX select 3);
			};

			if (count _e > 0) then
			{
				[_a, _e] call (GL4_Incoming_F select 1);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Incoming Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Incoming
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		if ( (_d != _a) && (_d knowsAbout _a > 0) && (_d countEnemy [_a] > 0) && ( { ( (_d != _x) && (alive _x) && (_d distance _x < 100) ) } count (units _d) > 0) ) exitWith
		{
			[units _d] spawn
			{
				GL4_Sound_FX set [3, (GL4_Sound_FX select 3) + (_this select 0) ];

				sleep 30;

				GL4_Sound_FX set [3, (GL4_Sound_FX select 3) - (_this select 0) ];
			};

			_e = "";

			switch (side _d) do
			{
				case EAST :
				{
					_e = (GL4_Resource select 16) call GL4_Random_Select_F;
				};

				case WEST :
				{
					_e = (GL4_Resource select 17) call GL4_Random_Select_F;
				};

				case RESISTANCE :
				{
					_e = (GL4_Resource select 16) call GL4_Random_Select_F;
				};
			};

			if (_e != "") then
			{
				_d say _e;
			};
		};
	};

	}
];