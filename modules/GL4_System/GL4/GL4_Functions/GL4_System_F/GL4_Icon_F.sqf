// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Icon Function
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	

GL4_Icon_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Icon Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Icon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = (vehicle leader _a);

	if (_b isKindOf "Man") then
	{
		switch (side _b) do
		{
			case EAST :
			{
				_c = "o_inf";
			};

			case WEST :
			{
				_c = "b_inf";
			};

			case RESISTANCE :
			{
				_c = "n_inf";
			};
		};
	};

	if (_b isKindOf "Car") then
	{
		switch (side _b) do
		{
			case EAST :
			{
				_c = "o_motor_inf";
			};

			case WEST :
			{
				_c = "b_motor_inf";
			};

			case RESISTANCE :
			{
				_c = "n_motor_inf";
			};
		};
	};

	if (_b isKindOf "Tank") then
	{
		switch (side _b) do
		{
			case EAST :
			{
				_c = "o_armor";
			};

			case WEST :
			{
				_c = "b_armor";
			};

			case RESISTANCE :
			{
				_c = "n_armor";
			};
		};
	};

	if (_b isKindOf "Air") then
	{
		switch (side _b) do
		{
			case EAST :
			{
				_c = "o_air";
			};

			case WEST :
			{
				_c = "b_air";
			};

			case RESISTANCE :
			{
				_c = "n_air";
			};
		};
	};

	if (_b isKindOf "Plane") then
	{
		switch (side _b) do
		{
			case EAST :
			{
				_c = "o_plane";
			};

			case WEST :
			{
				_c = "b_plane";
			};

			case RESISTANCE :
			{
				_c = "n_plane";
			};
		};
	};

	if (_b isKindOf "StaticCannon") then
	{
		switch (side _b) do
		{
			case EAST :
			{
				_c = "o_art";
			};

			case WEST :
			{
				_c = "b_art";
			};

			case RESISTANCE :
			{
				_c = "n_art";
			};
		};
	};

	if (isNil "_c") then
	{
		_c = "b_empty";

		switch (side _b) do
		{
			case EAST :
			{
				_c = "o_empty";
			};

			case WEST :
			{
				_c = "b_empty";
			};

			case RESISTANCE :
			{
				_c = "n_empty";
			};
		};
	};

	if (typeName _a == "Group") then
	{
		_d = _a addGroupIcon [_c];

		_a setGroupIcon [_d, _c];

		_a setGroupIconParams [ [0,0,1,1], format ["%1", _a], 0.7, True];

		setGroupIconsVisible [True, True];

		setGroupIconsSelectable True;

		GL4_Icon = 0;

		onGroupIconOverEnter 
		{
			if (visibleMap) then
			{
				if (GL4_Icon == 0) then
				{
					GL4_Icon = time + 0.20;
				};

				if (time > GL4_Icon) then
				{
					_this call (GL4_Icon_F select 1);

					uiNameSpace setVariable ["_e", findDisplay 12];
				};
			};
		};

		onGroupIconOverLeave 
		{
			GL4_Icon = 0;

			[] spawn
			{
				sleep 0.01;

				( (uiNameSpace getVariable "_e") displayCtrl 1124) ctrlSetPosition [0,0,0,0];
				( (uiNameSpace getVariable "_e") displayCtrl 1124) ctrlCommit 0;
				( (uiNameSpace getVariable "_e") displayCtrl 1125) ctrlSetPosition [0,0,0,0];
				( (uiNameSpace getVariable "_e") displayCtrl 1125) ctrlCommit 0;
			};
		};

		[_a, _d] spawn (GL4_Icon_F select 3);
	};

	_c

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Icon Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Icon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	disableSerialization;

	_a = _this select 1;
	_b = _this select 3;
	_c = _this select 4;

	_d = (vehicle leader _a);

	if (alive _d) then
	{
		_e = [_d] call (GL4_Icon_F select 2);

		_f = (findDisplay 12) displayCtrl 1124;

		_f ctrlsetposition [_b, _c, 0.30, 0.25];

		_f ctrlcommit 0;

		_g = (findDisplay 12) displayCtrl 1125;

		_g ctrlSetStructuredText _e;

		_g ctrlsetposition [_b, _c, 0.30, 0.25];

		_g ctrlCommit 0;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Icon Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Icon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;

	_b = [_a] call (GL4_Icon_F select 0);

	_c = getText (configFile >> "cfgGroupIcons" >> _b >> "Icon");

	_d = "";

	{if (alive _x) then {_d = _d + "I"}} forEach units _a;

	if (_a isKindOf "Air") then
	{
		_e = 	format ["<t size='0.8'>Fly High: %1</t><br/>", round (getPos _a select 2) ]
	}
	else
	{
		if (_a isKindOf "StaticCannon") then
		{
			_f = [_a] call (GL4_Icon_F select 4);

			_e = format ["<t size='0.8'>Armour: %1</t><br/>", _f];
		}
		else
		{
			_e = format ["<t size='0.8'>Speed: %1</t><br/>", round (speed _a) ]
		};
	};

	_g = parseText
	(
		format ["<t size='1.5' color='#0000ff' shadow='0'><img image='%1'/></t>", _c] +
		format ["<t size='1.0' color='#ffffff' font='Zeppelin33'> %1</t><br/>", group _a] +
		format ["<t size='0.8' color='#ffffff' >%1 %2</t><br/>", rank _a, name _a] +
		format ["<t size='0.8' >Units: %1</t><br/>", _d] +
		format ["<t size='0.8' >Distance: %1</t><br/>", round (_a distance player) ] +
		_e +
		format ["<t size='0.8' >Behaviour: %1</t><br/>", behaviour _a] +
		format ["<t size='0.8' >Combat Mode: %1</t><br/>", combatMode _a]
	);

	_g

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Icon Function #3
	// ////////////////////////////////////////////////////////////////////////////
	// Icon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;
	_b = _this select 1;

	while { ({alive _x} count (units _a) > 0) } do
	{
		sleep 1;
	};

	_a removeGroupIcon _b;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Icon Function #4
	// ////////////////////////////////////////////////////////////////////////////
	// Icon
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d"];

	_a = _this select 0;

	_b = getDammage _a;

	_c = 1;

	_d = "";

	while { (_c > _b) } do
	{
		_d = _d + "I";

		_c = _c - 0.1;
	};

	_d

	}
];