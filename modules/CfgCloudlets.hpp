class CfgCloudlets
{
	access = 0;

	class Default;

	class GL4_Explosion_Particles : Default
	{
		interval = 0.1;
		circleRadius = 0;
		circleVelocity[] = {0, 0, 0};
		particleShape = "\ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 0;
		particleFSFrameCount = 32;
		particleFSLoop = 0;
		angleVar = 1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 1;
		lifeTime = 1;
		moveVelocity[] = {0, 1, 0};
		rotationVelocity = 1;
		weight = 10;
		volume = 7.9;
		rubbing = 0.1;
		size[] = {"0.0125 * intensity + 2"};
		color[] = { {1, 1, 1, -2}, {1, 1, 1, 0} };
		animationSpeed[] = {1};
		randomDirectionPeriod = 0.2;
		randomDirectionIntensity = 0.2;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 0;
		positionVar[] = {0, 0.5, 0};
		MoveVelocityVar[] = {0.2, 0.5, 0.2};
		rotationVelocityVar = 1;
		sizeVar = 0.2;
		colorVar[] = {0, 0, 0, 0};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};

	class SmallFireF : Default
	{
		interval = 0.01;
		circleRadius = 0;
		circleVelocity[] = {0, 0, 0};
		particleShape = "\Ca\Data\ParticleEffects\Universal\Universal";
		particleFSNtieth = 16;
		particleFSIndex = 10;
		particleFSFrameCount = 32;
		particleFSLoop = 1;
		angleVar = 1;
		animationName = "";
		particleType = "Billboard";
		timerPeriod = 3;
		lifeTime = 0.5;
		moveVelocity[] = {0, 1, 0};
		rotationVelocity = 1;
		weight = 0.05;
		volume = 0.04;
		rubbing = 0.05;
		size[] = {1, 0};
		sizeCoef = 1;
		color[] = {{1, 1, 1, 0}, {1, 1, 1, -1}, {1, 1, 1, -1}, {1, 1, 1, -1}, {1, 1, 1, -1}, {1, 1, 1, 0}};
		colorCoef[] = {1, 1, 1, 1};
		animationSpeed[] = {1};
		animationSpeedCoef = 1;
		randomDirectionPeriod = 0;
		randomDirectionIntensity = 0;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 0.2;
		position[] = {0, 0, 0};
		positionVar[] = {0.05, 0.2, 0.05};
		moveVelocityVar[] = {0.08, 0.9, 0.08};
		rotationVelocityVar = 0;
		sizeVar = 0.06;
		colorVar[] = {0.1, 0.1, 0.1, 0};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};

	class ObjectDestructionShardsStatic : Default
	{
		interval = 0.1;
		circleRadius = 7;
		circleVelocity[] = {0.001, 0, 0.001};
		particleShape = "\Ca\Data\ParticleEffects\Shard\shard.p3d";
		particleFSNtieth = 1;
		particleFSIndex = 0;
		particleFSFrameCount = 1;
		particleFSLoop = 0;
		angleVar = 1;
		animationName = "";
		particleType = "SpaceObject";
		timerPeriod = 1;
		lifeTime = 60;
		moveVelocity[] = {0, 0, 0};
		rotationVelocity = 0;
		weight = 1.275;
		volume = 1;
		rubbing = 0;
		size[] = {1};
		color[] = {{1, 1, 1, 1}};
		animationSpeed[] = {1};
		randomDirectionPeriod = 0;
		randomDirectionIntensity = 0;
		onTimerScript = "";
		beforeDestroyScript = "";
		lifeTimeVar = 10;
		positionVar[] = {5, 0, 5};
		MoveVelocityVar[] = {0, 0, 0};
		rotationVelocityVar = 0;
		sizeVar = 0.5;
		colorVar[] = {0, 0, 0, 0};
		randomDirectionPeriodVar = 0;
		randomDirectionIntensityVar = 0;
	};
	
	class ObjectDestructionShards : Default {};
	
	class HeliDestructionShards1 : Default {};
	
	class HeliDestructionShards2 : Default {};
};