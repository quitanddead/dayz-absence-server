// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Explosion FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Explosion_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	if (GL4_Local select 47) then
	{
		if (player distance _a < (GL4_Local select 48) ) then
		{
			_c = (sizeOf typeOf _a);

			_c = round _c;

			if ( (floor (_b select 1) < (GL4_Local select 50) ) || (_c in (GL4_Local select 51) ) ) then
			{
				if (GL4_Local select 23) then
				{
					[_a] spawn (GL4_Sound_FX_F select 2);
				};

				if (GL4_Local select 56) then
				{
					[_a] call (GL4_Explosion_FX_F select 1);
				};

				if (floor (_b select 2) < (GL4_Local select 61) ) then
				{
					[_a, 1] spawn (GL4_Explosion_FX_F select 7);
				};

				if (floor (_b select 3) < (GL4_Local select 62) ) then
				{
					[_a, 1] spawn (GL4_Explosion_FX_F select 8);
				};

				if (floor (_b select 4) < (GL4_Local select 63) ) then
				{
					[_a, 1] spawn (GL4_Explosion_FX_F select 9);

					[_a, 1] spawn (GL4_Explosion_FX_F select 10);

					[_a] spawn (GL4_Explosion_FX_F select 13);
				};
			}
			else
			{
				if ( (floor (_b select 2) < (GL4_Local select 52) ) && (_c in (GL4_Local select 53) ) ) then
				{
					if (GL4_Local select 23) then
					{
						[_a] spawn (GL4_Sound_FX_F select 2);
					};

					if (GL4_Local select 56) then
					{
						[_a] call (GL4_Explosion_FX_F select 1);
					};

					if (floor (_b select 3) < (GL4_Local select 58) ) then
					{
						[_a] call (GL4_Explosion_FX_F select 3);

						[_a] call (GL4_Explosion_FX_F select 4);
					};

					if (floor (_b select 4) < (GL4_Local select 60) ) then
					{
						[_a, 1] call (GL4_Explosion_FX_F select 6);
					};

					if (floor (_b select 5) < (GL4_Local select 61) ) then
					{
						[_a, 2] spawn (GL4_Explosion_FX_F select 7);
					};

					if (floor (_b select 6) < (GL4_Local select 62) ) then
					{
						[_a, 2] spawn (GL4_Explosion_FX_F select 8);
					};

					if (floor (_b select 7) < (GL4_Local select 63) ) then
					{
						[_a, 2] spawn (GL4_Explosion_FX_F select 9);

						[_a, 2] spawn (GL4_Explosion_FX_F select 10);

						[_a] spawn (GL4_Explosion_FX_F select 13);
					};

				}
				else
				{
					if ( (floor (_b select 3) < (GL4_Local select 54) ) || (_c in (GL4_Local select 55) ) ) then
					{
						if (GL4_Local select 23) then
						{
							[_a] spawn (GL4_Sound_FX_F select 2);
						};

						[_a, 1] spawn (GL4_Explosion_FX_F select 7);

						[_a, 1] spawn (GL4_Explosion_FX_F select 8);

						if (GL4_Local select 56) then
						{
							[_a] call (GL4_Explosion_FX_F select 1);
						};

						if (floor (_b select 4) < (GL4_Local select 57) ) then
						{
							[_a] call (GL4_Explosion_FX_F select 2);
						};

						if (floor (_b select 5) < (GL4_Local select 58) ) then
						{
							[_a] call (GL4_Explosion_FX_F select 3);

							[_a] call (GL4_Explosion_FX_F select 4);
						};

						if (GL4_Local select 23) then
						{
							[_a] spawn (GL4_Sound_FX_F select 2);
						};

						[_a] call (GL4_Explosion_FX_F select 1);

						[_a] call (GL4_Explosion_FX_F select 5);

						[_a, 2] spawn (GL4_Explosion_FX_F select 9);

						if (floor (_b select 6) < (GL4_Local select 60) ) then
						{
							[_a, 1] call (GL4_Explosion_FX_F select 6);
						}
						else
						{
							[_a, 2] call (GL4_Explosion_FX_F select 6);
						};

						if (floor (_b select 7) < (GL4_Local select 61) ) then
						{
							[_a, 2] spawn (GL4_Explosion_FX_F select 7);
						};

						if (floor (_b select 8) < (GL4_Local select 62) ) then
						{
							[_a, 2] spawn (GL4_Explosion_FX_F select 8);
						};

						if (floor (_b select 9) < (GL4_Local select 63) ) then
						{
							[_a, 2] spawn (GL4_Explosion_FX_F select 9);

							[_a, 2] spawn (GL4_Explosion_FX_F select 10);

							[_a] spawn (GL4_Explosion_FX_F select 13);
						};
					};
				};
			};

			if (GL4_Local select 64) then
			{
				[_a] spawn (GL4_Explosion_FX_F select 11);
			};

			if (floor (_b select 11) < (GL4_Local select 65) ) then
			{
				[_a] spawn (GL4_Explosion_FX_F select 12);
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Flash
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = (sizeOf typeOf _a);

	_c = _b * 3;

	_d = 0;

	while { (_d < _c) } do
	{
		_e = [ 0.1 + random 0.3,
		       [0,0,0],
		       [_b, _b + _b, _b]
		];

		drop [ ["\ca\Data\ParticleEffects\Universal\Universal", 16, 2, 32, 0], "", "Billboard", 1, (_e select 0),

		"destructionEffect1", (_e select 1), 0, 1, 1, 0,

		(_e select 2), [ [1,1,1,-1],[1,1,1,-3],[1,1,1,-1] ], [_b / 5 - random 5],

		1, 1, "", "", _a, random 360];

		_d = _d + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Shock Wave
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	if (getPos _a select 2 < 5) then
	{
		_b = (sizeOf typeOf _a);

		_c = [ 5 / 7,
		       5 * 10,
		       [7 / 3],
		       [ [1,1,1,-0.5],[1,1,1,-0.3],[1,1,1,-0] ]
		];

		_d = 0;

		while { (_d < 360) } do
		{
			drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, (_c select 0),

			[0, 0, (getPos _a select 2) -2], [ (_c select 1) * sin _d, (_c select 1) * cos _d, 0], 0, 1.3, 1, 0,

			(_c select 2), (_c select 3), [0,1],

			0, 0, "", "", _a];

			_d = _d + 1;
		};
	};

	[_a] call (GL4_Shock_FX_F select 0);

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Fire Flash
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	if !(surfaceIsWater getPos _a) then
	{
		_b = (sizeOf typeOf _a);

		_c = _b * 3;

		_d = 0;

		while { (_d < _c) } do
		{
			_e = [ 0.5 + random 0.5,
			       [ (random 1 - random 1), (random 1 - random 1), 5 + (random 10) ],
			       random 1
			];

			drop [ ["\ca\Data\ParticleEffects\Universal\Universal", 16, 0, random 15, 0], "", "Billboard", 1, (_e select 0),

			"destructionEffect1", (_e select 1), (_e select 2), 3, 1, 0,

			[_b / 3, _b / 2], [ [1,1,1,-3],[1,1,1,-2],[1,1,1,-1],[1,1,1,-0] ], [_b / 3, _b / 2],

			1, 1, "", "", _a, random 360];

			_d = _d + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Sparks
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = random 3;

	_b = round _b;

	_c = (sizeOf typeOf _a);

	_c = _c * 10;

	_c = _c + random _c;

	_c = _c / (GL4_Local select 49);

	_d = _c / 2;

	while { (_c > 0) } do
	{
		switch (_b) do
		{
			case 0 :
			{
				_e = [ 1 + random 1,
				       [ + (random 5 - random 5), + (random 5 - random 5), 5 + (random 5) * 3 ],
				       [ - (random 5 - random 5), - (random 5 - random 5), 5 + (random 5) * 3 ],
				       5 + random 5,
					0.5 + random 0.5,
				       [0.7 - random 0.7, random 0.1]
				];
			};

			case 1 :
			{
				_e = [ 1 + random 1,
				       [ + (random 5 - random 5), + (random 5 - random 5), 5 + (random 5) * 2 ],
				       [ - (random 5 - random 5), - (random 5 - random 5), 5 + (random 5) * 2 ],
				       5 + random 5,
					0.5 + random 0.5,
				       [0.7 - random 0.7, random 0.1]
				];
			};

			case 2 :
			{
				_e = [ 1 + random 1,
				       [ + (random 3 - random 3), + (random 3 - random 3), 5 + (random 5) * 3 ],
				       [ - (random 3 - random 3), - (random 3 - random 3), 5 + (random 5) * 3 ],
				       7 + random 7,
					0.5 + random 0.5,
				       [1 - random 1, random 0.1]
				];
			};

			case 3 :
			{
				_e = [ 1 + random 1,
				       [ + (random 3 - random 3), + (random 3 - random 3), 5 + (random 5) * 2 ],
				       [ - (random 3 - random 3), - (random 3 - random 3), 5 + (random 5) * 2 ],
				       7 + random 7,
					0.5 + random 0.5,
				       [1 - random 1, random 0.1]
				];
			};

			case 4 :
			{
				_e = [ 1 + random 1,
				       [ + (random 5 - random 5) * 3, + (random 5 - random 5) * 3, 5 + (random 5) * 2 ],
				       [ - (random 5 - random 5) * 3, - (random 5 - random 5) * 3, 5 + (random 5) * 2 ],
				       7 + random 7,
					0.5 + random 0.5,
				       [1 - random 1, random 0.1]
				];
			};
		};

		if (_c > _d) then
		{
			if (floor (random 100) < 35) then
			{
				_e set [1, [ + (random 5 - random 5) * 2, + (random 5 - random 5) * 2, 5 + (random 5) * 2 ] ];
			};

			drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_e select 0),

			"destructionEffect1", (_e select 1), 0, (_e select 3), (_e select 4), 0,

			(_e select 5), [ [1,1,1,-10],[1,1,1,-0] ], [1000], 0, 0, "", "", _a, random 360];
		}
		else
		{
			if (floor (random 100) < 35) then
			{
				_e set [2, [ - (random 5 - random 5) * 2, - (random 5 - random 5) * 2, 5 + (random 5) * 2 ] ];
			};

			drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_e select 0),

			"destructionEffect1", (_e select 2), 0, (_e select 3), (_e select 4), 0,

			(_e select 5), [ [1,1,1,-10],[1,1,1,-0] ], [1000], 0, 0, "", "", _a, random 360];
		};

		_c = _c - 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Debris
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = "";

	if (_a isKindOf "Car") then
	{
		if (floor (random 100) < 50) then
		{
			_b = "\Ca\Wheeled\Data\Damagewheel\Damagewheel_6.p3d";

			if (alive _a) then
			{
				_c = 1 + (random 1);
			}
			else
			{
				_c = 1 + (random 3);
			};
		}
		else
		{
			_b = "\Ca\Wheeled2\MTVR\Data\Wheel_1_1\Wheel_1_1.p3d";

			if (alive _a) then
			{
				_c = 1 + (random 1);
			}
			else
			{
				_c = 1 + (random 3);
			};
		};
	}
	else
	{
		if (_a isKindOf "Tank") then
		{
			_b = "\Ca\Wheeled\Data\Damagewheel\Damagewheel_6.p3d";

			if (alive _a) then
			{
				_c = 1 + (random 3);
			}
			else
			{
				_c = 3 + (random 3);
			};
		};
	};

	if (_b != "") then
	{
		_d = 0;

		while { (_d < _c) } do
		{
			_e = [ [ (random 5 - random 5) * 3, (random 5 - random 5) * 3, 10 + (random 10) ],
			       0.3 + random 0.3
			];

			drop [_b, "", "SpaceObject", 1, 7,

			"destructionEffect1", (_e select 0), (_e select 1), 30, 1, 0,

			[0.5], [ [1,1,1,1] ], [0,1],

			1, 1, "", "", _a];

			_d = _d + 1;
		};
	};

	if (_a isKindOf "Car") then
	{
		if (alive _a) then
		{
			_c = 1 + (random 1);
		}
		else
		{
			_c = 1 + (random 2);
		};

		_d = 0;

		while { (_d < _c) } do
		{
			_e = [ [ (random 5 - random 5) * 3, (random 5 - random 5) * 3, 10 + (random 10) ],
			       0.5 + random 0.5
			];

			drop ["\Ca\Misc\Svodidla.p3d", "", "SpaceObject", 1, 5,

			"destructionEffect1", (_e select 0), (_e select 1), 15, random 0.5, 0,

			[0.5 + random 0.5], [ [1,1,1,1] ], [0,1],

			0, 0, "", "", _a];

			_d = _d + 1;
		};
	}
	else
	{
		if (_a isKindOf "Air") then
		{
			if (alive _a) then
			{
				_c = 1 + (random 1);
			}
			else
			{
				_c = 1 + (random 2);
			};

			_d = 0;

			while { (_d < _c) } do
			{
				if (floor (random 100) < 75) then
				{
					_e = "\Ca\Air2\C130J\BottomSeat.p3d";
				}
				else
				{
					_e = "\Ca\Air2\C130J\TopSeet.p3d";
				};

				_f = [ [ (random 5 - random 5) * 2, (random 5 - random 5) * 2, 10 + (random 10) ],
				       0.5 + random 0.5,
				       [0.5 + random 0.5]
				];

				drop [_e, "", "SpaceObject", 1, 5,

				"destructionEffect1", (_f select 0), (_f select 1), 15, 1, 0,

				(_f select 2), [ [1,1,1,1] ], [0,1],

				1, 1, "", "", _a];

				_d = _d + 1;
			};
		};
	};

	if (alive _a) then
	{
		_c = 1 + (random 1);
	}
	else
	{
		_c = 1 + (random 5);
	};

	_d = 0;

	while { (_d < _c) } do
	{
		_e = [ [ (random 5 - random 5) * 3, (random 5 - random 5) * 3, 10 + (random 10) ],
			0.7 + random 1
		];

		drop ["\Ca\Air\vikhr.p3d", "", "SpaceObject", 1, 5,

		"destructionEffect1", (_e select 0), (_e select 1), 20, random 0.5, 0,

		[0.5 + random 0.5], [ [1,1,1,1] ], [0,1],

		0, 0, "", "", _a, random 360];

		_d = _d + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Debris FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (sizeOf typeOf _a);

	switch (_b) do
	{
		case 1 :
		{
			_d = (_c - random _c) / 2;
		};

		case 2 :
		{
			_d = (_c - random _c);
		};
	};

	_d = _d / (GL4_Local select 49);

	_e = 0;

	while { (_e < _d) } do
	{
		_f = [ [ (getPos _a select 0), (getPos _a select 1), (getPos _a select 2) + 2],
		       [ (random 5 - random 5) * 5, (random 5 - random 5) * 5, 15 + (random 10) ],
		       [ (random 5 - random 5) * 7, (random 5 - random 5) * 7, 10 + (random 10) ]
		];

		_g = "FxExploArmor4" createVehicleLocal (_f select 0);

		_g setVeloCity (_f select 1);

		[_g, _b] spawn (GL4_Debri_FX_F select 0);

		if (floor (random 100) < 50) then
		{
			_g = "FxExploArmor4" createVehicleLocal (_f select 0);

			_g setVeloCity (_f select 2);

			[_g, _b] spawn (GL4_Debri_FX_F select 0);
		};

		_e = _e + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #7
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Stones
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if !(surfaceIsWater getPos _a) then
	{
		_c = 30 + (random 30);

		_c = _c / (GL4_Local select 49);

		_d = 0;

		while { (_d < _c) } do
		{
			switch (_b) do
			{
				case 1 :
				{
					if (floor (random 100) < 50) then
					{
						_e = [ 5 + (random 5),
						       [ (random 7 - random 7), (random 7 - random 7), 5 + (random 7) ],
						       1 + random 1,
						       [0.1 + random 0.3]
						];
					}
					else
					{
						_e = [ 5 + (random 5),
						       [ (random 10 - random 10), (random 10 - random 10), 5 + (random 7) ],
						       1 + random 1,
						       [0.1 + random 0.3]
						];
					};
				};

				case 2 :
				{
					if (floor (random 100) < 50) then
					{
						_e = [ 5 + (random 5),
						       [ (random 10 - random 10), (random 10 - random 10), 10 + (random 10) ],
						       1 + random 1,
						       [0.1 + random 0.7]
						];
					}
					else
					{
						_e = [ 5 + (random 5),
						       [ (random 15 - random 15), (random 15 - random 15), 10 + (random 10) ],
						       1 + random 1,
						       [0.1 + random 0.7]
						];
					};
				};
			};

			drop ["\Ca\Data\ParticleEffects\Pstone\PStone.p3d", "", "SpaceObject", 1, (_e select 0),

			[0,0,-1], (_e select 1), (_e select 2), 30, 0, 0,

			(_e select 3), [ [1,1,1,1] ], [0,1],

			0, 0, "", "", _a, random 360];

			_d = _d + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #8
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Leaves
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if !(surfaceIsWater getPos _a) then
	{
		_c = 30 + (random 30);

		_c = _c / (GL4_Local select 49);

		_d = 0;

		while { (_d < _c) } do
		{
			switch (_b) do
			{
				case 1 :
				{
					if (floor (random 100) < 50) then
					{
						_e = [ 30 + (random 30),
						       [ (random 5 - random 5), (random 5 - random 5), (random 3 - random 1) ],
						       0.5 + random 0.5,
						       1.2 + random 0.1,
						       0.9 + random 0.1,
						       [3 + random 1]
						];
					}
					else
					{
						_e = [ 30 + (random 30),
						       [ (random 7 - random 7), (random 7 - random 7), (random 3 - random 1) ],
						       0.5 + random 0.5,
						       1.2 + random 0.1,
						       0.9 + random 0.1,
						       [3 + random 1]
						];
					};
				};

				case 2 :
				{
					if (floor (random 100) < 50) then
					{
						_e = [ 30 + (random 30),
						       [ (random 7 - random 7), (random 7 - random 7), (random 5 - random 3) ],
						       0.5 + random 0.5,
						       1.2 + random 0.1,
						       0.9 + random 0.1,
						       [3 + random 1]
						];
					}
					else
					{
						_e = [ 30 + (random 30),
						       [ (random 10 - random 10), (random 10 - random 10), (random 5 - random 3) ],
						       0.5 + random 0.5,
						       1.2 + random 0.1,
						       0.9 + random 0.1,
						       [3 + random 1]
						];
					};
				};
			};

			drop ["\Ca\Data\ParticleEffects\Hit_Leaves\Leaves.p3d", "", "SpaceObject", 1, (_e select 0),

			[0,0,-1], (_e select 1), (_e select 2), (_e select 3), (_e select 4), 0,

			(_e select 5), [ [1,1,1,1] ], [0,1],

			1, 1, "", "", _a];

			_d = _d + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #9
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Mud
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if ( !(surfaceIsWater getPos _a) && !(isOnRoad _a) ) then
	{
		_c = (sizeOf typeOf _a);

		_d = 15 * _c + (random _c);

		_d = _d / (GL4_Local select 49);

		while { (_d > 0) } do
		{
			switch (_b) do
			{
				case 1 :
				{

					_e = [ 1 + random 3,
					       [ (random 5 - random 5), (random 5 - random 5), 3 + (random 3) ],
					       3 + random 2,
					       [5 - random _c, 5 + random _c],
					       [ [0.1,0.1,0.1,1],[0.1,0.1,0.1,0.5],[0.1,0.1,0.1,0] ]
					];
				};

				case 2 :
				{
					_e = [ 1 + random 3,
					       [ (random 3 - random 3), (random 3 - random 3), 3 + (random 7) ],
					       3 + random 2,
					       [5 - random _c, 5 + random _c],
					       [ [0.1,0.1,0.1,1],[0.1,0.1,0.1,0.5],[0.1,0.1,0.1,0] ]
					];
				};
			};

			if (floor (random 100) < 35) then
			{
				_e set [4, [ [0.3,0.3,0.3,1],[0.3,0.3,0.3,0.5],[0.3,0.3,0.3,0] ] ];
			};

			drop [ ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 9, 0], "", "Billboard", 1, (_e select 0),

			[0,0,-1], (_e select 1), 0, (_e select 2), 1, 0,

			(_e select 3), (_e select 4), [1000], 0.5, 0.5, "", "", _a, random 360];

			_d = _d - 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #10
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Mud
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if ( !(surfaceIsWater getPos _a) && !(isOnRoad _a) ) then
	{
		_c = (sizeOf typeOf _a);

		_c = _c + random _c;

		_c = _c / (GL4_Local select 49);

		while { (_c > 0) } do
		{
			_d = [ 2 - (random 1),
			       [ (random 5 - random 10), (random 5 - random 10), 7 + (random 7) ],
			       1 + random 1,
			       [0.1 + random 0.7]
			];

			drop [ ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 9, 0], "", "Billboard", 0.05, (_d select 0),

			[0,0,0], (_d select 1), (_d select 2), 30, 0, 0,

			(_d select 3), [ [1,1,1,1] ], [1000],

			1, 1, (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Dirt_Trail_FX_F.sqf"), "", _a, random 360];

			_c = _c - 3;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #11
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Dust Wave
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if !(surfaceIsWater getPos _a) then
	{
		_b = [ [0.345,0.3,0.168], [0.345,0.29,0.168], [0.4,0.3,0.2], [0.2,0.2,0.1] ] call GL4_Random_Select_F;

		if (floor (random 100) < 50) then
		{
			_c = [_b + [-0.1], _b + [-0.1], _b + [- random 0.5], _b + [-0.05] ];

			_d = 0;

			while { (_d < 361) } do
			{
				_e = 0;

				while { (_e < 2) } do
				{
					_f = [ 7.5,
					       [sin _d * 1, cos _d * 1, -2.0 + random 0.5 - random 1.5],
					       [ (random 7 - random 7), (random 7 - random 7), (random 2 - random 2) ],
					       [10 - random 2, 10 - random 4, 8]
					];

					drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, (_f select 0),

					(_f select 1), (_f select 2), 1, 2, 1.55, 0.10,

					(_f select 3), _c, [0,1,0], 0.6, 0.3, "", "", _a, random 360];

					_e = _e + 1;
				};

				_d = _d + 3;

				sleep 0.01;
			};
		}
		else
		{
			_c = [_b + [-0.1], _b + [-0.1], _b + [- random 0.5], _b + [-0.05] ];

			_d = 0;

			while { (_d < 361) } do
			{
				_e = 0;

				while { (_e < 2) } do
				{
					_f = [ 7.5,
					       [sin _d * 1, cos _d * 1, -2.0 + random 0.5 - random 1.5],
					       [ (random 7 - random 7), (random 7 - random 7), (random 2 - random 2) ],
					       [7 - random 4, 7 - random 4, 1]
					];

					drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 8, 0], "", "Billboard", 1, (_f select 0),

					(_f select 1), (_f select 2), 1, 2, 1.55, 0.10,

					(_f select 3), _c, [0,1,0], 0.6, 0.3, "", "", _a, random 360];

					_e = _e + 1;
				};

				_d = _d + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #12
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Fuel Smoke
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if !(surfaceIsWater getPos _a) then
	{
		_b = (sizeOf typeOf _a);

		_c = _b * 5;

		_c = _c / (GL4_Local select 49);

		while { ( (_c > 0) && (fuel _a > 0) ) } do
		{
			_d = [ _b * fuel _a * 2,
			     [ + (random 3 - random 3), + (random 3 - random 3), 0]
			];

			_a setFuel (fuel _a - 0.01);

			_e = (_d select 0);

			_f = 0;

			while { (_f < _e) } do
			{
				_g = [ 5 + random 5,
				       [ + (random 1 - random 1), + (random 1 - random 1), 2 + random 3],
				       [2 + random 2, 7 + random 7]
				];

				if (floor (random 100) < 50) then
				{
					_d set [1, [ - (random 3 - random 3), - (random 3 - random 3), 0] ];

					_g set [1, [ - (random 1 - random 1), - (random 1 - random 1), 2 + random 3] ];
				};

				drop [ ["\ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 7, 48], "", "Billboard", 1, (_g select 0),

				(_d select 1), (_g select 1), 1, 1.275, 1, 0,

				(_g select 2), [ [-1,-1,-1,0.5],[-1,-1,-1,1],[-1,-1,-1,0.5],[-1,-1,-1,0.3],[-1,-1,-1,0.1] ], [0,1], 0.1, 0.1, "", "", _a, random 360];

				_f = _f + 1;

				sleep 0.01;
			};

			sleep random 0.5;

			_c = _c - 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Explosion FX Function #13
	// ////////////////////////////////////////////////////////////////////////////
	// Explosion Shrad
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	while { (getPos _a select 2 > 3) } do
	{
		sleep 1;
	};

	if !(surfaceIsWater getPos _a) then
	{
		GL4_Explosion_FX set [1, 3 + (random 5) ];

		_b = (sizeOf typeOf _a);

		_c = _b + (random _b);

		while { (_c > 0) } do
		{
			if (floor (random 100) < 50) then
			{
				_d = [ [ ( (random 10) - (random 10) ), ( (random 10) - (random 10) ), 10 + (random 10) ],
				       [ [1,1,1,1] ],
				       (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Shard_FX_F.sqf")
				];
			}
			else
			{
				_d = [ [ ( (random 10) - (random 10) ) * 3, ( (random 10) - (random 10) ) * 3, 10 + (random 10) ],
				       [ [1,1,1,1] ],
				       (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Shard_FX_F.sqf")
				];
			};

			drop ["\Ca\Data\ParticleEffects\Shard\Shard.p3d", "", "SpaceObject", 1, 7,

			[0, 0, 0], (_d select 0), 0.5, 15, 1, 0.5,

			[1], (_d select 1), [1], random 0.5, random 1, (_d select 2), "", _a, 360];

			_c = _c - 1;
		};
	};

	}
];