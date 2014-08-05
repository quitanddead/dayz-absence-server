// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_HC_Artillery_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Artillery Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Artillery
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = _this select 0;
	_b = _this select 1;

	_c = [False, ""];

	if (_a distance _b < 100) exitWith
	{
		_d = [ [" [playerSide, ""HQ""] sidechat""%1 you are within the artillery fire range. Please select a position more then 100 meters away from your position."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat""%1 you are within %2 meters to the artillery fire range. Please select a position not nearby your position."" ", name _a, _a distance _b]

		] call GL4_Random_Select_F;

		_c set [0, True];

		_c set [1, _d];

		_c
	};

	_e = (GL4_HC_Artillery select 1);

	_f = 0;

	while { (_f < count _e) } do
	{
		_g = (_e select _f);

		_h = (vehicle leader _g);

		if ( (alive _h) && (alive gunner _h) && (canFire _h) && (_h distance _b < 100) ) exitWith
		{
			_d = [ [" [playerSide, ""HQ""] sidechat""%1 you requested position is nearby the artillery position. Please select a position more then 100 meters away from the artillery."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 you requested position is within %2 meters to the artillery. Please select a position not nearby the artillery position."" ", name _a, _h distance _b]

			] call GL4_Random_Select_F;

			_c set [0, True];

			_c set [1, _d];

			_c
		};

		_f = _f + 1;
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Artillery Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Artillery
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;

	_b = "";

	if (_a isKindOf "M119") then
	{
		_b = "Sh_105_HE";
	};

	if (_a isKindOf "D30") then
	{
		_b = "Sh_122_HE";
	};

	if (_a isKindOf "MLRS") then
	{
		_b = "R_MLRS";
	};

	_b

	}
];