// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Event Handler Assign
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	
private ["_a","_b","_c"];

if (isServer) then
{
	_a = allUnits;

	{if (isPlayer _x) then {_a = _a - units _x} } forEach _a;

	_b = 0;

	while { (_b < count _a) } do
	{
		_c = (_a select _b);

		_c addEventHandler ["Fired", { _this call (GL4_EH_Fired_F select 0) } ];

		_c addEventHandler ["Hit", { _this call (GL4_EH_Hit_F select 0) } ];
	
		_c addEventHandler ["Killed", { _this call (GL4_EH_Killed_F select 0) } ];

		_b = _b + 1;
	};
};

_a = vehicles;

_b = 0;

while { (_b < count _a) } do
{
	_c = (_a select _b);

	if (someAmmo _c) then
	{
		_c addEventHandler ["Fired", { _this call (GL4_EH_Fired_F select 0) } ];
	};

	_c addEventHandler ["Hit", { _this call (GL4_EH_Hit_F select 0) } ];

	_c addEventHandler ["Killed", { _this call (GL4_EH_Killed_F select 0) } ];

	_b = _b + 1;
};