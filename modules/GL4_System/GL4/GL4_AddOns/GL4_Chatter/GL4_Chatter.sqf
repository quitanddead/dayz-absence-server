// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Radio Chatter
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_Radio_Chatter.sqf");

call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Join_In_Progress.sqf");

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call (GL4_Chatter_F select 5)"];

if (player == leader player) then
{
	[player] execVM (GL4_Path+"GL4\GL4_AddOns\GL4_Chatter\GL4_Chatter_Assign.sqf");
};

while { (GL4_Local select 22) } do
{
	sleep 10;

	_a = (vehicle player);

	_b = getNumber (configFile >> "CfgVehicles" >> (typeOf _a) >> "side");

	switch (_b) do
	{
		case 0 :
		{
			_a = (vehicle player);

			if ( (_a isKindOf "Tank") && (isEngineOn _a) && (GL4_Chatter select 1) ) then
			{
				[ (GL4_Chatter select 2) ] call (GL4_Chatter_F select 7);

				while { ( (_a isKindOf "Tank") && (isEngineOn _a) && (GL4_Chatter select 1) ) } do
				{
					_c = (GL4_Resource select 22) call GL4_Random_Select_F;

					0 fadeSound (GL4_Chatter select 2);

					playSound _c;

					sleep 30 - (random 30);

					_a = (vehicle player);
				};
			}
			else
			{
				if ( (_a isKindOf "Wheeled_APC") && (isEngineOn _a) && (GL4_Chatter select 1) ) then
				{
					[ (GL4_Chatter select 2) ] call (GL4_Chatter_F select 7);

					while { ( (_a isKindOf "Wheeled_APC") && (isEngineOn _a) && (GL4_Chatter select 1) ) } do
					{
						_c = (GL4_Resource select 22) call GL4_Random_Select_F;

						0 fadeSound (GL4_Chatter select 2);

						playSound _c;

						sleep 30 - (random 30);

						_a = (vehicle player);
					};
				};
			};
		};

		case 1 :
		{
			_a = (vehicle player);

			if ( (_a isKindOf "Air") && (isEngineOn _a) && (GL4_Chatter select 1) ) then
			{
				[ (GL4_Chatter select 2) ] call (GL4_Chatter_F select 7);

				while { ( (_a isKindOf "Air") && (isEngineOn _a) && (GL4_Chatter select 1) ) } do
				{
					if (floor (random 100) < 99) then
					{
						_c = (GL4_Resource select 20) + (GL4_Resource select 23) call GL4_Random_Select_F;

						0 fadeSound (GL4_Chatter select 2);

						playSound _c;

						sleep 30 - (random 30);
					}
					else
					{
						if (floor (random 100) < 50) then
						{
							[_a] call (GL4_Chatter_F select 3);

							sleep 30 - (random 30);
						}
						else
						{
							[_a] call (GL4_Chatter_F select 4);

							sleep 30 - (random 30);
						};
					};

					_a = (vehicle player);
				};
			}
			else
			{
				if ( (_a isKindOf "Tank") && (isEngineOn _a) && (GL4_Chatter select 1) ) then
				{
					[ (GL4_Chatter select 2) ] call (GL4_Chatter_F select 7);

					while { ( (_a isKindOf "Tank") && (isEngineOn _a) && (GL4_Chatter select 1) ) } do
					{
						_c = (GL4_Resource select 21) + (GL4_Resource select 23) call GL4_Random_Select_F;

						0 fadeSound (GL4_Chatter select 2);

						playSound _c;

						sleep 30 - (random 30);

						_a = (vehicle player);
					};
				}
				else
				{
					if ( ( (_a isKindOf "Wheeled_APC") || (_a isKindOf "HMMWV_Base") ) && (isEngineOn _a) && (GL4_Chatter select 1) ) then
					{
						[ (GL4_Chatter select 2) ] call (GL4_Chatter_F select 7);

						while { ( ( (_a isKindOf "Wheeled_APC") || (_a isKindOf "HMMWV_Base") ) && (isEngineOn _a) && (GL4_Chatter select 1) ) } do
						{
							_c = (GL4_Resource select 21) + (GL4_Resource select 23) call GL4_Random_Select_F;

							0 fadeSound (GL4_Chatter select 2);

							playSound _c;

							sleep 30 - (random 30);

							_a = (vehicle player);
						};
					};
				};
			};
		};

		case 2 :
		{
			_a = (vehicle player);

			if ( (_a isKindOf "Tank") && (isEngineOn _a) && (GL4_Chatter select 1) ) then
			{
				[ (GL4_Chatter select 2) ] call (GL4_Chatter_F select 7);

				while { ( (_a isKindOf "Tank") && (isEngineOn _a) && (GL4_Chatter select 1) ) } do
				{
					_c = (GL4_Resource select 22) call GL4_Random_Select_F;

					0 fadeSound (GL4_Chatter select 2);

					playSound _c;

					sleep 30 - (random 30);

					_a = (vehicle player);
				};
			}
			else
			{
				if ( (_a isKindOf "Wheeled_APC") && (isEngineOn _a) && (GL4_Chatter select 1) ) then
				{
					[ (GL4_Chatter select 2) ] call (GL4_Chatter_F select 7);

					while { ( (_a isKindOf "Wheeled_APC") && (isEngineOn _a) && (GL4_Chatter select 1) ) } do
					{
						_c = (GL4_Resource select 22) call GL4_Random_Select_F;

						0 fadeSound (GL4_Chatter select 2);

						playSound _c;

						sleep 30 - (random 30);

						_a = (vehicle player);
					};
				};
			};

		};
	};
};