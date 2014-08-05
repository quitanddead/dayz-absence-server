// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Select
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = _this select 0;
_b = _this select 1;

if (isServer) then
{
	if (count _b > 0) then
	{
		_c = 0;

		while { (_c < count _a) } do
		{
			_d = (_a select _c);

			if (_d in _b) then
			{
				_a = _a - [_d];

				hint format ["Error: Friendly A.I. group(s) of the side %1 and leaded by A.I. was synchronized with the ""Group Link 4: System"" module. Please do only synchronize ENEMY A.I. groups leaded by A.I. and/or FRIENDLY A.I. groups leaded by a PLAYER with the ""Group Link 4: System"" module.", _d];
			};

			_c = _c + 1;
		};
	};

	if (count _a > 0) then
	{
		_a execVM (GL4_Path+"GL4\GL4_Database\GL4_Initialize.sqf");
	};

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Difficult_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Location_F.sqf");

	call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F\GL4_Rearm_F.sqf");

	GL4_Location = [ [] ];

	GL4_Rearm = [ [] ];

	_c = allUnits;

	_d = 0;

	while { (_d < count _c) } do
	{
		_e = (_c select _d);

		[_e] call (GL4_Difficult_F select 0);

		[_e] call (GL4_Difficult_F select 3);

		[_e] call (GL4_Location_F select 0);

		[_e] spawn (GL4_Rearm_F select 0);

		_d = _d + 1;
	};
};