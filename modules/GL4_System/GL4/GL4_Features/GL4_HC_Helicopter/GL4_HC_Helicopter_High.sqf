// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter High
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
			_g = (getPos _f select 2) + 30;

			if (_a in _f) then
			{
				if (isEngineOn _f) then
				{
					_f doMove [ (getPos _f select 0), (getPos _f select 1), _g];

					_f flyInHeight _g;
				}
				else
				{
					_f engineOn True;

					_f doMove [ (getPos _f select 0), (getPos _f select 1), _g];

					_f flyInHeight _g;
				};
			}
			else
			{
				if (isEngineOn _f) then
				{
					_f flyInHeight _g;
				}
				else
				{
					_f engineOn True;

					_f flyInHeight _g;
				};
			};

			_h = format ["Rodger %1. We will increase the flight high by %2 meters.", name _a, round _g];

			_f groupChat _h;
		};

		_d = _d + 1;
	};
};