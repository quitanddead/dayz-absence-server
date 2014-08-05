// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Weapon FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Weapon_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_d = getNumber (configFile >> "CfgAmmo" >> (typeOf _c) >> "hit");

	if ( !(_b isKindOf "Man") && (_a isKindOf "BulletBase") ) then
	{
		[_c, _d] spawn (GL4_Weapon_FX_F select 1);
	}
	else
	{
		if ( (_d > 10) && ( (_a isKindOf "Grenade") || (_a isKindOf "GrenadeBase") || (_a isKindOf "RocketBase") || (_a isKindOf "MissileBase") ) ) then
		{
			[_c, _d] spawn (GL4_Weapon_FX_F select 4);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = getPos _a;

	_d = time + 5;

	while { ( !(isNull _a) && (time < _d) ) } do
	{
		_c = getPos _a;

		sleep 0.01;
	};

	if !(surfaceIsWater _c) then
	{
		_e = (GL4_Weapon_FX select 0);

		_e setPos _c;

		if (floor (random 100) < (GL4_Local select 32) ) then
		{
			[_b, _e] call (GL4_Weapon_FX_F select 2);
		};

		if ( (GL4_Local select 33) && (_c select 2 < 5) && !(isOnRoad getPos _e) ) then
		{
			[_b, _e] call (GL4_Weapon_FX_F select 3);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = nearestObjects [_b, ["Man"], 5];

	if (count _c == 0) then
	{
		_d = random 3;

		_d = round _d;

		_a = _a / (GL4_Local select 31);

		while { (_a > 0) } do
		{
			switch (_d) do
			{
				case 0 :
				{
					_e = [ 0.1 + random 0.5,
					       [ + random 5 + (random 5 - random 5), + random 5 + (random 5 - random 5), (random 5 - random 5) * 3],
					       0.5 + random 1,
					       [random 0.3, random 0.1]
					];
				};

				case 1 :
				{
					_e = [ 0.1 + random 0.5,
					       [ - random 5 + (random 5 - random 5), - random 5 + (random 5 - random 5), (random 5 - random 5) * 3],
					       0.5 + random 1,
					       [random 0.3, random 0.1]
					];
				};

				case 2 :
				{
					_e = [ 0.1 + random 0.5,
					       [ + random 7 + (random 7 - random 7), + random 7 + (random 7 - random 7), (random 7 - random 7) * 3],
						0.7 + random 1,
					       [random 0.5, random 0.1]
					];
				};

				case 3 :
				{
					_e = [ 0.1 + random 0.5,
					       [ - random 7 + (random 7 - random 7), - random 7 + (random 7 - random 7), (random 7 - random 7) * 3],
						0.7 + random 1,
					       [random 0.5, random 0.1]
					];
				};
			};

			drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_e select 0),

			[0,0,0], (_e select 1), 0, (_e select 2), random 0.5, 0,

			(_e select 3), [ [1,1,1,-10] ], [1000], random 0.5, random 0.5, "", "", _b, random 360];

			_a = _a - 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = nearestObjects [_b, ["Man","Car","Tank","Air","House"], 10];

	if (count _c == 0) then
	{
		_a = _a / (GL4_Local select 31);

		while { (_a > 0) } do
		{
			_d = [ 0.1 + random 1,
			       [ (random 3 - random 3), (random 3 - random 3), (random 3 - random 3) * 2],
			       [0.5 + random 1]
			];

			drop [ ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 9, 0], "", "Billboard", 1, (_d select 0),

			[0,0,0], (_d select 1), 0, 5, 1, 0,

			(_d select 2), [ [0.1,0.1,0.1,1],[0.1,0.1,0.1,0] ], [1000], 0, 0, "", "", _b, random 360];

			_a = _a - 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = getPos _a;

	_d = time + 5;

	while { ( !(isNull _a) && (time < _d) ) } do
	{
		_c = (getPos _a);

		sleep 0.1;
	};

	if (_b > 100) then
	{
		_b = _b / 15;
	}
	else
	{
		_b = _b * 3;
	};

	_b = _b / (GL4_Local select 31);

	if (floor (random 100) < (GL4_Local select 34) ) then
	{
		[_b, _c] call (GL4_Weapon_FX_F select 5);
	};

	if (GL4_Local select 35) then
	{
		if ( !(surfaceIsWater _c) && ( (_c select 2) < 3) ) then
		{
			while { (_b > 0) } do
			{
				if (_b > 100) then
				{
					_e = [ 5 + (random 5),
					       [ (random 10 - random 10), (random 10 - random 10), 5 + (random 10) ],
					       1 + random 5,
					       [0.1 + random 0.3]
					];
				}
				else
				{
					_e = [ 5 + (random 5),
					       [ (random 10 - random 10), (random 10 - random 10), 5 + (random 5) ],
					       1 + random 5,
					       [0.1 + random 0.3]
					];
				};

				drop ["\ca\Data\ParticleEffects\Pstone\PStone.p3d", "", "SpaceObject", 1, (_e select 0),

				_c, (_e select 1), (_e select 2), 30, 0, 0,

				(_e select 3), [ [1,1,1,1] ], [0,1],

				0, 0, "", "", "", random 360];

				_b = _b - 3;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Weapon FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = random 1;

	_c = round _c;

	_a = _a + (random _a);

	while { (_a > 0) } do
	{
		switch (_c) do
		{
			case 0 :
			{
				_d = [ 0.1 + random 0.5,
				       [ (random 5 - random 5), (random 5 - random 5), (random 5 - random 5) * 3],
				       0.5 + random 1,
				       [random 0.3, random 0.1]
				];
			};

			case 1 :
			{
				_d = [ 0.1 + random 0.5,
				       [ (random 7 - random 7), (random 7 - random 7), (random 7 - random 7) * 3],
					0.7 + random 1,
				       [random 0.5, random 0.1]
				];
			};
		};

		drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_d select 0),

		_b, (_d select 1), 0, (_d select 2), random 0.5, 0,

		(_d select 3), [ [1,1,1,-10] ], [1000], random 0.5, random 0.5, "", "", "", random 360];

		_a = _a - 1;
	};

	}
];