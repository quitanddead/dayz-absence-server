// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Crew FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Crew_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Crew FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Crew FX
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	if (driver _a isKindOf "SoldierEB") then
	{
		_b = createGroup EAST;
	}
	else
	{
		if (driver _a isKindOf "SoldierWB") then
		{
			_b = createGroup WEST;
		}
		else
		{
			if (driver _a isKindOf "SoldierGB") then
			{
				_b = createGroup RESISTANCE;
			}
			else
			{
				_b = createGroup CIVILIAN;
			};
		};
	};

	if (floor (random 100) < (GL4_Local select 76) ) then
	{
		_c = True;
	}
	else
	{
		_c = False;
	};

	_d = (count crew _a);

	while { (_d > 0) } do
	{
		_e = (crew _a select _d);

		if !(isNull _e) then
		{
			if (floor (random 100) < 50) then
			{
				_f = (typeOf _e);

				if (_c) then
				{
					_f createUnit [ [0,0,0], _b, "if (isMultiplayer) then { if (isServer) then { [this, _a] spawn (GL4_Crew_FX_F select 1) } else { [this] spawn (GL4_Fire_FX_F select 0) } } else { [this, _a] spawn (GL4_Crew_FX_F select 1); [this] spawn (GL4_Fire_FX_F select 0) }"];
				}
				else
				{
					_f createUnit [ (getPos _a), _b, "this setVeloCity [ (veloCity this select 0) + (random 10 - random 10), (veloCity this select 1) + (random 10 - random 10), (veloCity this select 2) + 5 + (random 5)]; this switchMove ""AdthPercMstpSlowWrflDnon_r08""; this setDammage 1"];
				};
			};

			_e setPos [0,0,0];

			deleteVehicle _e;
		};

		_d = _d - 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Crew Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Crew FX
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	[_a] join grpNull;

	_a setDammage (random 0.75);

	removeAllWeapons _a;

	_a setUnitPos "UP";

	_a setCaptive True;

	while { (getPos _b select 2 > 3) } do
	{
		sleep 1;
	};

	sleep 10 + (random 20);

	_a setDir (getDir _b + random 360);

	_a setPos [ (getPos _b select 0), (getPos _b select 1), 0];

	while { (alive _a) } do
	{
		_a doMove [ ( (getPos _a select 0) + ( (random 100) - (random 100) ) ), ( (getPos _a select 1) + ( (random 100) - (random 100) ) ), 0];

		if ( (animationState _a != "AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDr") && (animationState _a != "AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDl") ) then
		{
			_d = ["AmovPercMevaSnonWnonDf","AmovPercMevaSnonWnonDfl","AmovPercMevaSnonWnonDfr"] call GL4_Random_Select_F;

			_a switchMove _d;
		};

		if (floor (random 100) < 50) then
		{
			_e = (GL4_Resource select 18) call GL4_Random_Select_F;

			[_a, _e] call (GL4_Dubbing_F select 6);

			if (_a distance _b > 5) then
			{
				if (floor (random 100) < 35) then
				{
					if (floor (random 100) < 50) then
					{
						_a playMove "AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDr";
					}
					else
					{
						_a playMove "AmovPpneMstpSnonWnonDnon_AmovPpneMevaSnonWnonDl";
					};
				};
			};
		};

		_a setDammage (getDammage _a + random 0.10);

		sleep 2;
	};

	}
];