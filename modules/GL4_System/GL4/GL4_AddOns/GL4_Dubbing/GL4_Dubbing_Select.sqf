// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Dubbing Select
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = (GL4_Dubbing select 0);

if (count _a > 0) then
{
	_b = (GL4_Local select 3 select 0);

	if (_b) then
	{
		_a = (GL4_Dubbing select 0);
	}
	else
	{
		_c = 0;

		while { (_c < count _a) } do
		{
			_d = (_a select _c);

			if ( { (isPlayer _x) } count (units _d) > 0) then
			{
				GL4_Dubbing set [0, (GL4_Dubbing  select 0) - [_d] ];
			};

			_c = _c + 1;
		};
	};
};

_a = (GL4_Dubbing select 0);

if (count _a > 0) then
{
	_b = (GL4_Local select 3 select 1);

	if (_b) then
	{
		_a = (GL4_Dubbing select 0);
	}
	else
	{
		_c = 0;

		while { (_c < count _a) } do
		{
			_d = (_a select _c);

			if !( { (isPlayer _x) } count (units _d) > 0) then
			{
				GL4_Dubbing set [0, (GL4_Dubbing  select 0) - [_d] ];
			};

			_c = _c + 1;
		};
	};
};

_a = (GL4_Dubbing select 0);

if (count _a > 0) then
{
	_b = (GL4_Local select 3 select 2);
};

_b