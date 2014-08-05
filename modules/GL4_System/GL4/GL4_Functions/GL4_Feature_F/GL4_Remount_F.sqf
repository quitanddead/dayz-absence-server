// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Remount Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Remount_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Remount Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Remount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	if (count _a > 0) then
	{
		_b = 0;

		while { (_b < count _a) } do
		{
			_c = (_a select _b);

			_d = (vehicle leader _c);

			{_x doMove (getPos _d); if (vehicle _x isKindOf "Man") then {_x setUnitPos "AUTO"; _x setSpeedMode "NORMAL"} } forEach units _c;

			if (_c in (GL4_System select 8) ) then
			{
				[_c] call (GL4_Remount_F select 1);

				[_c] call (GL4_Remount_F select 2);
			}
			else
			{
				_c lockWP False;

				[_c] call (GL4_Remount_F select 1);
			};

			_b = _b + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Remount Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Remount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	if (count (GL4_System select 7) > 0) then
	{
		_b = (GL4_System select 7);

		if (_a in _b) then
		{
			_c = _b find _a;

			_c = _c + 1;

			_d = (_b select _c);

			_a setFormation _d;

			_c = _c + 1;

			_e = (_b select _c);

			_a setSpeedMode _e;

			_c = _c + 1;

			_f = (_b select _c);

			_a setBehaviour _f;

			_c = _c + 1;

			_g = (_b select _c);

			_a setCombatMode _g;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Remount Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Remount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	if (count (GL4_System select 8) > 0) then
	{
		_b = (GL4_System select 8);

		_c = _b find _a;

		_d = (vehicle leader _a);

		_c = _c + 1;

		_e = (_b select _c);

		_c = _c + 1;

		_f = (_b select _c);

		if ( { (alive _x) } count (units _a) > 0) then
		{
			[_a, _d, _e, _f] spawn (GL4_Remount_F select 3);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Remount Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Remount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;
	_d = _this select 3;

	if (_b isKindOf "Man") then
	{
		if (_d isKindOf "Man") then
		{
			{_x doMove _c} forEach units _a;
		}
		else
		{
			if (count (GL4_System select 9) > 0) then
			{
				_e = (GL4_System select 9);

				_f = _e find _a;

				_f = _f + 1;

				_g = (_e select _f);

				{_x doMove _g} forEach units _a;

				GL4_System set [9, (GL4_System select 9) - [_a, _g] ];

				while { ( (alive _b) && (_b distance _g > 30) ) } do
				{
					sleep 1;
				};

				if (alive _b) then
				{
					[_a] call (GL4_Vehicle_Mount_F select 0);
				};
			};

			{_x doMove _c} forEach units _a;
		};
	};

	if (_b isKindOf "Wheeled_APC") then
	{
		{if ( !(_x in _b) && (alive _x) ) then {_x assignAsCargo _b; units _a orderGetIn True} } forEach units _a;

		{_x doMove _c} forEach units _a;
	};

	if (_b isKindOf "Car") then
	{
		{if ( { !(_x in _b) } count (units _a) > 0) then {_x assignAsCargo _b} } forEach units _a; units _a orderGetIn True;

		{_x doMove _c} forEach units _a;
	};

	if (_b isKindOf "Tank") then
	{
		{if ( !(_x in _b) && (alive _x) ) then {_x assignAsCargo _b; units _a orderGetIn True} } forEach units _a;

		{_x doMove _c} forEach units _a;
	};

	if (_b isKindOf "Helicopter") then
	{
		_e = [_a] call GL4_Crew_F;

		if ( { (alive _x) } count (units _a) > _e) then
		{
			_f = units _a select (count units _a - 1);

			if ( (alive _b) && (alive driver _b) && (canMove _b) && !(_f in _b) ) then
			{
				_b move (getPos _f);

				{_x doMove (getPos _f) } forEach units _a;

				_g = "HeliHEmpty" createVehicleLocal (getPos _f);

				while { ( (alive _b) && (alive driver _b) && (canMove _b) && !(unitReady _b) ) } do
				{
					sleep 1;
				};

				if ( (alive _b) && (alive driver _b) && (canMove _b) ) then
				{
					_b land "GETIN";

					{if ( !(_x in _b) && (alive _x) ) then {_x assignAsCargo _b; units _a orderGetIn True}} forEach units _a;
				};

				deleteVehicle _g;
			};
		};

		if ( (alive _b) && (alive driver _b) && (canMove _b) ) then
		{
			_g = "HeliHEmpty" createVehicleLocal _c;

			_b move _c;

			while { ( (alive _b) && (alive driver _b) && (canMove _b) && !(unitReady _b) ) } do
			{
				sleep 1;
			};

			if ( (alive _b) && (alive driver _b) && (canMove _b) ) then
			{
				_b setSpeedMode "NORMAL";

				_b land "LAND";
			};

			deleteVehicle _g;
		};
	};

	_a lockWP False;

	}
];