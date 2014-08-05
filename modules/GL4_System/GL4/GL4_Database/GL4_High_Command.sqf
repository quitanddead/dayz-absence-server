// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_High_Command = [

	// #0
	False,
	3,
	50000,
	True,

	// #4
	False,
	3,
	50000,
	True,

	// #8
	False,
	3,
	"Sh_85_HE",
	5,
	50,
	240,
	True
];

if (GL4_Path == "\GL4_System\") then
{
	call compile preprocessFile "\UserConfig\GL4\GL4_High_Command.sqf";
};