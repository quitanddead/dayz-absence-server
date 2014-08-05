// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Weapon
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = (configFile  >> "CfgWeapons");

_b = 1;

while { (_b < count _a) } do
{
	_c = (_a select _b);

	_d = (configName _c);

	if ( (_d != "close") && (_d != "short") && (_d != "medium") && (_d != "far") ) then
	{
		_e = getNumber (_a >> _d >> "fireLightDuration");

		if (_e == 0) then
		{
			GL4_Global set [35, (GL4_Global select 35) + [_d] ];
		};
	};

	_b = _b + 1;
};