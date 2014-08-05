// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Bleeding Functions
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Bleeding_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Bleeding Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Bleeding
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = str _a;

	_c = _a addAction ["First Aid", (GL4_Path+"GL4\GL4_AddOns\GL4_Blood\GL4_First_Aid.sqf") ];

	while { ( (alive _a) && (GL4_Bleeding select 1) ) } do
	{
		titleRsc ["GL4_RscBleeding_01", "PLAIN", 2];

		_e = 2 + (random 2);

		while { ( (alive _a) && (GL4_Bleeding select 1) && (_e > 0) ) } do
		{
			_f = getPos _a;

			_g = ["GL4_Blood_01","GL4_Blood_02","GL4_Blood_03","GL4_Blood_04"] call GL4_Random_Select_F;

			[ (_f select 0) + sin random 360 * random 0.3, (_f select 1) + cos random 360 * random 0.3, 0, _g] call GL4_Texture_F;

			if (GL4_Bleeding select 2) then
			{
				GL4_Bleeding set [2, False];

				[getDammage _a] spawn (GL4_Bleeding_F select 1);
			};

			if (getDammage _a > 0.5) then
			{
				sleep 1 + (random 2);

				_d = (getDammage _a + random 0.02);

				_a setDammage _d;

				_e = _e - 0.5;
			}
			else
			{
				sleep 2 + (random 4);

				_d = (getDammage _a + random 0.01);

				_a setDammage _d;

				_e = _e - 1;
			};
		};
	};

	GL4_Bleeding set [1, True];

	_a removeAction _c;

	if (alive _a) then
	{
		[getDammage _a] spawn (GL4_Bleeding_F select 2);
	}
	else
	{
		"radialBlur" ppEffectEnable False;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Bleeding Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Bleeding
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = _a / 50;
	_c = _a / 25;

	_d = 1 + random 1 * accTime;

	"radialBlur" ppEffectEnable True;

	"radialBlur" ppEffectAdjust [_b, _b, _c, _c];
	"radialBlur" ppEffectCommit _d;

	sleep _d;

	"radialBlur" ppEffectAdjust [_b, _b, _c, _c];
	"radialBlur" ppEffectCommit _d;

	sleep _d;

	GL4_Bleeding set [2, True];

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Bleeding Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Bleeding
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = _a / 50;
	_c = _a / 25;

	_d = 1 + random 1 * accTime;

	while { ( (_b > 0) && (_c > 0) ) } do
	{
		_b = _b - 0.003;
		_c = _c - 0.003;

		"radialBlur" ppEffectAdjust [_b, _b, _c, _c];
		"radialBlur" ppEffectCommit _d;

		sleep _d;

		"radialBlur" ppEffectAdjust [_b, _b, _c, _c];
		"radialBlur" ppEffectCommit _d;

		sleep _d;
	};

	"radialBlur" ppEffectEnable False;

	}
];