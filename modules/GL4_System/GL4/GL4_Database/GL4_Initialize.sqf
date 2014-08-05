// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Initialize Functions
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b"];

_a = _this select 0;

if (isServer) then
{
	[_a] spawn
	{
		waitUntil { ( !(isNil "GL4_Defend") || (time > 1) ) };

		if (isNil "GL4_Defend") then
		{
			if (isNil "dg1") then
			{
				GL4_Defend = [ [] ];

				GL4_Synchronize set [0, True];
			}
			else
			{
				call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Defend.sqf");
			};
		};
	};

	[_a] spawn
	{
		waitUntil { ( !(isNil "GL4_Static") || (time > 1) ) };

		if (isNil "GL4_Static") then
		{
			if (isNil "sg1") then
			{
				GL4_Static = [ [] ];

				GL4_Synchronize set [1, True];
			}
			else
			{
				call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Static.sqf");
			};
		};
	};

	[_a] spawn
	{
		waitUntil { ( !(isNil "GL4_Reinforcement") || (time > 1) ) };

		if (isNil "GL4_Reinforcement") then
		{
			if (isNil "cg1") then
			{
				GL4_Reinforcement = [ [], [], [], True ];

				GL4_Synchronize set [2, True];
			}
			else
			{
				call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Custom.sqf");
			};
		};
	};

	GL4_Groups = [ [] ];

	GL4_System = [ False, time, objNull, objNull, "Logic" createVehicleLocal [0,0,0], "Logic" createVehicleLocal [0,0,0], time + 50, [], [], [], True, [] ];

	GL4_Artillery = [ [], True ];

	GL4_Airstrike = [ [], True ];

	GL4_House_Search = [ [], [] ];

	GL4_Advancing = [ [], True, 0 ];

	GL4_Suppressed = [ [], time, 0, time ];

	GL4_Body_Detect = [ [], [] ];

	GL4_Detection = [ [] ];

	GL4_Extraction = [ [], [], [], "Logic" createVehicleLocal [0,0,0] ];

	GL4_Killed = [ [] ];

	GL4_Idle = [ [], [], [], [] ];

	GL4_Garrison = [ [] ];

	GL4_Static_Weapon = [ [], [] ];

	GL4_Car_Weapon = [ [], [] ];

	GL4_Patrol = [ [] ];

	waitUntil { !(isNil "GL4_Reinforcement") };

	call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Initialize.sqf");

	if (GL4_Reinforcement select 3) then
	{
 		GL4_Synchronize set [0, True];

		GL4_Synchronize set [1, True];

		GL4_Synchronize set [2, True];
	};

	call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Groups.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Debug_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Marker_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Weapon_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Advancing_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Airstrike_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Artillery_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Body_Detect_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Body_Remove_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Vehicle_Mount_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Car_Weapon_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Detection_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Extraction_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Garrison_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Helicopter_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_House_Search_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Idle_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Patrol_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Reinforcement_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Remount_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Static_Weapon_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Suppressed_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Unmount_F.sqf");

	waitUntil { ( (GL4_Synchronize select 0) && (GL4_Synchronize select 1) && (GL4_Synchronize select 2) ) };

	if (count (GL4_Defend select 0) > 0) then
	{
		_b = (GL4_Defend select 0);

		GL4_Static set [0, (GL4_Static select 0) + _b];
	};

	[] execVM (GL4_Path+"GL4\GL4_System\GL4_Time.sqf");

	[3] execVM (GL4_Path+"GL4\GL4_System\GL4_Monitor.sqf");

	[] execVM (GL4_Path+"GL4\GL4_Features\GL4_Body_Detect\GL4_Body_Detect.sqf");

	[] execVM (GL4_Path+"GL4\GL4_Features\GL4_Body_Remove\GL4_Body_Remove.sqf");

	[] execVM (GL4_Path+"GL4\GL4_Features\GL4_Garrison\GL4_Garrison.sqf");

	[] execVM (GL4_Path+"GL4\GL4_Features\GL4_Idle\GL4_Idle.sqf");

	[] execVM (GL4_Path+"GL4\GL4_Features\GL4_Patrol\GL4_Patrol.sqf");

	[] execVM (GL4_Path+"GL4\GL4_Features\GL4_Static_Weapon\GL4_Static_Weapon.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Twice.sqf");

	[] spawn (GL4_Debug_F select 0);

	[] spawn (GL4_Marker_F select 0);

	[] execVM (GL4_Path+"GL4\GroupLink4.sqf");
};