// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Event Handler "Fired" Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_EH_Fired_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Fired" Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Fired" System
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 4;

	_d = (vehicle _a);

	_e = nearestObject [_d, _c];

	if (isServer) then
	{
		_f = (GL4_Player select 0) + (GL4_Player select 2);

		if (_d in _f) then
		{
			if (GL4_Global select 32) then
			{
				_this call (GL4_EH_Fired_F select 1);
			};

			if (GL4_Global select 42) then
			{
				_this call (GL4_EH_Fired_F select 2);
			};
		};

		if ( (_a getVariable "GL4_Smoke_Shell") && ( (_this select 2) == "SmokeShellMuzzle") ) then
		{
			_e setVeloCity [ (veloCity _e select 0) + (sin (getDir _a) + 3) * 2, (veloCity _e select 1) + (cos (getDir _a) + 3) * 2, (veloCity _e select 2) - 5 ];
		};
	};

	if (GL4_Local select 1) then
	{
		if (_d isKindOf "Man") then
		{
			if ( (_b == "Throw") && (_c isKindOf "GrenadeHandTimedWest") || (_c isKindOf "GrenadeHandTimedEast") ) then
			{
				[_d] call (GL4_Grenade_F select 0);
			};

			if (_c isKindOf "RocketBase") then
			{
				[_d, _e] spawn (GL4_Incoming_F select 0);
			};
		}
		else
		{
			if (_c isKindOf "ShellBase") then
			{
				[_d, _e] spawn (GL4_Incoming_F select 0);
			};
		};
	};

	if ( (GL4_Local select 4) && (_d isKindOf "Man") && (isPlayer _d) && (_c isKindOf "BulletBase") && (floor (random 100) < 35) ) then
	{
		if (animationState _d != "AmovPpneMstpSrasWrflDnon") then
		{
			[_d, _e] call (GL4_Blood_FX_F select 5);
		};
	};

	if (GL4_Local select 23) then
	{
		if ( (GL4_Local select 24) && (_c isKindOf "BulletBase") && (floor (random 100) < (GL4_Local select 25) ) ) then
		{
			[_e] spawn (GL4_Sound_FX_F select 5);
		}
		else
		{
			if ( (GL4_Local select 26) && (_c isKindOf "ShellBase") ) then
			{
				[_e] spawn (GL4_Sound_FX_F select 0);
			};
		};
	};

	if (GL4_Local select 30) then
	{
		[_c, _d, _e] call (GL4_Weapon_FX_F select 0);
	};

	if ( (GL4_Local select 36) && !(_d isKindOf "Man") && (_c isKindOf "ShellBase") )  then
	{
		[_d, _e] spawn (GL4_Shell_FX_F select 0);
	};

	if ( (GL4_Local select 77) && (_d isKindOf "Man") && ( (_c isKindOf "RocketBase") || (_c isKindOf "MissileBase") ) ) then
	{
		_f = (getPos _e select 2);

		[_d, _e, _f] call (GL4_Backblast_FX_F select 0);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Fired" Advancing
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	if (GL4_Advancing select 1) then
	{
		_this call (GL4_Advancing_F select 0);

		if (count (GL4_Advancing select 0) == 0) then
		{
			_a = _this select 0;

			_b = (GL4_Groups select 0);

			if (count _b > 0) then
			{
				[_a, _b] call (GL4_Advancing_F select 1);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Fired" Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Event Handler "Fired" Suppressed Fire
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	GL4_Suppressed set [1, time - (GL4_Suppressed select 3) ];

	if ( (GL4_Suppressed select 1) < (GL4_Global select 43) ) then
	{
		GL4_Suppressed set [2, (GL4_Suppressed select 2) + 1];
	}
	else
	{
		GL4_Suppressed set [2, 0];
	};

	if ( (GL4_Suppressed select 2) > (GL4_Global select 44) ) then
	{
		_a = _this select 0;

		_b = (GL4_Groups select 0);

		GL4_System set [3, _a];

		if (count _b > 0) then
		{
			[_a, _b] call (GL4_Suppressed_F select 0);
		};
	};

	GL4_Suppressed set [3, time];

	}
];