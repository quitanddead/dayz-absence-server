// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Event Handler "Killed" Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_EH_Killed_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Killed" Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Killed"
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (vehicle _a);

	if (isPlayer _a) then
	{
		GL4_Player set [0, (GL4_Player select 0) - [_a] ];

		[_a] execVM (GL4_Path+"GL4\GL4_Player\GL4_Spawn.sqf");
	};

	if (_b isKindOf "Man") then
	{
		if !(isNil "GL4_Killed") then
		{
			GL4_Killed set [0, (GL4_Killed select 0) + [_b] ];
		};

		if (floor (random 100) < (GL4_Local select 7) ) then
		{
			if (isMultiplayer) then
			{
				if (isDedicated) then
				{
					GL4_AddOn_PublicVariable = [2, _this]; publicVariable "GL4_AddOn_PublicVariable";
				}
				else
				{
					GL4_AddOn_PublicVariable = [2, _this]; publicVariable "GL4_AddOn_PublicVariable";

					_this call (GL4_Blood_FX_F select 0);
				};
			}
			else
			{
				_this call (GL4_Blood_FX_F select 0);
			};
		};

		if (floor (random 100) < (GL4_Local select 28) ) then
		{
			if (floor (random 100) < 50) then
			{
				_c = "Head_Axis";
			}
			else
			{
				_c = "Leaning_Axis";
			};

			if (isMultiplayer) then
			{
				if (isDedicated) then
				{
					GL4_AddOn_PublicVariable = [3, _b, _c]; publicVariable "GL4_AddOn_PublicVariable";
				}
				else
				{
					GL4_AddOn_PublicVariable = [3, _b, _c]; publicVariable "GL4_AddOn_PublicVariable";

					[_b, _c] spawn (GL4_Sound_FX_F select 3);
				};
			}
			else
			{
				[_b, _c] spawn (GL4_Sound_FX_F select 3);
			};
		};
	}
	else
	{
		if ( (_a isKindOf "Car") || (_a isKindOf "Tank") || (_a isKindOf "Air") ) then
		{
			if (GL4_Global select 31) then
			{
				if (floor (random 100) < 50) then
				{
					[_a] call (GL4_Detection_F select 0);
				};
			};

			_c = [12] call GL4_Random_Chance_F;

			if (isDedicated) then
			{
				GL4_AddOn_PublicVariable = [5, _a, _c]; publicVariable "GL4_AddOn_PublicVariable";
			}
			else
			{
				[_a, _c] call (GL4_Explosion_FX_F select 0);

				[_a, _c] spawn (GL4_Wrack_FX_F select 0);

				[_a] spawn (GL4_Burning_FX_F select 0);
			};

			if (GL4_Local select 1) then
			{
				_d = _this select 1;

				if (_d countEnemy [_b] == 1) then
				{
					["Woohoo", _d] spawn (GL4_Dubbing_F select 4);
				};
			};

			if (GL4_Local select 75) then
			{
				if (count (crew _a) > 0) then
				{
					[_a] call (GL4_Crew_FX_F select 0);
				};
			};
		};
	};

	}
];