// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Synchronize
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (count _this == 0) then
{
	sleep 1;

	if (GL4_Synchronize select 0) then
	{
		hint "Error: Please synchronize a enemy A.I. group with the ""Group Link 4: System"" module once to initialize the ""Group Link 4: Static"" module.";
	}
	else
	{
		if (GL4_Synchronize select 1) then
		{
			hint "Error: Please synchronize a enemy A.I. group with the ""Group Link 4: System"" module once to initialize the ""Group Link 4: Custom"" module.";
		};
	};
};