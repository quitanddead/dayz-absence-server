// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Chatter Assign
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

_a = _this select 0;

while { (count (units _a) == 1) } do
{
	sleep 1;
};

if (alive _a) then
{
	[_a] call (GL4_Chatter_F select 0);

	call compile preprocessFile "\Ca\Modules\Functions\Misc\fn_commsMenuCreate.sqf";

	GL4_HQ_Radio_Menu = [

		["H.Q. Radio", False],
		["On", [2], "", -5, [ ["expression", " [1, (groupSelectedUnits player) ] call (GL4_Chatter_F select 1) "] ], "1", "1"],
		["Off", [3], "", -5, [ ["expression", " [2, (groupSelectedUnits player) ] call (GL4_Chatter_F select 1) "] ], "1", "1"]
	];

	if (isNil "GL4_Array_Push_F") then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Extension_F.sqf");
	};

	[BIS_MENU_GroupCommunication, ["", [], "", -1, [], "0", "0"] ] call GL4_Array_Push_F;

	[BIS_MENU_GroupCommunication, ["H.Q. Radio", [0], "#User:GL4_HQ_Radio_Menu", -5, [ ["expression", ""] ], "1", "1"] ] call GL4_Array_Push_F;
};