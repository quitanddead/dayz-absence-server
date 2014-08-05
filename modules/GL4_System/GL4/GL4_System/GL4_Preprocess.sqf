// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Preprocess
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	
private ["_a","_b","_c","_d","_e"];

call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Core.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Local.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Global.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_High_Command.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Resource.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Extension_F.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_EH_F\GL4_EH_Fired_F.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_EH_F\GL4_EH_Hit_F.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_EH_F\GL4_EH_Killed_F.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Icon_F.sqf");

GL4_Player_Id = objNull;

GL4_Group_Id = grpNull;

GL4_Player = [ [], [], [] ];

if (isServer) then
{
	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Get_In_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Spawn_F.sqf");

	_a = allGroups;

	_b = 0;

	while { (_b < count _a) } do
	{
		_c = (_a select _b);

		_d = (vehicle leader _c);

		if (_d isKindOf "Man") then
		{
			[_d] call (GL4_Get_In_F select 0);
		};

		_b = _b + 1;
	};
};

if (isDedicated) then
{
	GL4_Core set [4, False];

	"GL4_Player_PublicVariable" addPublicVariableEventHandler { (_this select 1) call compile preprocessFile (GL4_Path+"GL4\GL4_Player\GL4_Initialize.sqf") };

	"GL4_System_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_System\GL4_Spawn.sqf") };

	[] spawn
	{
		waitUntil { (alive GL4_Player_Id) };

		[GL4_Player_Id] call compile preprocessFile (GL4_Path+"GL4\GL4_Player\GL4_Initialize.sqf");

		GL4_Initialize set [1, True];

		[1] execVM (GL4_Path+"GL4\GL4_System\GL4_Monitor.sqf");

		[GL4_Player_Id] execVM (GL4_Path+"GL4\GL4_Player\GL4_TeamSwitch.sqf");
	};
}
else
{
	[] spawn
	{
		waitUntil { (player == player) };

		if (player == player) then
		{
			GL4_Player_Id = player; publicVariable "GL4_Player_Id";

			GL4_Group_ID = group player; publicVariable "GL4_Group_Id";

			[GL4_Player_Id] call compile preprocessFile (GL4_Path+"GL4\GL4_Player\GL4_Initialize.sqf");

			GL4_Player_PublicVariable = [player]; publicVariable "GL4_Player_PublicVariable";

			GL4_Initialize set [1, True];

			[1] execVM (GL4_Path+"GL4\GL4_System\GL4_Monitor.sqf");

			[GL4_Player_Id] execVM (GL4_Path+"GL4\GL4_Player\GL4_TeamSwitch.sqf");

			if (GL4_High_Command select 0) then
			{
				[player] execVM (GL4_Path+"GL4\GL4_System\GL4_HC_Reinforcement.sqf");
			};

			if (GL4_High_Command select 4) then
			{
				[player] execVM (GL4_Path+"GL4\GL4_System\GL4_HC_Helicopter.sqf");
			};

			if (GL4_High_Command select 8) then
			{
				[player] execVM (GL4_Path+"GL4\GL4_System\GL4_HC_Artillery.sqf");
			};

			if (GL4_Local select 86) then
			{
				if (player == leader player) then
				{
					GL4_HC_Force_Move = [ [], [], [] ];

					_e = (units player);

					_e = _e - [player];

					GL4_HC_Force_Move set [0, _e];

					call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_HC_Force_Move_F.sqf");

					[player] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move_Assign.sqf");
				};
			};
		};
	};
};

call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_EH_Assign.sqf");