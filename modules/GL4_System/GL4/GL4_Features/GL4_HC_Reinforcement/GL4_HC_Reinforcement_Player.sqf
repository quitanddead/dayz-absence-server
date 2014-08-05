// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement Player
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

_a = _this select 0;
_b = _this select 1;

switch (_a) do
{
	case 1 :
	{
		if (local _b) then
		{
			_c = _this select 2;

			call compile format _c;
		};
	};

	case 2 :
	{
		if (local _b) then
		{
			_c = _this select 2;

			[_b, _c] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Map.sqf");
		};
	};

	case 3 :
	{
		if (local _b) then
		{
			_c = _this select 2;

			[_c] call (GL4_Icon_F select 0);
		};
	};	

	case 4 :
	{
		if (local _b) then
		{
			GL4_HC_Reinforcement_Menu set [2, ["Command Map", [3], "", -5, [ ["expression", "[player, -1] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Map.sqf"") "] ], "1", "1"] ];

			GL4_HC_Reinforcement_Menu set [3, ["Status", [4], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Status.sqf"") "] ], "1", "1"] ];

			GL4_HC_Reinforcement_Menu set [4, ["Cancel", [5], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Cancel.sqf"") "] ], "1", "1"] ];
		};
	};
};