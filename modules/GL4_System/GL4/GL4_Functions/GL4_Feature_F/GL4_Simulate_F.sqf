// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Simulate Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Simulate_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Simulate Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Simulate
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	if ( (_a countEnemy [_b] > 0) && ( [_a] call (GL4_Simulate_F select 1) ) && !(_a in (GL4_Simulate select 0) ) ) then
	{
		GL4_Simulate set [0, (GL4_Simulate select 0) + [_a] ];

		hint "Warning! There are no allied nearby. You may should think about simulating dead.";

		_c = _a addAction ["Simulate Dead", (GL4_Path+"GL4\GL4_Features\GL4_Simulate_Dead\GL4_Simulate_Dead.sqf")];

		sleep 10;

		if (alive _a) then
		{
			if (animationState _a != "AdthPercMstpSlowWrflDnon_1") then
			{
				_a removeAction _c;

				hint "";

				sleep 50 + (random 100);

				GL4_Simulate set [0, (GL4_Simulate select 0) - [_a] ];
			};
		}
		else
		{
			_a removeAction _c;

			hint "";

			GL4_Simulate set [0, (GL4_Simulate select 0) - [_a] ];
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Simulate Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Simulate
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = True;

	_c = 0;

	while { ( (_c < count units _a) && (_b) ) } do
	{
		_d = (units _a select _c);

		if ( (_d != _a) && (alive _d) ) then
		{
			if (_d distance _a > (GL4_Local select 85) ) then
			{
				_b = True;
			}
			else
			{
				_b = False;
			};
		};

		_c = _c + 1;
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Simulate Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Simulate
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	if ( (alive _a) && (_a countEnemy [_b] > 0) && ( [_a] call (GL4_Simulate_F select 3) ) ) then
	{
		if ( { (animationState _a == _x) } count (GL4_Resource select 37) > 0) then
		{
			_a switchMove "AinjPpneMstpSnonWnonDnon_kneel";
		}
		else
		{
			if (stopped _a) then
			{
				_a stop False;
			};

			_c = (GL4_Resource select 37) call GL4_Random_Select_F;

			_a playMove _c;

			sleep 30 + (random 50);

			if (alive _a ) then
			{
				_a switchMove "AinjPpneMstpSnonWnonDnon_kneel";
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Simulate Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Simulate
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = True;

	_c = nearestObjects [_a, ["Man","Car","Tank","Air"], 100];

	_c = _c - [_a];

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

			if (count _d > (GL4_Global select 60) ) exitWith
			{
				_b = False;
			};

			_e = _e + 1;
		};
	};

	_b

	}
];		