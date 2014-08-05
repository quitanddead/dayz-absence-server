// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Patrol Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Patrol_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Patrol Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Patrol
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = (_b select 0);

	if (count _b > 1) then
	{
		_a setBehaviour (_b select 1);
	};

	if (count _b > 2) then
	{
		_a setSpeedMode (_b select 2);
	};

	if (count _b > 3) then
	{
		_a setFormation (_b select 3);
	};

	_d = (vehicle leader _a);

	_e = (getPos _d);

	while { ( (alive _d) && !(_a in (GL4_Reinforcement select 1) ) ) } do
	{
		_f = [ ( (_e select 0) + ( (random _c) - (random _c) ) ), ( (_e select 1) + ( (random _c) - (random _c) ) ), 0];

		if !(surfaceIsWater _f) then
		{
			_a move _f;
		};

		_g = time + 50;

		while { ( (alive _d) && !(unitReady _d) && (time < _g) && !(_a in (GL4_Reinforcement select 1) ) ) } do
		{
			sleep 1;
		}; 

		if (floor (random 100) < 50) then
		{
			sleep 10 + (random 30);
		};
	};

	}
];