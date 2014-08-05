// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Recruit
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;
_b = _this select 2;

_c = group _a;

[_a] join grpNull;

if (isMultiplayer) then
{
	GL4_Recruit_Server_PublicVariable = [1, _a, _c]; publicVariable "GL4_Recruit_Server_PublicVariable";
}
else
{
	[1, _a, _c] execVM (GL4_Path+"GL4\GL4_Features\GL4_Recruit\GL4_Recruit_Server.sqf");
};