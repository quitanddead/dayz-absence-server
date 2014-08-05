// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Twice
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = (GL4_Reinforcement select 0);

if (count _a > 0) then
{
	_b = [];

	_c = 0;

	while { (_c < count _a) } do
	{
		_d = (_a select _c);

		if (_d in _b) then
		{
			GL4_Reinforcement set [0, (GL4_Reinforcement select 0) - [_d] ];

			GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [_d] ];
		}
		else
		{
			_b = _b + [_d];
		};

		_c = _c + 1;
	};
};

_a = (GL4_Static select 0);

if (count _a > 0) then
{
	_b = [];

	_c = 0;

	while { (_c < count _a) } do
	{
		_d = (_a select _c);

		if (_d in _b) then
		{
			GL4_Static set [0, (GL4_Static select 0) - [_d] ];

			GL4_Static set [0, (GL4_Static select 0) + [_d] ];
		}
		else
		{
			_b = _b + [_d];
		};

		_c = _c + 1;
	};
};

_a = (GL4_Location select 0);

if (count _a > 0) then
{
	_b = [];

	_c = 0;

	while { (_c < count _a) } do
	{
		_d = (_a select _c);

		if (_d in _b) then
		{
			GL4_Location set [0, (GL4_Location select 0) - [_d] ];

			GL4_Location set [0, (GL4_Location select 0) + [_d] ];
		}
		else
		{
			_b = _b + [_d];
		};

		_c = _c + 1;
	};
};