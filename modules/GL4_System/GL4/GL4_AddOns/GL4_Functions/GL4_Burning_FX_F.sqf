// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Burning FX Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Burning_FX_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Burning FX Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Burning FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b"];

	_a = _this select 0;

	if (GL4_Local select 74) then
	{
		_b = (sizeOf typeOf _a);

		_b = _b * 15;

		[_a, _b] spawn (GL4_Fire_FX_F select 1);

		[_a, _b] spawn (GL4_Burning_FX_F select 1);
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Burning FX Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Burning FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e","_f","_g"];

	_a = _this select 0;
	_b = _this select 1;

	_c = time + _b;

	_d = time + 3;

	while { (time < _c) } do
	{
		_e = (vehicle player);

		if ( (_e isKindOf "Man") && (_e distance _a < 50) ) then
		{
			_f = (_e distance _a);

			if (_f <= 10) then
			{
				"dynamicBlur" ppEffectEnable True;

				if (_e in (GL4_Burning_FX select 0) ) then
				{
					_g = False;
				}
				else
				{
					_g = True;

					if (time > _d) then
					{
						_d = time + 3;

						titleRsc ["GL4_Burning", "PLAIN", 2];

						"dynamicBlur" ppEffectAdjust [5 / _f];
						"dynamicBlur" ppEffectCommit 1;

						_e setDammage (getDammage _e + 0.1 / _f);
					};
				};

				if ( (_f < 5) && (_g) ) then
				{
					GL4_Burning_FX set [0, (GL4_Burning_FX select 0) + [_e] ];

					if (isMultiplayer) then
					{
						GL4_AddOn_PublicVariable = [5, _e]; publicVariable "GL4_AddOn_PublicVariable";

						[_e] spawn (GL4_Fire_FX_F select 2);
					}
					else
					{
						[_e] spawn (GL4_Fire_FX_F select 2);
					};
				};
			}
			else
			{
				if (_g) then
				{
					if ( (_f > 10) && (_f <= 15) ) then
					{
						"dynamicBlur" ppEffectAdjust [3 / _f];
						"dynamicBlur" ppEffectCommit 1;
					}
					else
					{
						if ( (_f > 15) && (_f <= 20) ) then
						{
							"dynamicBlur" ppEffectAdjust [0];
							"dynamicBlur" ppEffectCommit 1;
						};
					};
				};
			};

			sleep 1;
		}
		else
		{
			sleep 10;
		};
	};

	"dynamicBlur" ppEffectEnable False;

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Burning FX Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Burning FX
	// Script by =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	_b = time + 3;

	while { !(isNull _a) } do
	{
		if (inflamed _a) then
		{
			while { (inflamed _a) } do
			{
				_c = (vehicle player);

				if ( (_c isKindOf "Man") && (alive _c) && (_c distance _a < 50) ) then
				{
					_d = (_c distance _a);

					if (_d <= 3) then
					{
						"dynamicBlur" ppEffectEnable True;

						if (_c in (GL4_Burning_FX select 0) ) then
						{
							_e = False;
						}
						else
						{
							_e = True;

							if (time > _b) then
							{
								_b = time + 3;

								titleRsc ["GL4_Burning", "PLAIN", 2];

								"dynamicBlur" ppEffectAdjust [1 / _d];
								"dynamicBlur" ppEffectCommit 1;

								_c setDammage (getDammage _c + 0.1 / _d);
							};
						};
					}
					else
					{
						if (_e) then
						{
							if ( (_d > 3) && (_d <= 5) ) then
							{
								"dynamicBlur" ppEffectAdjust [1 / _d];
								"dynamicBlur" ppEffectCommit 1;
							}
							else
							{
								if ( (_d > 5) && (_d <= 10) ) then
								{
									"dynamicBlur" ppEffectAdjust [0];
									"dynamicBlur" ppEffectCommit 1;
								};
							};
						};
					};

					sleep 1;
				}
				else
				{
					sleep 10;
				};
			};

			"dynamicBlur" ppEffectEnable False;
		}
		else
		{
			sleep 10;
		};
	};

	}
];