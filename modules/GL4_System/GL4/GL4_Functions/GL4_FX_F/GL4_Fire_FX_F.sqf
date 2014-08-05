// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Fire FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Fire_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Fire FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Fire FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	while { (surfaceIsWater (getPos _a) ) } do
	{
		sleep 1;
	};

	_b = 3 - (random 1);

	_c = 0.5 + random 0.5;

	_d = "#particlesource" createVehicleLocal (getPos _a);
	_d attachTo [_a, [0,0,_c], ""];
	_d setDropInterval 0.01;

	_e = "#lightpoint" createVehicleLocal (getPos _a);
	_e setLightBrightness 0;
	_e setLightAmbient [3,1,0];
	_e setLightColor [3,1,0];
	_e lightAttachObject [_a, [0,0,-1] ];

	_f = createSoundSource ["Sound_Fire", (getPos _a), [], 0];

	_f attachto [_a, [0,0,0], ""];

	while { ( (alive _a) && !(surfaceIsWater (getPos _a) ) ) } do
	{
		_d setParticleParams [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 10, 32, 1], "", "Billboard", 1, 0.5 + random 0.5,

		[0, 0, (getPos _a select 2) + _c], [0, 0, 0], 0, 1, 0.9, 0,

		[_b / 3, _b / 5], [ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,0] ], [0.5, 1], 0, 0, "", "", _a, 0.1];

		_d setParticleRandom [0.5, [0.1, 0.1, 0.1], [0.1, 0.1, 0.1], 0.1, 0.5, [0.1,0.1,0.1,0], 0, 0];

		_e setLightBrightness (_b / 100);

		sleep 3;
	};

	while { ( (_b > 1) && !(surfaceIsWater (getPos _a) ) ) } do
	{
		_d setParticleParams [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 10, 32, 1], "", "Billboard", 1, 0.5 + random 0.5,

		[0, 0, 0.5], [0, 0, 0], 0, 1, 0.9, 0,

		[_b / 3, _b / 5], [ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,0] ], [0.5, 1], 0, 0, "", "", _a, 0.1];

		_d setParticleRandom [0.5, [0.1, 0.1, 0.1], [0.1, 0.1, 0.1], 0.1, 0.5, [0.1,0.1,0.1,0], 0, 0];

		_e setLightBrightness (_b / 100);

		_b = _b - 0.05 - rain / 10;

		sleep 3;
	};

	deleteVehicle _d;

	deleteVehicle _e; 

	deleteVehicle _f;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Fire FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Fire FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = time + _b;

	sleep 5 + (random 10);

	_d = "#particlesource" createVehicleLocal (getPos _a);
	_d attachTo [_a, [0,0,0], "destructionEffect1"];
	_d setDropInterval 0.01;

	_d setParticleParams [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 10, 32, 1], "", "Billboard", 1, 1 + random 1,

	"destructionEffect1", [0, 0, 1], 360, 0.045, 0.04, 0.05,

	[2, 0.2], [ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,0] ], [0.5, 1], 0, 0, "", "", _a, 0.1];

	_d setParticleRandom [0.5, [0.3, 0.3, 0.3], [0.1, 0.1, 0.5], 10, 0.5, [0.1,0.1,0.1,0], 0, 0];

	if (GL4_Local select 23) then
	{
		_e = (GL4_Resource select 29) call GL4_Random_Select_F;
	}
	else
	{
		_e = "Sound_Fire";
	};

	_f = createSoundSource [_e, (getPos _a), [], 0];

	_f attachto [_a, [0,0,0], "destructionEffect1"];

	while { ( !(surfaceIsWater (getPos _a) ) && (time < _c) ) } do
	{
		sleep 3;
	};

	deleteVehicle _d;

	deleteVehicle _f;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Fire FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Fire FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = 3 - (random 1);

	_c = 0.5 + random 0.5;

	_d = "#particlesource" createVehicleLocal (getPos _a);
	_d attachTo [_a, [0,0,_c], ""];
	_d setDropInterval 0.01;

	_e = "#lightpoint" createVehicleLocal (getPos _a);
	_e setLightBrightness 0;
	_e setLightAmbient [3,1,0];
	_e setLightColor [3,1,0];
	_e lightAttachObject [_a, [0,0,-1] ];

	if (local _a) then
	{
		_f = createSoundSource ["Sound_Fire", (getPos _a), [], 0];

		_f attachto [_a, [0,0,0], ""];
	};

	while { ( (_b > 1) && !(surfaceIsWater (getPos _a) ) ) } do
	{
		_d setParticleParams [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 10, 32, 1], "", "Billboard", 1, 0.5 + random 0.5,

		[0, 0, (getPos _a select 2) + _c], [0, 0, 0], 0, 1, 0.9, 0,

		[_b / 3, _b / 5], [ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,0] ], [0.5, 1], 0, 0, "", "", _a, 0.1];

		_d setParticleRandom [0.5, [0.1, 0.1, 0.1], [0.1, 0.1, 0.1], 0.1, 0.5, [0.1,0.1,0.1,0], 0, 0];

		_e setLightBrightness (_b / 100);

		if (alive _a) then
		{
			if ( ( { (animationState _a == _x) } count (GL4_Resource select 26) ) > 0) then {_b = _b - 1};

			if (local _a) then
			{
				titleRsc ["GL4_Burning", "PLAIN", 2];

				_a setDammage (getDammage _a + 0.05 * _b);

				"dynamicBlur" ppEffectAdjust [0.5 * _b];
				"dynamicBlur" ppEffectCommit 1;

				if (floor (random 100) < 75) then
				{
					_g = (GL4_Resource select 18) call GL4_Random_Select_F;

					[_a, _g] call (GL4_Dubbing_F select 6);
				};
			};
		}
		else
		{
			_b = _b - 0.05;
		};

		sleep 3;
	};

	deleteVehicle _d;

	deleteVehicle _e; 

	if ( (alive _a) && (local _a) ) then
	{
		GL4_Burning_FX set [0, (GL4_Burning_FX select 0) - [_a] ];

		deleteVehicle _f;

		while { ( (alive _a) && (_b > 0) ) } do
		{
			_b = _b - 0.03;

			"dynamicBlur" ppEffectAdjust [1 * _b];
			"dynamicBlur" ppEffectCommit 1;

			sleep 1 + (random 1);
		};

		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 1;

		"dynamicBlur" ppEffectEnable False;
	}
	else
	{
		deleteVehicle _f;

		"dynamicBlur" ppEffectAdjust [0];
		"dynamicBlur" ppEffectCommit 1;

		"dynamicBlur" ppEffectEnable False;

		GL4_Burning_FX set [0, (GL4_Burning_FX select 0) - [_a] ];
	};

	}
];