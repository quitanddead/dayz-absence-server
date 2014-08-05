// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Additional
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	
private ["_a","_b","_c","_d"];

if (isServer) then
{
	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Captive_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Simulate_F.sqf");

	GL4_Recruit = [ [] ];

	_a = allUnits;

	_b = 0;

	while { (_b < count _a) } do
	{
		_c = (_a select _b);

		if (side _c in _this) then
		{
			if (GL4_Global select 66) then
			{
				GL4_Player set [2, (GL4_Player select 2) + [_c] ];
			};

			GL4_Recruit set [0, (GL4_Recruit select 0) + [_c] ];
		}
		else
		{
			[_c] spawn (GL4_Captive_F select 0);
		};

		_b = _b + 1;
	};

	if (count (GL4_Recruit select 0) > 0) then
	{
		[] spawn
		{
			waitUntil { (GL4_Initialize select 2) };

			if (isMultiplayer) then
			{
				GL4_Recruit_Player_PublicVariable = [1, (GL4_Recruit select 0) ]; publicVariable "GL4_Recruit_Player_PublicVariable";
			}
			else
			{
				[1, (GL4_Recruit select 0) ] execVM (GL4_Path+"GL4\GL4_Features\GL4_Recruit\GL4_Recruit_Player.sqf");
			};
		};
	};
}
else
{
	"GL4_Captive_Player_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Captive_Player.sqf") };

	"GL4_Recruit_Player_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_Recruit\GL4_Recruit_Player.sqf") };
};

if (isDedicated) then
{
	"GL4_Captive_Server_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_Captive\GL4_Captive_Server.sqf") };

	"GL4_Recruit_Server_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_Recruit\GL4_Recruit_Server.sqf") };

	GL4_Initialize set [2, True];

	[2] execVM (GL4_Path+"GL4\GL4_System\GL4_Monitor.sqf");
}
else
{
	[] spawn
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Captive_F.sqf");

		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Simulate_F.sqf");

		GL4_Captive = [ [], [], [] ];

		GL4_Simulate = [ [] ];

		GL4_Initialize set [2, True];

		[2] execVM (GL4_Path+"GL4\GL4_System\GL4_Monitor.sqf");
	};
};