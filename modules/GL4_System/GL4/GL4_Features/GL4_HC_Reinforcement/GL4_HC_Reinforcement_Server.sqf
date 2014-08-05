// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement Server
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

_a = _this select 0;
_b = _this select 1;

if (isServer) then
{
	switch (_a) do
	{
		case 1 :
		{
			[_b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Request.sqf");
		};

		case 2 :
		{
			_c = _this select 2;

			[_b, _c] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Map.sqf");
		};

		case 3 :
		{
			[_b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Status.sqf");
		};

		case 4 :
		{
			[_b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Cancel.sqf");
		};
	};
};