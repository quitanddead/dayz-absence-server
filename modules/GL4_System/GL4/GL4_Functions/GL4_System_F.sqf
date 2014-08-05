// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// System Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_System_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = _this select 0;
	_b = _this select 1;

	_c = 0;

	while { (_c < count _a) } do
	{
		_d = (_a select _c);

		_e = (vehicle _d);

		if (alive _e) then
		{
			_f = 0;

			while { (_f < count _b) } do
			{
				_g = (_b select _f);

				_h = (vehicle leader _g);

				if ( ( { (alive _x) } count (units _g) > 0) && (_g knowsAbout _e >= (GL4_Global select 3) ) ) then
				{
					[_e, _g] call (GL4_Reinforcement_F select 0);

					if (time > (GL4_System select 6) ) then
					{
						[_e, (GL4_Reinforcement select 1) ] call (GL4_Reinforcement_F select 4);

						GL4_System set [6, time + 50];
					};
				};

				_f = _f + 1;
			};
		};

		_c = _c + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;
	_d = _this select 3;

	_e = (vehicle leader _c);

	switch (_a) do
	{
		case 1 :
		{
			_f = (GL4_System select 4);

			_f setPos [ ( (getPos _b select 0) + ( (random _d) - (random _d) ) ), ( (getPos _b select 1) + ( (random _d) - (random _d) ) ), 0];
		};

		case 2 :
		{
			_f = (GL4_System select 5);

			_f setPos [ ( (getPos _b select 0) + ( (random _d) - (random _d) ) ), ( (getPos _b select 1) + ( (random _d) - (random _d) ) ), 0];
		};
	};

	if ( [_c] call (GL4_System_F select 2) ) then
	{
		if ( (surfaceIsWater (getPos _f) ) && (_e isKindOf "Man") ) then
		{
			{_x doMove (getPos _e) } forEach units _c;
		}
		else
		{
			{_x doMove (getPos _f) } forEach units _c;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = True;

	_c = (GL4_Extraction select 0) + (GL4_Extraction select 1) + (GL4_Extraction select 2);

	if (_a in _c) then
	{
		_b = False;
	};

	_c = (GL4_Suppressed select 0);

	if (_a in _c) then
	{
		_b = False;

		{if (floor (random 100) < 35) then {doStop _x} } forEach units _a;
	};

	_c = (GL4_Garrison select 0);

	if (_a in _c) then
	{
		_a setCombatMode "GREEN";

		_d = (GL4_Static select 0);

		if (_a in _d) then
		{
			_b = False;
		};
	};

	_c = (GL4_Defend select 0);

	if (_a in _c) then
	{
		_b = False;
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _b);

	if (_b in (GL4_Suppressed select 0) ) exitWith {};

	_d = 100 + (random 200);

	_e = 0;

	while { (_e < count units _b) } do
	{
		_f = (units _b select _e);

		if (_f distance (GL4_System select 4) < _d) then
		{
			if (floor (random 100) < 50) then
			{
				_f setUnitPos "MIDDLE";

				_f setSpeedMode "LIMITED";
			}
			else
			{
				_f setUnitPos "AUTO";

				_f setSpeedMode "NORMAL";
			};
		}
		else
		{
			_f setUnitPos "AUTO";
		};

		_e = _e + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Extension Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	if !(_a in (GL4_System select 7) ) then
	{
		GL4_System set [7, (GL4_System select 7) + [_a, formation _a, speedMode _a, behaviour leader _a, combatMode _a] ];
	};

	switch (_b) do
	{
		case 1 :
		{
			_c = (GL4_Global select 5);
		};

		case 2 :
		{
			_c = (GL4_Global select 6);
		};
	};

	_d = 0;

	while { (_d < count _c) } do
	{
		_e = (_c select _d);

		_f = _e call GL4_Random_Select_F;

		switch (_d) do
		{
			case 0 :
			{
				_a setFormation _f;
			};

			case 1 :
			{
				_a setSpeedMode _f;
			};

			case 2 :
			{
				_a setBehaviour _f;
			};

			case 3 :
			{
				_a setCombatMode _f;
			};
		};

		_d = _d + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Script by KeyCat
	// Optimized by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = 0;
	_c = [_a, _c] call (GL4_System_F select 6);

	_d = 0;
	_d = [_b, _d] call (GL4_System_F select 6);

	_e = (_c + 0.01) / (_d + 0.01);
	_f = (_e + 0.01) / 2;

	if (_f > 1) then {_f = 1};

	_f

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// Script by KeyCat
	// Enhanced and Optimized by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = [];

	_d = 0;

	while { (_d < count units _a) } do
	{
		_e = (units _a select _d);

		_f = (vehicle _e);

		if ( !(_e in _c) && (_e isKindOf "Man") && (alive _e) && ( (count weapons _e) > 0) && ( (count magazines _e) > 0) ) then
		{
			_c = _c + [_e];

			_b = _b + 1;
		};

		if ( !(_f in _c) && (alive _f) && ( (count weapons _f) > 0) && ( (count magazines _f) > 0) && (canFire _f) ) then
		{ 
			if (_f isKindOf "Car") then
 			{
				_c = _c + [_f];

				_b = _b + 5;
			};

			if (_f isKindOf "Tank") then
 			{
				_c = _c + [_f];

				_b = _b + 10;
			};

			if (_f isKindOf "Air") then
 			{
				_c = _c + [_f];

				_b = _b + 15;
			};
		};

		_d = _d + 1;
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #7
	// ////////////////////////////////////////////////////////////////////////////
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a"];

	_a = _this select 0;

	if (count (GL4_Static select 0) > 0) then
	{
		_a = _a - (GL4_Static select 0);
	};

	if (count (GL4_Artillery select 0) > 0) then
	{
		_a = _a - (GL4_Artillery select 0);
	};

	if (count (GL4_Airstrike select 0) > 0) then
	{
		_a = _a - (GL4_Airstrike select 0);
	};

	if (count _a > (GL4_Global select 1) ) then
	{
		GL4_Global set [1, (GL4_System select 12) ];
	}
	else
	{
		GL4_Global set [1, count _a];
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #8
	// ////////////////////////////////////////////////////////////////////////////
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (GL4_Player select 0);

	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		if !(alive _d) then
		{
			GL4_Player set [0, (GL4_Player select 0) - [_d] ];

			if (_d == (GL4_System select 2) ) then
			{
				GL4_System set [2, objNull];
			};
		};

		_c = _c + 1;
	};

	if (count (GL4_Player select 0) == 0) then
	{
		_a = False;
	};

	_b = (GL4_Player select 1);

	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		if ( { (alive _x) } count (units _d) == 0) then
		{
			GL4_Player set [1, (GL4_Player select 1) - [_d] ];
		};

		_c = _c + 1;
	};

	if (count (GL4_Player select 1) == 0) then
	{
		_a = False;
	};

	_b = (GL4_Reinforcement select 0);

	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		if ( { (alive _x) } count (units _d) == 0) then
		{
			if (_d in (GL4_Groups select 0) ) then
			{
				GL4_Groups set [0, (GL4_Groups select 0) - [_d] ];
			};

			GL4_Reinforcement set [0, (GL4_Reinforcement select 0) - [_d] ];

			if (_c in (GL4_Reinforcement select 1) ) then
			{
				GL4_Reinforcement set [1, (GL4_Reinforcement select 1) - [_d] ];
			};
		};

		_c = _c + 1;
	};

	if (count (GL4_Reinforcement select 0) == 0) then
	{
		_a = False;
	};

	_a

	},

	// ////////////////////////////////////////////////////////////////////////////
	// System Function #9
	// ////////////////////////////////////////////////////////////////////////////
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = False;

	_c = (GL4_Defend select 0);

	_d = (_a - _c);

	if (count _d < (GL4_Global select 1) ) then
	{
		_b = True;
	};

	_c = [];

	_d = 0;

	while { (_d < count _a) } do
	{
		_e = (_a select _d);

		_c = _c + units _e;

		_d = _d + 1;
	};

	if (count _c < (GL4_Global select 2) ) then
	{
		_b = True;
	};

	_b

	}
];