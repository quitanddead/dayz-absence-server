// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter Cancel
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;

if (typeName _a == "Object") exitWith
{
	GL4_HC_Helicopter set [5, False];

	GL4_HC_Helicopter set [6, True];

	GL4_HC_Helicopter_Menu set [2, ["Fly Low", [3], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Low.sqf"") "] ], "0", "0"] ];

	GL4_HC_Helicopter_Menu set [3, ["Fly High", [4], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_High.sqf"") "] ], "0", "0"] ];

	GL4_HC_Helicopter_Menu set [4, ["Land", [5], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Land.sqf"") "] ], "0", "0"] ];

	GL4_HC_Helicopter_Menu set [5, ["Status", [6], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Status.sqf"") "] ], "0", "0"] ];

	GL4_HC_Helicopter_Menu set [6, ["Cancel", [7], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Cancel.sqf"") "] ], "0", "0"] ];

	call compile format [" [playerSide, ""HQ""] sidechat""%1 helicopter cancel confirmed. We will retreat the requested helicopter."" ", name _a];

	_b = (GL4_HC_Helicopter select 2);

	_c = 0;

	while { (_c < count _b) } do
	{
		_d = (_b select _c);

		_e = (vehicle leader _d);

		_f = _e getVariable "GL4_HC_Helicopter";

		if (typeName _f == "Array") then
		{
			[driver _e] join grpNull;

			if (isMultiplayer) then
			{
				GL4_HC_Helicopter_Server_PublicVariable = [2, _d, _f]; publicVariable "GL4_HC_Helicopter_Server_PublicVariable";
			}
			else
			{
				[2, _d, _f] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Server.sqf");
			};
		};

		_c = _c + 1;
	};

	GL4_HC_Helicopter set [2, [] ];

	GL4_HC_Helicopter set [3, [] ];
};

if (isServer) then
{
	_b = _this select 1;

	_c = (vehicle leader _a);

	_d = 0;

	while { (_d < count crew _c) } do
	{
		_e = (crew _c select _d);

		if ( (local _e) && (_e != driver _c) && !( { (isPlayer _x) } count (units _e) > 0) ) exitWith
		{
			[driver _c] join _e;
		};

		_d = _d + 1;
	};

	GL4_HC_Helicopter set [5, False];

	GL4_HC_Helicopter set [2, (GL4_HC_Helicopter select 2) - [_a] ];

	{_x setCombatMode "BLUE"; _x disableAI "TARGET"; _x disableAI "AUTOTARGET"} forEach (crew _c);

	_c move _b;

	while { ( (alive _c) && !(unitReady _c) ) } do
	{
		sleep 1;
	};

	if (alive _c) then
	{
		{_x setCombatMode "GREEN"; _x enableAI "TARGET"; _x enableAI "AUTOTARGET"} forEach (crew _c);

		_c land "LAND";
	};
};