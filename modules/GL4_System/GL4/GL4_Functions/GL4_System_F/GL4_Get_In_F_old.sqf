// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Get In Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Get_In_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Get In Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Get In
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	if (GL4_Global select 67) then
	{
		_b = synchronizedObjects _a;

		if (count _b > 0) then
		{
			_c = 0;

			while { (_c < count _b) } do
			{
				_d = (_b select _c);

				if ( { (_d isKindOf _x) } count (GL4_Resource select 44) > 0) exitWith
				{
					[_a, _d] call (GL4_Get_In_F select 1);
				};

				_c = _c + 1;
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Get In Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Get In
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = [ True, True, True, True, True, True ];

	_d = [];

	{if (_x isKindOf "Man") then {_d = _d + [_x]} } forEach units _a;

	_e = -3;

	while { ( (count _d > 0) && (_e <= count units _a) ) } do
	{
		if (_c select 0) then
		{
			(_d select 0) moveInDriver _b;

			if ( (_d select 0) in _b) then
			{
				_c set [0, False];

				_d = _d - [ (_d select 0) ];
			}
			else
			{
				_c set [0, False];
			};
		}
		else
		{
			if (_c select 1) then
			{
				(_d select 0) moveInGunner _b;

				if ( (_d select 0) in _b) then
				{
					_c set [1, False];

					_d = _d - [ (_d select 0) ];
				}
				else
				{
					_c set [1, False];
				};
			}
			else
			{
				if (_c select 2) then
				{
					(_d select 0) moveInCommander _b;

					if ( (_d select 0) in _b) then
					{
						_c set [2, False];

						_d = _d - [ (_d select 0) ];
					}
					else
					{
						_c set [2, False];
					};
				}
				else
				{
					if (_c select 3) then
					{
						(_d select 0) moveInTurret [_b, [0] ];

						if ( (_d select 0) in _b) then
						{
							_c set [3, False];

							_d = _d - [ (_d select 0) ];
						}
						else
						{
							_c set [3, False];
						};
					}
					else
					{
						if (_c select 4) then
						{
							(_d select 0) moveInTurret [_b, [1] ];

							if ( (_d select 0) in _b) then
							{
								_c set [4, False];

								_d = _d - [ (_d select 0) ];
							}
							else
							{
								_c set [4, False];
							};
						}
						else
						{
							if (_c select 5) then
							{
								(_d select 0) moveInCargo _b;

								if ( (_d select 0) in _b) then
								{
									_d = _d - [ (_d select 0) ];
								}
								else
								{
									_c set [5, False];

									if (count _d > 0) then
									{
										(_d select 0) setPos (getPos _b);

										[_d, _b] call (GL4_Get_In_F select 2);
									};
								};
							};
						};
					};
				};
			};
		};

		_e = _e + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Get In Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Get In
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = nearestObjects [ (_a select 0), (GL4_Resource select 44), 20];

	_c = _c - [_b];

	if (count _c > 0) then
	{
		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);
			
			if ( !(locked _e) && (canMove _e) && (count (crew _e) == 0) ) exitWith
			{
				[_a, _e] call (GL4_Get_In_F select 3);
			};

			_d = _d + 1;
		};
	};

	[_a] call (GL4_Get_In_F select 4);

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Get In Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Get In
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;
	_b = _this select 1;

	_c = [ True, True, True, True, True ];

	_d = _a;

	_e = -3;

	while { ( (count _d > 0) && (_e <= count _a) ) } do
	{
		if (_c select 0) then
		{
			(_d select 0) moveInDriver _b;

			if ( (_d select 0) in _b) then
			{
				_c set [0, False];

				_d = _d - [ (_d select 0) ];
			}
			else
			{
				_c set [0, False];
			};
		}
		else
		{
			if (_c select 1) then
			{
				(_d select 0) moveInGunner _b;

				if ( (_d select 0) in _b) then
				{
					_c set [1, False];

					_d = _d - [ (_d select 0) ];
				}
				else
				{
					_c set [1, False];
				};
			}
			else
			{
				if (_c select 2) then
				{
					(_d select 0) moveInCommander _b;

					if ( (_d select 0) in _b) then
					{
						_c set [2, False];

						_d = _d - [ (_d select 0) ];
					}
					else
					{
						_c set [2, False];
					};
				}
				else
				{
					if (_c select 3) then
					{
						(_d select 0) moveInTurret [_b, [0] ];

						if ( (_d select 0) in _b) then
						{
							_c set [3, False];

							_d = _d - [ (_d select 0) ];
						}
						else
						{
							_c set [3, False];
						};
					}
					else
					{
						if (_c select 4) then
						{
							(_d select 0) moveInTurret [_b, [1] ];

							if ( (_d select 0) in _b) then
							{
								_c set [4, False];

								_d = _d - [ (_d select 0) ];
							}
							else
							{
								_c set [4, False];
							};
						}
						else
						{
							(_d select 0) moveInCargo _b;

							if ( (_d select 0) in _b) then
							{
								_d = _d - [ (_d select 0) ];
							};
						};
					};
				};
			};
		};

		_e = _e + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Get In Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Get In
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	_b = (vehicle leader (_a select 0) );

	_c = [];

	_d = 0;

	while { (_d < count _a) } do
	{
		_e = (_a select _d);

		_f = (vehicle _e);

		if (_f isKindOf "Man") then
		{
			_c = _c + [_e];
		};

		_d = _d + 1;
	};

	if (count _c > 0) then
	{
		hint format ["Get In Error:\n%1 had not enough available cargo for %2 units of %3.\nPlease resize the group %3 or choose a vehicle with more available cargo.", typeOf _b, count _c, group _b];
	};

	}
];