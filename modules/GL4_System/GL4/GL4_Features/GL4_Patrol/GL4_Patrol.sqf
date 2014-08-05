// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Patrol
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = (GL4_Groups select 0);

if (count _a > 0) then
{
	_b = 0;

	while { (_b < count _a) } do
	{
		_c = (_a select _b);

		_d = (vehicle leader _c);

		_e = _d getVariable "GL4_Patrol";

		if (typeName _e != "String") then
		{
			GL4_Patrol set [0, (GL4_Patrol select 0) + [_c] ];

			if (typeName _e != "Array") then
			{
				_e = [_e];
			};

			[_c, _e] spawn (GL4_Patrol_F select 0);
		};

		_b = _b + 1;
	};
};