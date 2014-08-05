// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Airstrike Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Airstrike_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Airstrike Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Airstrike
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (GL4_System select 4);

	GL4_Airstrike set [1, False];

	GL4_Reinforcement set [0, (GL4_Reinforcement select 0) - [group _a] ];

	_a setFuel 1;

	_a lockWp True;

	_a doMove (getPos _b);

	_e = getPos _a;

	while { ( (alive _a) && (alive driver _a) && (canMove _a) && (_a distance (GL4_System select 4) > 500) ) } do
	{
		sleep 0.1;
	};

	if ( (alive _a) && (alive driver _a) && (canMove _a) ) then
	{
		_b = (GL4_System select 4);

		if ( [_a, _b] call (GL4_Airstrike_F select 1) ) then
		{ 
			_a doMove (getPos _b);

			_a setBehaviour "CARELESS";

			_a flyInHeight 50 + (random 100);

			_c = time + 30;

			while { ( (alive _a) && (alive driver _a) && (canMove _a) && (_a distance (GL4_System select 4) > 200) ) } do
			{
				sleep 0.1;

				if (time > _c) then
				{
					_a doMove getPos (GL4_System select 4);

					_c = time + 30;
				};
			};

			if ( (alive _a) && (alive driver _a) && (canMove _a) && (getPos _a select 2 > 10) ) then
			{
				_a lockWp False;

				_a setSpeedMode "Limited";

				_d =  16 + (random 8);

				while { (_d > 0) } do
				{
					(GL4_Global select 16) createVehicle [(getPos _a select 0) + (random 15 - random 15) * 3, (getPos _a select 1) + (random 15 - random 15) * 3, 0];

					sleep (random 0.30);

					_d = _d - 1;
				};
			};
		};

		if ( (alive _a) && (alive driver _a) && (canMove _a) ) then
		{
			_a doMove _e;

			_a setSpeedMode "Normal";

			_a action ["Land", _a];

			while { ( (alive _a) && (alive driver _a) && (canMove _a) && (getPos _a select 2 > 10) ) } do
			{
				sleep 1;
			};

			_a setFuel 0;

			_a lockWp False;
		};

		sleep 240 + (random 240);
	};

	GL4_Airstrike set [1, True];

	GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [group _a] ];

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Airstrike Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Airstrike
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = True;

	_d = nearestObjects [_b, ["Man","Car","Tank"], 100];

	if (count _d > 0) then
	{
		_e = 0;

		while { (_e < count _d) } do
		{
			_f = (_d select _e);

			if ( (alive _f) && (side _f != CIVILIAN) && (_a countFriendly [_f] > 0) ) exitWith
			{
				_c = False;
			};

			_e = _e + 1;
		};
	};

	_c

	}
];