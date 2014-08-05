// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter Land
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g"];

_a = player;

_b = _this select 1;

if (typeName _b == "Array") then
{
	if (count _b == 0) then
	{
		_c = (GL4_HC_Helicopter select 3);
	}
	else
	{
		_c = _b;
	};
}
else
{
	_b = (_this select 3);

	_c = [_b];
};

if (local _a) then
{
	_d = 0;

	while { (_d < count _c) } do
	{
		_e = (_c select _d);

		_f = (vehicle _e);

		if (_f isKindOf "Helicopter") then
		{
			if (_a in _f) then
			{
				_g = format ["Rodger %1. We will land at your requested position. Prepare for landing.", name _a];
			}
			else
			{
				_g = format ["Rodger %1. We will land within %2 meters to your position. Prepare for landing.", name _a, round (_a distance _f) ];
			};

			_f groupChat _g;

			_f land "LAND";
		};

		_d = _d + 1;
	};
};