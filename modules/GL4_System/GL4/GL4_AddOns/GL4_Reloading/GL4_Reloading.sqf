// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Reloading
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Join_In_Progress.sqf");

_a = (vehicle player);

if (_a == leader _a) then
{
	_b = 0;

	while { (_b < count units _a) } do
	{
		_c = (units _a select _b);

		_d = (vehicle _c);

		if !(_d in (GL4_Reloading select 0) ) then
		{
			GL4_Reloading set [0, (GL4_Reloading select 0) + [_d] ];

			[_d] spawn (GL4_Reloading_F select 0);
		};

		_b = _b + 1;
	};
};