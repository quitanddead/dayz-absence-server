// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Reinforcement Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Reinforcement_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _b);

	GL4_System set [0, True];

	GL4_System set [1, 0];

	GL4_System set [2, _a];

	if !(_b in (GL4_Reinforcement select 1) ) then
	{
		GL4_Reinforcement set [1, (GL4_Reinforcement select 1) + [_b] ];

		_b lockWp True;

		[1, _a, _b, 100] call (GL4_System_F select 1);

		[_b] spawn (GL4_Unmount_F select 0);

		if (_c isKindOf "Man") then
		{
			[_a, _b] call (GL4_System_F select 3);
		};
	};

	if ( (_c isKindOf "Man") && ( { (alive _x) } count (units _b) > 3) ) then
	{
		_d = units _b select (count units _b - 1);

		if (floor (random 100) < 50) then
		{
			if (GL4_Global select 17) then
			{
				_e = nearestObjects [_a, ["House"], 100];

				if (count (GL4_House_Search select 0) > 0) then
				{
					_e = _e - (GL4_House_Search select 0);
				};

				if (count _e > 0) then
				{
					_f = (_e select 0);

					if ( (_a distance _f < 100) && (_d distance _f < 100) ) then
					{
						[_b, _d, _e] call (GL4_House_Search_F select 0);
					};
				};
			};
		}
		else
		{
			if (GL4_Global select 18) then
			{
				_e = nearestObjects [_d, ["Car"], 100];

				if (count (GL4_Car_Weapon select 0) > 0) then
				{
					_e = _e - (GL4_Car_Weapon select 0);
				};

				if (count _e > 0) then
				{
					[_b, _d, _e] call (GL4_Car_Weapon_F select 0);
				};
			};
		};
	};

	if (GL4_Global select 0) then
	{
		if ( [ (GL4_Reinforcement select 1) ] call (GL4_System_F select 9) ) then
		{
			_d = [group _a, _b] call (GL4_System_F select 5);

			if (_d <= (GL4_Global select 4) ) then
			{
				sleep 10;
			}
			else
			{
				[_a, _b] call (GL4_Reinforcement_F select 1);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h","_i"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _b);

	if (count (GL4_Reinforcement select 0) > 0) then
	{
		_d = [_c] call (GL4_Reinforcement_F select 2);

		if (count (GL4_Static select 0) > 0) then
		{
			_d = _d - (GL4_Static select 0);
		};

		if (count (GL4_Reinforcement select 1) > 0) then
		{
			_d = _d - (GL4_Reinforcement select 1);
		};

		if (count (GL4_Artillery select 0) > 0) then
		{
			_d = _d - (GL4_Artillery select 0);
		};

		if (count (GL4_Airstrike select 0) > 0) then
		{
			_d = _d - (GL4_Airstrike select 0);
		};

		if (count _d > 0) then
		{
			_e = grpNull;

			_f = [_b] call (GL4_Reinforcement_F select 3);

			_g = 0;

			while { (_g < count _d) } do
			{
				_h = (_d select _g);

				_i = (vehicle leader _h);

				if ( { (alive _x) } count (units _h) == 0) then
				{
					GL4_Reinforcement set [0, (GL4_Reinforcement select 0) - [_h] ];
				}
				else
				{
					if (_i distance _c < _f) then
					{
						_e = _h;

						_f = (_i distance _c);
					};
				};

				_g = _g + 1;
			};

			if ( { (alive _x) } count (units _e) > 0) then
			{
				GL4_Reinforcement set [1, (GL4_Reinforcement select 1) + [_e] ];

				GL4_Reinforcement set [2, (GL4_Reinforcement select 2) + [_e] ];

				_e lockWp True;

				[1, _a, _e, 100] call (GL4_System_F select 1);

				[_e] spawn (GL4_Unmount_F select 0);
			};
		};
	};

	},

 	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = [];

	_c = synchronizedObjects _a;

	{if (_x in _c) then {_c = _c - [_x] } } forEach units _a;

	if (count _c > 0) then
	{
		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			if (_e isKindOf "Man") then
			{
				_b = _b + [group _e];
			};

			_d = _d + 1;
		};
	};

	if (count _b > 0) then
	{
		_b = _b;
	}
	else
	{
		_b = (GL4_Reinforcement select 0);

		if (count (GL4_Location select 0) > 0) then
		{
			_b = _b - (GL4_Location select 0);
		};
	};

	_b;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	_c = 10000;

	_d = (GL4_Global select 7);

	_e = 0;

	while { (_e < count _d) } do
	{
		_f = (_d select _e);

		if (_b isKindOf (_f select 0) ) exitWith
		{
			_c = (_f select 1);
		};

		_e = _e + 1;
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	if (count (GL4_Static select 0) > 0) then
	{
		_b = _b - (GL4_Static select 0);
	};

	if (count _b > 0) then
	{
		_c = 100 + (random 200);

		_d = 0;

		while { (_d < count _b) } do
		{
			_e = (_b select _d);

			_f = (vehicle leader _e);

			if (_f distance (GL4_System select 4) > _c) then
			{
				[1, _a, _e, 100] call (GL4_System_F select 1);

				if (_f isKindOf "Man") then
				{
					[_a, _e] call (GL4_System_F select 3);
				};

				if !(_e in (GL4_System select 11) ) then
				{
					GL4_System set [11, (GL4_System select 11) + [_e] ];

					[_e, 1] call (GL4_System_F select 4);
				};
			}
			else
			{
				if (_f isKindOf "Man") then
				{
					[_a, _e] call (GL4_System_F select 3);
				};

				if (_e in (GL4_System select 11) ) then
				{
					GL4_System set [11, (GL4_System select 11) - [_e] ];

					[_e, 2] call (GL4_System_F select 4);
				};
			};

			_d = _d + 1;
		};
	};

	}
];