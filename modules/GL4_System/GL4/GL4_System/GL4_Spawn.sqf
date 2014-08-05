// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Spawn
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b"];

_a = (_this select 0);

switch (_a) do
{
	case 1 :
	{
		publicVariable "GL4_Core";
	};

	case 2 :
	{
		waitUntil { (GL4_Initialize select 1) };

		if (typeName (GL4_Initialize select 0) == "Array") then
		{
			_b = (GL4_Initialize select 0);

			if (count (_b select 1) > 0) then
			{
				waitUntil { (GL4_Initialize select 2) };
			};

			publicVariable "GL4_Initialize";

			if (count (GL4_Recruit select 0) > 0) then
			{
				[] spawn
				{
					GL4_Recruit_Player_PublicVariable = [1, (GL4_Recruit select 0) ]; publicVariable "GL4_Recruit_Player_PublicVariable";
				};
			};
		};
	};
};