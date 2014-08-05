// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Random Weather
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

if (isServer) then
{
	if (isNil "GL4_Random") then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Random.sqf");
	};

	if (isMultiplayer) then
	{
		"GL4_Weather_Server_PublicVariable" addPublicVariableEventHandler
		{
			[] spawn
			{
				waitUntil { !(isNil "GL4_Weather_Player_PublicVariable") };

				publicVariable "GL4_Weather_Player_PublicVariable";
			};
		};
	};

	waitUntil { (time > 0) };

	GL4_Random_Weather_F =
	
		// ////////////////////////////////////////////////////////////////////////////
		// Random Weather
		// ////////////////////////////////////////////////////////////////////////////
		// By Operation Flashpoint MOD E.C.P. ( Enhanced Configuration Project )
		// ////////////////////////////////////////////////////////////////////////////
		{private "_a";

		_a = -1;

		if (count _this > 0) then
		{
			if (count _this > 1) then
			{
				_a = (_this select 0) + random ( (_this select 1) - (_this select 0) );
			}
			else
			{
				_a = _this select 0;
			}
		}; 

		_a
	};

	while { (True) } do
	{
		_a = (GL4_Random select 2) call GL4_Random_Weather_F;

		_b = (GL4_Random select 3) call GL4_Random_Weather_F;

		if (floor (random 100) < 95) then
		{
			_c = (GL4_Random select 4) call GL4_Random_Weather_F;

			_a setOvercast _c;

			_d = 0;

			if (_c >= 0.7) then
			{
				_d = (GL4_Random select 5) call GL4_Random_Weather_F;

				_a setRain _d;
			};

			GL4_Weather_Player_PublicVariable = [1, _a, _c, _d]; publicVariable "GL4_Weather_Player_PublicVariable";
		}
		else
		{
			_e = (GL4_Random select 6) call GL4_Random_Weather_F;

			_a setFog _e;

			GL4_Weather_Player_PublicVariable = [2, _a, _e]; publicVariable "GL4_Weather_Player_PublicVariable";
		};

		sleep _a;
		sleep _b;
	};
}
else
{
	_a = _this select 0;	

	if (typeName _a == "Object") then
	{
		"GL4_Weather_Player_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_System\GL4_Random\GL4_Weather.sqf") };

		GL4_Weather_Server_PublicVariable = [True]; publicVariable "GL4_Weather_Server_PublicVariable";
	}
	else
	{
		switch (_a) do
		{
			case 1 :
			{
				_b = _this select 1;
				_c = _this select 2;

				_b setOvercast _c;

				if (_c >= 0.7) then
				{
					_d = _this select 3;

					_b setRain _d;
				};
			};

			case 2 :
			{
				_b = _this select 1;
				_c = _this select 2;

				_b setFog _c;
			};
		};
	};
};