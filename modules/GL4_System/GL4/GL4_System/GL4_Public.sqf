// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Public
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	
private ["_a","_b"];

if (isServer) then
{
	_a = _this select 0;
	_b = _this select 1;

	GL4_Initialize set [0, [_a, _b] ]; publicVariable "GL4_Initialize";

	if (GL4_Core select 1) then
	{
		if (count _a > 0) then
		{
			_a execVM (GL4_Path+"GL4\GL4_System\GL4_Include.sqf");

			[_a, _b] call compile preProcessFile (GL4_Path+"GL4\GL4_System\GL4_Select.sqf");
		}
		else
		{
			_a execVM (GL4_Path+"GL4\GL4_System\GL4_Synchronize.sqf");
		};
	};

	if (GL4_Core select 2) then
	{
		if (count _b > 0) then
		{
			_b call compile preProcessFile (GL4_Path+"GL4\GL4_System\GL4_Additional.sqf");
		};
	};

	[_a, _b] call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_HC_Reinforcement.sqf");
}
else
{
	if (typeName (GL4_Initialize select 0) != "Array") then
	{
		GL4_System_PublicVariable = [2]; publicVariable "GL4_System_PublicVariable";
	};

	[] spawn
	{
		waitUntil { (typeName (GL4_Initialize select 0) == "Array") };

		_a = (GL4_Initialize select 0);

		_b = (_a select 1);

		if (GL4_Core select 2) then
		{
			if (count _b > 0) then
			{
				_b call compile preProcessFile (GL4_Path+"GL4\GL4_System\GL4_Additional.sqf");
			};
		};
	};
};