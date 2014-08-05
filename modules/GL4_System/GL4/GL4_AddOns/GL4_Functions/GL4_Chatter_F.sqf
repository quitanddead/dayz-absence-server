// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Chatter Function
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Chatter_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = 0;

	while { (_b < count units _a) } do
	{
		_c = (units _a select _b);

		_c setVariable ["GL4_Radio", False];

		_d = "Logic" createVehicleLocal (getPos _c);

		_d attachTo [_c, [0,0,0], "Head_Axis"];

		[_c, _d] spawn (GL4_Chatter_F select 2);

		_b = _b + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	if (count _b > 0) then
	{
		switch (_a) do
		{
			case 1 :
			{
				_c = 0;

				while { (_c < count _b) } do
				{
					_d = (_b select _c);

					if !(_d getVariable "GL4_Radio") then
					{
						_e = (vehicle _d);

						if (_e isKindOf "Man") then
						{
							_d setVariable ["GL4_Radio", True, True];
						}
						else
						{
							hint format ["%1 you are not allowed to use the ""H.Q. Radio"" feature while %2 is in a vehicles.", name player, name _d];
						};
					};

					_c = _c + 1;
				};
			};

			case 2 :
			{
				_c = 0;

				while { (_c < count _b) } do
				{
					_d = (_b select _c);

					if (_d getVariable "GL4_Radio") then
					{
						_d setVariable ["GL4_Radio", False, True];
					};

					_c = _c + 1;
				};
			};
		};
	}
	else
	{
		hint format ["%1 please use the F - Keys to select units which should use the ""H.Q. Radio"" feature.", name player];
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	_c = getNumber (configFile >> "CfgVehicles" >> (typeOf _a) >> "side");

	while { (True) } do
	{
		sleep 10;

		if ( (_a getVariable "GL4_Radio") && (GL4_Chatter select 1) ) then
		{
			switch (_c) do
			{
				case 0 :
				{
					_d = (GL4_Resource select 41) call GL4_Random_Select_F;

					0 fadeSound (GL4_Chatter select 2);

					_b say _d;

					sleep 30 - (random 30);
				};

				case 1 :
				{

					_d = (GL4_Resource select 40) call GL4_Random_Select_F;

					0 fadeSound (GL4_Chatter select 2);

					_b say _d;

					sleep 30 - (random 30);
				};

				case 2 :
				{
					_d = (GL4_Resource select 41) call GL4_Random_Select_F;

					0 fadeSound (GL4_Chatter select 2);

					_b say _d;

					sleep 30 - (random 30);
				};
			};
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = (vehicle _a);

	_c = ["West_Air_v56a","West_Air_v57a","West_Air_v58a","West_Air_v59a","West_Air_v60a","West_Air_v61a","West_Air_v62a","West_Air_v63a","West_Air_v64a","West_Air_v65a","West_Air_v66a","West_Air_v67a","West_Air_v68a","West_Air_v69a","West_Air_v70a","West_Air_v71a","West_Air_v72a","West_Air_v73a","West_Air_v74a","West_Air_v75a","West_Air_v76a","West_Air_v77a","West_Air_v78a","West_Air_v79a","West_Air_v80a","West_Air_v81a","West_Air_v82a","West_Air_v83a"];

	_d = [4.76, 3.4, 2.12, 2.56, 4.76, 1.5, 4.84, 2.16, 2.48, 4.4, 5.56, 2.36, 1.92, 2.72, 3.48, 5.56, 2.72, 2.92, 1.92, 2.24, 5.36, 4.36, 5.32, 4.48, 4.32, 5.12, 3.76, 10.96];

	_e = 0;

	while { ( (_b isKindOf "Air") && (isEngineOn _b) && (_e < count _c) && (GL4_Chatter select 1) ) } do
	{
		_f = (_c select _e);

		0 fadeSound (GL4_Chatter select 2);

		playSound _f;

		_g = (_d select _e);

		sleep _g;

		_b = (vehicle _a);

		_e = _e + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = (vehicle _a);

	_c = ["West_Air_v84a","West_Air_v85a","West_Air_v86a","West_Air_v87a","West_Air_v88a","West_Air_v89a","West_Air_v90a","West_Air_v91a","West_Air_v92a","West_Air_v93a","West_Air_v94a","West_Air_v95a","West_Air_v96a"];

	_d = [2.24, 5.6, 11.3, 2.6, 2.12, 1.5, 2.84, 4.56, 3.72, 4.8, 3.84, 5.2, 3.2];

	_e = 0;

	while { ( (_b isKindOf "Air") && (isEngineOn _b) && (_e < count _c) && (GL4_Chatter select 1) ) } do
	{
		_f = (_c select _e);

		0 fadeSound (GL4_Chatter select 2);

		playSound _f;

		_g = (_d select _e);

		sleep _g;

		_b = (vehicle _a);

		_e = _e + 1;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #5
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 1;

	_b = (vehicle player);

	if ( (_a == (GL4_Chatter select 3) ) && ( (GL4_Chatter select 0) != 10) ) exitWith
	{
		GL4_Chatter set [0, (GL4_Chatter select 0) + 1];

		if ( (GL4_Chatter select 0) >= 10) then
		{
			GL4_Chatter set [0, 10];
		};

		[_b, (GL4_Chatter select 0) ] call (GL4_Chatter_F select 6);
	};

	if ( (_a == (GL4_Chatter select 4) ) && ( (GL4_Chatter select 0) != 0) ) exitWith
	{
		GL4_Chatter set [0, (GL4_Chatter select 0) - 1];

		if ( (GL4_Chatter select 0) <= 0) then
		{
			GL4_Chatter set [0, 0];
		};

		[_b, (GL4_Chatter select 0) ] call (GL4_Chatter_F select 6);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #6
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;
	_b = _this select 1;

	switch (_b) do
	{
		case 0 :
		{
			_b = "Off";

			GL4_Chatter set [1, False];
		};

		case 1 :
		{
			_b = "|";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.1];
		};

		case 2 :
		{
			_b = "||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.2];
		};

		case 3 :
		{
			_b = "|||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.3];
		};

		case 4 :
		{
			_b = "||||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.4];
		};

		case 5 :
		{
			_b = "|||||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.5];
		};

		case 6 :
		{
			_b = "||||||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.6];
		};

		case 7 :
		{
			_b = "|||||||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.7];
		};

		case 8 :
		{
			_b = "||||||||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.8];
		};

		case 9 :
		{
			_b = "|||||||||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 0.9];
		};

		case 10 :
		{
			_b = "||||||||||";

			GL4_Chatter set [1, True];

			GL4_Chatter set [2, 1];
		};

		default
		{
			_b = "Off";

			GL4_Chatter set [1, False];
		};
	};

	if (_a isKindOf "Man") then
	{
		_c = 0;

		while { (_c < count units _a) } do
		{
			_d = (units _a select _c);

			if (_d getVariable "GL4_Radio") exitWith
			{
				hint format ["H.Q. Chatter: %1", _b];
			};

			_c = _c + 1;
		};
	}
	else
	{
		hint format ["Radio Chatter: %1", _b];
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Chatter Function #7
	// ////////////////////////////////////////////////////////////////////////////
	// Chatter
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a"];

	_a = _this select 0;

	switch (_a) do
	{
		case 0.0 :
		{
			_a = "Off";

			GL4_Chatter set [1, False];
		};

		case 0.1 :
		{
			_a = "|";

			GL4_Chatter set [0, 1];

			GL4_Chatter set [2, 0.1];
		};

		case 0.2 :
		{
			_a = "||";

			GL4_Chatter set [0, 2];

			GL4_Chatter set [2, 0.2];
		};

		case 0.3 :
		{
			_a = "|||";

			GL4_Chatter set [0, 3];

			GL4_Chatter set [2, 0.3];
		};

		case 0.4 :
		{
			_a = "||||";

			GL4_Chatter set [0, 4];

			GL4_Chatter set [2, 0.4];
		};

		case 0.5 :
		{
			_a = "|||||";

			GL4_Chatter set [0, 5];

			GL4_Chatter set [2, 0.5];
		};

		case 0.6 :
		{
			_a = "||||||";

			GL4_Chatter set [0, 6];

			GL4_Chatter set [2, 0.6];
		};

		case 0.7 :
		{
			_a = "|||||||";

			GL4_Chatter set [0, 7];

			GL4_Chatter set [2, 0.7];
		};

		case 0.8 :
		{
			_a = "||||||||";

			GL4_Chatter set [0, 8];

			GL4_Chatter set [2, 0.8];
		};

		case 0.9 :
		{
			_a = "|||||||||";

			GL4_Chatter set [0, 9];

			GL4_Chatter set [2, 0.9];
		};

		case 1 :
		{
			_a = "||||||||||";

			GL4_Chatter set [0, 10];

			GL4_Chatter set [2, 1];
		};

		default
		{
			_a = "Off";

			GL4_Chatter set [1, False];
		};
	};

	[_a] spawn
	{
		hint "Radio Chatter: On";

		sleep 3;

		hintSilent format ["Radio Chatter: %1", (_this select 0) ];
	};

	}
];					