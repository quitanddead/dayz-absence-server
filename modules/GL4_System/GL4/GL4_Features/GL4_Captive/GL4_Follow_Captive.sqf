// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Captive
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g"];

_a = _this select 0;
_b = _this select 2;
_c = _this select 3;

if (alive _a) then
{
	if (player == _c) then
	{
		if (local _a) then
		{
			_a stop False;
		}
		else
		{
			GL4_Captive_Server_PublicVariable = [3, _a]; publicVariable "GL4_Captive_Server_PublicVariable";
		};

		_a removeAction _b;

		_d = [ "Okay lets go.",
		       "I'm right behind you.",
		       "Okay let's move."

		] call GL4_Random_Select_F;

		_a globalChat _d;

		_e = _a addAction [format ["%1 Stop", name _a], (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Stop_Captive.sqf"), _c];

		_f = (GL4_Captive select 1);

		_g = _f find _a;

		_g = _g + 1;

		(GL4_Captive select 1) set [_g, _e];
	}
	else
	{
		hint format ["%1 you are not allowed to order %2 to follow you. %2 is captive of %3.", name player, name _a, name _c];
	};
};
