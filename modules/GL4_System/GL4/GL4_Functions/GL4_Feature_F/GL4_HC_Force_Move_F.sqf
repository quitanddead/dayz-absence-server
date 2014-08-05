// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Force Move Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_HC_Force_Move_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Force Move Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Force Move
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	while { (count _b > 0) } do
	{
		_c = (_b select 0);

		_d = (vehicle _c);

		if (_d isKindOf "Man") then
		{
			_d = _d;
		}
		else
		{
			GL4_HC_Force_Move set [1, (GL4_HC_Force_Move select 1) - [_d] ];

			_d = (driver vehicle _c);

			GL4_HC_Force_Move set [1, (GL4_HC_Force_Move select 1) + [_d] ];
		};

		if ( (_d != leader _d) && (_d != _a) ) then
		{
			[_d] join grpNull;

			[_a, _d] spawn (GL4_HC_Force_Move_F select 1);

			if (stopped _d) then
			{
				_d stop False;
			};

			_d setUnitPos "UP";

			_d setSpeedMode "FULL";

			_d setCombatMode "BLUE";

			_d setBehaviour "CARELESS";

			_d disableAI "TARGET";

			_d disableAI "AUTOTARGET";

			_d enableAI "MOVE";
		};

		_b = _b - [_d];
	};

	GL4_HC_Force_Move_Menu set [3, ["Regroup ( Leader )", [4], "", -5, [ ["expression", "[player, (GL4_HC_Force_Move select 1) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move_Regroup.sqf"") "] ], "1", "1"] ];

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Force Move Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Force Move
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = time;

	while { ( (alive _a) && (alive _b) && (_b in (GL4_HC_Force_Move select 1) ) ) } do
	{
		if (time > _c) then
		{
			if (_a getVariable "GL4_HC_Force_Move") then
			{
				_d = (getPos _a);

				if (alive _b) then
				{
					if (_b distance _d > 10) then
					{
						_b doMove _d;
					}
					else
					{
						_e = format ["Roger %1 falling back to regroup.", name _a];

						_b sideChat _e;

						[_a, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move_Regroup.sqf");
					};
				};
			}
			else
			{
				_d = (GL4_HC_Force_Move select 2);

				if (alive _b) then
				{
					if (_b distance _d > 10) then
					{
						_b doMove _d;

						if (floor (random 100) < 15) then
						{
							_e = format ["%1 %2 meters remaining to target location.", name _a, round (_b distance _d) ];

							_b sideChat _e;
						};

						if (behaviour _b != "CARELESS") then
						{
							_b setUnitPos "UP";

							_b setSpeedMode "FULL";

							_b setCombatMode "BLUE";

							_b setBehaviour "CARELESS";

							_b disableAI "TARGET";

							_b disableAI "AUTOTARGET";

							_b enableAI "MOVE";
						};
					}
					else
					{
						if (behaviour _b == "CARELESS") then
						{
							_e = format ["%1 at target location. Ready and standing by.", name _a];

							_b sideChat _e;

							_b setUnitPos "AUTO";

							_b setSpeedMode (speedMode _a);

							_b setCombatMode (combatMode _a);

							_b setBehaviour (behaviour _a);

							_b enableAI "TARGET";

							_b enableAI "AUTOTARGET";
						};
					};
				};
			};

			_c = time + 5;
		};

		sleep 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Force Move Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Force Move
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;

	_b = "";

	switch (side _a) do
	{
		case EAST :
		{
			_b = (GL4_Resource select 38) call GL4_Random_Select_F;
		};

		case WEST :
		{
			_b = (GL4_Resource select 39) call GL4_Random_Select_F;
		};

		case RESISTANCE :
		{
			_b = (GL4_Resource select 38) call GL4_Random_Select_F;
		};
	};

	if (_b != "") then
	{
		[_a, _b] call (GL4_Dubbing_F select 6);
	};

	}
];