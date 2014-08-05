// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Difficult Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Difficult_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Difficult Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Difficult
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f"];

	_a = _this select 0;

	if (GL4_Global select 45) then
	{
		_b = (GL4_Global select 46);
		_c = (GL4_Global select 47);

		_d = _b + (random _c);

		if (_d > 1) then
		{
			_d = 1;
		}
		else
		{
			if (_d < 0) then
			{
				_d = 0;
			};
		};

		_a setSkill _d;

		_e = 0;

		while { (_e < 10) } do
		{
			_d = [_e] call (GL4_Difficult_F select 1);

			switch (_e) do
			{
				case 0 :
				{
					_a setSkill ["aimingAccuracy", _d];
				};

				case 1 :
				{
					_a setSkill ["aimingShake", _d];
				};

				case 2 :
				{
					_a setSkill ["aimingSpeed", _d];
				};

				case 3 :
				{
					_a setSkill ["endurance", _d];
				};

				case 4 :
				{
					_a setSkill ["spotDistance", _d];
				};

				case 5 :
				{
					_a setSkill ["spotTime", _d];
				};

				case 6 :
				{
					_a setSkill ["courage", _d];
				};

				case 7 :
				{
					_a setSkill ["reloadSpeed", _d];
				};

				case 8 :
				{
					_a setSkill ["commanding", _d];
				};

				case 9 :
				{
					_a setSkill ["general", _d];
				};
			};

			_e = _e + 1;
		};

		_a allowFleeing 0;
	};

	_f = (GL4_Global select 49);

	if (typeOf _a in _f) then
	{
		[_a, _f, (typeOf _a) ] call (GL4_Difficult_F select 2);
	}
	else
	{
		if (rank _a in _f) then
		{
			[_a, _f, (rank _a) ] call (GL4_Difficult_F select 2);
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Difficult Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Difficult
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = (GL4_Global select 48 select _a);

	if (count _b > 1) then
	{
		_c = (_b select 0);
		_d = (_b select 1);

		_e = _c + (random _d);
	}
	else
	{
		_c = (_b select 0);

		_e = _c;
	};

	if (_e > 1) then
	{
		_e = 1;
	}
	else
	{
		if (_e < 0) then
		{
			_e = 0;
		};
	};

	_e

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Difficult Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Difficult
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	_d = [];

	_e = _b find _c;

	_e = _e + 1;

	_f = (_b select _e);

	_g = 0;

	while { (_g < count _f) } do
	{
		_d set [0, (_f select _g) ];

		_g = _g + 1;

		if (count (_f select _g) > 1) then
		{
			_d set [1, (_f select _g select 0) + random (_f select _g select 1) ];
		}
		else
		{
			_d set [1, (_f select _g select 0) ];
		};

		_g = _g + 1;

		if ( (_d select 1) > 1) then
		{
			_d set [1, 1];
		}
		else
		{
			if ( (_d select 1) < 0) then
			{
				_d set [1, 0];
			};
		};

		_a setSkill [ (_d select 0), (_d select 1) ];
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Difficult Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Difficult
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	if (GL4_Global select 50) then
	{
		_b = (GL4_Global select 51);
		_c = (GL4_Global select 52);

		if (_a != leader _a) then
		{
			_d = _b + (random _c);

			if (_d >= 1) then
			{
				_d = 0.9;
			}
			else
			{
				if (_d <= 0) then
				{
					_d = 0.1;
				};
			};

			_a allowFleeing _d;
		};
	};

	}
];