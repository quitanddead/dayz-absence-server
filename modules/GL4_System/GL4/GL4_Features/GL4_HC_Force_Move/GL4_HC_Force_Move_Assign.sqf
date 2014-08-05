// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Force Move Assign
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
	call compile preprocessFile "\Ca\Modules\Functions\Misc\fn_commsMenuCreate.sqf";

	GL4_HC_Force_Move_Menu = [

		["H.C. Force Move", False],
		["Position ( Leader )", [2], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move.sqf"") "] ], "1", "1"],
		["Position ( Map - Click )", [3], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move_Position.sqf"") "] ], "1", "1"] 
	];

	[BIS_MENU_GroupCommunication, ["H.C. Force Move", [0], "#User:GL4_HC_Force_Move_Menu", -5, [ ["expression", ""] ], "1", "1"] ] call GL4_Array_Push_F;

	[BIS_MENU_GroupCommunication, ["", [], "", -1, [], "0", "0"] ] call GL4_Array_Push_F;
};
