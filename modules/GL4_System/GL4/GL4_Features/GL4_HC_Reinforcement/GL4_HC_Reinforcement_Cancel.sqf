// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement Cancel
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

_a = _this select 0;

if (local _a) then
{
	GL4_HC_Reinforcement_Menu set [2, ["Command Map", [3], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Map.sqf"") "] ], "0", "0"] ];

	GL4_HC_Reinforcement_Menu set [3, ["Status", [4], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Status.sqf"") "] ], "0", "0"] ];

	GL4_HC_Reinforcement_Menu set [4, ["Cancel", [5], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Cancel.sqf"") "] ], "0", "0"] ];

	call compile format [" [playerSide, ""HQ""] sidechat""%1 reinforcement cancel confirmed. We will retreat the requested reinforcement."" ", name _a];

	onMapSingleClick "";
};

if (isMultiplayer) then
{
	GL4_HC_Reinforcement_Server_PublicVariable = [4, _a]; publicVariable "GL4_HC_Reinforcement_Server_PublicVariable";
};

if (isServer) then
{
	GL4_HC_Reinforcement set [4, False];

	deleteMarker GL4_HC_Reinforcement_Marker;

	GL4_HC_Reinforcement_Marker = nil;

	sleep 5;

	[ (GL4_HC_Reinforcement select 2) ] call (GL4_Remount_F select 0);

	GL4_HC_Reinforcement set [2, [] ];

	GL4_HC_Reinforcement set [5, True];
};