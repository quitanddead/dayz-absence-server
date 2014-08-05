// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Launcher FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Launcher_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Launcher FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Launcher FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;

	if (GL4_Local select 34) then
	{
		_b = getNumber (configFile >> "CfgAmmo" >> (typeOf _a) >> "hit");

		[_a, _b] spawn (GL4_Launcher_FX_F select 1);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Launcher FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Launcher FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = time + 5;

	while { ( !(isNull _a) && (time < _c) ) } do
	{
		_d = (getPos _a);

		sleep 0.1;
	};

	if (_b > 100) then
	{
		_b = _b / 15;
	}
	else
	{
		_b = _b * 3;
	};

	if (GL4_Local select 35) then
	{
		[_b, _d] call (GL4_Launcher_FX_F select 2);
	};

	if ( !(surfaceIsWater _d) && !(isOnRoad _d) && ( (_d select 2) < 3) ) then
	{
		while { (_b > 0) } do
		{
			if (_b > 100) then
			{
				_e = [ 5 + (random 5),
				       [ (random 10 - random 10), (random 10 - random 10), 5 + (random 10) ],
				       1 + random 5,
				       [0.1 + random 0.3]
				];
			}
			else
			{
				_e = [ 5 + (random 5),
				       [ (random 10 - random 10), (random 10 - random 10), 5 + (random 5) ],
				       1 + random 5,
				       [0.1 + random 0.3]
				];
			};

			drop ["\ca\Data\ParticleEffects\Pstone\PStone.p3d", "", "SpaceObject", 1, (_e select 0),

			_d, (_e select 1), (_e select 2), 30, 0, 0,

			(_e select 3), [ [1,1,1,1] ], [0,1],

			0, 0, "", "", "", random 360];

			_b = _b - 3;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Launcher FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Launcher FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = random 1;

	_c = round _c;

	_a = _a + (random _a);

	while { (_a > 0) } do
	{
		switch (_c) do
		{
			case 0 :
			{
				_d = [ 0.1 + random 0.5,
				       [ (random 5 - random 5), (random 5 - random 5), (random 5 - random 5) * 3],
				       0.5 + random 1,
				       [random 0.3, random 0.1]
				];
			};

			case 1 :
			{
				_d = [ 0.1 + random 0.5,
				       [ (random 7 - random 7), (random 7 - random 7), (random 7 - random 7) * 3],
					0.7 + random 1,
				       [random 0.5, random 0.1]
				];
			};
		};

		drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_d select 0),

		_b, (_d select 1), 0, (_d select 2), random 0.5, 0,

		(_d select 3), [ [1,1,1,-10] ], [1000], random 0.5, random 0.5, "", "", "", random 360];

		_a = _a - 1;
	};

	}
];