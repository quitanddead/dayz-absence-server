// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Debri FX Functions
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Debri_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Debri FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Debri FX Smoke
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	if (isNull Player) exitWith {};

	_a = _this select 0;

	switch (_this select 1) do
	{
		case 1 :
		{
			_b = [ 0.3 + random 0.7,
			       [0.1 + random 0.3, 0.1 - random 0.3],
			       [ [0.1,0.1,0.1,0.7] ],
			       100
			];
		};

		case 2 :
		{
			_b = [ 0.3 + random 0.7,
			       [0.1 + random 0.3, 0.1 - random 0.3],
			       [ [1,1,1,-3] ],
			       50
			];
		};
	};

	_d = "#particlesource" createVehicleLocal (getPos _a);
	_d setDropInterval 0.01;

	_d setParticleParams [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 7, 8, 0], "", "Billboard", 1, (_b select 0),

	[0,0,0], [0,0,0], 0, 1, 1, 0,

	(_b select 1), (_b select 2), [1000],

	0, 0, "", "", "", random 360];

	_d attachTo [_a, [0,0,0], ""];

	_d setParticleRandom [ (_b select 0), [0,0,0], [0,0,0], 0, 0, [0,0,0,0], 0.05, 0.05, random 360];

	if (floor (random 100) > (_b select 3) ) then
	{
		[_a] spawn (GL4_Debri_FX_F select 1);
	};

	while { (getPos _a select 2 > 0) } do
	{
		_d setPos getPos _a;

		sleep 0.01;
	};

	deleteVehicle _d;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Debri FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Debri FX Fire
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	if (isNull Player) exitWith {};

	_a = _this select 0;

	_b = [ 0.3 + random 0.7,
	       [0.3 + random 0.7, 0.3 - random 0.7],
	       [ [1,1,1,-1] ]
	];

	_d = "#particlesource" createVehicleLocal (getPos _a);
	_d setDropInterval 0.01;

	_d setParticleParams ["\Ca\Data\Cl_exp.p3d", "", "Billboard", 1, (_b select 0),

	[0,0,0], [0,0,0], 0, 1, 1, 0,

	(_b select 1), (_b select 2), [1000],

	0, 0, "", "", "", random 360];

	_d setParticleRandom [ (_b select 0), [0,0,0], [random 0.5, random 0.5, random 0.5], 0.5, 0.5, [0,0,0,0], 0.05, 0.05, random 360];

	while { (getPos _a select 2 > 0) } do
	{
		_d setPos (getPos _a);

		sleep 0.01;
	};

	deleteVehicle _d;

	}
];