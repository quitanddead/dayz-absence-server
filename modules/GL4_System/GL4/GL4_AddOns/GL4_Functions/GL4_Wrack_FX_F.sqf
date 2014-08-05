// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Wrack FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Wrack_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	if (GL4_Local select 66) then
	{
		if (player distance _a < (GL4_Local select 67) ) then
		{
			_c = (sizeOf typeOf _a);

			_c = _c * 15;

			if (floor (_b select 0) < (GL4_Local select 68) ) then
			{
				[_a, _c] spawn (GL4_Wrack_FX_F select 1);
			};

			if (floor (_b select 1) < (GL4_Local select 69) ) then
			{
				[_a] spawn (GL4_Wrack_FX_F select 2);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if !(surfaceIsWater getPos _a) then
	{
		sleep 3 + (random 5);

		_b = _b / 2;

		_c = time + _b;

		_d = 0;

		while { (time < _c) } do
		{
			_e = [ 3 + random 5,
			       [ 1 - random 2, 1 - random 2, random 5],
			       [ [1,1,1,-0],[1,1,1,-5],[1,1,1,-10] ]
			];

			if (_e select 1 select 2 > 3) then
			{
				_e set [0, 1 + random 1];
			}
			else
			{
				_e set [0, 3 + random 5];
			};

			drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_e select 0),

			"destructionEffect1", (_e select 1), 0, 1.265, 1, 0,

			[0.05 + random 0.10, 0.05 - random 0.10], (_e select 2), [1000],

			0, 0, "", "", _a, random 360];

			_e = [ 10 + (random 4),
			       -2 + (random 4),
			       [ [0,0,0,0.5], [0,0,0,0.5] ]
			];

			drop ["\Ca\Data\Cl_fired.p3d", "", "Billboard", 1, (_e select 0),

			"destructionEffect1", [ (_e select 1), (_e select 1), random 3], 1, 1.290, 1, 0,

			[random 0.10], (_e select 2), [0,1],

			0, 0.1, "", "", _a];

			if (time > _c / 2) then
			{
				sleep 0.20 + (random 20);
			}
			else
			{
				sleep 0.10 + (random 0.10);
			};

			if (_d == 50) then
			{
				_d = 0;

				if (GL4_Local select 23) then
				{
					if (floor (random 100) < 15) then
					{
						[_a] spawn (GL4_Sound_FX_F select 1);
					};
				};
			};

			_d = _d + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if !(surfaceIsWater getPos _a) then
	{
		sleep 6 + (random 4);

		_b = [ 120 - random 60,
		       0.75
 		];

		_c = (_b select 0) / 0.4;

		while { (_c > 0) } do
		{
			_d = 0;

			while { (_d < 10) } do
			{
				_e = [	0.6 + random 0.6,
				       random 360,
				       [ (_b select 1), (_b select 1), (_b select 1), 0],
					[ (_b select 1), (_b select 1), (_b select 1), 0.05 + random 0.1 ]
				];

				_f = [ [ (getPos _a select 0), (getPos _a select 1), (getPos _a select 2) -0.15],
					[ (_e select 0) * sin (_e select 1), (_e select 0) * cos (_e select 1), 0],
				       [ (_e select 2), (_e select 3), (_e select 3), (_e select 2) ]
				];

				drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, 3 + random 1,

				(_f select 0), (_f select 1), 1, 1.275, 1, 0,

				[2 + random 2], (_f select 2), [0,1], 1, 0.05, "", "", ""];

				_d = _d + 1;
			};

			sleep 0.4;

			_c = _c - 1;

			if ( (_b select 1) >= 0.60) then {_b set [1, (_b select 1) - 0.0025] };
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Wrack FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	if (floor (random 100) > 50) then
	{
		_c = 1;
	}
	else
	{
		_c = 2;
	};

	_d = random 3;

	while { (_d > 0) } do
	{
		_e = 10 * 5;

		_f = _e * random 5;

		if (_f < _e) then {_f = _e};

		while { (_f > 0) } do
		{
			switch (_c) do
			{
				case 1 :
				{
					_g = [ 1 + random 1,
					       [ + random 3 + (random 3 - random 3), + random 3 + (random 3 - random 3), 3 + (random 3 - random 3) ],
					       [random 0.3, random 0.1]
					];
				};

				case 2 :
				{
					_g = [ 1 + random 1,
					       [ - random 3 + (random 3 - random 3), - random 3 + (random 3 - random 3), 3 + (random 3 - random 3) ],
					       [random 0.3, random 0.1]
					];
				};
			};

			drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_g select 0),

			_b, (_g select 1), 0, 1.5 + random 1.5, 1, 0,

			(_g select 2), [ [0.1,0.1,1,-10],[1,1,1,-10] ], [1000], 0, 0, "", "", _a, random 360];

			_f = _f - 1;
		};

		_d = _d - 1;
	};

	}
];