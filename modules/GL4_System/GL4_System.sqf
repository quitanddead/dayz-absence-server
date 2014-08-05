// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// System Initialize
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = _this select 0;

if (isNil "GL4_Initialize") then
{
	GL4_Initialize = [ False, False, False ];

	GL4_Synchronize = [ False, False, False ];

	GL4_Default = [ False, False, False ];

	if (isServer) then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Preprocess.sqf");
	}
	else
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Preprocess.sqf");

		if (_a isKindOf "Man") then
		{
			GL4_System_PublicVariable = [1]; publicVariable "GL4_System_PublicVariable";

			_b = time + 1;

			waitUntil { (time > _b) };
		};
	};
};

if ( (_a isKindOf "Man") && (typeName (GL4_Default select 0) == "Bool") && (GL4_Core select 0) ) exitWith
{
	_b = time + 1;

	waitUntil { (time > _b) };

	if (typeName (GL4_Default select 0) == "Bool") then
	{
		GL4_Default set [0, _a];

		["Default", 1] execVM (GL4_Path+"GL4\GL4_System\GL4_Display.sqf");

		if (isServer) then
		{
			_c = allUnits;

			{if ( { (isPlayer _x) } count (units _x) > 0) exitWith {_d = (vehicle _x) } } forEach _c;

			if (typeName _d == "Object") then
			{
				_e = [_c, _d] call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_System.sqf");

				[ (_e select 0), (_e select 1) ] call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Public.sqf");
			};
		}
		else
		{
			call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Public.sqf");
		};

		if (GL4_Core select 3) then
		{
			_this execVM (GL4_Path+"GL4\GL4_System\GL4_Special_FX.sqf");
		};

		GL4_Initialize set [3, True];

		["Default", 2] execVM (GL4_Path+"GL4\GL4_System\GL4_Display.sqf");
	};
};

if ( (_a isKindOf "Logic") && (typeName (GL4_Default select 0) == "Bool") ) exitWith
{
	GL4_Default set [0, _a];

	_b = time + 1;

	waitUntil { (time > _b) };

	["Module", 1] execVM (GL4_Path+"GL4\GL4_System\GL4_Display.sqf");

	if (isServer) then
	{
		_c = allUnits;

		{if ( { (isPlayer _x) } count (units _x) > 0) exitWith {_d = (vehicle _x) } } forEach _c;

		_c = (synchronizedObjects _a);

		_c = _c - [_a];

		if (typeName _d == "Object") then
		{
			_e = [_c, _d] call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_System.sqf");

			[ (_e select 0), (_e select 1) ] call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Public.sqf");
		};
	}
	else
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Public.sqf");
	};

	GL4_Initialize set [3, True];

	["Module", 2] execVM (GL4_Path+"GL4\GL4_System\GL4_Display.sqf");
};