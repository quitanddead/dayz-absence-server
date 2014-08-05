// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Force Move Regroup
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

_a = _this select 0;
_b = _this select 1;

onMapSingleClick "";

if (typeName _b == "Object") then
{
	GL4_HC_Force_Move set [1, (GL4_HC_Force_Move select 1) - [_b] ];

	if (alive _b) then
	{
		_b setUnitPos "AUTO";

		_b setSpeedMode (speedMode _a);

		_b setCombatMode (combatMode _a);

		_b setBehaviour (behaviour _a);

		_b enableAI "TARGET";

		_b enableAI "AUTOTARGET";

		[_b] join _a;
	};
}
else
{
	while { (count _b > 0) } do
	{
		_c = (_b select 0);

		GL4_HC_Force_Move set [1, (GL4_HC_Force_Move select 1) - [_c] ];

		if (alive _c) then
		{
			_c setUnitPos "AUTO";

			_c setSpeedMode (speedMode _a);

			_c setCombatMode (combatMode _a);

			_c setBehaviour (behaviour _a);

			_c enableAI "TARGET";

			_c enableAI "AUTOTARGET";

			[_c] join _a;
		};

		_b = _b - [_c];
	};
};

if (count (GL4_HC_Force_Move select 1) == 0) then
{
	if (_a getVariable "GL4_HC_Force_Move") then
	{
		_a setVariable ["GL4_HC_Force_Move", False];
	}
	else
	{
		_a setVariable ["GL4_HC_Force_Move", True];
	};

	deleteMarker GL4_HC_Force_Move_Marker;

	GL4_HC_Force_Move_Marker = nil;

	GL4_HC_Force_Move_Menu set [3, ["Regroup ( Leader )", [4], "", -5, [ ["expression", "[player, (GL4_HC_Force_Move select 1) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Force_Move\GL4_HC_Force_Move_Regroup.sqf"") "] ], "0", "0"] ];
};