// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// FX Public Variable
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;

switch (_a) do
{
	case 1 :
	{
		if (GL4_Local select 1) then
		{
			_b = _this select 1;
			_c = _this select 2;

			_b say _c;
		};
	};

	case 2 :
	{
		if (GL4_Local select 4) then
		{
			_b = _this select 1;

			_b call (GL4_Blood_FX_F select 0);
		};
	};

	case 3 :
	{
		if (GL4_Local select 23) then
		{
			_b = _this select 1;
			_c = _this select 2;

			[_b, _c] spawn (GL4_Sound_FX_F select 3);
		};
	};

	case 4 :
	{
		if (GL4_Local select 42) then
		{
			_b = _this select 1;
			_c = _this select 2;

			[_b, _c] call (GL4_Impact_FX_F select 0);
		};
	};

	case 5 :
	{
		_b = _this select 1;

		if (_b isKindOf "Man") then
		{
			if (GL4_Local select 74) then
			{
				[_b] spawn (GL4_Fire_FX_F select 2);
			};
		}
		else
		{
			_c = _this select 2;

			if (GL4_Local select 47) then
			{
				[_b, _c] call (GL4_Explosion_FX_F select 0);
			};

			if (GL4_Local select 66) then
			{
				[_b, _c] spawn (GL4_Wrack_FX_F select 0);
			};

			if (GL4_Local select 74) then
			{
 				[_b] spawn (GL4_Burning_FX_F select 0);
			};
		};
	};

	case 6 :
	{
		if (GL4_Local select 73) then
		{
			_b = _this select 1;
			_c = _this select 2;

			[_b, _c] call (GL4_House_FX_F select 0);
		};
	};

	case 7 :
	{
		if (GL4_Local select 80) then
		{
			_b = _this select 1;

			[_b] call (GL4_Artillery_FX_F select 0);
		};
	};

	case 8 :
	{
		if (GL4_Local select 87) then
		{
			_b = _this select 1;

			[_b] call (GL4_Debug_F select 1);
		};
	};
};