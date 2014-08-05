// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Backblast FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Backblast_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	if (GL4_Local select 78) then
	{
		[_a, _c] spawn (GL4_Backblast_FX_F select 1);
	};

	if (GL4_Local select 79) then
	{
		[_a, 1] call (GL4_Backblast_FX_F select 2);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = [ [ (getPos _a select 0) + sin (getDir _a + 180) * 0.8, (getPos _a select 1) + cos (getDir _a + 180) * 0.8, _b -0.15],
	       [sin (getDir _a + 205) * 3, cos (getDir _a + 195) * 2, -0.5],
	       [sin (getDir _a + 180) * 3, cos (getDir _a + 180) * 2, -0.5],
	       [sin (getDir _a + 165) * 3, cos (getDir _a + 165) * 2, -0.5]
	];

	// /////////// DEBUG ///////////
	// setAccTime 0.3;
	// /////////////////////////////

	_d = 0;

	while { (_d < 50) } do
	{
		_e = [ 0.3 + random 0.5,
		       5 + random 5
		];

		_f = [ [sin (getDir _a + (150 + _d) ) * (_e select 1), cos (getDir _a + (150 + _d) ) * (_e select 1), 0.5 - (random 1) ],
		       0.5 + random 0.5,
		       [random 0.1 + random 0.1, random 0.1 - random 0.1]
		];

		drop [ (GL4_Config_FX select 0),  "", "Billboard", 1, (_e select 0),

		(_c select 0), (_f select 0), 0, (_f select 1), 0.5, 0,

		(_f select 2), [ [1,1,1,-10] ], [1000],

		0, 0, "", "", "", random 360];

		_d = _d + 0.5;
	};

	_d = 0;

	while { (_d < 30) } do
	{
		_e = [ 0.1 + random 0.3,
		       5 + (random 5)
		];

		_f = [ [sin (getDir _a + (165 + _d) ) * (_e select 1), cos (getDir _a + (165 + _d) ) * (_e select 1), 0.5 - (random 1) ],
		       [1 + random 1],
		       [ [1,1,1,-3],[1,1,1,-2],[1,1,1,-1],[1,1,1,-0] ]
		];

		drop [ ["\ca\Data\ParticleEffects\Universal\Universal", 16, 0, 3, 0], "", "Billboard", 1, (_e select 0),

		(_c select 0), (_f select 0), 1, 0.005, 0.0042, 0.075,

		(_f select 1), (_f select 2), [3 + random 5],

		1, 0, "", "", "", random 360];

		_d = _d + 1;
	};

	_d = 0;

	while { (_d < 4) } do
	{
		drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 7, 8, 0], "", "Billboard", 1, 5, (_c select 0), (_c select 1), 1, 0.005, 0.0042, 0.05, [0.5,5], [ [0.8, 0.8, 0.8, 0.4],[0.4, 0.4, 0.4, 0.7] ], [0,1,0,1,0,1], 0.4, 0.4, "", "", ""];

		drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 7, 8, 0], "", "Billboard", 1, 5, (_c select 0), (_c select 2), 1, 0.005, 0.0042, 0.05, [0.5,5], [ [0.8, 0.8, 0.8, 0.4],[0.4, 0.4, 0.4, 0.7] ], [0,1,0,1,0,1], 0.4, 0.4, "", "", ""];
		drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 7, 8, 0], "", "Billboard", 1, 5, (_c select 0), (_c select 3), 1, 0.005, 0.0042, 0.05, [0.5,5], [ [0.8, 0.8, 0.8, 0.4],[0.4, 0.4, 0.4, 0.7] ], [0,1,0,1,0,1], 0.4, 0.4, "", "", ""];

		sleep 0.05;

		_d = _d + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = nearestObjects [_a, ["Man"], 10];

	if (count _c > 0) then
	{
		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			if ( (_e != _a) && (alive _e) ) then 
			{
				if ( [position _a, getDir _a - 180, 35, position _e] call (GL4_Backblast_FX_F select 3) ) then
				{
					switch (_b) do
					{
						case 1 :
						{
							[_a, _e] spawn (GL4_Backblast_FX_F select 4);
						};

						case 2 :
						{
							if (floor (random 100) < 50) then
							{
								_f = (GL4_Resource select 43) call GL4_Random_Select_F;

								_e playMove _f;
							}
							else
							{
								if (stopped _e) then
								{
									_e stop False;
								};

								_e doMove [ ( (getPos _e select 0) + (random 30 - random 30) ), ( (getPos _e select 1) + (random 30 - random 30) ), 0];
							};
						};
					};
				};
			};

			_d = _d + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = False;

	_b = (_this select 1) - ( (_this select 2) / 2 );

	_c = (_this select 1) + ( (_this select 2) / 2 );

	_d = ( (_this select 3) select 0) - ( (_this select 0) select 0);

	_e = ( (_this select 3) select 1) - ( (_this select 0) select 1);

	_f = _d atan2 _e;

	if (_f < 0) then
	{
		_f = _f + 360;
	};

	_g = _f - 360;

	_h = _f + 360;

	if ( (_f >= _b && _f <= _c) || (_g >= _b && _g <= _c) || (_h >= _b && _h <= _c) ) then
	{
		_a = True;
	};

	_a

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (_a distance _b);

	_d = [ 1 * (10 - _c) / 10,
		(getDir _a + 180)
	];

	_b setDammage (getDammage _b + (_d select 0) );

	_b setVeloCity [ (veloCity _b select 0) + (sin (_d select 1) * 30 / _c), (veloCity _b select 1) + (cos (_d select 1) * 30 / _c), (veloCity _b select 2) ];

	if (floor (random 100) < 75) then
	{
		_e = (GL4_Resource select 18) call GL4_Random_Select_F;

		[_b, _e] call (GL4_Dubbing_F select 6);
	};

	_b switchMove "AdthPercMstpSrasWrflDnon_16";

	sleep (10 / _c);

	if (alive _b) then
	{
		_b switchMove "AinjPpneMstpSnonWnonDnon_kneel";
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Backblast FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a"];

	_a = _this select 0;

	while { (alive _a) } do
	{
		if (currentWeapon _a in (GL4_Resource select 42) ) then
		{
			[_a, 2] call (GL4_Backblast_FX_F select 2);

			sleep 3;
		}
		else
		{
			sleep 1;
		};
	};

	}
];