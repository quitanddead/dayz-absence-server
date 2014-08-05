// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Vehicle Mount Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Vehicle_Mount_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	_c = nearestObjects [_b, ["Car","Tank","Air"], 200];

	if (count _c > 0) then
	{
		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			if ( (sizeOf typeOf _e > 1) && (canMove _e) && (count (crew _e) == 0) && ( [_b, _e] call (GL4_Vehicle_Mount_F select 3) ) ) exitWith
			{
				[_a, _e] call (GL4_Vehicle_Mount_F select 1);
			};

			_d = _d + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	_d = [];

	_c assignAsDriver _b; [_c] orderGetIn True;

	if (someAmmo _b) then
	{
		_e = (units _a select 1);

		if (isNull _e) then
		{
			_e = objNull;
		}
		else
		{
			_e assignAsGunner _b; [_e] orderGetIn True;
		};
	}
	else
	{
		_e = objNull;
	};

	{if ( (alive _x) && (_x != _c) && (_x != _e) ) then {_x assignAsCargo _b} } forEach units _a; units _a orderGetIn True;

	while { ( (alive _b) && (alive _c) && (count (crew _b) == 0) ) } do
	{
		sleep 1;
	};

	if ( (alive _b) && (alive _c) ) then
	{
		sleep 10;

		{if ( (alive _x) && !(_x in _b) ) then {_d = _d + [_x]} } forEach units _a;

		if (count _d > 0) then
		{
			_c = (vehicle leader _a);

			_c stop True;

			[_a, _d] call (GL4_Vehicle_Mount_F select 2);

			sleep 10;

			_c stop False;
		};

		if (_a in (GL4_Reinforcement select 1) ) then
		{
			{_x doMove (getPos (GL4_System select 4) ) } forEach units _a;
		}
		else
		{
			if (_a in (GL4_HC_Reinforcement select 2) ) then
			{
				{_x doMove (getPos (GL4_HC_Reinforcement select 6) ) } forEach units _a;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	_d = (_b select 0);

	_e = nearestObjects [_d, ["Car","Tank","Air"], 200];

	_e = _e - [_c];

	if (count _e > 0) then
	{
		_f = 0;

		while { (_f < count _e) } do
		{
			_g = (_e select _f);

			if ( (sizeOf typeOf _g > 1) && (canMove _g) && (count (crew _g) == 0) && ( [_c, _g] call (GL4_Vehicle_Mount_F select 3) ) ) exitWith
			{
				_d assignAsDriver _g; [_d] orderGetIn True;

				_b = _b - [_d];

				if (someAmmo _g) then
				{
					_d = (_b select 0);

					if (isNull _d) then
					{
						_d = objNull;
					}
					else
					{
						_d assignAsGunner _g; [_d] orderGetIn True;

						_b = _b - [_d];
					};
				};

				{_x assignAsCargo _g} forEach _b; _b orderGetIn True;

				while { ( (alive _c) && (count (crew _g) == 0) ) } do
				{
					sleep 1;
				};
			};

			_f = _f + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Vehicle Mount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = False;

	_d = getNumber (configFile >> "CfgVehicles" >> (typeOf _a) >> "side");

	_e = getNumber (configFile >> "CfgVehicles" >> (typeOf _b) >> "side");

	if (_d == _e) then
	{
		_c = True;
	};

	_c

	}
];