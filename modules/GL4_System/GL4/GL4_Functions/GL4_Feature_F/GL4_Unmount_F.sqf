// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Unmount Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Unmount_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	[_a, 1] call (GL4_System_F select 4);

	_c = [_a, _b] call (GL4_Unmount_F select 1);

	_d = time + 10;

	while { ( ( { (alive _x) } count (units _a) > 0) && (GL4_System select 0) ) } do
	{
		if (_b != vehicle leader _a) then
		{
			_b = (vehicle leader _a);

			_c = [_a, _b] call (GL4_Unmount_F select 1);
		};

		if ( (_b isKindOf "Man") && (time > _d) && (_b distance (GL4_System select 4) > (_c * 2) ) ) then
		{
			[_a] spawn (GL4_Vehicle_Mount_F select 0);

			_d = time + 50;
		};

		if ( [_a] call (GL4_Unmount_F select 2) ) exitWith
		{
			_b = (vehicle leader _a);

			[_a, 2] call (GL4_System_F select 4);

			[_a, _b, True] spawn (GL4_Unmount_F select 3);
		};

		if ( (_b distance (GL4_System select 4) < _c) || !(canMove _b) || !(alive driver _b) ) exitWith
		{
			_b = (vehicle leader _a);

			[_a, 2] call (GL4_System_F select 4);

			[_a, _b, False] spawn (GL4_Unmount_F select 3);
		};

		sleep 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	_c = 100 + (random 100);

	if !(_a in (GL4_System select 8) ) then
	{
		GL4_System set [8, (GL4_System select 8) + [_a, getPos _b, _b] ];
	};

	if (_b isKindOf "Helicopter") then
	{
		_c = 300 + (random 200);

		if (GL4_Global select 19) then
		{
			if (floor (random 100) < 75) then
			{
				GL4_System set [10, True];

				_b flyInHeight (100 + (random 100) );
			}
			else
			{
				GL4_System set [10, False];
			};
		}
		else
		{
			GL4_System set [10, False];
		};
	};

	if (_b distance (GL4_System select 4) > _c) then
 	{
		_c = _c;
	}
	else
	{
		_c = _b distance (GL4_System select 4);
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = False;

	_c = (GL4_Player select 0);

	_d = 0;

	while { (_d < count _c) } do
	{
		_e = (_c select _d);

		_f = (vehicle _e);

		if ( (alive _f) && (_a knowsAbout _f > 0) ) exitWith
		{
			GL4_System set [2, _f];

			_b = True;
		};

		_d = _d + 1;
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by KeyCat
	// Optimized and Enhanced by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	GL4_Reinforcement set [2, (GL4_Reinforcement select 2) - [_a] ];

	if (_b isKindOf "Man") then
	{
		if (GL4_Global select 25) then
		{
			if ( (floor (random 100) < 50) && (_b distance (GL4_System select 4) < 200) ) then
			{
				[_a] execVM (GL4_Path+"GL4\GL4_Features\GL4_Tactics\GL4_Tactics.sqf");
			};
		};
	};

	if (_b isKindOf "Wheeled_APC") then
	{
		{if (assignedVehicleRole _x select 0 == "Cargo") then {unAssignVehicle _x} } forEach units _a;
	};

	if (_b isKindOf "Car") then
	{
		{unAssignVehicle _x} forEach units _a;

		while { ( (alive _b) && (canMove _b) && (speed _b > 60) ) } do
		{
			sleep 1;
		};

		GL4_System set [9, (GL4_System select 9) + [_a, getPos _b] ];
	};

	if (_b isKindOf "Tank") then
	{
		{if (assignedVehicleRole _x select 0 == "Cargo") then {unAssignVehicle _x} } forEach units _a;
	};

	if (_b isKindOf "Helicopter") then
	{
		_d = [_a] call GL4_Crew_F;

		if (count (crew _b) > _d) then
		{
			[_a, 1] spawn (GL4_Helicopter_F select 0);
		};

		if (driver _b in units _a) then
		{
			_d = [_a] call GL4_Crew_F;

			if ( !(_a in (GL4_Extraction select 0) ) && (floor (random 100) < (GL4_Global select 20) ) && (count (units _a) > _d) ) then
			{
				GL4_Extraction set [0, (GL4_Extraction select 0) + [_a] ];

				[_a, 1] spawn (GL4_Helicopter_F select 2);
			}
			else
			{
				if !(_a in (GL4_Extraction select 1) ) then
				{
					GL4_Extraction set [1, (GL4_Extraction select 1) + [_a] ];

					[_a] spawn (GL4_Extraction_F select 0);
				};
			};
		};
	};

	_this call (GL4_Unmount_F select 4);

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by KeyCat
	// Optimized and Enhanced by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	if (_c) then
	{
		_d = (GL4_System select 2);

 		[_a, _d] call (GL4_Unmount_F select 5);
	};

	if ( (dayTime > 5.00) && (dayTime < 19.00) ) then
	{
		if (_c) then
		{
			if (_b isKindOf "Man") then
			{
				[_b, _d] spawn (GL4_Unmount_F select 7);
			}
			else
			{
				[_b] spawn (GL4_Unmount_F select 8);
			};
		};
	}
	else
	{
		[_a] spawn (GL4_Unmount_F select 9);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by KeyCat
	// Optimized and Enhanced by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_a reveal _b;

	_c = (vehicle leader _a);

	[1, _b, _a, 100] call (GL4_System_F select 1);

	if ( (GL4_Global select 9) && ( [_a, 1] call (GL4_Unmount_F select 6) ) && (GL4_Artillery select 1) ) then
	{
		if (count (GL4_Artillery select 0) > 0) then
		{
			_d = (GL4_Artillery select 0);

			_e = 0;

			while { (_e < count _d) } do
			{
				_f = (_d select _e);

				_g = (vehicle leader _f);

				if ( (_g isKindOf "StaticCannon") && (alive _g) && (alive gunner _g) && (canFire _g) ) then
				{
					if (floor (random 100) < (GL4_Global select 11) ) then
					{
						[_g] spawn (GL4_Artillery_F select 0);
					};
				};

				_e = _e + 1;
			};
		};
	};

	if ( (GL4_Global select 13) && ( [_a, 2] call (GL4_Unmount_F select 6) ) && (GL4_Airstrike select 1) ) then
	{
		if (count (GL4_Airstrike select 0) > 0) then
		{
			_d = (GL4_Airstrike select 0);

			_e = 0;

			while { (_e < count _d) } do
			{
				_f = (_d select _e);

				_g = (vehicle leader _f);

				if ( (_g isKindOf "Plane") && (alive _g) && (alive driver _g) && (canMove _g) && (canFire _g) ) then
				{
					if (floor (random 100) < (GL4_Global select 15) ) then
					{
						[_g] spawn (GL4_Airstrike_F select 0);
					};
				};

				_e = _e + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by KeyCat
	// ////////////////////////////////////////////////////////////////////////////
	{private["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = False;

	switch (_b) do
	{
		case 1 :
		{
			_d = (GL4_Global select 10);
		};

		case 2 :
		{
			_d = (GL4_Global select 14);
		};
	};

	_e = 0;

	while { (_e < count units _a) } do
	{
		_f = (units _a select _e);

		_g = (vehicle _f);

		if ( (alive _g) && (rank _g in _d) ) exitWith
		{
			_c = True;
		};

		_e = _e + 1;
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #7
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by KeyCat
	// ////////////////////////////////////////////////////////////////////////////
	{private["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	if (GL4_Global select 22) then
	{
		if (floor (random 100) < 35) then
		{
			_c = (vehicle leader _a);

			_c setVariable ["GL4_Smoke_Shell", True];

			_d = [_b, _c] call GL4_Dir_To_F;

			_c setDir _d;

			_c doWatch _b;

			_c doTarget _b;

			sleep 1;

			_c disableAI "MOVE";

			_e = "SmokeShell";

			_f = magazines _c;

			_g = (_f select 0);

			_c removeMagazine _g;
			_c addMagazine _e;

			_c fire ["SmokeShellMuzzle","SmokeShellMuzzle", _e];

			sleep 10;

			_c setVariable ["GL4_Smoke_Shell", False];

			_c enableAI "MOVE";

			_c addMagazine _g;

			_c doWatch _b;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #8
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by KeyCat
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0; 

	if (GL4_Global select 23) then
	{
		if (floor (random 100) < 75) then
		{
			while { ( (alive _a) && (speed _a > 10) ) } do
			{
				sleep 1;
			};

			if (alive _a) then
			{
				_b = (getPos _a select 0);
				_c = (getPos _a select 1);

				"smokeShell" createVehicle [ ( (_b) + ( (random 5) - (random 5) ) ), ( (_c) + ( (random 5) - (random 5) ) ), 2];

				sleep random 3;

				"smokeShell" createVehicle [ ( (_b) + ( (random 10) - (random 10) ) ), ( (_c) + ( (random 10) - (random 10) ) ), 2];

				sleep random 5;

				"smokeShell" createVehicle [ ( (_b) + ( (random 15) - (random 15) ) ), ( (_c) + ( (random 15) - (random 15) ) ), 2];
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Unmount Function #9
	// ////////////////////////////////////////////////////////////////////////////
	// Unmount
	// Script by KeyCat
	// Optimized and Enhanced by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h","_i"];

	_a = _this select 0;

	if (GL4_Global select 24) then
	{
		_b = 0;
	
		while { (_b < count units _a) } do
		{
			_c = (units _a select _b);

			_d = getArray (configFile >> "cfgWeapons" >> (primaryWeapon _c) >> "muzzles");

			if ( (alive _c) && (count _d > 1) ) exitWith
			{
				_e = magazines _c;
				_f = (_e select 0);
				_c removeMagazine _f;

				_g = 8 + (random 7);

				_h = 0;

				while { ( (alive _c) && (_h < _g) ) } do
				{
					sleep 5 + (random 5);

					switch (side _c) do
					{
    						case EAST :
						{
							_i = "FlareWhite_GP25";

							_c addMagazine _i;
							_c fire ["GP25Muzzle","GP25Muzzle", _i];
						};
    						case WEST :
						{
							_i = "FlareWhite_M203";

							_c addMagazine _i;
							_c fire ["M203Muzzle","M203Muzzle", _i];
						};
    						case RESISTANCE :
						{
							_i = "FlareWhite_M203";

							_c addMagazine _i;
							_c fire ["M203Muzzle","M203Muzzle", _i];
						};
					};

					sleep 30 + (random 30);

					_h = _h + 1;
				};

				if (alive _c) then {_c addMagazine _f};
			};

			_b = _b + 1;
		};
	};

	}
];