// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery Cancel
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

_a = _this select 0;

if (local _a) then
{
	GL4_HC_Artillery_Menu set [2, ["Cancel", [3], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Cancel.sqf"") "] ], "0", "0"] ];

	call compile format [" [playerSide, ""HQ""] sidechat""%1 artillery cancel confirmed. We will stop the requested artillery support."" ", name _a];
};

if (isMultiplayer) then
{
	GL4_HC_Artillery_Server_PublicVariable = [3, _a]; publicVariable "GL4_HC_Artillery_Server_PublicVariable";
};

if (isServer) then
{
	GL4_HC_Artillery set [5, False];

	deleteMarker GL4_HC_Artillery_Marker;

	GL4_HC_Artillery_Marker = nil;
};