// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter Status
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = player;

_b = (GL4_HC_Helicopter select 2);

if (local _a) then
{
	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		_e = (vehicle leader _d);

		if (alive _e) then
		{
			hint format ["Helicopter Group: %1\nHelicopter Distance: %2\nHelicopter High: %3\nHelicopter Crew: %4", _d, round (_e distance _a), round (getPos _e select 2), (count crew _e) ];

			sleep 5;
		};

		_c = _c + 1;
	};
};