// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_HC_Helicopter_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Helicopter Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Helicopter
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = grpNull;

	if (count (GL4_HC_Helicopter select 1) > 0) then
	{
		_c = (GL4_HC_Helicopter select 1);

		if (count (GL4_HC_Helicopter select 2) > 0) then
		{
			_c = _c - (GL4_HC_Helicopter select 2);
		};

		if (count _c > 0) then
		{
			_d = (GL4_High_Command select 6);

			_e = 0;

			while { (_e < count _c) } do
			{
				_f = (_c select _e);

				_g = (vehicle leader _f);

				if ( (alive _g) && (alive driver _g) && (canMove _g) ) then
				{
					if (_g distance (vehicle _a) < _d) then
					{
						_b = _f;

						_d = (_g distance (vehicle _a) );
					};
				}
				else
				{
					if (_f in (GL4_HC_Helicopter select 1) ) then
					{
						GL4_HC_Helicopter set [1, (GL4_HC_Helicopter select 1) - [_f] ];

						if (_f in (GL4_HC_Helicopter select 2) ) then
						{
							GL4_HC_Helicopter set [2, (GL4_HC_Helicopter select 2) - [_f] ];
						};
					};
				};

				_e = _e + 1;
			};
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Helicopter Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Helicopter
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _b);

	_b lockWp True;

	_c move (getPos _a);

	if (_a in _c) then
	{
		_d = [ [" [playerSide, ""HQ""] sidechat""%1 the requested helicopter %2 is is ready for take off."" ", name _a, _b],
		       [" [playerSide, ""HQ""] sidechat""%1 helicopter request confirmed. %2 is ready to use."" ", name _a, _b]

		] call GL4_Random_Select_F;
	}
	else
	{
		_d = [ [" [playerSide, ""HQ""] sidechat""%1 the requested helicopter %2 is on the way to your position."" ", name _a, _b],
		       [" [playerSide, ""HQ""] sidechat""%1 helicopter request confirmed. %2 is on the way to your position."" ", name _a, _b]

		] call GL4_Random_Select_F;
	};

	if (local _a) then
	{
		call compile format _d;
	}
	else
	{
		GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _d]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
	};

	}
];