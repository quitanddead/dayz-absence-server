// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Body Remove
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

sleep 5 + (random 5);

while { (GL4_Global select 68) } do
{
	if (count (GL4_Killed select 0) > 0) then
	{
		_a = (GL4_Killed select 0);

		[_a] call (GL4_Body_Remove_F select 0);

		if (count (GL4_Killed select 0) > 100) then
		{
			[_a] spawn (GL4_Body_Remove_F select 4);
		};
	};

	sleep 240 + (random 240);
};