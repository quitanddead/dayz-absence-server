// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Marker Functions
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

GL4_Marker_F = [

	// ////////////////////////////////////////////////////////////////////////////
	// Marker Function #0
	// ////////////////////////////////////////////////////////////////////////////
	// Marker
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = (GL4_Reinforcement select 0);

	if (count _a > 0) then
	{
		_b = 0;

		while { (_b < count _a) } do
		{
			_c = (_a select _b);

			[_c] spawn (GL4_Marker_F select 1);

			_b = _b + 1;
		};
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Marker Function #1
	// ////////////////////////////////////////////////////////////////////////////
	// Marker
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c","_d","_e"];

	_a = _this select 0;

	if (GL4_Global select 62) then
	{
		_b = format ["%1", _a];

		_c = (vehicle leader _a);

		if (typeName (GL4_Global select 63) == "Bool") then
		{
			_d = [_c] call (GL4_Icon_F select 0);
		}
		else
		{
			_d = (GL4_Global select 63);
		};

		createMarker [_b, position _c];

		_b setMarkerShape "ICON"; _b setMarkerType _d; _b setMarkerSize [0.7,0.7]; _b setMarkerText _b; _b setMarkerColor "ColorBlue";

		while { (alive _c) } do
		{
			_c = (vehicle leader _a);

			_e = (GL4_Suppressed select 0) + (GL4_Defend select 0) + (GL4_Static select 0) + (GL4_House_Search select 1) + (GL4_Extraction select 2) + (GL4_Reinforcement select 1) + (GL4_Reinforcement select 2) + (GL4_Advancing select 0) + (GL4_Location select 0) + (GL4_Patrol select 0) + (GL4_Idle select 0) + (GL4_Body_Detect select 0) + (GL4_Detection select 0) + (GL4_Garrison select 0) + (GL4_Car_Weapon select 1) + (GL4_Artillery select 0) + (GL4_Airstrike select 0);

			if (_a in _e) then
			{
				[_a, _b, _c] call (GL4_Marker_F select 2);
			}
			else
			{
				_b setMarkerText _b; _b setMarkerColor "ColorBlue";
			};

			_b setMarkerPos (getPos _c);

			sleep 1;
		};

		deleteMarker _b;
	};

	},

	// ////////////////////////////////////////////////////////////////////////////
	// Marker Function #2
	// ////////////////////////////////////////////////////////////////////////////
	// Marker
	// By =\SNKMAN/=
	// ////////////////////////////////////////////////////////////////////////////
	{private ["_a","_b","_c"];

	_a = _this select 0;
	_b = _this select 1;
	_c = _this select 2;

	if (_a in (GL4_Suppressed select 0) ) then
	{
		_b setMarkerText format ["%1 ( Suppressed )", _b];
	}	
	else
	{
		if (_a in (GL4_Defend select 0) ) then
		{
			_b setMarkerText format ["%1 ( Defend )", _b];
		}
		else
		{
			if (_a in (GL4_Static select 0) ) then
			{
				_b setMarkerText format ["%1 ( Static )", _b];
			}
			else
			{
				if (_a in (GL4_House_Search select 1) ) then
				{
					_b setMarkerText format ["%1 ( House Search )", _b];
				}
				else
				{
					if (_a in (GL4_Extraction select 2) ) then
					{
						_b setMarkerText format ["%1 ( Extraction )", _b];
					}
					else
					{
						if ( (_a in (GL4_Reinforcement select 1) ) && (_a in (GL4_Reinforcement select 2) ) ) then
						{
							_b setMarkerText format ["%1 ( Reinforcement )", _b];
						}
						else
						{
							if (_a in (GL4_Reinforcement select 1) ) then
							{
								_b setMarkerText format ["%1 ( COMBAT )", _b];

								switch (behaviour _c) do
								{
									case "COMBAT" :
									{
										_b setMarkerColor "ColorRed";
									};

									case default
									{
										_b setMarkerColor "ColorBlue";
									};
								};
							}
							else
							{
								if (_a in (GL4_Advancing select 0) ) then
								{
									_b setMarkerText format ["%1 ( Advancing )", _b];
								}
								else
								{
									if (_a in (GL4_Location select 0) ) then
									{
										_b setMarkerText format ["%1 ( Location )", _b];
									}
									else
									{
										if (_a in (GL4_Patrol select 0) ) then
										{
											_b setMarkerText format ["%1 ( Patrol )", _b];
										}
										else
										{
											if (_a in (GL4_Idle select 0) ) then
											{
												_b setMarkerText format ["%1 ( Patrol )", _b];
											}
											else
											{
												if (_a in (GL4_Body_Detect select 0) ) then
												{
													_b setMarkerText format ["%1 ( Body Detect )", _b];
												}
												else
												{
													if (_a in (GL4_Detection select 0) ) then
													{
														_b setMarkerText format ["%1 ( Detection )", _b];
													}
													else
													{
														if (_a in (GL4_Garrison select 0) ) then
														{
															_b setMarkerText format ["%1 ( Garrison )", _b];
														}
														else
														{
															if (_a in (GL4_Car_Weapon select 1) ) then
															{
																_b setMarkerText format ["%1 ( Car Weapon )", _b];
															}
															else
															{
																if (_a in (GL4_Artillery select 0) ) then
																{
																	_b setMarkerText format ["%1 ( Artillery )", _b];
																}
																else
																{
																	if (_a in (GL4_Airstrike select 0) ) then
																	{
																		_b setMarkerText format ["%1 ( Airstrike )", _b];
																	};
																};
															};
														};
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};

	}
];