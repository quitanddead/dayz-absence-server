// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Dubbing Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Dubbing_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Dubbing Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (count units _a);

	_c = (units _a select random _b);

	if ( (_c isKindOf "Man") && (alive _c) && ( { ( (_c != _x) && (alive _x) && (_c distance _x < 100) ) } count (units _c) > 0) ) then
	{
		if (typeName _a == "Object") then
		{
			sleep 5 + (random 5);
		};

		_d = [_c] call (GL4_Dubbing_F select 1);

		if (typeName _a == "Group") then
		{
			GL4_Dubbing set [0, (GL4_Dubbing select 0) - [_a] ];

			sleep _d;

			GL4_Dubbing set [0, (GL4_Dubbing select 0) + [_a] ];
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Dubbing Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;				

	_b = behaviour _a;

	_c = "";

	_d = 10 + (random 10);

	_e = [_a] call (GL4_Dubbing_F select 2);

	if ( (_e == 0) || (_e == 1) ) then
	{
		switch (_b) do
		{
			case "CARELESS" :
			{
				if (_e == 0) then
				{
					if (floor (random 100) < 50) then
					{
						switch (side _a) do
						{
							case EAST :
							{
								_c = (GL4_Resource select 0) call GL4_Random_Select_F;
							};

							case WEST :
							{
								_c = (GL4_Resource select 1) call GL4_Random_Select_F;
							};

							case RESISTANCE :
							{
								_c = (GL4_Resource select 0) call GL4_Random_Select_F;
							};
						};

						if (_a isKindOf "Man") then
						{
							[_a, _c] call (GL4_Dubbing_F select 6);

							_d = 50 + (random 100);

							if (floor (random 100) < 35) then
							{
								[_a] spawn (GL4_Dubbing_F select 0);
							};
						};
					};
				};
			};

			case "SAFE" :
			{
				if (_e == 0) then
				{
					if (floor (random 100) < 50) then
					{
						switch (side _a) do
						{
							case EAST :
							{
								_c = (GL4_Resource select 0) call GL4_Random_Select_F;
							};

							case WEST :
							{
								_c = (GL4_Resource select 1) call GL4_Random_Select_F;

							};

							case RESISTANCE :
							{
								_c = (GL4_Resource select 0) call GL4_Random_Select_F;
							};
						};

						if (_a isKindOf "Man") then
						{
							[_a, _c] call (GL4_Dubbing_F select 6);

							_d = 50 + (random 100);

							if (floor (random 100) < 35) then
							{
								[_a] spawn (GL4_Dubbing_F select 0);
							};
						};
					};
				};
			};

			case "AWARE" :
			{
				if (_e == 0) then
				{
					if (floor (random 100) < 50) then
					{
						if ( (veloCity _a call (GL4_Dubbing_F select 3) ) <= 0) then
						{
							switch (side _a) do
							{
								case EAST :
								{
									_c = (GL4_Resource select 0) call GL4_Random_Select_F;
								};

								case WEST :
								{
									_c = (GL4_Resource select 1) call GL4_Random_Select_F;

								};

								case RESISTANCE :
								{
									_c = (GL4_Resource select 0) call GL4_Random_Select_F;
								};
							};

							if (_a isKindOf "Man") then
							{
								[_a, _c] call (GL4_Dubbing_F select 6);

								_d = 50 + (random 100);

								if (floor (random 100) < 35) then
								{
									[_a] spawn (GL4_Dubbing_F select 0);
								};
							};
						}
						else
						{
							switch (side _a) do
							{
								case EAST :
								{
									_c = (GL4_Resource select 2) call GL4_Random_Select_F;
								};

								case WEST :
								{
									_c = (GL4_Resource select 3) call GL4_Random_Select_F;
								};

								case RESISTANCE :
								{
									_c = (GL4_Resource select 2) call GL4_Random_Select_F;
								};
							};

							if (_a isKindOf "Man") then
							{
								[_a, _c] call (GL4_Dubbing_F select 6);

								_d = 50 + (random 100);

								if (floor (random 100) < 35) then
								{
									[_a] spawn (GL4_Dubbing_F select 0);
								};
							};
						};
					};
				}
				else
				{
					if (floor (random 100) < 75) then
					{
						switch (side _a) do
						{
							case EAST :
							{
								_c = (GL4_Resource select 4) call GL4_Random_Select_F;
							};

							case WEST :
							{
								_c = (GL4_Resource select 5) call GL4_Random_Select_F;
							};

							case RESISTANCE :
							{
								_c = (GL4_Resource select 4) call GL4_Random_Select_F;
							};
						};

						if (_a isKindOf "Man") then
						{
							[_a, _c] call (GL4_Dubbing_F select 6);

							_d = 10 + (random 10);

							if (floor (random 100) < 35) then
							{
								[_a] spawn (GL4_Dubbing_F select 0);
							};
						};
					};
				};
			};

			case "COMBAT" :
			{
				if (_e == 0) then
				{
					if (floor (random 100) < 50) then
					{
						switch (side _a) do
						{
							case EAST :
							{
								_c = (GL4_Resource select 2) call GL4_Random_Select_F;
							};

							case WEST :
							{
								_c = (GL4_Resource select 3) call GL4_Random_Select_F;
							};

							case RESISTANCE :
							{
								_c = (GL4_Resource select 2) call GL4_Random_Select_F;
							};
						};

						if (_a isKindOf "Man") then
						{
							[_a, _c] call (GL4_Dubbing_F select 6);

							_d = 50 + (random 100);

							if (floor (random 100) < 35) then
							{
								[_a] spawn (GL4_Dubbing_F select 0);
							};
						};
					};
				}
				else
				{
					if (floor (random 100) < 75) then
					{
						switch (side _a) do
						{
							case EAST :
							{
								_c = (GL4_Resource select 6) call GL4_Random_Select_F;
							};

							case WEST :
							{
								_c = (GL4_Resource select 7) call GL4_Random_Select_F;
							};

							case RESISTANCE :
							{
								_c = (GL4_Resource select 6) call GL4_Random_Select_F;
							};
						};

						if (_a isKindOf "Man") then
						{
							[_a, _c] call (GL4_Dubbing_F select 6);

							_d = 10 + (random 10);

							if (floor (random 100) < 35) then
							{
								[_a] spawn (GL4_Dubbing_F select 0);
							};
						};
					};
				};
			};
		};
	};

	_d

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Dubbing Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = True;

	_c = 0;

	_d = nearestObjects [_a, ["Man"], 300];

	if (count _d > 0) then
	{
		_e = 0;

		while { ( (_e < count _d) && (_b) ) } do
		{
			_f = (_d select _e);

			if ( (alive _f) && (primaryWeapon _f != "") && (_a countEnemy [_f] > 0) && (group _f knowsAbout (vehicle _a) > 0) ) then
			{
				_b = False;

				_c = 1;
			}
			else
			{
				if ( (alive _f) && (_a countEnemy [_f] > 0) && (group _f knowsAbout (vehicle _a) == 0) ) then
				{
					_b = False;

					_c = 2;
				};
			};

			_e = _e + 1;
		};
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Dubbing Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = (_this select 0) * (_this select 0);
	_b = (_this select 1) * (_this select 1);
	_c = (_this select 2) * (_this select 2);

	sqrt (_a + _b + _c)

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Dubbing Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (count units _b);

	_d = units _b select random _c;

	if ( (_d isKindOf "Man") && (alive _d) && ( { ( (_d != _x) && (alive _x) && (_d distance _x < 100) ) } count (units _d) > 0) ) then
	{
		switch (_a) do
		{
			case "Advancing" :
			{
				if (floor (random 100) < 35) then
				{
					switch (side _d) do
					{
						case EAST :
						{
							_e = (GL4_Resource select 8) call GL4_Random_Select_F;
						};

						case WEST :
						{
							_e = (GL4_Resource select 9) call GL4_Random_Select_F;
						};

						case RESISTANCE :
						{
							_e = (GL4_Resource select 8) call GL4_Random_Select_F;
						};
					};

					[_d, _e] call (GL4_Dubbing_F select 6);
				};
			};

			case "Suppressed" :
			{
				if (floor (random 100) < 35) then
				{
					switch (side _d) do
					{
						case EAST :
						{
							_e = (GL4_Resource select 10) call GL4_Random_Select_F;
						};

						case WEST :
						{
							_e = (GL4_Resource select 11) call GL4_Random_Select_F;
						};

						case RESISTANCE :
						{
							_e = (GL4_Resource select 10) call GL4_Random_Select_F;
						};
					};

					[_d, _e] call (GL4_Dubbing_F select 6);
				};
			};

			case "Woohoo" :
			{
				if (floor (random 100) < 35) then
				{
					switch (side _d) do
					{
						case EAST :
						{
							_e = (GL4_Resource select 27) call GL4_Random_Select_F;
						};

						case WEST :
						{
							_e = (GL4_Resource select 28) call GL4_Random_Select_F;
						};

						case RESISTANCE :
						{
							_e = (GL4_Resource select 27) call GL4_Random_Select_F;
						};
					};

					sleep 1 + (random 3);

					[_d, _e] call (GL4_Dubbing_F select 6);
				};
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Dubbing Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	sleep 1 + (random 3);

	_b = 75;

	_c = (GL4_Player select 0);

	_d = 0;

	while { (_d < count _c) } do
	{
		_e = (_c select _d);

		_f = (vehicle _e);

		if ( (_f isKindOf "Man") && (alive _f) && (_f distance _a < 200) ) then
		{
			if (floor (random 100) < _b) then
			{
				switch (side _f) do
				{
					case EAST :
					{
						_g = (GL4_Resource select 16) call GL4_Random_Select_F;
					};

					case WEST :
					{
						_g = (GL4_Resource select 17) call GL4_Random_Select_F;
					};

					case RESISTANCE :
					{
						_g = (GL4_Resource select 16) call GL4_Random_Select_F;
					};
				};

				[_f, _g] call (GL4_Dubbing_F select 6);

				sleep 5 - (random 3);

				_b = 35;
			};
		};

		_d = _d + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Dubbing Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;
	_b = _this select 1;

	if (_b != "") then
	{
		if ( { (_a distance _x < (GL4_Local select 2) ) } count (GL4_Player select 0) > 0) then
		{
			if (isMultiplayer) then
			{
				if (isDedicated) then
				{
					GL4_AddOn_PublicVariable = [1, _a, _b]; publicVariable "GL4_AddOn_PublicVariable";
				}
				else
				{
					GL4_AddOn_PublicVariable = [1, _a, _b]; publicVariable "GL4_AddOn_PublicVariable";

					_a say _b;
				};
			}
			else
			{
				if (GL4_Local select 1) then
				{
					_a say _b;
				};
			};
		};
	};

	}
];