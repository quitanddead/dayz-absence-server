// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Local Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Local = [

	[True, True],

	True,
	200,
	[ True, True, 50 ],

	True,
	True,
	200,
	50,

	30,
	300,

	35,
	2,
	1.5,
	1,
	10,
	-2,
	2,

	35,
	6,

	0.5,
	0.7,
	[ [0.1,0,0,1], [0.1,0,0,1], [0.1,0,0,1], [0.1,0,0,1] ],

	// #22
	True,

	// #23
	True,
	True,
	50,
	True,
	50,
	50,
	5,

	// #30
	True,
	1,
	50,
	True,
	75,
	True,

	// #36
	True,
	1,
	50,
	75,
	75,
	75,
	True,

	// #43
	True,
	1,
	50,
	35,

	// #47
	True,
	viewDistance,
	1,

	50,
	[0,1,2,3,4,5,6,7],

	75,
	[8,9,10,11,12,13,14],

	35,
	[8,9,10,11,12,13,14,15,16,17,18,19,20,21],

	True,
	35,
	75,
	75,
	50,
	50,
	50,
	75,
	True,
	35,

	// #66
	True,
	viewdistance,
	75,
	35,
	50,

	// #71
	True,
	True,
	True,
	True,

	// #75
	True,
	15,

	// #77
	True,
	True,
	True,

	// #80
	True,
	True,

	// #82
	True,
	50,

	// #84
	True,
	50,

	// #86
	True,

	// #87
	True
];

if (GL4_Path == "\GL4_System\") then
{
	call compile preprocessFile "\UserConfig\GL4\GL4_Local.sqf";
};