// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Global Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Global = [

	True,
	3,
	10,
	0.30,
	0.10,
	[ ["COLUMN","LINE"], ["NORMAL","NORMAL","FULL","FULL"], ["SAFE","SAFE","AWARE","AWARE"], ["WHITE","WHITE","YELLOW","YELLOW"] ],
	[ ["COLUMN","LINE","WEDGE","VEE","FILE","DIAMOND"], ["NORMAL","NORMAL","FULL","FULL"], ["AWARE","AWARE","COMBAT","COMBAT"], ["YELLOW","YELLOW","RED","RED"] ],
	[ ["Man", 3000], ["Car", 7000], ["Tank", 10000], ["Air", 30000], ["Ship", 30000] ],
	5,

	// #9
	True,
	["SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"],
	50,
	"Sh_85_HE",

	// #13
	True,
	["SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"],
	50,
	"Sh_85_HE",

	// #17
	True,
	True,
	True,
	75,
	True,
	True,
	True,
	True,
	True,
	True,

	// #27
	True,
	True,
	True,
	True,
	True,

	// #32
	True,
	["SmokeShell","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","G_40mm_Smoke","G_40mm_SmokeRed","G_40mm_SmokeGreen","G_40mm_SmokeYellow"],
	100,
	["B_9x19_SD","B_556x45_Ball_SD","B_9x18_SD","B_545x39_SD"],
	["M203Muzzle","GP25Muzzle","G_30mm_HE","G_40mm_HE"],
	["Javelin","M136","SMAW","Stinger","Igla","MetisLauncher","RPG18","RPG7V","Strela"],
	15,
	50,
	300,
	600,

	// #42
	True,
	0.20,
	6,

	// #45
	True,
	0.10,
	0.20,
	[ [0.35, 0.15], [0.50, 0.35], [0.50, 0.35], [1], [1], [0.35, 0.15], [0.75, 0.25], [0.70], [1], [1] ],
	["RU_Soldier_Sniper",    ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
        "USMC_SoldierS_Sniper", ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ]
	],

	// #50
	True,
	0.1,
	0.3,
	[90,80,70,60,50,40,30],
	3,
	5,
	3,
	1,

	// #58
	True,
	15,
	5,

	// #61
	False,
	True,
	True,

	// #64
	True,
	["SERGEANT","LIEUTENANT","CAPTAIN","MAJOR","COLONEL"],

	// #66
	False,

	// #67
	True,

	// #68
	True,

	// #69
	["Man","Car","Tank","Air"]
];

if (isServer) then
{
	if (GL4_Path == "\GL4_System\") then
	{
		call compile preprocessFile "\UserConfig\GL4\GL4_Global.sqf";
	};
};