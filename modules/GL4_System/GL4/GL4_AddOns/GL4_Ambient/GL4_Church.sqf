// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Church
// Idea and Sounds by Operation Flashpoint MOD E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Join_In_Progress.sqf");

while { (True) } do
{
	if ( (dayTime > 10.00) && (dayTime < 19.00) ) then
	{
		sleep 10 + (random 30);

		_a = nearestObjects [player, ["Land_Church_01","Land_Church_02","Land_Church_03"], 500];

		if ( (count _a > 0) && (floor (random 100) < 50) ) then
		{
			if (typeName _b == "Array") then
			{
				{deleteVehicle _x} forEach (_b select 1);
			};

			_b = (GL4_Resource select 32) call GL4_Random_Select_F;
			_c = (GL4_Resource select 33) call GL4_Random_Select_F;
			_d = (GL4_Resource select 34) call GL4_Random_Select_F;

			_e = [_b, _c, _d] call GL4_Random_Select_F;

			_f = 60 + (random 60);

			switch (_e) do
			{
				case _b :
				{
					_f = 60 + (random 60);
				};

				case _c :
				{
					_f = 120 + (random 120);
				};

				case _d :
				{

					_f = 200 + (random 200);
				};
			};

			(_a select 0) say _e;

			sleep _f;
		}
		else
		{
			sleep 240 + (random 240);
		};
	}
	else
	{
		_a = nearestObjects [player, ["Land_Church_01","Land_Church_02","Land_Church_03"], 1000];

		if (typeName _b != "Array") then
		{
			_b = [ [], [] ];
		};

		if (count (_b select 0) > 0) then
		{
			_a = _a - (_b select 0);
		};

		if (count _a > 0) then
		{
			_c = 0;

			while { (_c < count _a) } do
			{
				_d = (_a select _c);

				_b set [0, (_b select 0) + [_d] ];

				_e = "#lightpoint" createVehicleLocal (getPos _d);

				_b set [1, (_b select 1) + [_e] ];

				_e setPos [ (getPos _d select 0), (getPos _d select 1), (getPos _d select 2) + 10];

				_e setLightBrightness 0.1;

				_f = [ [1, 2, 1], [2, 1, 0], [2, 2, 2] ] call GL4_Random_Select_F;

				_e setLightAmbient _f;
				_e setLightColor _f;

				_c = _c + 1;
			};
		};

		sleep 240 + (random 240);
	};
};