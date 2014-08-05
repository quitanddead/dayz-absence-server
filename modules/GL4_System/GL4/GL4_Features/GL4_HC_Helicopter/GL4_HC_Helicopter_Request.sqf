// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter Request
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;

if (isMultiplayer) then
{
	GL4_HC_Helicopter_Server_PublicVariable = [1, _a]; publicVariable "GL4_HC_Helicopter_Server_PublicVariable";
};

if (isServer) then
{
	if (isNil "GL4_HC_Helicopter") exitWith
	{
		_b = [" [playerSide, ""HQ""] sidechat ""%1 H.C. Helicopter initializing... Please stand by..."" ", name _a];

		if (local _a) then
		{
			call compile format _b;
		}
		else
		{
			GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
		};
	};

	if (GL4_HC_Helicopter select 4) then
	{
		if (count (GL4_HC_Helicopter select 1) > 0) then
		{
			if (count (GL4_HC_Helicopter select 2) < (GL4_High_Command select 5) ) then
			{
				GL4_HC_Helicopter set [4, False];

				_b = [" [playerSide, ""HQ""] sidechat ""%1 helicopter request confirmed. Please stand by."" ", name _a];

				if (local _a) then
				{
					call compile format _b;
				}
				else
				{
					GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
				};

				GL4_HC_Helicopter set [5, True];

				sleep 5 - (random 5);

				if (GL4_HC_Helicopter select 5) then
				{
					_c = [_a] call (GL4_HC_Helicopter_F select 0);

					_d = (vehicle leader _c);

					if ( (alive _d) && (alive driver _d) && (canMove _d) ) then
					{
						if (isMultiplayer) then
						{
							GL4_HC_Helicopter set [2, (GL4_HC_Helicopter select 2) + [_c] ];
						};

						[_a, _c] call (GL4_HC_Helicopter_F select 1);

						if (local _a) then
						{
							[2, _a, _d] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Player.sqf");
						}
						else
						{
							GL4_HC_Helicopter_Player_PublicVariable = [2, _a, _d]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
						};
					}
					else
					{
						if (count (GL4_HC_Helicopter select 1) > 0) then
						{
							_b = [ [" [playerSide, ""HQ""] sidechat""%1 currently we are unable to send more helicopters."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 at the moment all available helicopters are in use."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 currently all available helicopters was requested."" ", name _a]

							] call GL4_Random_Select_F;

							if (local _a) then
							{
								call compile format _b;
							}
							else
							{
								GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
							};
						}
						else
						{
							_b = [ [" [playerSide, ""HQ""] sidechat""%1 we do not have available helicopters. Helicopter request cancelled."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 we can not supply helicopters any longer. Helicopter request cancelled."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 we are unable to supply helicopters. Helicopter request failed."" ", name _a]

							] call GL4_Random_Select_F;

							if (local _a) then
							{
								[1, _a, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Player.sqf");
							}
							else
							{
								GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
							};
						};
					};
				};

				GL4_HC_Helicopter set [4, True];
			}
			else
			{		
				_b = [ [" [playerSide, ""HQ""] sidechat""%1 currently we are unable to send more helicopters."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 at the moment we do not have more helicopters available."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 currently we do not have any callable helicopters."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 currently we can not supply more helicopters."" ", name _a]

				] call GL4_Random_Select_F;

				if (local _a) then
				{
					call compile format _b;
				}
				else
				{
					GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
				};
			};
		}
		else
		{
			_b = [ [" [playerSide, ""HQ""] sidechat""%1 we do not have available helicopters. Helicopter request cancelled."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 we can not supply helicopters any longer. Helicopter request cancelled."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 we are unable to supply helicopters. Helicopter request failed."" ", name _a]

			] call GL4_Random_Select_F;

			if (local _a) then
			{
				[1, _a, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Player.sqf");
			}
			else
			{
				GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
			};
		};
	}
	else
	{
		_b = [ [" [playerSide, ""HQ""] sidechat""%1 please be patient. We need to confirm the current helicopter request."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat""%1 please wait till we have confirmed the current helicopter request."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat""%1 the latest helicopters request is not confirmed so far. Please stand by."" ", name _a]

		] call GL4_Random_Select_F;

		if (local _a) then
		{
			call compile format _b;
		}
		else
		{
			GL4_HC_Helicopter_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Helicopter_Player_PublicVariable";
		};
	};
};