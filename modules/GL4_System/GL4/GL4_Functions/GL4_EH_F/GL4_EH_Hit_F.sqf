// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Event Handler "Hit" Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_EH_Hit_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Hit" Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Hit"
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (vehicle _a);

	if (_b isKindOf "Man") then
	{
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

		if (isPlayer _b) then
		{
			if ( (GL4_Local select 84) && (alive _b) && !(_b in (GL4_Simulate select 0) ) ) then
			{
				_c = _this select 1;

				[_b, _c] spawn (GL4_Simulate_F select 0);
			};
		}
		else
		{
			if ( (GL4_Global select 58) && (alive _b) && !( { (isPlayer _x) } count (units _b) > 0) && (floor (random 100) < (GL4_Global select 59) ) ) then
			{
				_c = _this select 1;

				[_b, _c] spawn (GL4_Simulate_F select 2);
			};
		};

		if ( (alive _b) && (captive _b) && (fleeing _b) ) then
		{
			_b allowFleeing 0;

			if ( (floor (random 100) < 75) && (canStand _b) ) then
			{
				_b switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
			};
		};
	}
	else
	{
		if ( (_a isKindOf "Car") || (_a isKindOf "Tank") || (_a isKindOf "Air") ) then
		{
			if ( (floor (random 100) < (GL4_Local select 45) ) && (alive _a) ) then
			{
				_c = [1] call GL4_Random_Chance_F;

				if (isDedicated) then
				{
					GL4_AddOn_PublicVariable = [4, _a, _c]; publicVariable "GL4_AddOn_PublicVariable";
				}
				else
				{
					[_a, _c] call (GL4_Impact_FX_F select 0);
				};
			};
		}
		else
		{
			if (_a isKindOf "House") then
			{
				if ( (floor (random 100) < 75) && (alive _a) ) then
				{
					[_a] execVM (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Dedicated\GL4_House_FX_F.sqf");
				};
			};
		};		
	};

	}
];