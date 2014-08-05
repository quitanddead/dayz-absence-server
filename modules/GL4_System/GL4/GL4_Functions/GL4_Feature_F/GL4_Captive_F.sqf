// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Captive Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Captive_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Captive Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Captive
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	waitUntil { (GL4_Initialize select 1) };

	_a = _this select 0;

	if (GL4_Global select 50) then
	{
		while { (alive _a) } do
		{
			_b = (vehicle _a);

			if ( (_b isKindOf "Man") && (side _b != CIVILIAN) && ( (fleeing _b) || (primaryWeapon _b == "") ) ) then
			{
				if ( (floor (random 100) < 50) && ( { (alive _x) } count (units _b) < (GL4_Global select 54) ) ) then
				{
					_c = (GL4_Global select 53);

					switch (rank _b) do
					{
						case "PRIVATE" :
						{
							_d = (_c select 0);
						};

						case "CORPORAL" :
						{
							_d = (_c select 1);
						};

						case "SERGEANT" :
						{
							_d = (_c select 2);
						};

						case "LIEUTENANT" :
						{
							_d = (_c select 3);
						};

						case "CAPTAIN" :
						{
							_d = (_c select 4);
						};

						case "MAJOR" :
						{
							_d = (_c select 5);
						};

						case "COLONEL" :
						{
							_d = (_c select 6);
						};
					};

					if (floor (random 100) < _d) then
					{
						[_b] call (GL4_Captive_F select 1);
					};
				};
			};

			sleep 30 + (random 50);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Captive Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Captive
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (GL4_Player select 0);

	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		if ( (_a countEnemy [_d] > 0) && (_a distance _d < 200) && ( [_a] call (GL4_Captive_F select 2) ) ) exitWith
		{
			[_a, _d] spawn (GL4_Captive_F select 3);
		};

		_c = _c + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Captive Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Captive
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = True;

	_c = nearestObjects [_a, ["Man","Car","Tank","Air"], 100];

	_c = _c - units _a;

	if (count _c > 0) then
	{
		_d = [];

		_e = 0;

		while { (_e < count _c) } do
		{
			_f = (_c select _e);

			if ( (alive _f) && (_a countFriendly [_f] > 0) && (side _f != CIVILIAN) && (_a knowsAbout _f > 0) && (count weapons _f > 0) && (count magazines _f > 0) ) then
			{
				_d = _d + [_f];
			};

			if (count _d > (GL4_Global select 55) ) exitWith
			{
				_b = False;
			};

			_e = _e + 1;
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Captive Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Captive
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	if (count magazines _a > 0) then
	{
		{_a removeMagazine _x} forEach magazines _a;
	};

	_c = [ "I surrender! Please don't shoot!",
	       "I give up! Please don't kill me!",
	       "Hold your fire! I surrender!"
	
	] call GL4_Random_Select_F;

	if (isMultiplayer) then
	{
		GL4_Captive_Player_PublicVariable = [4, _a, _c]; publicVariable "GL4_Captive_Player_PublicVariable";
	}
	else
	{
		_a globalChat _c;
	};

	[_a] join grpNull;

	_a setCaptive True;
	_a allowFleeing 0;
	_a stop True;
	_a setBehaviour "CARELESS";
	_a setCombatMode "BLUE";
	_a setUnitPos "UP";

	_d = format ["%1", primaryWeapon _a];

	if (_d != "") then
	{
		_a action ["DROPWEAPON", WeaponHolder, _d];

		_e = time + 5;

		while { ( (alive _a) && (_d != "") && (time < _e) ) } do
		{
			sleep 1;
		};
	}
	else
	{
		sleep 1;
	};

	if (alive _a) then
	{
		_d = format ["%1", secondaryWeapon _a];

		if (_d != "") then
		{
			_a action ["DROPWEAPON", WeaponHolder, _d];

			_e = time + 5;

			while { ( (alive _a) && (_d != "") && (time < _e) ) } do
			{
				sleep 1;
			};
		}
		else
		{
			sleep 1;
		};
	};

	if (alive _a) then
	{
		_d = magazines _a;

		{_a removeMagazine _x} forEach _d;

		removeAllWeapons _a;

		if ( (floor (random 100) < 75) && (canStand _a) ) then
		{
			_a switchMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
		};

		if (isMultiplayer) then
		{
			GL4_Captive_Player_PublicVariable = [1, _a]; publicVariable "GL4_Captive_Player_PublicVariable";
		}
		else
		{
			[1, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Captive_Player.sqf");
		};
	};

	while { ( (alive _a) && (captive _a) && (stopped _a) ) } do
	{
		if ( (floor (random 100) < (GL4_Global select 57) ) && ( [_a] call (GL4_Captive_F select 5) ) ) then
		{
			[_a] spawn (GL4_Captive_F select 6);
		};

		sleep 30 + (random 60);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Captive Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Captive
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = "";

	_d = nearestObjects [_a, ["Man","Car","Tank","Helicopter","Plane"], 200];

	_d = _d - units _a;

	if (count _d > 0) then
	{
		_e = 0;

		while { (_e < count _d) } do
		{
			_f = (_d select _e);

			if ( (alive _f) && (_a countFriendly [_f] > 0) && (side _f != CIVILIAN) && (count weapons _f > 0) && (count magazines _f > 0) && (canFire _f) && (canMove _f) && (_b knowsAbout _f == 0) ) exitWith
			{
				_c = (vehicle leader _f);
			};

			_e = _e + 1;
		};
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Captive Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Captive
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = False;

	_c = nearestObjects [_a, ["Man","Car","Tank","Air"], 100];

	_c = _c - units _a;

	if (count _c > 0) then
	{
		_d = [];

		_e = 0;

		while { (_e < count _c) } do
		{
			_f = (_c select _e);

			if ( (alive _f) && (_a countFriendly [_f] > 0) && (side _f != CIVILIAN) && (_a knowsAbout _f > 0) && (count weapons _f > 0) && (count magazines _f > 0) ) then
			{
				_d = _d + [_f];
			};

			if (count _d > (GL4_Global select 55) ) exitWith
			{
				_b = True;
			};

			_e = _e + 1;
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Captive Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// Captive
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_a stop False;
	_a setCombatMode "AWARE";
	_a setUnitPos "UP";

	_a setCaptive False;

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

	while { ( (alive _a) && (_a == leader _a) && (side _a != CIVILIAN) && !(stopped _a) ) } do
	{
		_c = nearestObjects [_a, _b, 100];

		_c = _c - [_a];

		if (count _c > 0) then
		{
			_d = 0;

			while { (_d < count _c) } do
			{
				_e = (_c select _d);

				if ( (alive _e) && (_a knowsAbout _e > 0) && (_a countFriendly [_e] > 0) ) exitWith
				{
					[_a] join group _e;

					_a doMove (getPos _e);

					while { ( (alive _a) && ({alive _x} count (units _e) > 0) && (_a distance _e > 30) ) } do
					{
						sleep 1;
					};

					if (alive _a) then
					{
						_a setUnitPos "AUTO";
					};
				};

				_d = _d + 1;
			};
		};

		sleep 30 + (random 50);
	};

	}
];