// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Blood FX Functions
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Blood_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX
	// By Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	if (GL4_Local select 4) then
	{
		_a = _this select 0;
		_b = _this select 1;

		if (_a == _b) then
		{
			_c = random 360;
		}
		else
		{
			_c = [position _b, position _a] call (GL4_Blood_FX_F select 3);
		};

		_d = [getPos _a select 0, getPos _a select 1];

		(GL4_Blood_FX_F select 4) setPos _d;

		_d set [2, _a distance (GL4_Blood_FX_F select 4) ];

		_e = (GL4_Local select 8) / 5;

		_f = 0;

		while { (_f < 5) } do
		{
			[_a, _c, _d, _e, 1] call (GL4_Blood_FX_F select 1);

			_f = _f + 1;
		};

		_c = _c - 180;

		if (_c < 0) then
		{
			_c = _c + 360;
		};

		[_a, _c, _d, _e, 2] call (GL4_Blood_FX_F select 1);

		if ( (isPlayer _a) && (alive _a) && (_a isKindOf "Man") && (local _a) ) then
		{
			if (GL4_Local select 5) then
			{
				if !(_a in (GL4_Bleeding select 0) ) then
				{
					GL4_Bleeding set [0, (GL4_Bleeding select 0) + [_a] ];

					[_a] spawn (GL4_Bleeding_F select 0);
				};
			};

			if (getDammage _a < 0.3) then
			{
				cutRsc ["GL4_RscBleeding_02", "PLAIN", 0];
			}
			else
			{
				if (getDammage _a > 0.5) then
				{
					cutRsc ["GL4_RscBleeding_03", "PLAIN", 0];
				};
			};
		};

		if ( (GL4_Blood select 2) && (GL4_Blood select 3) && (count (GL4_Blood select 0) > (GL4_Local select 9) ) ) then
		{
			_g = 0;

			[_g] spawn (GL4_Monitor_F select _g);
		};

		if ( (GL4_Blood select 2) && (GL4_Blood select 3) && (time > (GL4_Blood select 4) ) ) then
		{
			_g = 1;

			[_g] spawn (GL4_Monitor_F select _g);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX
	// By Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g","_h"];

	_a = [ _this select 0,
	       _this select 1,
	       _this select 2,
	       _this select 3,
	       _this select 4
	];

	switch (_a select 4) do
	{
		case 1 :
		{
			_b = (GL4_Local select 10);
			_c = (GL4_Local select 14);
		};

		case 2 :
		{
			_b = (GL4_Local select 17);
			_c = (GL4_Local select 18);
		};
	};

	_a set [3, (_a select 3) * 1 ];

	while { ( (_a select 3) > 0) } do
	{
		_d = _b * (random 1) ^ (GL4_Local select 11);

		_e = [ (_a select 1) + (random (_d * 2) - _d),
		       (GL4_Local select 13) + (random (_c - (GL4_Local select 13) ) * (random 1) ^ (GL4_Local select 12) )
		];

		_f = [ sin (_e select 0) * (_e select 1),
		       cos (_e select 0) * (_e select 1),
		       (GL4_Local select 16) + random ( (GL4_Local select 15) - (GL4_Local select 16) ),
		       0.3
		];

		if ( (_f select 2) < 0) then
		{
			_f set [3, 0.5];
		};

		_g = 2 + (- (_f select 2) * (_f select 3) );

		_h = [ ( [ (_a select 2), [ ( (_a select 2) select 0) + sin (_e select 0) * ( (_e select 1) / _g), ( (_a select 2) select 1) + cos (_e select 0) * ( (_e select 1) / _g), 0] ] call (GL4_Blood_FX_F select 2) ) / (_e select 1),
		       [ (GL4_Local select 19) + random ( (GL4_Local select 20) - (GL4_Local select 19) ) ],
		       ""
		];

		if ( ( (_a select 0) distance player < (GL4_Local select 6) ) && !(surfaceIsWater (getPos (_a select 0) ) ) ) then
		{
			if (count (GL4_Blood select 0) < (GL4_Local select 9) ) then
			{
				_h set [2, (GL4_Path+"GL4\GL4_AddOns\GL4_Blood\GL4_Texture.sqf") ];
			}
			else
			{
				_h set [2, ""];
			};
		};

		drop ["\GL4_Blood_FX\GL4_Models\GL4_Blood_01.p3d", "", "SpaceObject", 1, (_h select 0),

		[ ( (_a select 2) select 0), ( (_a select 2) select 1), (0.7 + random 0.1) + ( (_a select 2) select 2) ],

		[ (_f select 0), (_f select 1), (_f select 2) ], 1, 0.05, 0.0045, 0,

		(_h select 1), (GL4_Local select 21), [0,1,0], 0.5, 0.05, "", (_h select 2), "", random 360];

		_a set [3, (_a select 3) - 1 ];
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX
	// By Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = (_this select 0) select 0;
	_b = (_this select 0) select 1;
	_c = (_this select 1) select 0;
	_d = (_this select 1) select 1;

	sqrt ( (_a - _c) ^2 + (_b - _d) ^2 );

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX
	// By Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = ( (_b select 1) - (_a select 1) );
	_d = ( (_b select 0) - (_a select 0) ) atan2 (if (_c == 0) then {1e-10} else {_c});

	if (_d < 0) then {_d = _d + 360};

	_d

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX
	// By Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
	// ////////////////////////////////////////////////////////////////////////////
	call {private ["_a"];

	_a = "Logic" createVehicleLocal [0,0,0];

	_a

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Blood FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;

	if (_b distance _a < 0.9) then
	{
		[_a, _a] call (GL4_Blood_FX_F select 0);

		if (local _a) then
		{
			_c = (getDammage _a);

			_a setDammage _c + (random 0.05);
		};
	};

	}
];