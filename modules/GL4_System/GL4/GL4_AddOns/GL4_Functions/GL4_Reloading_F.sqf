// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Reloading Function
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Reloading_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Reloading Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Reloading
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	if (GL4_Local select 1) then
	{
		_b = (vehicle _a);

		while { (alive _b) } do
		{
			_b = (vehicle _a);

			if ( (_b isKindOf "Man") && (needReload _b == 1) && ( { ( (_x != _b) && (alive _x) && (_x distance _b < 100) ) } count (units _b) > 0) && !(_b in (GL4_Reloading select 1) ) ) then
			{
				if (floor (random 100) < 75) then
				{
					_c = nearestObjects [_b, ["Man"], 200];

					if (count _c > 0) then
					{
						_d = 0;

						while { (_d < count _c) } do
						{
							_e = (_c select _d);

							if ( (alive _e) && (_e knowsAbout _b > 0) && (_b countEnemy [_e] > 0) ) exitWith
							{
								switch (side _b) do
								{
									case EAST :
									{
										_f = (GL4_Resource select 12) call GL4_Random_Select_F;
									};

									case WEST :
									{
										_f = (GL4_Resource select 13) call GL4_Random_Select_F;
									};

									case RESISTANCE :
									{
										_f = (GL4_Resource select 12) call GL4_Random_Select_F;
									};
								};

								[_b, _f] call (GL4_Dubbing_F select 6);

								GL4_Reloading set [1, (GL4_Reloading select 1) + [_b] ];
							};

							_d = _d + 1;
						};
					};
				}
				else
				{
					while { ( (alive _b) && (needReload _b == 1) ) } do
					{
						sleep 5 + (random 5);
					};
				};
			}
			else
			{
				if ( (needReload _b == 0) && (_b in (GL4_Reloading select 1) ) ) then
				{
					sleep 5 + (random 5);

					GL4_Reloading set [1, (GL4_Reloading select 1) - [_b] ];
				};
			};

			sleep 1;
		};

		GL4_Reloading set [0, (GL4_Reloading select 0) - [_b] ];
	};

	}
];