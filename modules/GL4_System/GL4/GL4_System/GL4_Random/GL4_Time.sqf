// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Time
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;

if (_a isKindOf "Logic") then
{
	GL4_Time = [ False ];

	if (isServer) then
	{
		if (isNil "GL4_Random") then
		{
			call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Random.sqf");
		};

		_b = (GL4_Random select 0);

		_c = (GL4_Random select 1);

		if (_b == 0) then
		{
			_d = (random 24);
		}
		else
		{
			_d = _b + (random _c);
		};

		skipTime _d;

		if (isMultiplayer) then
		{
			"GL4_Time_Server_PublicVariable" addPublicVariableEventHandler
			{
				_e = (_this select 1);

				_f = (_e select 0);

				if (_f != dayTime) then
				{
					GL4_Time set [0, date]; publicVariable "GL4_Time";
				};
			};
		};
	}
	else
	{
		waitUntil { (time > 0) };

		GL4_Time_Server_PublicVariable = [dayTime]; publicVariable "GL4_Time_Server_PublicVariable";

		waitUntil { (typeName (GL4_Time select 0) == Array) };

		_b = (GL4_Time select 0);

		setDate [ (_b select 0), (_b select 1), (_b select 2), (_b select 3), (_b select 4) ];
	};
};