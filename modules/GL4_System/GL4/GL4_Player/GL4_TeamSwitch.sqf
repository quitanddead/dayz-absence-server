// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Team Switch
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;

while { (True) } do
{
	if (local _a) then
	{
		if ( { ( (alive _a) && (alive _x) && (_a != _x) ) } count (GL4_Player select 0) > 0) then
		{
			_a = player;

			[player] call compile preprocessFile (GL4_Path+"GL4\GL4_Player\GL4_Initialize.sqf");

			GL4_Player_PublicVariable = [player]; publicVariable "GL4_Player_PublicVariable";
		};
	};

	_b = (GL4_Player select 0);

	if (count (GL4_HC_Force_Move select 1) > 0) then
	{
		_b = _b - (GL4_HC_Force_Move select 1);
	};

	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		if !( { ( (isPlayer _x) && (alive _x) ) } count (units _d) > 0) then
		{
			GL4_Player set [0, (GL4_Player select 0) - [_d] ];
		};

		_c = _c + 1;
	};

	sleep 30;
};