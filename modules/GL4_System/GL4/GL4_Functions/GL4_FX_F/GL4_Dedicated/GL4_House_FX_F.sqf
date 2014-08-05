// ////////////////////////////////////////////////////////////////////////////
// House FX Dedicated
// ////////////////////////////////////////////////////////////////////////////
// House FX
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;

_b = 0;

while { (format ["%1", _a buildingPos _b] != "[0,0,0]") } do
{
	_b = _b + 1;
};

_b = _b - 1;

if (_b > 5) then
{
	_c = nearestObjects [_a, ["Logic"], 50];

	if (count _c <= 5) then
	{
		_d = [];

		_e = 0;

		while { (_e < _b) } do
		{
			_f = (_a buildingPos _e);

			if ( (floor (random 100) < 50) && ( (_f select 2) <= 7) ) then
			{
				_d = _d + [_f];
			};

			_e = _e + 1;
		};

		if (count _d > 0) then
		{
			if (isDedicated) then
			{
				GL4_AddOn_PublicVariable = [6, _a, _d]; publicVariable "GL4_AddOn_PublicVariable";
			}
			else
			{
				[_a, _d] call (GL4_House_FX_F select 0);
			};
		};
	};
};