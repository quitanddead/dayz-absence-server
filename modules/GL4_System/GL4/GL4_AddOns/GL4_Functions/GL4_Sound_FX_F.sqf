// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Sound FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Sound_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;	

	if ( (alive vehicle player) && (cameraOn == (vehicle player) ) ) then
	{
		_b = "Logic" createVehicleLocal (getPos _a);

		_b attachTo [_a, [0,0,0], ""];

		_c = (GL4_Resource select 19) call GL4_Random_Select_F;

		_b say _c;

		_d = time + 5;

		while { ( !(isNull _a) && (_d > time) ) } do
		{
			sleep 0.1;
		};

		deleteVehicle _b;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = ["destructionEffect1","destructionEffect2","destructionEffect3","destructionEffect4","destructionEffect5"] call GL4_Random_Select_F;

	_c = "Logic" createVehicleLocal (getPos _a);

	_c attachTo [_a, [0,0,0], _b];

	_d = (GL4_Resource select 24) call GL4_Random_Select_F;

	_c say _d;

	if (floor (random 100) < (GL4_Local select 70) ) then
	{
		[_a, _b] call (GL4_Wrack_FX_F select 3);
	};

	sleep 5;

	deleteVehicle _c;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;

	_b = "Logic" createVehicleLocal (getPos _a);

	_b attachTo [_a, [0,0,0], "destructionEffect1"];

	_c = (GL4_Resource select 25) call GL4_Random_Select_F;

	_b say _c;

	sleep 10;

	deleteVehicle _b;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;
	_b = _this select 1;

	_c = "Logic" createVehiclelocal (getPos _a);

	_c attachTo [_a, [0,0,0], _b];

	sleep 3;

	_d = 150 + (random 150);

	drop ["\GL4_Sound_FX\GL4_Models\GL4_Blood_Splat.p3d", "", "SpaceObject", 1, _d,

	[ (getPos _c select 0), (getPos _c select 1), 0], [0, 0, 0], 0, 1.275, 1, 0,

	[random 1, 5], [ [1,1,1,1] ], [0], 0, 0, "", "", ""];

	if ( (player distance _a < 200) && ( (dayTime > 7.00) && (dayTime < 19.00) ) && ( [_a] call (GL4_Sound_FX_F select 4) ) && (count (GL4_Sound_FX select 0) < (GL4_Local select 29) ) ) then
	{
		GL4_Sound_FX set [0, (GL4_Sound_FX select 0) + [_a] ];

		sleep 30 + (random 30);

		_e = time + (_d - (random _d) );

		_f = createSoundSource ["Sound_Flies", (getPos _c), [], 0];

		while { (time < _e) } do
		{
			sleep 1;
		};

		deleteVehicle _f;

		GL4_Sound_FX set [0, (GL4_Sound_FX select 0) - [_a] ];
	};

	while { (time < _d) } do
	{
		sleep 1;
	};

	deleteVehicle _c;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = True;

	if (count (GL4_Sound_FX select 0) > 0) then
	{
		_c = (GL4_Sound_FX select 0);

		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			if ( (_e != _a) && (_e distance _a < 10) ) exitWith
			{
				_b = False;
			};

			_d = _d + 1;
		};
	};

	_b

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	if ( (alive player) && (cameraOn == (vehicle player) ) ) then
	{
		if ( (alive player) && (_a distance player < 200) && (count (GL4_Sound_FX select 1) <= 3) ) then
		{
			_b = [_a, getPos player] call GL4_Rel_Dir_To_F;

			if ( (_b >= 340) || (_b <= 20) ) then
			{
				_c = (GL4_Sound_FX select 2);

				_d = (_c select 0);

				GL4_Sound_FX set [2, (GL4_Sound_FX select 2) - [_d] ];

				[_a, _d] spawn (GL4_Sound_FX_F select 6);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// Sound FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	if !(isNull _a) then
	{
		GL4_Sound_FX set [1, (GL4_Sound_FX select 1) + [_a] ];

		_b attachTo [_a, [0,0,0], ""];

		_c = (GL4_Resource select 31) call GL4_Random_Select_F;

		_b say _c;

		_d = time + 5;

		while { ( !(isNull _a) && (_d > time) ) } do
		{
			sleep 0.1;
		};

		GL4_Sound_FX set [1, (GL4_Sound_FX select 1) - [_a] ];

		GL4_Sound_FX set [2, (GL4_Sound_FX select 2) + [_b] ];
	};

	}
];