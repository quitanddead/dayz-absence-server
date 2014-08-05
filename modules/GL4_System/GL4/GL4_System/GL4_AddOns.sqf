// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// AddOns
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

if (isDedicated) then
{
	_a = False;

	GL4_Local set [4, False];
	GL4_Local set [5, False];
	GL4_Local set [22, False];
	GL4_Local set [23, False];
	GL4_Local set [30, False];
	GL4_Local set [36, False];
	GL4_Local set [43, False];
	GL4_Local set [47, False];
	GL4_Local set [66, False];
	GL4_Local set [71, False];
	GL4_Local set [80, False];
	GL4_Local set [82, False];
}
else
{
	_a = True;
};

_b = 15;

_c = 0;

while { (_c < _b) } do
{
	switch (_c) do
	{
		case 0 :
		{
			if (GL4_Local select 1) then
			{
				_d = isClass (configFile >> "cfgPatches" >> "GL4_Dubbing");

				if (_d) then
				{
					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Dubbing_F.sqf");

					if (_a) then
					{
						[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

						call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Grenade_F.sqf");

						call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Incoming_F.sqf");

						call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Reloading_F.sqf");

						[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Reloading\GL4_Reloading.sqf");
					};
				}
				else
				{
					GL4_Local set [1, False];
				};
			};
		};

		case 1 :
		{
			if (GL4_Local select 4) then
			{
				_d = isClass (configFile >> "cfgPatches" >> "GL4_Blood_FX");

				if (_d) then
				{
					[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

					if (GL4_Local select 5) then
					{
						call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Blood_F\GL4_Bleeding_F.sqf");
					}
					else
					{
						GL4_Local set [5, False];
					};

					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Blood_F\GL4_Monitor_F.sqf");

					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Blood_F\GL4_Blood_FX_F.sqf");
				}
				else
				{
					GL4_Local set [4, False];

					GL4_Local set [5, False];
				};
			};
		};

		case 2 :
		{
			if (GL4_Local select 22) then
			{
				_d = isClass (configFile >> "cfgPatches" >> "GL4_Radio_Chatter");

				if (_d) then
				{
					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Chatter_F.sqf");

					[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Chatter\GL4_Chatter.sqf");
				}
				else
				{
					GL4_Local set [22, False];
				};
			};
		};

		case 3 :
		{
			if (GL4_Local select 23) then
			{
				_d = isClass (configFile >> "cfgPatches" >> "GL4_Sound_FX");

				if (_d) then
				{
					[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Sound_FX_F.sqf");
				}
				else
				{
					GL4_Local set [23, False];
				};
			};
		};

		case 4 :
		{
			if (GL4_Local select 30) then
			{
				[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

				call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Weapon_FX_F.sqf");
			};
		};

		case 5 :
		{
			if (GL4_Local select 36) then
			{
				[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

				call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Shell_FX_F.sqf");
			};
		};

		case 6 :
		{
			if (GL4_Local select 43) then
			{
				call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Impact_FX_F.sqf");
			};
		};

		case 7 :
		{
			if (GL4_Local select 47) then
			{
				[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

				call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Explosion_FX_F.sqf");
			};
		};

		case 8 :
		{
			if (GL4_Local select 66) then
			{
				[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

				call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Wrack_FX_F.sqf");
			};
		};

		case 9 :
		{
			if (GL4_Local select 71) then
			{
				_d = isClass (configFile >> "cfgPatches" >> "GL4_Burning_FX");

				if (_d) then
				{
					[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Burning_FX_F.sqf");

					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Camp_FX_F.sqf");

					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_House_FX_F.sqf");
				}
				else
				{
					GL4_Local set [71, False];
				};
			};
		};

		case 10 :
		{
			if (GL4_Local select 75) then
			{
				if (_a) then
				{
					[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");
				};

				if (isServer) then
				{
					call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Crew_FX_F.sqf");
				};
			};
		};

		case 11 :
		{
			if (GL4_Local select 77) then
			{
				call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Backblast_FX_F.sqf");

				[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Backblast\GL4_Backblast.sqf");

				if (_a) then
				{
					GL4_Local set [77, True];
				}
				else
				{
					GL4_Local set [77, False];
				};
			};
		};

		case 12 :
		{
			if (GL4_Local select 80) then
			{
				[_c] call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Database\GL4_Initialize.sqf");

				call compile preprocessFile (GL4_Path+"GL4\GL4_AddOns\GL4_Functions\GL4_Artillery_FX_F.sqf");
			};
		};

		case 13 :
		{
			if (GL4_Local select 82) then
			{
				[] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Autumn\GL4_Autumn.sqf");
			};
		};

		case 14 :
		{
			_d = isClass (configFile >> "cfgPatches" >> "GL4_Config_FX");

			if (_d) then
			{
				GL4_Config_FX = [ "\GL4_Config_FX\GL4_Sparks\GL4_Sparks.p3d" ];
			}
			else
			{
				GL4_Config_FX = [ ["\ca\Data\ParticleEffects\Universal\Universal", 16, 13, 2, 0] ];
			};
		};
	};

	_c = _c + 1;
};