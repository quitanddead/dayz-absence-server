// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.4
// ////////////////////////////////////////////////////////////////////////////
// Debug Functions
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Debug_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Debug Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Debug
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a"];

	if (GL4_Global select 61) then
	{
		hint "DEBUG Initializing...";

		sleep 2;

		while { (GL4_Global select 61) } do
		{
       		_a = [
				(GL4_Reinforcement select 0),
				(GL4_Reinforcement select 1),
				(GL4_Player select 1),
				(GL4_System select 2),
				(GL4_Defend select 0),
				(GL4_Location select 0),
				(GL4_Static select 0),
				(GL4_Global select 1),
				(GL4_Global select 3),
				count (GL4_Reinforcement select 0),
				(GL4_Artillery select 0),
				(GL4_Airstrike select 0)
			];

			if (isDedicated) then
			{
				GL4_AddOn_PublicVariable = [8, _a]; publicVariable "GL4_AddOn_PublicVariable";
			}
			else
			{
				hint format ["DEBUG:\n

				\nInitialized Groups:\n%1

				\nSelected Groups:\n%2

				\nPlayer Group:\n%3

				\nDetected Player:\n%4

				\nDefend Groups:\n%5

				\nLocation Groups:\n%6

				\nStatic Groups:\n%7

				\nMaximum Groups:\n%8

				\nGroups Courage:\n%9

				\nGroups Count:\n%10

				\nArtillery:\n%11

				\nAirstrike:\n%12",

				(_a select 0),

				(_a select 1),

				(_a select 2),

				(_a select 3),

				(_a select 4),

				(_a select 5),

				(_a select 6),

				(_a select 7),

				(_a select 8),

				(_a select 9),

				(_a select 10),

				(_a select 11)

				];
			};

			sleep 10;
		};

		hint "";
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Debug Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Debug
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a"];

	_a = _this select 0;

	hint format ["DEBUG:\n

	\nInitialized Groups:\n%1

	\nSelected Groups:\n%2

	\nPlayer Group:\n%3

	\nDetected Player:\n%4

	\nDefend Groups:\n%5

	\nLocation Groups:\n%6

	\nStatic Groups:\n%7

	\nMaximum Groups:\n%8

	\nGroups Courage:\n%9

	\nGroups Count:\n%10

	\nArtillery:\n%11

	\nAirstrike:\n%12",

	(_a select 0),

	(_a select 1),

	(_a select 2),

	(_a select 3),

	(_a select 4),

	(_a select 5),

	(_a select 6),

	(_a select 7),

	(_a select 8),

	(_a select 9),

	(_a select 10),

	(_a select 11)

	];

	}
];