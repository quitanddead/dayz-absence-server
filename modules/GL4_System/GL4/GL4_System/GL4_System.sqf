// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// System
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	
private ["_a","_b","_c","_d","_e","_f"];
	
_a = _this select 0;
_b = _this select 1;

_c = [ [], [], [] ];

if ( { (isPlayer _x) } count (units _b) > 0) then
{
	if (captive _b) then
	{
		_b setCaptive False;

		_c set [2, (_c select 2) + [_b] ];
	};

	_d = 0;

	while { (_d < count _a) } do
	{
		_e = (_a select _d);

		_f = (vehicle _e);

		if (captive _f) then
		{
			_f setCaptive False;

			_c set [2, (_c select 2) + [_f] ];
		};

		if ( (side _f != CIVILIAN) && !(side _f in (_c select 0) ) && !(side _f in (_c select 1) ) ) then
		{
			if (side _f getFriend side _b < 0.6) then
			{
				_c set [0, (_c select 0) + [side _f] ];
			}
			else
			{
				_c set [1, (_c select 1) + [side _f] ];
			};
		};

		_d = _d + 1;
	};
};

if (count (_c select 2) > 0) then
{
	{_x setCaptive True} forEach (_c select 2);
};

_c