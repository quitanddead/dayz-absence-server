// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Camp FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Camp_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// GL4 v.1.0
	// ////////////////////////////////////////////////////////////////////////////
	// Camp FX Functions
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;

	if (GL4_Local select 72) then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Join_In_Progress.sqf");

		if (GL4_Local select 74) then
		{
			[_a] spawn (GL4_Burning_FX_F select 2);
		};

		while { !(isNull _a) } do
		{
			if (inflamed _a) then
			{
				while { ( (inflamed _a) && !(isNull _a) ) } do
				{
					if (player distance _a < 200) then
					{
						_b = [ 3 + random 3,
						       [ 0.25 - random 0.5, 0.25 - random 0.5, 0.5 + random 1],
						       [ [0.3,0.1,0,-1],[0.3,0.1,0,-5],[0.3,0.1,0,-1] ]
						];

						drop [ (GL4_Config_FX select 0), "", "Billboard", 1, (_b select 0),

						[0, 0, random 0.5], (_b select 1), 0, 1.265, 1, 0,

						[0.01 + random 0.05, 0.01 - random 0.05], (_b select 2), [1000],

						0, 0, "", "", _a, random 360];

						if (floor (random 100) < 15) then
						{
							_b = [ 3 + random 5,
							       [ 0.25 - random 0.5, 0.25 - random 0.5, 0.5 + random 0.5],
							       [ [0,0,0,0.5], [0,0,0,0.5] ]
							];

							drop ["\Ca\Data\Cl_fired.p3d", "", "Billboard", 1, (_b select 0),

							[0, 0, random 0.5], (_b select 1), 1, 1.290, 1, 0,

							[0.01 + random 0.01], (_b select 2), [0,1],

							0, 0.1, "", "", _a];
						};

						sleep (random 0.5);
					}
					else
					{
						sleep 5;
					};
				};
			}
			else
			{
				sleep 5;
			};
		};
	};

	}
];