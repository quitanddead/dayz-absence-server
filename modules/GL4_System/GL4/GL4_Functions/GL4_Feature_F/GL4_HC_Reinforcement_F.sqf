// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_HC_Reinforcement_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = grpNull;

	if (count (GL4_HC_Reinforcement select 1) > 0) then
	{
		_c = (GL4_HC_Reinforcement select 1);

		if (count (GL4_HC_Reinforcement select 2) > 0) then
		{
			_c = _c - (GL4_HC_Reinforcement select 2);
		};

		if (count _c > 0) then
		{
			_d = (GL4_High_Command select 2);

			_e = 0;

			while { (_e < count _c) } do
			{
				_f = (_c select _e);

				_g = (vehicle leader _f);

				if ( { (alive _x) } count (units _f) > 0) then
				{
					if (_g distance (vehicle _a) < _d) then
					{
						_b = _f;

						_d = (_g distance (vehicle _a) );
					};
				}
				else
				{
					if (_f in (GL4_HC_Reinforcement select 1) ) then
					{
						GL4_HC_Reinforcement set [1, (GL4_HC_Reinforcement select 1) - [_f] ];

						if (_f in (GL4_HC_Reinforcement select 2) ) then
						{
							GL4_HC_Reinforcement set [2, (GL4_HC_Reinforcement select 2) - [_f] ];
						};
					};
				};

				_e = _e + 1;
			};
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	{_x doMove _c} forEach units _b;

	_b lockWp True;

	[_a, _b] spawn (GL4_HC_Reinforcement_F select 2);

	if (GL4_High_Command select 3) then
	{
		if (local _a) then
		{
			[3, _a, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Player.sqf");
		}
		else
		{
			GL4_HC_Reinforcement_Player_PublicVariable = [3, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
		};
	};

	_d = [ [" [playerSide, ""HQ""] sidechat""%1 we will send you %2 as reinforcement."" ", name _a, _b],
	       [" [playerSide, ""HQ""] sidechat""%1 we will send %2 to your requested coordinates as reinforcement."" ", name _a, _b, _d]

	] call GL4_Random_Select_F;

	if (local _a) then
	{
		call compile format _d;
	}
	else
	{
		GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _d]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _b);

	[_b, 1] call (GL4_System_F select 4);

	_d = [_b, _c] call (GL4_HC_Reinforcement_F select 3);

	_e = time + 10;

	while { ( ( { (alive _x) } count (units _b) > 0) && (GL4_HC_Reinforcement select 4) ) } do
	{
		if (_c != vehicle leader _b) then
		{
			_c = (vehicle leader _b);

			_d = [_b, _c] call (GL4_HC_Reinforcement_F select 3);
		};

		if ( (_c isKindOf "Man") && (time > _e) && (_c distance (GL4_HC_Reinforcement select 6) > _d) ) then
		{
			[_b] spawn (GL4_Vehicle_Mount_F select 0);

			_e = time + 50;
		};

		if ( [_a, _c] call (GL4_HC_Reinforcement_F select 4) ) exitWith
		{
			_c = (vehicle leader _b);

			[_b, 2] call (GL4_System_F select 4);

			[_b, _c] spawn (GL4_HC_Reinforcement_F select 5);
		};

		if ( (_c distance (GL4_HC_Reinforcement select 6) < _d) || !(canMove _c) || !(alive driver _c) ) exitWith
		{
			_c = (vehicle leader _b);

			[_b, 2] call (GL4_System_F select 4);

			[_b, _c] spawn (GL4_HC_Reinforcement_F select 5);
		};

		sleep 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
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

	if (_b distance (GL4_HC_Reinforcement select 6) > _c) then
 	{
		_c = _c;
	}
	else
	{
		_c = _b distance (GL4_HC_Reinforcement select 6);
	};

	_c

	},


	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = False;

	_d = nearestObjects [_b, ["AllVehicles"], 200];

	if (count _d > 0) then
	{
		_e = 0;

		while { (_e < count _d) } do
		{
			_f = (_d select _e);

			if ( (alive _f) && (_b countEnemy [_f] > 0) && (_b knowsAbout (vehicle _f) > 0) ) exitWith
			{
				_g = [ [" [playerSide, ""HQ""] sidechat""%1 was attacked by enemy forces. %1 has cancelled your reinforcement request. "" ", group _b],
				       [" [playerSide, ""HQ""] sidechat""%1 has spotted enemy forces. %1 is not able to comply your reinforcement request."" ", group _b]

				] call GL4_Random_Select_F;

				if (isMultiplayer) then
				{
					GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _g]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
				}
				else
				{
					call compile format _g;
				};

				_c = True;
			};

			_e = _e + 1;
		};
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by KeyCat
	// Optimized and Enhanced by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	if (_b isKindOf "Wheeled_APC") exitWith
	{
		{if (assignedVehicleRole _x select 0 == "Cargo") then {unAssignVehicle _x} } forEach units _a;
	};

	if (_b isKindOf "Car") exitWith
	{
		{unAssignVehicle _x} forEach units _a;

		while { ( (alive _b) && (canMove _b) && (speed _b > 60) ) } do
		{
			sleep 1;
		};

		GL4_System set [9, (GL4_System select 9) + [_a, getPos _b] ];
	};

	if (_b isKindOf "Tank") exitWith
	{
		{if (assignedVehicleRole _x select 0 == "Cargo") then {unAssignVehicle _x} } forEach units _a;
	};

	if (_b isKindOf "Helicopter") exitWith
	{
		_c = [_a] call GL4_Crew_F;

		if (count (crew _b) > _c) then
		{
			[_a, 2] spawn (GL4_Helicopter_F select 0);
		};

		if ( (floor (random 100) < (GL4_Global select 20) ) && (count (units _a) > _c) ) then
		{
			[_a, 2] spawn (GL4_Helicopter_F select 2);
		}
		else
		{
			[_a] spawn (GL4_HC_Reinforcement_F select 7);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (vehicle leader _a);

	GL4_HC_Reinforcement set [1, (GL4_HC_Reinforcement select 1) + [group _b] ];

	GL4_HC_Reinforcement set [2, (GL4_HC_Reinforcement select 2) + [group _b] ];

	GL4_HC_Reinforcement set [1, (GL4_HC_Reinforcement select 1) - [_a] ];

	GL4_HC_Reinforcement set [2, (GL4_HC_Reinforcement select 2) - [_a] ];

	{_x doMove (getPos (GL4_HC_Reinforcement select 6) ) } forEach units _b;

	if (GL4_High_Command select 3) then
	{
		if (local player) then
		{
			[3, player, group _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Player.sqf");
		}
		else
		{
			GL4_HC_Reinforcement_Player_PublicVariable = [3, player, group _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
		};
	};

	_d = (GL4_System select 8);

	_e = _d find _a;

	_e = _e + 1;

	_f = (_d select _e);

	{_x disableAI "TARGET"; _x disableAI "AUTOTARGET"} forEach (crew _c);

	_c move _f;

	if ( (alive _c) && (alive driver _c) && (canMove _c) ) then
	{
		if (unitReady _c) then
		{
			if (GL4_HC_Reinforcement select 4) then
			{
				_c land "LAND";

				{_x enableAI "TARGET"; _x enableAI "AUTOTARGET"} forEach (crew _c);
			}
			else
			{
				_c land "NONE";
			};
		};

		while { ( (alive _c) && (alive driver _c) && (canMove _c) && (GL4_HC_Reinforcement select 4) ) } do
		{
			sleep 1;
		};

		if ( (alive _c) && (alive driver _c) && (canMove _c) ) then
		{
			{if (alive _x) then {[_x] join _c} } forEach units _b;

			GL4_HC_Reinforcement set [1, (GL4_HC_Reinforcement select 1) + [_a] ];

			GL4_HC_Reinforcement set [2, (GL4_HC_Reinforcement select 2) + [_a] ];
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #7
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	if (GL4_Global select 21) then
	{
		while { ( (alive _b) && (alive driver _b) && (canMove _b) && (GL4_HC_Reinforcement select 4) ) } do
		{
			if ( (floor (random 100) < 75) && (GL4_HC_Reinforcement select 4) ) then
			{
				[_a] call (GL4_HC_Reinforcement_F select 8);
			};

			sleep 30 + (random 50);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement Function #8
	// ////////////////////////////////////////////////////////////////////////////
	// High Command Reinforcement
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	_b flyInHeight (100 - (random 50) );

	_c = (GL4_HC_Reinforcement select 6);

	_d = [ ( (getPos _c select 0) + ( (random 700) - (random 700) ) ), ( (getPos _c select 1) + ( (random 700) - (random 700) ) ), 0];

	(GL4_HC_Reinforcement select 7) setPos _d;

	_b move (getPos (GL4_HC_Reinforcement select 7) );

	while { ( (alive _b) && (alive driver _b) && (canMove _b) && !(unitReady _b) && (GL4_HC_Reinforcement select 4) ) } do
	{
		sleep 1;
	};

	if ( (alive _b) && (alive driver _b) && (canMove _b) && (GL4_HC_Reinforcement select 4) ) then
	{
		sleep (random 30);
	};

	if ( (floor (random 100) < 85) && (alive _b) && (alive driver _b) && (canMove _b) && (GL4_HC_Reinforcement select 4) ) then
	{
		[_a] call (GL4_HC_Reinforcement_F select 8);
	};

	}
];