// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// AddOns Initialize
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

_a = _this select 0;

switch (_a) do
{
	case 0 :
	{
		GL4_Reloading = [ [], [] ];
	};

	case 1 :
	{
		GL4_Blood = [ [], [], True, True, 180];

		GL4_Bleeding = [ [], True, True, True ];

		GL4_Texture_F = compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Blood\GL4_Texture.sqf");

		_a = 0;

		{_a = _a + _x; GL4_Blood set [1, (GL4_Blood select 1) + [_a] ]} foreach [0.05, 0.225, 0.325, 0.4];
	};

	case 3 :
	{
		GL4_Sound_FX = [

			[],
			[],

			call {private ["_a","_b","_c"];

			_a = [];

			_b = 0;

			while { (_b < 20) } do
			{
				_c = "Logic" createVehicleLocal [0,0,0];

				_a = _a + [_c];

				_b = _b + 1;
			};

			_a

			},

			[]
		];

		[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Ambient\GL4_Church.sqf");

		[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Ambient\GL4_Lighthouse.sqf");
	};

	case 4 :
	{
		GL4_Weapon_FX = [ "Logic" createVehicleLocal [0,0,0] ];
	};

	case 5 :
	{
		GL4_Shell_FX = [ "Logic" createVehicleLocal [0,0,0] ];
	};

	case 7 :
	{
		GL4_Explosion_FX = [ "Logic" createVehicleLocal [0,0,0], 0, [] ];

		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Debri_FX_F.sqf");

		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Shock_FX_F.sqf");
	};

	case 8 :
	{
		if (isNil "GL4_Fire_FX_F") then
		{
			call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Fire_FX_F.sqf");
		};
	};

	case 9 :
	{
		GL4_Burning_FX = [ [] ];

		if (isNil "GL4_Fire_FX_F") then
		{
			call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Fire_FX_F.sqf");
		};
	};

	case 10 :
	{
		if (isNil "GL4_Fire_FX_F") then
		{
			call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_FX_F\GL4_Fire_FX_F.sqf");
		};
	};

	case 12 :
	{
		GL4_Artillery_FX = [ "Logic" createVehicleLocal [0,0,0] ];
	};
};