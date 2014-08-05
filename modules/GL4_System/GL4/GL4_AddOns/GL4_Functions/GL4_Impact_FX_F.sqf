// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Impact FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Impact_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Impact FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Impact FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	if (GL4_Local select 43) then
	{
		_c = ["destructionEffect1","destructionEffect2","destructionEffect3","destructionEffect4","destructionEffect5"] call GL4_Random_Select_F;

		[_a, _c] call (GL4_Impact_FX_F select 1);

		[_a, _c] call (GL4_Impact_FX_F select 2);

		if (GL4_Local select 47) then
		{
			if (floor (_b select 0) < (GL4_Local select 46) ) then
			{
				[_a] call (GL4_Explosion_FX_F select 5);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Impact FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Impact FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = 15 + (random 15);

	_c = _c / (GL4_Local select 44);

	while { (_c > 0) } do
	{
		drop [ ["\ca\Data\ParticleEffects\Universal\Universal", 16, 0, 32, 0], "", "Billboard", 1, random 0.3,

		_b, [0,0,0], 0, 1, 1, 0,

		[1], [ [1,1,1,-1] ], [0,1],

		0.2, 0.2, "", "", _a, 1];

		_c = _c - 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Impact FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Impact FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = random 3;

	_c = round _c;

	_d = 30 * 5 * random 3;

	if (_d < 30 * 5) then {_d = 30 * 5};

	_d = _d / (GL4_Local select 44);

	while { (_d > 0) } do
	{
		switch (_c) do
		{
			case 0 :
			{
				_e = [ 0.1 + random 1,
				       [ + random 5 + (random 5 - random 5), + random 5 + (random 5 - random 5), (random 5 - random 5) * 3],
				       0.5 + random 1,
				       [random 0.3, random 0.3]
				];
			};

			case 1 :
			{
				_e = [ 0.1 + random 1,
				       [ - random 5 + (random 5 - random 5), - random 5 + (random 5 - random 5), (random 5 - random 5) * 3],
				       0.5 + random 1,
				       [random 0.3, random 0.3]
				];
			};

			case 2 :
			{
				_e = [ 0.1 + random 1,
				       [ + random 7  + (random 7 - random 7), + random 7 + (random 7 - random 7), (random 7 - random 7) * 3],
					0.7 + random 1,
				       [random 0.5, random 0.5]
				];
			};

			case 3 :
			{
				_e = [ 0.1 + random 1,
				       [ - random 7 + (random 7 - random 7), - random 7 + (random 7 - random 7), (random 7 - random 7) * 3],
					0.7 + random 1,
				       [random 0.5, random 0.5]
				];
			};
		};

		drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_e select 0),

		_b, (_e select 1), 0, (_e select 2), random 0.5, 0,

		(_e select 3), [ [1,1,1,-10] ], [1000], random 0.5, random 0.5, "", "", _a, random 360];

		_d = _d - 1;
	};

	}
];