// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// House FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_House_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// House FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// House FX
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	if (GL4_Local select 73) then
	{
		_c = 0;

		while { (_c < count _b) } do
		{
			_d = (_b select _c);

			[_a, _d] spawn (GL4_House_FX_F select 1);

			_c = _c + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// House FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// House FX
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h","_i"];

	_a = _this select 0;
	_b = _this select 1;

	_c = "Logic" createVehicleLocal [0,0,0];

	_c setPos _b;

	_d = "#particlesource" createVehicleLocal (getPos _c);
	_d attachTo [_c, [0,0,0], ""];
	_d setDropInterval 0.01;

	_d setParticleParams [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 10, 32, 1], "", "Billboard", 1, 1 + random 1,

	[0, 0, 0], [0, 0, 1], 360, 0.045, 0.04, 0.05,

	[1 + random 3, 1], [ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,0] ], [0.5, 1], 0, 0, "", "", _c, 0.1];

	_d setParticleRandom [0.5, [0.3, 0.3, 0.3], [0.1, 0.1, 0.5], 10, 0.5, [0.1,0.1,0.1,0], 0, 0];

	_e = "#lightpoint" createVehicleLocal (getPos _c);
	_e setLightBrightness 0.02;
	_e setLightAmbient [3,1,0];
	_e setLightColor [3,1,0];
	_e lightAttachObject [_c, [0,0,0] ];

	_f = nearestObjects [_c, ["Logic"], 10];

	_f = _f - [_c];

	if (count _f == 0) then
	{
		if (GL4_Local select 23) then
		{
			_g = (GL4_Resource select 29) call GL4_Random_Select_F;
		}
		else
		{
			_g = "Sound_Fire";
		};

		_h = createSoundSource [_g, (getPos _c), [], 0];
	};

	_i = time + (100 + (random 100) );

	if (GL4_Local select 74) then
	{
		[_c, _i] spawn (GL4_Burning_FX_F select 1);
	}; 

	if (floor (random 100) < 50) then
	{
		[_c, _i] spawn (GL4_House_FX_F select 2);
	}; 

	while { ( (alive _a) && (time < _i) ) } do
	{
		if (floor (random 500) < 0.1) then
		{
			"R_Hydra_HE" createVehicleLocal [ (getPos _c select 0), (getPos _c select 1), 0];
		};

		sleep 1;
	};

	deleteVehicle _c;
	deleteVehicle _d;
	deleteVehicle _e;
	if (typeName _h != "Scalar") then {deleteVehicle _h};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// House FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// House FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_b = _b / 2;

	_c = time + _b;

	while { (time < _c) } do
	{
		_d = [ 3 + random 5,
		       [ 1 - random 2, 1 - random 2, random 5],
		       [ [1,1,1,-0],[1,1,1,-5],[1,1,1,-10] ]
		];

		if (_d select 1 select 2 > 3) then
		{
			_d set [0, 1 + random 1];
		}
		else
		{
			_d set [0, 3 + random 5];
		};

		drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_d select 0),

		"destructionEffect1", (_d select 1), 0, 1.265, 1, 0,

		[0.05 + random 0.10, 0.05 - random 0.10], (_d select 2), [1000],

		0, 0, "", "", _a, random 360];

		_d = [ 10 + (random 4),
		       -2 + (random 4),
		       [ [0,0,0,0.5], [0,0,0,0.5] ]
		];

		drop ["\Ca\Data\Cl_fired.p3d", "", "Billboard", 1, (_d select 0),

		"destructionEffect1", [ (_d select 1), (_d select 1), random 3], 1, 1.290, 1, 0,

		[random 0.10], (_d select 2), [0,1],

		0, 0.1, "", "", _a];

		if (time > _c / 2) then
		{
			sleep 0.20 + (random 20);
		}
		else
		{
			sleep 0.10 + (random 0.10);
		};
	};

	}
];