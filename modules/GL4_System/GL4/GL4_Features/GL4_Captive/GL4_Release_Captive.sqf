// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Captive
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

_a = _this select 0;
_b = _this select 2;
_c = _this select 3;

if (alive _a) then
{
	if (player == _c) then
	{
		if (isMultiplayer) then
		{
			_d = format ["%1 was released by %2.", name _a, name _c];

			GL4_Captive_Player_PublicVariable = [3, _a, _c, _d]; publicVariable "GL4_Captive_Player_PublicVariable";

			_c groupChat _d;
		}
		else
		{
			_c groupChat _d;
		};

		if (local _a) then
		{
			_a allowFleeing 1;

			[_a] spawn (GL4_Captive_F select 6);
		}
		else
		{
			GL4_Captive_Server_PublicVariable = [4, _a]; publicVariable "GL4_Captive_Server_PublicVariable";
		};
	}
	else
	{
		hint format ["%1 you are not allowed to release %2. %2 is captive of %3.", name player, name _a, name _c];
	};
};