// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Dubbing
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

waitUntil { (GL4_Initialize select 1) };

sleep 5 + (random 10);

if (GL4_Local select 1) then
{
	_a = call compile preProcessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Dubbing\GL4_Dubbing_Select.sqf");

	while { (count (GL4_Dubbing select 0) > 0) } do
	{
		_b = (GL4_Dubbing select 0);

		_c = 0;

		while { (_c < count _b) } do
		{
			_d = (_b select _c);

			if ( { (alive _x) } count (units _d) > 1) then
			{
				_e = (vehicle leader _d);

				if ( { ( (_e isKindOf "Man") && (_e distance _x < (GL4_Local select 2) ) ) } count (GL4_Player select 0) > 0) then
				{
					if (floor (random 100) < _a) then
					{
						[_d] spawn (GL4_Dubbing_F select 0);
					};
				};
			};

			_c = _c + 1;
		};

		sleep 1;
	};
};