// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// First Aid
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

_a = _this select 0;
_b = _this select 2;

_a removeAction _b;

GL4_Bleeding set [1, False];

if (canStand _a) then
{
	_a playMove "AinvPknlMstpSlayWrflDnon_medic";
}
else
{
	_a playMove "AmovPpneMstpSrasWrflDnon_healed";
};

_c = 2 + random 1 * acctime;

"dynamicBlur" ppEffectAdjust [getDammage _a / 2];
"dynamicBlur" ppEffectCommit _c;

sleep _c;

GL4_Bleeding set [0, (GL4_Bleeding select 0) - [_a] ];