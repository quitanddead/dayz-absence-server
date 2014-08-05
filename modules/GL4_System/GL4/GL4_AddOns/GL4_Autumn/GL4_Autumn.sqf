// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Autumn
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Join_In_Progress.sqf");

_a = player;

while { (GL4_Local select 82) } do
{
	if ( !(surfaceIsWater getPos _a) && (getPos _a select 2 < 20) ) then
	{
		_b = Wind;

		if ( (_b select 2) <= 0) then
		{
			_b set [2, random 1];
		};

		_c = (GL4_Local select 83);

		_c = _c + (random _c);

		_d = 0;

		while { (_d < _c) } do
		{
			_e = [ [ (getPos _a select 0) + (random 50 - random 50), (getPos _a select 1) + (random 50 - random 50), (getPos _a select 2) ],
			       [ (_b select 0) * 2, (_b select 1) * 2, random (_b select 2) ],
			       0.7 + random 0.7
			];

			drop ["\Ca\Data\ParticleEffects\Hit_Leaves\Leaves.p3d", "", "SpaceObject", 1, _c,

			(_e select 0), (_e select 1), (_e select 2), 1.27 + random 0.02, 1, 0.2,

			[0.7 + random 0.7], [ [1,1,1,1] ], [0,1],

			0.05, 0.05, "", "", ""];

			_d = _d + 1;
		};
	}
	else
	{
		_c = (GL4_Local select 83);
	};

	_c = _c - (random _c);

	sleep _c;
};