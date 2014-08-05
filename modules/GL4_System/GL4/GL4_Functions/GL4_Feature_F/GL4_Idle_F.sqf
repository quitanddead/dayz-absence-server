// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Idle Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Idle_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Idle Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Idle
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

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

		if (count (GL4_Idle select 0) > 0) then
		{
			_a = _a - (GL4_Idle select 0);
		};

		if (count _a > 0) then
		{
			_b = 0;

			while { (_b < count _a) } do
			{
				_c = (_a select _b);

				_d = (vehicle leader _c);

				if (_d isKindOf "Man") then
				{
					[_c] spawn (GL4_Idle_F select 1);
				};

				_b = _b + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Idle Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Idle
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	if ( ( (waypointType [_a, 1] == "HOLD") || (waypointType [_a, 1] == "GUARD") ) && (waypointBehaviour [_a, 1] == "SAFE") )  then
	{
		_c = 0;

		while { (_c < count units _a) } do
		{
			_d = (units _a select _c);

			if (floor (random 100) < 75) then
			{
				if (_d != _b) then
				{ 
					if (floor (random 100) < 75) then
					{
						if ( (dayTime > 5.00) && (dayTime < 19.00) ) then
						{
							[_d] spawn (GL4_Idle_F select 2);
						}
						else
						{
							[_d] spawn (GL4_Idle_F select 3);
						};
					}
					else
					{
						[_d] spawn (GL4_Idle_F select 4);
					};
				};
			};

			_c = _c + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Idle Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Idle Day
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	if (floor (random 100) < 75) then
	{
		if !(group _a in (GL4_Idle select 0) ) then
		{
			GL4_Idle set [0, (GL4_Idle select 0) + [group _a] ];

			[group _a] spawn (GL4_Idle_F select 5);
		};
	}
	else
	{
		if (count (GL4_Idle select 2) > 0) then
		{
			_b = (GL4_Idle select 2);

			_c = 0;

			while { (_c < count _b) } do
			{
				_d = (_b select _c);

				if ( (_a distance _d < 20) && (inflamed _d) ) exitWith
				{
					GL4_Idle set [1, (GL4_Idle select 1) - [group _a] ];

					_a lockWp True;

					_a doMove (getPos _d);

					sleep 5 + (random 5);

					_a action ["firePutDown", _d];

					GL4_Idle set [2, (GL4_Idle select 2) - [_d] ];

					_a lockWp False;
				};

				_c = _c + 1;
			};
		}
		else
		{
			if (floor (random 100) < 50) then
			{
				_a action ["sitDown", _a];
			}
			else
			{
				_e = ["AmovPercMstpSlowWrflDnon_seeWatch","AmovPercMstpSnonWnonDnon_seeWatch","AmovPercMstpSnonWnonDnon_exerciseKneeBendA","AmovPercMstpSnonWnonDnon_exerciseKneeBendB","AmovPercMstpSnonWnonDnon_exercisePushup","AmovPsitMstpSlowWrflDnon_WeaponCheck1","AmovPsitMstpSlowWrflDnon_Smoking","AmovPercMstpSlowWrflDnon_AmovPsitMstpSlowWrflDnon","AidlPpneMstpSnonWnonDnon_SleepC_killFly"] call GL4_Random_Select_F;

				_a playMove _e;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Idle Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Idle Night
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	if !(group _a in (GL4_Idle select 1) ) then
	{
		_b = nearestObjects [_a, ["StreetLamp"], 100];

		if (count _b == 0) then
		{
			GL4_Idle set [1, (GL4_Idle select 1) + [group _a] ];

			_c = "Land_Fire_Burning" createVehicle (getPos _a);

			GL4_Idle set [2, (GL4_Idle select 2) + [_c] ];

			_a action ["sitDown", _a];
		};
	}
	else
	{
		if (floor (random 100) < 75) then
		{
			if !(group _a in (GL4_Idle select 0) ) then
			{
				GL4_Idle set [0, (GL4_Idle select 0) + [group _a] ];

				[group _a] spawn (GL4_Idle_F select 5);
			};
		}
		else
		{
			_d = (GL4_Idle select 2);

			_e = 0;

			while { (_e < count _d) } do
			{
				_f = (_d select _e);

				if (_a != leader _a) then
				{
					if ( (_a distance _f > 10) && (_a distance _f < 30) ) then
					{
						_a lockWp True;

						_a doMove (getPos _f);

						sleep 5 + (random 5);

						_a action ["sitDown", _a];

						_a lockWp False;
					}
					else
					{
						_a action ["sitDown", _a];
					};
				};

				_e = _e + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Idle Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Idle Talk
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	switch (side _a) do
	{
		case EAST :
		{
			_b = ["SoldierEB"];
		};
    		case WEST :
		{
			_b = ["SoldierWB"];
		};
    		case RESISTANCE :
		{
			_b = ["SoldierGB"];
		};
	};

	_c = nearestObjects [_a, _b, 20];

	if (count _c > 0) then
	{
		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			if (_e != _a) exitWith
			{
				_f = getDir _e;

				_a setDir _f + 180;

				if (_a distance _e > 10) then
				{
					_a lockWP True;

					_a doMove (getPos _e);

					sleep 3 + (random 3);

					_a lockWP False;

					_a playMove "AidlPercSnonWnonDnon_talk1";

					["TALK", _a];
				}
				else
				{
					["TALK", _a];

					_a playMove "AidlPercSnonWnonDnon_talk2";
				};
			};

			_d = _d + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Idle Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Idle Patrol
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	if (count (units _a) > 2) then
	{
		_b = units _a select (count units _a - 1);

		[_b] join grpNull;

		_c = units _a select (count units _a - 1);

		[_c] join grpNull;

		[_c] join _b;

		_d = group _b;

		if !(_d in (GL4_Idle select 0) ) then
		{
			GL4_Idle set [0, (GL4_Idle select 0) + [_d] ];

			[_d] spawn (GL4_Marker_F select 1);
		};

		_d lockWp True;

		_e = 2 + (random 2);

		_f = 0;

		while { ( (alive leader _d) && (_f < _e) && !(_a in (GL4_Reinforcement select 1) ) ) } do
		{
			[2, leader _a, _d, 100] call (GL4_System_F select 1);

			if (floor (random 100) < 75) then 
			{
				{_x setSpeedMode "LIMITED"; _x setBehaviour "SAFE"} forEach units _d;
			}
			else
			{
				{_x setSpeedMode "NORMAL"; _x setBehaviour "AWARE"} forEach units _d;
			};

			sleep 50 + (random 70);

			_f = _f + 1;
		};

		if (alive leader _d) then
		{
			if !(_a in (GL4_Reinforcement select 1) ) then
			{
				_d lockWP False;
			};

			if ({alive _x} count (units _a) > 0) then
			{
				{[_x] join _a} forEach units _d;
			};
		};

		GL4_Idle set [0, (GL4_Idle select 0) - [_a, _d] ];
	}
	else
	{
		if (count (units _a) > 1) then
		{
			_b = units _a select (count units _a - 1);

			[_b] join grpNull;

			_c = group _b;

			if !(_c in (GL4_Idle select 0) ) then
			{
				GL4_Idle set [0, (GL4_Idle select 0) + [_c] ];

				[_c] spawn (GL4_Marker_F select 1);
			};

			_c lockWP True;

			[2, leader _a, _c, 100] call (GL4_System_F select 1);

			sleep 50 + (random 70);

			if (alive leader _c) then
			{
				if !(_a in (GL4_Reinforcement select 1) ) then
				{
					_c lockWP False;
				};

				if ({alive _x} count (units _a) > 0) then
				{
					[_b] join _a;
				};
			};

			GL4_Idle set [0, (GL4_Idle select 0) - [_a, _c] ];
		};
	};

	}
];