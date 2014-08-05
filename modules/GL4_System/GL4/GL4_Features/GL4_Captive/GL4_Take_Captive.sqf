// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Captive
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g"];

_a = _this select 0;
_b = _this select 2;

_c = player;

if (count (GL4_Captive select 0) <= (GL4_Global select 56) ) then
{
	GL4_Captive set [0, (GL4_Captive select 0) + [_a] ];

	_d = format ["%1 was taken captive.", name _a];

	if (isMultiplayer) then
	{
		GL4_Captive_Player_PublicVariable = [3, _a, _b, _c, _d]; publicVariable "GL4_Captive_Player_PublicVariable";

		_c groupChat _d;

		_a removeAction _b;
	}
	else
	{
		_c groupChat _d;

		_a removeAction _b;
	};

	_e = _a addAction [format ["%1 Interrogate", name _a], (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Interrogate_Captive.sqf"), _c];

	_f = _a addAction [format ["%1 Stop", name _a], (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Stop_Captive.sqf"), _c];

	_g = _a addAction [format ["%1 Release", name _a], (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Release_Captive.sqf"), _c];

	GL4_Captive set [1, (GL4_Captive select 1) + [_a, _f] ];

	if (local _a) then
	{
		[1, _a, _c] execVM (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Captive_Server.sqf");
	}
	else
	{
		GL4_Captive_Server_PublicVariable = [1, _a, _c]; publicVariable "GL4_Captive_Server_PublicVariable";
	};

	while { ( (alive _a) && (alive _c) && (captive _a) ) } do
	{
		sleep 1;
	};

	{_a removeAction _x} forEach [_e, _f, _g];

	[5, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Captive_Player.sqf");
}
else
{
	hint format ["%1 you are not allowed to take more captives.", name _c];
};