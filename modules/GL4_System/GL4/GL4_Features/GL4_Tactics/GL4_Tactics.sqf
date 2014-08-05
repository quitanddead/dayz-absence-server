// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Tactic
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g"];

_a = _this select 0;

if ( { (alive _x) } count (units _a) > 7) then
{
	_b = count (units _a) / 2;

	_c = units _a select (count (units _a) - 1);

	[_c] join grpNull;

	_d = group _c;

	[_d] spawn (GL4_Marker_F select 1);

	while { ( (alive leader _d) && (count (units _d) < _b) ) } do
	{
		_c = units _a select (count (units _a) - 1);

		if (alive leader _d) then
		{
			[_c] join grpNull;

			[_c] join _d;
		};
	};

	if (alive leader _d) then
	{
		GL4_Reinforcement set [1, (GL4_Reinforcement select 1) + [_d] ];

		_e = (GL4_System select 2);

		_f = 2 + (random 3);

		_g = 0;

		while { ( ( { (alive _x) } count (units _d) > 0) && (_g < _f) && (GL4_System select 0) ) } do
		{
			[2, _e, _d, 100] call (GL4_System_F select 1);

			sleep 20 + (random 30);

			_g = _g + 1;
		};

		GL4_Reinforcement set [1, (GL4_Reinforcement select 1) - [_d] ];
	};

	if ( { (alive _x) } count (units _d) > 0) then
	{
		if ( { (alive _x) } count (units _a) > 0) then
		{
			{[_x] join _a} forEach units _d;

			_d = grpNull;
		};
	};
};