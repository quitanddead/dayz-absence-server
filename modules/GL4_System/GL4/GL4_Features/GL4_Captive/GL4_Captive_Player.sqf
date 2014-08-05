// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Captive
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;
_b = _this select 1;

switch (_a) do
{
	case 1 :
	{
		_c = _b addAction [format ["Take %1 Captive", name _b], (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Take_Captive.sqf") ];

		[_b] execVM (GL4_Path+"GL4\GL4_Player\GL4_Marker.sqf");

		if ( (_b knowsAbout player > 0) || (player knowsAbout _b > 0) ) then
		{
			call compile format ["player sideChat ""%1 is surrendering."" ", name _b];
		};

		while { ( (alive _b) && (captive _b) ) } do
		{
			sleep 1;
		};

		_b removeAction _c;
	};

	case 2 :
	{
		if (player in units _b) then
		{
			_c = _this select 2;

			call compile format _c;
		};
	};

	case 3 :
	{
		if (count _this > 4) then
		{
			_c = _this select 2;

			_b removeAction _c;

			_d = _this select 3;

			if (player in units _d) then
			{
				_e = _this select 4;

				_d groupChat _e;
			};
		}
		else
		{
			_c = _this select 2;

			if (player in units _c) then
			{
				_d = _this select 3;

				_c groupChat _d;
			};
		};
	};

	case 4 :
	{
		if ( (_b knowsAbout player > 0) || (player knowsAbout _b > 0) ) then
		{
			_c = _this select 2;

			_b globalChat _c;
		};
	};

	case 5 :
	{
		if (_b in (GL4_Captive select 0) ) then
		{
			_d = (GL4_Captive select 1);

			_e = _d find _b;

			_e = _e + 1;

			_f = (_d select _e);

			_b removeAction _f;

			GL4_Captive set [1, (GL4_Captive select 1) - [_b, _f] ];
		}
		else
		{
			_b removeAction 0;
		};
	};
};