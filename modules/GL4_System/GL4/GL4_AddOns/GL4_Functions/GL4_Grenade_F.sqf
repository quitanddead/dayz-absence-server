// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Grenade Function
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Grenade_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Grenade Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Grenade Fired
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = nearestObjects [_a, ["Man"], 100];

	if (count _b > 0) then
	{
		_c = 0;

		while { (_c < count _b) } do
		{
			_d = (_b select _c);

			if ( (alive _d) && (_d knowsAbout _a > 0) && (_d countEnemy [_a] > 0) && ( { ( (_d != _x) && (alive _x) && (_d distance _x < 100) ) } count (units _d) > 0) ) exitWith
			{
				_a = _d;
			};

			_c = _c + 1;
		};

		if ( { ( (_x != _a) && (alive _x) && (_x distance _a < 100) ) } count (units _a) > 0) then
		{
			_e = "";

			switch (side _a) do
			{
				case EAST :
				{
					_e = (GL4_Resource select 14) call GL4_Random_Select_F;
				};

				case WEST :
				{
					_e = (GL4_Resource select 15) call GL4_Random_Select_F;
				};

				case RESISTANCE :
				{
					_e = (GL4_Resource select 14) call GL4_Random_Select_F;
				};
			};

			if (_e != "") then
			{
				_a say _e;
			};
		};
	};

	}
];