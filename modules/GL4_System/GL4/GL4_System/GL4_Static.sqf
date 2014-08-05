// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Static Initialize
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;

if (typeName _a == "Object") then
{
	waitUntil { ( !(isNil "GL4_Initialize") || (time > 1) ) };

	if (isNil "GL4_Initialize") then
	{
		hint "Error: Please create a ""Group Link 4: System"" module to initialize the ""Group Link 4: Static"" module.";
	}
	else
	{
		if (isNil "GL4_Static") then
		{
			GL4_Static = [ [] ];
		};

		waitUntil { !(isNil "GL4_Reinforcement") };

		_b = (synchronizedObjects _a);

		_b = _b - [_a];

		if (count _b > 0) then
		{
			_c = 0;

			while { (_c < count _b) } do
			{
				_d = (_b select _c);

				if (group _d in (GL4_Static select 0) ) then
				{
					hint format ["Note: %1 was synchronized twice with the ""Group Link 4: Static"" module.", group _d];
				}
				else
				{
					GL4_Static set [0, (GL4_Static select 0) + [group _d] ];

					GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [group _d] ];
				};

				_c = _c + 1;
			};

			GL4_Synchronize set [1, True];
		}
		else
		{
			GL4_Synchronize set [1, True];
		};
	};
}
else
{
	GL4_Static = [ [] ];

	waitUntil { !(isNil "GL4_Reinforcement") };

	_b = 1;

	_c = call compile format ["sg%1", _b];

	_d = 0;

	while { (_d < 5) } do
	{
		_c = call compile format ["sg%1", _b];

		if (isNil "_c") then
		{
			_d = _d + 1;
		}
		else
		{
			_d = 0;

			GL4_Static set [0, (GL4_Static select 0) + [_c] ];

			GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [_c] ];
		};

		_b = _b + 1;
	};

	GL4_Synchronize set [1, True];
};