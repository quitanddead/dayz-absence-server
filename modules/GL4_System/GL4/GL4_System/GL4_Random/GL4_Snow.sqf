// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Snow
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

GL4_Snow = [ False, False ];

if (isNil "GL4_Random") then
{
	call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Random.sqf");
};

if (isServer) then
{
	if (isMultiplayer) then
	{
		"GL4_Snow_Server_PublicVariable" addPublicVariableEventHandler
		{
			[] spawn
			{
				waitUntil { !(isNil "GL4_Snow") };

				if (overCast >= (GL4_Random select 7) ) then
				{
					publicVariable "GL4_Snow";
				};
			};
		};
	};

	GL4_Snow_F = 

		// ////////////////////////////////////////////////////////////////////////////
		// Snow
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

	[] spawn
	{
		while { (True) } do
		{
			if (overCast >= (GL4_Random select 7) ) then
			{
				if (floor (random 100) < 50) then
				{
					GL4_Snow set [0, True]; GL4_Snow set [1, False]; publicVariable "GL4_Snow";
				}
				else
				{
					if (floor (random 100) < 75) then
					{
						GL4_Snow set [0, False]; GL4_Snow set [1, True]; publicVariable "GL4_Snow";
					}
					else
					{
						GL4_Snow set [0, False]; GL4_Snow set [1, False]; publicVariable "GL4_Snow";
					};
				};

				_a = [50,100] call GL4_Snow_F;

				sleep _a;	
			}
			else
			{
				sleep 10;
			};
		};
	};
}
else
{
	GL4_Snow_Server_PublicVariable = [True]; publicVariable "GL4_Snow_Server_PublicVariable";
};

waitUntil { (time > 0) };

if (isNull player) exitWith {};

while { (True) } do
{
	if (overCast >= (GL4_Random select 7) ) then
	{
		if (rain > 0) then {0 setRain 0};

		if (GL4_Snow select 0) then
		{
			_b = overCast * (GL4_Random select 8);

			while { (_b > 0) } do
			{
				_c = [ (getPos player select 0) - 35 + (random (35 * 2)), (getPos player select 1) - 35 + (random (35 * 2)), (getPos player select 2) + 15];

				_c = [ (_c select 0) + ((veloCity vehicle player select 0) *3), (_c select 1) + ((veloCity vehicle player select 1) *3), (_c select 2) ];

				drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 16, 0], "", "Billboard", 1, 7,

				_c, [0,0,-0.61], 1, 0.000001, 0, 1.4, [0.03, 0.03],

				[ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1] ], [0,1,0,1,0,1], 0.5, 0.5, "", "", ""];

				_b = _b - 1;
			};

			sleep 0.1;
		}
		else
		{
			if (GL4_Snow select 1) then
			{
				_b = overCast * (GL4_Random select 8);

				while { (_b > 0) } do
				{
					_c = [ (getPos player select 0) - 35 + (random (35 * 2)), (getPos player select 1) - 35 + (random (35 * 2)), (getPos player select 2) + 15];

					_c = [ (_c select 0) + ((veloCity vehicle player select 0) *3), (_c select 1) + ((veloCity vehicle player select 1) *3), (_c select 2) ];

					drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 16, 0], "", "Billboard", 1, 7,

					_c, [0,0,-0.61], 1, 0.000001, 0, 1.4, [0.03, 0.03],

					[ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1] ], [0,1,0,1,0,1], 0.5, 0.5, "", "", ""];

					_b = _b - 1;
				};

				sleep 0.01;
			}
			else
			{
				_b = overCast * (GL4_Random select 8);

				while { (_b > 0) } do
				{
					_c = [ (getPos player select 0) - 35 + (random (35 * 2)), (getPos player select 1) - 35 + (random (35 * 2)), (getPos player select 2) + 15];

					_c = [ (_c select 0) + ((veloCity vehicle player select 0) *3), (_c select 1) + ((veloCity vehicle player select 1) *3), (_c select 2) ];

					drop [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 12, 16, 0], "", "Billboard", 1, 7,

					_c, [0,0,-0.61], 1, 0.000001, 0, 1.4, [0.03, 0.03],

					[ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1] ], [0,1,0,1,0,1], 0.5, 0.5, "", "", ""];

					_b = _b - 1;
				};

				sleep 0.001;
			};
		};
	}
	else
	{
		sleep 10;
	};
};