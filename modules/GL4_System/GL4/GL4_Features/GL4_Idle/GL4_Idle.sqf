// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Idle
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

sleep 5 + (random 5);

while { (GL4_Global select 27) } do
{
	if (count (GL4_Static select 0) > 0) then
	{
		_a = (GL4_Static select 0);

		if (count _a > 0) then
		{
			[_a] call (GL4_Idle_F select 0);
		};
	};

	sleep 120 + (random 120);
};