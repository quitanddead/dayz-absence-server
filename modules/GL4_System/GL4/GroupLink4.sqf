// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Idea and Basic Script by Toadlife
// Modified and Enhanced by KeyCat
// Modified Optimized and Enhanced by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

waitUntil { (GL4_Initialize select 1) };

if (True) then
{
	GL4_System set [1, 0];

	_a = (GL4_Global select 8);

	_b = 200 + (random 100);

	_c = True;

	while { (_c) } do
	{
		_c = [True] call (GL4_System_F select 8);

		if (_c) then
		{
			if ( (GL4_System select 0) && ( (GL4_System select 1) > _b) && (count (GL4_Reinforcement select 1) > 0) ) then
			{
				GL4_System set [0, False];

				GL4_System set [1, 0];

				GL4_System set [2, objNull];

				sleep 5;

				[ (GL4_Reinforcement select 1) ] call (GL4_Remount_F select 0);

				GL4_Reinforcement set [1, [] ];

				call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Groups.sqf");

				_b = 200 + (random 100);
			};

			_d = (GL4_Player select 0);

			_e = (GL4_Reinforcement select 0);

			[_e] call (GL4_System_F select 7);

			if ( [ (GL4_Reinforcement select 1) ] call (GL4_System_F select 9) ) then
			{
				[_d, _e] call (GL4_System_F select 0);

				sleep _a;
			}
			else
			{
				[_d, _e] call (GL4_System_F select 0);

				sleep (_a * 3);
			};
		}
		else
		{
			sleep 15;

			_c = [True] call (GL4_System_F select 8);
		};
	};
};