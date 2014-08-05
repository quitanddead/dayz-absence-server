// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Advancing Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Advancing_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;
	_d = _this select 4;

	if (_b != "Put") then
	{
		if (_d in (GL4_Global select 33) ) exitWith
		{
			_e = nearestObject [_a, _d];

			[_a, _e] spawn (GL4_Advancing_F select 4);
		};

		if ( (_c in (GL4_Global select 36) ) || (_d in (GL4_Global select 36) ) ) then
		{
			GL4_Advancing set [2, 1];
		}
		else
		{
			if ( (_b in (GL4_Global select 35) ) || (_d in (GL4_Global select 35) ) ) then
			{
				GL4_Advancing set [2, 0];
			}
			else
			{
				if ( (_b in (GL4_Global select 36) ) || (_d in (GL4_Global select 36) ) ) then
				{
					GL4_Advancing set [2, 1];
				}
				else
				{
					if ( (_b in (GL4_Global select 37) ) || (_d in (GL4_Global select 37) ) ) then
					{
						GL4_Advancing set [2, 2];
					}
					else
					{
						GL4_Advancing set [2, 3];
					};
				};
			};
		};

		GL4_System set [3, _a];

		GL4_Advancing set [1, False];

		[] spawn
		{
			if (count (GL4_Advancing select 0) > 0) then
			{
				while { (count (GL4_Advancing select 0) > 0) } do
				{
					sleep 5;
				};
			}
			else
			{
				sleep 10;
			};

			GL4_Advancing set [1, True];
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

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

		if (count (GL4_Suppressed select 0) > 0) then
		{
			_b = _b - (GL4_Suppressed select 0);
		};

		_c = 0;

		while { (_c < count _b) } do
		{
			_d = (_b select _c);

			_e = (vehicle leader _d);

			if (_e isKindOf "Man") then
			{
				[_a, _d] call (GL4_Advancing_F select 2);
			};

			_c = _c + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (_a distance leader _b);

	switch (GL4_Advancing select 2) do
	{
		case 0 :
		{
			if (_c <= (GL4_Global select 38) ) then
			{
				[_a, _b, _c] spawn (GL4_Advancing_F select 3);
			};
		};

		case 1 :
		{
			if (_c <= (GL4_Global select 39) ) then
			{
				[_a, _b, _c] spawn (GL4_Advancing_F select 3);
			};
		};

		case 2 :
		{
			if (_c <= (GL4_Global select 40) ) then
			{
				[_a, _b, _c] spawn (GL4_Advancing_F select 3);
			};
		};

		case 3 :
		{
			if (_c <= (GL4_Global select 41) ) then
			{
				[_a, _b, _c] spawn (GL4_Advancing_F select 3);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_d = (vehicle leader _b);

	if (_b in (GL4_Static select 0) ) then
	{
		{if (floor (random 100) < 75) then {_x setUnitPos "DOWN"} } foreach units _b;

		if (_c > 100) then
		{
			if (_d hasWeapon "Binocular") then {_d selectWeapon "Binocular"};
		};

		{if (floor (random 100) < 50) then {_x doWatch (getPos _a) } } forEach units _b;

		["Advancing", _b] call (GL4_Dubbing_F select 4);

		sleep (random 30);

		{_x doWatch objNull} forEach units _b;

		if !(_b in (GL4_Suppressed select 0) ) then { {_x setUnitPos "AUTO"} } foreach units _b;
	}
	else
	{
		if ( (floor (random 100) < 50) && (_c > 50) ) then
		{
			GL4_Advancing set [0, (GL4_Advancing select 0) + [_b] ];

			_e = behaviour _d;
			_f = speedMode _d;

			if (floor (random 100) < 50) then
			{
				_b setBehaviour "AWARE";
				_b setSpeedMode "NORMAL";
			}
			else
			{
				_b setBehaviour "COMBAT";
				_b setSpeedMode "FULL";
			};

			{if (floor (random 100) < 50) then {_x doWatch (getPos _a) } } forEach units _b;

			["Advancing", _b] call (GL4_Dubbing_F select 4);

			_b lockWp True;

			{if ( (floor (random 100) < 75) || (_x == _d) ) then {_x doMove (getPos _a) } } forEach units _b;

			sleep (random 50);

			{_x doWatch objNull} forEach units _b;

			_b setBehaviour _e;
			_b setSpeedMode _f;

			GL4_Advancing set [0, (GL4_Advancing select 0) - [_b] ];

			if !(_b in (GL4_Reinforcement select 1) ) then { {doStop _x} } forEach units _b;
		}
		else
		{
			{if (floor (random 100) < 75) then {_x setUnitPos "DOWN"} } foreach units _b;

			if (_c > 100) then
			{
				if (_d hasWeapon "Binocular") then {_d selectWeapon "Binocular"};
			};

			{if (floor (random 100) < 50) then {_x doWatch (getPos _a) } } forEach units _b;

			["Advancing", _b] call (GL4_Dubbing_F select 4);

			sleep (random 30);

			{_x doWatch objNull} forEach units _b;

			if !(_b in (GL4_Suppressed select 0) ) then { {_x setUnitPos "AUTO"} } foreach units _b;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Advancing Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Advancing
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	while { (getPos _b select 2 > 1) } do
	{
		sleep 0.1;
	};

	_c = (GL4_Groups select 0);

	if (count _c > 0) then
	{
		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			_f = (vehicle leader _e);

			if ( (alive _f) && (_f isKindOf "Man") && (_f distance _b < (GL4_Global select 34) ) ) exitWith
			{
				sleep 1 + (random 1);

				_g = (_f distance _b);

				[_a, _e, _g] spawn (GL4_Advancing_F select 3);
			};

			if (getPos _b select 2 > 1) then
			{
				[_a, _b] spawn (GL4_Advancing_F select 4);
			};

			_d = _d + 1;
		};
	};

	}
];