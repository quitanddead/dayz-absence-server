// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Body Detect Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Body_Detect_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	if (count _a > 0) then
	{
		if (count (GL4_Reinforcement select 1) > 0) then
		{
			_a = _a - (GL4_Reinforcement select 1);
		};

		if (count (GL4_Advancing select 0) > 0) then
		{
			_a = _a - (GL4_Advancing select 0);
		};

		if (count (GL4_Suppressed select 0) > 0) then
		{
			_a = _a - (GL4_Suppressed select 0);
		};

		if (count (GL4_Garrison select 0) > 0) then
		{
			_a = _a - (GL4_Garrison select 0);
		};

		if (count (GL4_Body_Detect select 0) > 0) then
		{
			_a = _a - (GL4_Body_Detect select 0);
		};

		if (count _a > 0) then
		{
			_b = 0;

			while { (_b < count _a) } do
			{
				_c = (_a select _b);

				_d = (vehicle leader _c);

				if ( (alive _d) && (canMove _d) && ( (behaviour _d == "SAFE") || (behaviour _d == "AWARE") ) ) then
				{
					_e = [_c] call (GL4_Body_Detect_F select 1);

					if (_e isKindOf "Man") then
					{
						if (_d isKindOf "Man") then
						{
							[_c, _e] spawn (GL4_Body_Detect_F select 3);
						}
						else
						{
							if (_d isKindOf "Car") then
							{
								[_c, _e] spawn (GL4_Body_Detect_F select 4);
							};
						};	
					};
				};

				_b = _b + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	_c = objNull;

	if (count (GL4_Killed select 0) > 0) then
	{
		_d = (GL4_Killed select 0);

		if (count (GL4_Body_Detect select 1) > 0) then
		{
			_d = _d - (GL4_Body_Detect select 1);
		};

		if (count _d > 0) then
		{
			_e = 0;

			while { (_e < count _d) } do
			{
				_f = (_d select _e);

				if ( (_b distance _f < 100) && (_b countFriendly [_f] > 0) && (_a knowsAbout _f > 0) ) exitWith
				{
					GL4_Body_Detect set [0, (GL4_Body_Detect select 0) + [_a] ];

					[_f] call (GL4_Body_Detect_F select 2);

					_c = _f;
				};

				_e = _e + 1;
			};
		};
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = nearestObjects [_a, ["Man"], 100];

	if (count (GL4_Body_Detect select 1) > 0) then
	{
		_b = _b - (GL4_Body_Detect select 1);
	};

	if (count _b > 0) then
	{
		_c = 0;

		while { (_c < count _b) } do
		{
			_d = (_b select _c);

			if (_d in (GL4_Killed select 0) ) then
			{
				GL4_Body_Detect set [1, (GL4_Body_Detect select 1) + [_d] ];
			};

			_c = _c + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	if (alive _c) then
	{
		_d = behaviour _c;
		_e = speedMode _a;

		if (floor (random 100) < 50) then {_a setSpeedMode "NORMAL"; 	_a setBehaviour "SAFE"} else {_a setSpeedMode "FULL"; _a setBehaviour "AWARE"};

		_a lockWp True;

		{_x doMove (getPos _b) } forEach units _a;

		while { ( (alive _c) && (_c distance _b > 10) && !(_a in (GL4_Reinforcement select 1) ) ) } do
		{
			sleep 1;
		};

		if ( (alive _c) && !(_a in (GL4_Reinforcement select 1) ) ) then
		{
			_f = 2 + (random 3);

			_g = 0;

			while { ( (alive _c) && (_g < _f) && !(_a in (GL4_Reinforcement select 1) ) ) } do
			{
				[2, _b, _a, 100] call (GL4_System_F select 1);

				sleep 30 + (random 50);

				_g = _g + 1;
			};
		};

		if !(_a in (GL4_Reinforcement select 1) ) then
		{
			_a setBehaviour _d;
			_a setSpeedMode _e;

			_a lockWp False;
		};
	};

	GL4_Body_Detect set [0, (GL4_Body_Detect select 0) - [_a] ];

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Body Detect
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	if (alive leader _a) then
	{
		_d = behaviour _c;
		_e = speedMode _a;

		if (floor (random 100) < 50) then {_a setSpeedMode "NORMAL"; 	_a setBehaviour "SAFE"} else {_a setSpeedMode "FULL"; _a setBehaviour "AWARE"};

		_a lockWp True;

		_c doMove (getPos _b);

		while { ( (alive _c) && (_c distance _b > 20) && !(_a in (GL4_Reinforcement select 1) ) ) } do
		{
			sleep 1;
		};

		if ( (alive leader _a) && !(_a in (GL4_Reinforcement select 1) ) ) then
		{
			_f = [];

			{if ( (alive _x) && (_x in _c) ) then {_f = _f + [_x]; unAssignVehicle _x} } forEach units _a;

			_g = 2 + (random 3);

			_h = 0;

			while { ( (alive leader _a) && (_h < _g) && !(_a in (GL4_Reinforcement select 1) ) ) } do
			{
				if (count _f > 0) then
				{
				{
					[2, _b, _x, 100] call (GL4_System_F select 1);
				};
				} forEach _f;

				sleep 30 + (random 50);

				_h = _h + 1;
			};

			if ( (alive _c) && (alive leader _a) ) then
			{
				(leader _a) assignAsDriver _c; [ (leader _a) ] orderGetIn True;

				{if ( (alive _x) && (_x != leader _a) ) then {_x assignAsCargo _c; units _x orderGetIn True} } forEach _f;
			};
		};

		if !(_a in (GL4_Reinforcement select 1) ) then
		{
			_a setBehaviour _d;
			_a setSpeedMode _e;

			_a lockWp False;
		};
	};

	GL4_Body_Detect set [0, (GL4_Body_Detect select 0) - [_a] ];

	}
];