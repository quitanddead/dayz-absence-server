// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Special FX
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = _this select 0;

_b = time + 1;

waitUntil { (time > _b) };

["Special FX", 1] execVM (GL4_Path+"GL4\GL4_System\GL4_Display.sqf");

if (_a isKindOf "Logic") then
{
	if (isNil "GL4_Initialize") then
	{
		hint "Error: The ""Group Link 4: System"" module is required to initialize the ""Group Link 4: Special FX"" module.";
	}
	else
	{
		if (isServer) then
		{
			GL4_Dubbing = [ [] ];

			_c = allGroups;

			_d = 0;

			while { (_d < count _c) } do
			{
				_e = (_c select _d);

				GL4_Dubbing set [0, (GL4_Dubbing select 0) + [_e] ];

				_d = _d + 1;
			};

			if (count (GL4_Dubbing select 0) > 0) then
			{
				[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Dubbing\GL4_Dubbing.sqf");
			};
		}
		else
		{
			GL4_AddOn_PublicVariable_CompileExecVM = compile preprocessFile (GL4_Path+"GL4\GL4_Addons\GL4_AddOn_PublicVariable.sqf");

			"GL4_AddOn_PublicVariable" addPublicVariableEventHandler { (_this select 1) call GL4_AddOn_PublicVariable_CompileExecVM };
		};

		call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_AddOns.sqf");
	};
}
else
{
	if (isServer) then
	{
		GL4_Dubbing = [ [] ];

		_c = allGroups;

		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			GL4_Dubbing set [0, (GL4_Dubbing select 0) + [_e] ];

			_d = _d + 1;
		};

		if (count (GL4_Dubbing select 0) > 0) then
		{
			[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Dubbing\GL4_Dubbing.sqf");
		};
	}
	else
	{
		GL4_AddOn_PublicVariable_CompileExecVM = compile preprocessFile (GL4_Path+"GL4\GL4_Addons\GL4_AddOn_PublicVariable.sqf");

		"GL4_AddOn_PublicVariable" addPublicVariableEventHandler { (_this select 1) call GL4_AddOn_PublicVariable_CompileExecVM };
	};

	call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_AddOns.sqf");
};

["Special FX", 2] execVM (GL4_Path+"GL4\GL4_System\GL4_Display.sqf");