// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Detection Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Detection_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Detection Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Detection #1
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = (GL4_Groups select 0);

	if (count _b > 0) then
	{
		if (count (GL4_Reinforcement select 1) > 0) then
		{
			_b = _b - (GL4_Reinforcement select 1);
		};

		if (count (GL4_Advancing select 0) > 0) then
		{
			_b = _b - (GL4_Advancing select 0);
		};

		if (count (GL4_Artillery select 0) > 0) then
		{
			_b = _b - (GL4_Artillery select 0);
		};

		if (count (GL4_Airstrike select 0) > 0) then
		{
			_b = _b - (GL4_Airstrike select 0);
		};

		if (count (GL4_Suppressed select 0) > 0) then
		{
			_b = _b - (GL4_Suppressed select 0);
		};

		if (count (GL4_Detection select 0) > 0) then
		{
			_b = _b - (GL4_Detection select 0);
		};

		if (count _b > 0) then
		{
			_c = grpNull;

			_d = 500;

			_e = 0;

			while { (_e < count _b) } do
			{
				_f = (_b select _e);

				_g = (vehicle leader _f);

				if ( (_g isKindOf "Man") || (_g isKindOf "Car") ) then
				{
					if ( (alive _g) && (canMove _g) && (_g distance _a > 100) && (_g distance _a < _d) ) then
					{
						_c = _f;

						_d = (_g distance _a);
					};
				};

				_e = _e + 1;
			};

			if ( { (alive _x) } count (units _c) > 0) then
			{
				if (_g isKindOf "Man") then
				{
					GL4_Detection set [0, (GL4_Detection select 0) + [_c] ];

					[_c, _a] spawn (GL4_Detection_F select 1);
				}
				else
				{
					if (_g isKindOf "Car") then
					{
						GL4_Detection set [0, (GL4_Detection select 0) + [_c] ];

						[_c, _a] spawn (GL4_Detection_F select 2);
					};
				};
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Detection Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Detection Man
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	if (alive _c) then
	{
		_d = speedMode _a;
		_e = behaviour _c;

		if (floor (random 100) < 50) then {_a setSpeedMode "NORMAL"; 	_a setBehaviour "SAFE"} else {_a setSpeedMode "FULL"; _a setBehaviour "AWARE"};

		_a lockWP True;

		{_x doMove (getPos _b) } forEach units _a;

		while { ( (alive _c) && (_c distance _b > 10) && !(_a in (GL4_Reinforcement select 1) ) ) } do
		{
			sleep 1;
		};

		if ( (alive _c) && !(_a in (GL4_Reinforcement select 1) ) ) then
		{
			_f = 2 + (random 2);

			_g = 0;

			while { ( (alive _c) && (_g < _f) && !(_a in (GL4_Reinforcement select 1) ) ) } do
			{
				[2, _b, _a, 100] call (GL4_System_F select 1);

				sleep 20 + (random 10);

				_g = _g + 1;
			};
		};

		if !(_a in (GL4_Reinforcement select 1) ) then
		{
			_a setSpeedMode _d;
			_a setBehaviour _e;

			_a lockWP False;
		};
	};

	GL4_Detection set [0, (GL4_Detection select 0) - [_a] ];

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Detection Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Detection Car
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	if (alive _c) then
	{
		_d = speedMode _a;
		_e = behaviour _c;

		if (floor (random 100) < 50) then {_a setSpeedMode "NORMAL"; 	_a setBehaviour "SAFE"} else {_a setSpeedMode "FULL"; _a setBehaviour "AWARE"};

		_a lockWP True;

		_c doMove (getPos _b);

		while { ( (alive _c) && (_c distance _b > 30) && !(_a in (GL4_Reinforcement select 1) ) ) } do
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

				sleep 20 + (random 10);

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
			_a setSpeedMode _d;
			_a setBehaviour _e;

			_a lockWP False;
		};
	};

	GL4_Detection set [0, (GL4_Detection select 0) - [_a] ];

	}
];