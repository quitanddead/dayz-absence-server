// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Shock FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Shock_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Shock FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Shock FX
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = nearestObjects [_a, ["Man"], 30];

	if (count _b > 0) then
	{
		_c = 0;

		while { (_c < count _b) } do
		{
			_d = (_b select _c);

			if (alive _d) then
			{
				[_d, _a] spawn (GL4_Shock_FX_F select 1);
			};

			_c = _c + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Shock FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Shock FX
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = _a distance _b;

	_d = 0.02 * _c;

	sleep _d;

	_a setVelocity [sin (getDir _a + 180) * 30 * 5 / _c, cos (getDir _a + 180) * 30 * 5 / _c, _c * 5 / _c];

	_a switchMove "AdthPercMstpSrasWrflDnon_16";

	_a setDammage (getDammage _a + 0.5 / _c);

	if (alive _a) then
	{
		_e = getDammage _a + 30 * 3 / _c;

		if (isPlayer _a) then
		{
			"dynamicBlur" ppEffectEnable True;

			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 0.1;  

			sleep 0.3;

			"dynamicBlur" ppEffectAdjust [3];
			"dynamicBlur" ppEffectCommit 5;

			sleep _e;

			"dynamicBlur" ppEffectEnable False;
		}
		else
		{
			sleep _e;
		};

		_a switchMove "AinjPpneMstpSnonWnonDnon_kneel";
	};

	}
];