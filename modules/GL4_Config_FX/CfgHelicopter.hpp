class HelicopterExplosionEffects
{
	class LightExp
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
		type = "CloudMedDark";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};

class HelicopterExplosionEffects2
{
	class LightExp
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
		type = "VehExplosionParticles";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 0.2;
	};
	
	class Explosion2
	{
		simulation = "particles";
		type = "FireBallBright";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	
	class Smoke1
	{
		simulation = "particles";
		type = "VehExpSmoke";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
	
	class SmallSmoke1
	{
		simulation = "particles";
		type = "VehExpSmoke2";
		position[] = {0, 0, 0};
		intensity = 1;
		interval = 1;
		lifeTime = 1;
	};
};