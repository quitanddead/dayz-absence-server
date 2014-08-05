// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Force Position
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;
_b = _this select 1;

if (count _b > 0) then
{
	_b = _b;
}
else
{
	_b = (GL4_HC_Force_Move select 1);
};

if (count _b > 0) then
{
	if (count (GL4_HC_Force_Move select 1) > 0) then
	{
		GL4_HC_Force_Move set [1, (GL4_HC_Force_Move select 1) + _b];
	}
	else
	{
		GL4_HC_Force_Move set [1, _b];
	};

	if (visibleMap) then
	{
		onMapSingleClick "[player, (GL4_HC_Force_Move select 1), _pos] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move.sqf""); True";
	}
	else
	{
		createDialog "RscMiniMap";

		onMapSingleClick "[player, (GL4_HC_Force_Move select 1), _pos] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move.sqf""); True";
	};

	_c = format ["Rodger %1 waiting for new map coordinates.", name _a];

	(_b select 0) sideChat _c;
}
else
{
	hint format ["%1 please use the F - Keys to select units which should use the ""Force Move"" feature.", name _a];
};