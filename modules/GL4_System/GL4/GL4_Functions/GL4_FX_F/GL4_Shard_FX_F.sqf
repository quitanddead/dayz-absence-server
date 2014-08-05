// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Shard FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

if ( (_this select 2) <= 0) then
{
	if (floor (random 100) < 50) then
	{
		_a = "#particlesource" createVehicleLocal [ (_this select 0), (_this select 1), 0];
		_a setDropInterval 70;
		_a setParticleParams [ ["\Ca\Data\ParticleEffects\Shard\Shard.p3d", 1, 0, 1, 0], "", "SpaceObject", 1, 80,

		[0, 0, 0], [0, 0, 0], 0, 1.275, 1, 0,

		[1], [ [1,1,1,1] ], [1], 0, 0, "", "", "", 1];

		GL4_Explosion_FX set [2, (GL4_Explosion_FX select 2) + [_this] ];

		if ( { (_this distance _x > 10) } count (GL4_Explosion_FX select 2) > 0) then
		{
			if (count (GL4_Explosion_FX select 2) < (GL4_Explosion_FX select 1) ) then
			{
				[] spawn
				{
					sleep 7;

					GL4_Explosion_FX set [2, [] ];
				};

				_b = 1 + (random 1);

				_c = "#particlesource" createVehicleLocal [ (_this select 0), (_this select 1), 0];
				_c setDropInterval 0.01;

				_d = "#lightpoint" createVehicleLocal _this;
				_d setLightBrightness 0;
				_d setLightAmbient [3,1,0];
				_d setLightColor [3,1,0];

				while { ( (_b > 1) && !(surfaceIsWater _this) ) } do
				{
					_c setParticleParams [ ["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 10, 32, 1], "", "Billboard", 1, 0.5 + random 0.5,

					[0, 0, 0], [0, 0, 0], 0, 1, 0.9, 0,

					[_b / 3, _b / 5], [ [1,1,1,-0],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,-1],[1,1,1,0] ], [0.5, 1], 0, 0, "", "", "", 0.1];

					_c setParticleRandom [0.5, [0.1, 0.1, 0.1], [0.1, 0.1, 0.1], 0.1, 0.5, [0.1,0.1,0.1,0], 0, 0];

					_d setLightBrightness (_b / 100);

					_b = _b - 0.03 - rain / 10;

					sleep 3;
				};

				deleteVehicle _c;
				deleteVehicle _d;
			};
		};

		sleep 70 + (random 70);

		deleteVehicle _a;
	};
};