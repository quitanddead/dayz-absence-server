// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Friendly
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;

_b = [ [], [], [] ];

_c = allGroups;

_d = 0;

while { (_d < count _c) } do
{
	_e = (_c select _d);

	_f = (vehicle leader _e);

	if (captive _f) then
	{
		_f setCaptive False;

		_b set [2, (_b select 2) + [_f] ];
	};

	if (side _a getFriend side _f < 0.6) then
	{
		_b set [1, (_b select 1) + [_e] ];
	}
	else
	{
		_b set [0, (_b select 0) + [_e] ];
	};

	_d = _d + 1;
};

if (count (_b select 2) > 0) then
{
	{_x setCaptive True} forEach (_b select 2);
};

_b = (_b select 0);

_b