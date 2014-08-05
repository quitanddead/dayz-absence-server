// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Helicopter Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Helicopter_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	if (GL4_System select 10) then
	{
		if ( (alive _c) && (getPos _c select 2 > 50) ) then
		{
			_d = (count crew _c);

			while { ( (alive _c) && (_d > 0) ) } do
			{
				_e = (crew _c select _d);

				if !(surfaceIsWater (getPos _c) ) then
				{
					if (assignedVehicleRole _e select 0 == "Cargo") then
					{
						_e action ["Eject", _c];
						unAssignVehicle _e;
					};
				};

				if (surfaceIsWater (getPos _c) ) exitWith
				{
					[_a, _b] spawn (GL4_Helicopter_F select 1);
				};

				sleep 1 - (random 1);

				_d = _d - 1;
			};
		}
		else
		{
			[_a, _b] spawn (GL4_Helicopter_F select 1);
		};
	}
	else
	{
		[_a, _b] spawn (GL4_Helicopter_F select 1);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	{if (assignedVehicleRole _x select 0 == "Cargo") then {unAssignVehicle _x} } forEach crew _c;

	_d = time + 100;

	_e = [_a] call GL4_Crew_F;

	while { ( (alive _c) && (alive driver _c) && (canMove _c) && (count (crew _c) > _e) && (_d > time) ) } do
	{
		sleep 1;
	};

	if ( (alive _c) && (alive driver _c) && (canMove _c) && (count (crew _c) > _e) ) then
	{
		_c land "NONE";

		switch (_b) do
		{
			case 1 :
			{
				[_a] spawn (GL4_Unmount_F select 0);
			};

			case 2 :
			{
				[_a] spawn (GL4_HC_Reinforcement_F select 2);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	_d = units _a select (count units _a - 1);

	_e = [];

	{if (assignedVehicleRole _x select 0 == "Cargo") then {[_x] join grpNull; _e = _e + [_x] } } forEach units _a;

	{if (_x != _d) then {[_x] join _d} } forEach _e;

	while { ( (alive _d) && ( { ( (alive _x) && (_x in _c) ) } count (units _d) > 0) ) } do
	{
		sleep 1;
	};

	if (alive _d) then
	{
		switch (_b) do
		{
			case 1 :
			{
				[_a, _d] spawn (GL4_Helicopter_F select 3);
			};

			case 2 :
			{
				[_a, _d] spawn (GL4_HC_Reinforcement_F select 6);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Helicopter
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	[group _b] spawn (GL4_Marker_F select 1);

	GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [group _b] ];

	GL4_Reinforcement set [1, (GL4_Reinforcement select 1) + [group _b] ];

	GL4_Reinforcement set [0, (GL4_Reinforcement select 0) - [_a] ];

	GL4_Reinforcement set [1, (GL4_Reinforcement select 1) - [_a] ];

	{_x doMove (getPos (GL4_System select 4) ) } forEach units _b;

	_d = (GL4_System select 8);

	_e = _d find _a;

	_e = _e + 1;

	_f = (_d select _e);

	{_x setCombatMode "BLUE"; _x disableAI "TARGET"; _x disableAI "AUTOTARGET"} forEach (crew _c);

	_c move _f;

	while { ( (alive _c) && (alive driver _c) && (canMove _c) && !(unitReady _c) && (GL4_System select 0) ) } do
	{
		sleep 1;
	};

	if ( (alive _c) && (alive driver _c) && (canMove _c) ) then
	{
		if (unitReady _c) then
		{
			if (GL4_System select 0) then
			{
				_c land "LAND";

				{_x setCombatMode "GREEN"; _x enableAI "TARGET"; _x enableAI "AUTOTARGET"} forEach (crew _c);
			}
			else
			{
				_c land "NONE";
			};
		};

		while { ( (alive _c) && (alive driver _c) && (canMove _c) && (GL4_System select 0) ) } do
		{
			sleep 1;
		};

		if ( (alive _c) && (alive driver _c) && (canMove _c) ) then
		{
			{if (alive _x) then {[_x] join _c} } forEach units _b;

			GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [_a] ];

			GL4_Reinforcement set [1, (GL4_Reinforcement select 1) + [_a] ];
		};
	};

	GL4_Extraction set [0, (GL4_Extraction select 0) - [_a] ];

	}
];