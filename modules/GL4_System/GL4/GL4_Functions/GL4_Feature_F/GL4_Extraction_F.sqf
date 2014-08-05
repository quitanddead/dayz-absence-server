// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Extraction Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Extraction_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Extraction Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Extraction
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	if (GL4_Global select 21) then
	{
		while { ( (alive _b) && (alive driver _b) && (canMove _b) && (GL4_System select 0) ) } do
		{
			_c = [_a] call GL4_Crew_F;

			if (count (crew _b) == _c) then
			{
				if (_a in (GL4_Extraction select 2) ) then
				{
					while { (_a in (GL4_Extraction select 2) ) } do
					{
						sleep 1;
					};
				}
				else
				{
					if (GL4_System select 0) then
					{
						if (floor (random 100) < 75) then
						{
							[_a] call (GL4_Extraction_F select 1);
						}
						else
						{
							[_a] call (GL4_Extraction_F select 2);
						};
					};
				};
			};

			sleep 30 + (random 50);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Extraction Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Extraction
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	_b flyInHeight (100 - (random 50) );

	_c = (GL4_System select 2);

	_d = [ ( (getPos _c select 0) + ( (random 700) - (random 700) ) ), ( (getPos _c select 1) + ( (random 700) - (random 700) ) ), 0];

	(GL4_Extraction select 3) setPos _d;

	_b move (getPos (GL4_Extraction select 3) );

	while { ( (alive _b) && (alive driver _b) && (canMove _b) && !(unitReady _b) && (GL4_System select 0) ) } do
	{
		sleep 1;
	};

	if ( (alive _b) && (alive driver _b) && (canMove _b) && (GL4_System select 0) ) then
	{
		sleep (random 30);
	};

	if ( (floor (random 100) < 85) && (alive _b) && (alive driver _b) && (canMove _b) && (GL4_System select 0) ) then
	{
		[_a] call (GL4_Extraction_F select 1);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Extraction Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Extraction
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	if (count (GL4_Reinforcement select 1) > 0) then
	{
		_c = (GL4_Reinforcement select 1);

		if (count (GL4_Extraction select 2) > 0) then
		{
			_c = _c - (GL4_Extraction select 2);
		};

		if (count _c > 0) then
		{
			_d = 0;

			while { (_d < count _c) } do
			{
				_e = (_c select _d);

				_f = (vehicle leader _e);

				if ( (_f isKindOf "Man") && ( { (alive _x) } count (units _f) >= 3) && (_f distance _b > 500) && (_f distance _b < 5000) && (_f distance (GL4_System select 4) > 500) ) exitWith
				{
					GL4_Extraction set [2, (GL4_Extraction select 2) + [_a, _e] ];

					[_a, _e] spawn (GL4_Extraction_F select 3);
				};

				_d = _d + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Extraction Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Extraction
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	_c setSpeedMode "FULL";
	_c setBehaviour "SAFE";
	_c setCombatMode "BLUE";

	_c move (getPos leader _b);

	while { ( (alive _c) && (alive driver _c) && (canMove _c) && (alive leader _b) && !(unitReady _c) ) } do
	{
		sleep 0.5;
	};

	if ( (alive _c) && (alive driver _c) && (canMove _c) && (alive leader _b) && (GL4_System select 0) ) then
	{
		_c setSpeedMode "LIMITED";
		_c setBehaviour "AWARE";

		{_x doMove (getPos _c) } forEach units _b;

		_d = [_a] call GL4_Crew_F;

		_c land "GETIN";

		{_x assignAsCargo _c; units _b orderGetIn True} forEach units _b;

		_e = time + 100;

		while { ( (alive _c) && (alive driver _c) && (canMove _c) && (count (crew _c) == _d) && (alive leader _b) && (time < _e) && (GL4_System select 0) ) } do
		{
			sleep 1;
		};

		if (time < _e) then
		{
			if ( (alive _c) && (alive driver _c) && (canMove _c) && (alive leader _b) && (GL4_System select 0) ) then
			{
				[_b] spawn (GL4_Unmount_F select 0);

				_c doMove (getPos (GL4_System select 4) );

				_c setSpeedMode "FULL";
				_c setBehaviour "AWARE";
				_c setCombatMode "GREEN";

				while { ( (alive _c) && (alive driver _c) && (canMove _c) && (count (crew _c) > _d) ) } do
				{
					sleep 1;
				};
			};
		}
		else
		{
			_c land "NONE";

			_c doMove (getPos (GL4_System select 4) );

			{if ( (_x in _c) && (_x in units _b) ) then {unAssignVehicle _c} } forEach units _b;
		};
	};

	GL4_Extraction set [2, (GL4_Extraction select 2) - [_a, _b] ];

	}
];