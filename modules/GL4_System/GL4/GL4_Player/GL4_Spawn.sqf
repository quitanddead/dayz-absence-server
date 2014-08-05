// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Spawn
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a"];

_a = _this select 0;

while { (True) } do
{
	sleep 1;

	if (alive player) exitWith
	{
		GL4_Player_PublicVariable = [player]; publicVariable "GL4_Player_PublicVariable";

		[player] call compile preprocessFile (GL4_Path+"GL4\GL4_Player\GL4_Initialize.sqf");

		if (player == leader player) then
		{
			if (GL4_Local select 1) then
			{
				[player] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Reloading\GL4_Reloading.sqf");
			};
		};
	};
};