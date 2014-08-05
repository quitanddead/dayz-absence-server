class CfgAmmo
{
	class BulletCore;
	class BulletBase;

	class B_762x51_Ball : BulletBase
	{
		deflecting = 30;
		tracerScale = 1.5;
		tracerStartTime = 0.05;
		tracerEndTime = 3;
	};

	class B_762x54_Ball : BulletBase
	{
		deflecting = 30;
		tracerScale = 1.5;
		tracerStartTime = 0.05;
		tracerEndTime = 3;
	};

	class B_127x99_Ball : BulletBase
	{
		deflecting = 30;
		tracerScale = 1.5;
		tracerStartTime = 0.05;
		tracerEndTime = 3;
	};

	class B_127x108_APHE : BulletBase
	{
		deflecting = 50;
		tracerScale = 1.5;
		tracerStartTime = 0.05;
		tracerEndTime = 3;
	};

	class RocketBase;

	class R_MLRS : RocketBase
	{
		hit = 1000;
		indirectHit = 100;
		indirectHitRange = 40;
		model = "\ca\weapons\grad";
		initTime = 0.05;
		timeToLive = 30;
		cost = 400;
		maxSpeed = 700;
		thrustTime = 1;
		thrust = 500;
		fuseDistance = 5;
		whistleOnFire = 2;
		whistleDist = 80;
		CraterEffects = "ArtyShellCrater";
		ExplosionEffects = "ArtyShellExplosion";
		effectsMissile = "missile5";
	};
};

class ATRocketCrater
{
	class MissileCircleDust
	{
		simulation = "particles";
		type = "CircleDustMed";
		position[] = {0, 0, 0};

		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	
	class RocketSmokeTrails1
	{
		simulation = "particles";
		type = "RocketSmokeTrails";
		position[] = {0, 0, 0};

		intensity = 1;
		interval = 1;
		lifeTime = 0.1;
	};
	
	class RocketSmokeTrails2
	{
		simulation = "particles";
		type = "RocketSmokeTrails2";
		position[] = {0, 0, 0};

		intensity = 1;
		interval = 1;
		lifeTime = 0.1;
	};
};

class ATRocketExplosion
{
	class Light
	{
		simulation = "light";
		type = "ExploLight";
		position[] = {0, 0, 0};
		intensity = 0.001;
		interval = 1;
		lifeTime = 0.5;
	};
	
	class Explosion1
	{
		simulation = "particles";
		type = "ExplosionParticles";
		position[] = {0, 0, 0};
		intensity = 3;
		interval = 1;
		lifeTime = 0.25;
	};
	
	class SmallSmoke1
	{
		simulation = "particles";
		type = "CloudBigLight";
		position[] = {0, 0, 0};

		intensity = 0.2;
		interval = 0.2;
		lifeTime = 0.2;
	};
};

class ExploAmmoCrater
{
	class ExploAmmoStones
	{
		simulation = "particles";
		type = "DirtSmall";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	
	class CircleDust
	{
		simulation = "particles";
		type = "CircleDustSmall";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};

class ExploAmmoExplosion
{
	class Light
	{
		simulation = "light";
		type = "ExploLightMed";
		position[] = {0, 0, 0};
		intensity = 0.001;
		interval = 1;
		lifeTime = 0.5;
	};

	class Explosion
	{
		simulation = "particles";
		type = "GL4_Explosion_Particles";
		position[] = {0, 0, 0};

		intensity = 1;
		interval = 1;
		lifeTime = 0.25;
	};

	class ExploAmmoSmoke
	{
		simulation = "particles";
		type = "ExploAmmoSmoke";
		position[] = {0, 0, 0};

		intensity = 0.3;
		interval = 0.3;
		lifeTime = 0.3;
	};
};

class GrenadeCrater
{
	class GrenadeDust
	{
		simulation = "particles";
		type = "CircleDustSmall";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.5;
	};
};

class GrenadeExplosion
{
	class Light
	{
		simulation = "light";
		type = "GrenadeExploLight";
		position[] = {0, 0, 0};
		intensity = 0.01;
		interval = 1;
		lifeTime = 1;
	};
	
	class Explosion
	{
		simulation = "particles";
		type = "GL4_Explosion_Particles";
		position[] = {0, 0, 0};

		intensity = 1;
		interval = 1;
		lifeTime = 0.25;
	};
	
	class GrenadeSmoke
	{
		simulation = "particles";
		type = "GrenadeSmoke1";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};

class SHShellCrater
{
	class ExploAmmoStones
	{
		simulation = "particles";
		type = "DirtSmall";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	
	class CircleDust
	{
		simulation = "particles";
		type = "CircleDustSmall";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};

class SHShellExplosion
{
	class Light
	{
		simulation = "light";
		type = "ExploLightMed";
		position[] = {0, 0, 0};
		intensity = 0.001;
		interval = 1;
		lifeTime = 0.5;
	};

	class Explosion
	{
		simulation = "particles";
		type = "ExplosionParticles";
		position[] = {0, 0, 0};
		intensity = 3;
		interval = 1;
		lifeTime = 0.25;
	};
	
	class ExploAmmoSmoke
	{
		simulation = "particles";
		type = "ExploAmmoSmoke";
		position[] = {0, 0, 0};

		intensity = 0.3;
		interval = 0.3;
		lifeTime = 0.3;
	};
};