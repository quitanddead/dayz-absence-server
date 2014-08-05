// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Body Detect
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

sleep 5 + (random 5);

while { (GL4_Global select 30) } do
{
	if (count (GL4_Groups select 0) > 0) then
	{
		_a = (GL4_Groups select 0);

		if (count _a > 0) then
		{
			if (count (GL4_Killed select 0) > 0) then
			{
				[_a] call (GL4_Body_Detect_F select 0);
			};
		};
	};

	sleep 30 + (random 60);
};