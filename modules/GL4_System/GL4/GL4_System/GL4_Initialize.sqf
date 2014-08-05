// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Initialize
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = [];

_b = allGroups;

_c = 0;

while { (_c < count _b) } do
{
	_d = (_b select _c);

	_e = (vehicle leader _d);

	if (captive _e) then
	{
		_e setCaptive False;

		_a = _a + [_e];
	};

	if (side _e in _this) then
	{
		GL4_Groups set [0, (GL4_Groups select 0) + [_d] ];

		if (GL4_Reinforcement select 3) then
		{
			GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [_d] ];
		};

		if (_e isKindOf "StaticCannon") then
		{
			if (canFire _e) then
			{
				GL4_Artillery set [0, (GL4_Artillery select 0) + [_d] ];
			};
		};

		if (_e isKindOf "Plane") then
		{
			if ( (canFire _e) && (count waypoints _e == 1) ) then
			{
				_e setFuel 0;

				GL4_Airstrike set [0, (GL4_Airstrike select 0) + [_d] ];
			};
		};
	};

	_c = _c + 1;
};

if (count _a > 0) then
{
	{_x setCaptive True} forEach _a;
};