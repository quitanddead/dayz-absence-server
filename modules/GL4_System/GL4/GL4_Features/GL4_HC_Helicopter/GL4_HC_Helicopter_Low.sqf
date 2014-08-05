// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter Low
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g","_h"];

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
			_g = (getPos _f select 2) - 30;

			if (_g > 0) then
			{
				_h = format ["Rodger %1. We will decrease the flight high by %2 meters.", name _a, round _g];
			}
			else
			{
				_g = (getPos _f select 2);

				_h = format ["Rodger %1. Sorry we are unable to decrease the flight high any more.", name _a];
			};

			_e flyInHeight _g;

			_e groupChat _h;
		};

		_d = _d + 1;
	};
};