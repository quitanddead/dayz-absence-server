// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Shell FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Shell_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = getNumber (configFile >> "CfgAmmo" >> (typeOf _b) >> "hit");

	if (GL4_Local select 42) then
	{
		[_a, _c] spawn (GL4_Shell_FX_F select 5);
	};

	_d = getPos _b;

	_e = time + 5;

	while { ( !(isNull _b) && (time < _e) ) } do
	{
		_d = getPos _b;

		sleep 0.01;
	};

	if !(surfaceIsWater _d) then
	{
		_f = (GL4_Shell_FX select 0);

		_f setPos _d;

		if (floor (random 100) < (GL4_Local select 38) ) then
		{
			[_c, _f] call (GL4_Shell_FX_F select 1);
		};

		if ( (_d select 2 < 5) && !(isOnRoad getPos _f) ) then
		{
			if (floor (random 100) < (GL4_Local select 39) ) then
			{
				[_c, _f] call (GL4_Shell_FX_F select 2);
			};
		};

		if (GL4_Local select 42) then
		{
			[_f] spawn (GL4_Shell_FX_F select 5);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = random 3;

	_c = round _c;

	_a = _a / 3;

	_a = _a / (GL4_Local select 37);

	while { (_a > 0) } do
	{
		switch (_c) do
		{
			case 0 :
			{
				_d = [ 0.1 + random 1,
				       [ + random 5 + (random 5 - random 5), + random 5 + (random 5 - random 5), (random 5 - random 5) * 3],
				       0.5 + random 1,
				       [random 0.3, random 0.3]
				];
			};

			case 1 :
			{
				_d = [ 0.1 + random 1,
				       [ - random 5 + (random 5 - random 5), - random 5 + (random 5 - random 5), (random 5 - random 5) * 3],
				       0.5 + random 1,
				       [random 0.3, random 0.3]
				];
			};

			case 2 :
			{
				_d = [ 0.1 + random 1,
				       [ + random 7 + (random 7 - random 7), + random 7 + (random 7 - random 7), (random 7 - random 7) * 3],
					0.7 + random 1,
				       [random 0.5, random 0.5]
				];
			};

			case 3 :
			{
				_d = [ 0.1 + random 1,
				       [ - random 7 + (random 7 - random 7), - random 7 + (random 7 - random 7), (random 7 - random 7) * 3],
					0.7 + random 1,
				       [random 0.5, random 0.5]
				];
			};
		};

		drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_d select 0),

		[0,0,0], (_d select 1), 0, (_d select 2), random 0.5, 0,

		(_d select 3), [ [1,1,1,-10] ], [1000], random 0.5, random 0.5, "", "", _b, random 360];

		_a = _a - 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = nearestObjects [_b, ["Car","Tank","Air","House"], 10];

	if (count _c == 0) then
	{
		if (floor (random 100) < (GL4_Local select 40) ) then
		{
			[_a, _b] call (GL4_Shell_FX_F select 3);
		};

		if (floor (random 100) < (GL4_Local select 41) ) then
		{
			[_a, _b] call (GL4_Shell_FX_F select 4);
		};

		if (isClass (configFile >> "cfgPatches" >> "GL4_Shell_FX") ) then
		{
			_d = "GL4_Crater" createVehicleLocal (getPos _b);
		};

		_a = _a / 10;

		_a = _a / (GL4_Local select 37);

		while { (_a > 0) } do
		{
			_e = [ 3 + random 3,
			       [ (random 1 - random 1), (random 1 - random 1), 5 + (random 7) ],
			       [3 + random 5],
			       [ [0.1,0.1,0.1,1],[0.1,0.1,0.1,0] ]
			];

			if (floor (random 100) > 75) then
			{
				_e set [3, [ [0.3,0.3,0.3,1],[0.3,0.3,0.3,0] ] ];
			};

			drop [ ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 9, 0], "", "Billboard", 1, (_e select 0),

			[0,0,0], (_e select 1), 0, 10, 1, 0,

			(_e select 2), (_e select 3), [1000], 1, 1, "", "", _b, random 360];

			_a = _a - 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	_a = _a / 30;

	_a = _a / (GL4_Local select 37);

	while { (_a > 0) } do
	{
		if (floor (random 100) > 35) then
		{
			_c = [ 5 + (random 5),
			       [ (random 10 - random 10), (random 10 - random 10), 5 + (random 10) ],
			       1 + random 1,
			       [0.1 + random 0.7]
			];
		}
		else
		{
			_c = [ 5 + (random 5),
			       [ (random 10 - random 10), (random 10 - random 10), 10 + (random 10) ],
			       1 + random 1,
			       [0.1 + random 0.7]
			];
		};

		drop ["\Ca\Data\ParticleEffects\Pstone\PStone.p3d", "", "SpaceObject", 1, (_c select 0),

		[0,0,0], (_c select 1), (_c select 2), 30, 0, 0,

		(_c select 3), [ [1,1,1,1] ], [0,1],

		0, 0, "", "", _b, random 360];

		_a = _a - 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	_a = _a / 50;

	_a = _a / (GL4_Local select 37);

	while { (_a > 0) } do
	{
		_c = [ 2 - (random 1),
		       [ (random 5 - random 10), (random 5 - random 10), 5 + (random 10) ],
		       1 + random 1,
		       [0.1 + random 0.7]
		];

		drop [ ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 9, 0], "", "Billboard", 0.05, (_c select 0),

		[0,0,0], (_c select 1), (_c select 2), 30, 0, 0,

		(_c select 3), [ [1,1,1,1] ], [1000],

		1, 1, (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Dirt_Trail_FX_F.sqf"), "", _b, random 360];

		_a = _a - 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Shell FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle player);

	if ( (_c isKindOf "Man") && (alive _c) ) then
	{
		_d = (_a distance _c);

		if (_d < 50) then
		{
			"dynamicBlur" ppEffectEnable True;

			"dynamicBlur" ppEffectAdjust [ (_b / 15) / _d];
			"dynamicBlur" ppEffectCommit 0;

			_e = getDir _c;

			_f = (_b / 5) / _d;

			while { ( (_f > 0) && (alive _c) ) } do
			{
				_c setDir _e + (random 15 - random 15);

				_f = _f - 1;

				sleep 0.005 + (random 0.005);
			};

			player setDir _e;

			_g = (_b / 15) / _d;

			while { (_g > 0) } do
			{
				_g = _g - 0.01;

				"dynamicBlur" ppEffectAdjust [_g];
				"dynamicBlur" ppEffectCommit 0;

				sleep 0.01;
			};

			"dynamicBlur" ppEffectEnable False;
		};
	};

	}
];