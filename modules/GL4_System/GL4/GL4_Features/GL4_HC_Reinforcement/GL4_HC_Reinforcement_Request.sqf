// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement Request
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;

if (isMultiplayer) then
{
	GL4_HC_Reinforcement_Server_PublicVariable = [1, _a]; publicVariable "GL4_HC_Reinforcement_Server_PublicVariable";
};

if (isServer) then
{
	if (isNil "GL4_HC_Reinforcement") exitWith
	{
		_b = [" [playerSide, ""HQ""] sidechat ""%1 H.C. Reinforcement initializing... Please stand by..."" ", name _a];

		if (local _a) then
		{
			call compile format _b;
		}
		else
		{
			GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
		};
	};

	if (GL4_HC_Reinforcement select 3) then
	{
		GL4_HC_Reinforcement set [1, (GL4_HC_Reinforcement select 1) - [group _a] ];

		if (count (GL4_HC_Reinforcement select 1) > 0) then
		{
			if (count (GL4_HC_Reinforcement select 2) < (GL4_High_Command select 1) ) then
			{
				GL4_HC_Reinforcement set [3, False];

				_b = [" [playerSide, ""HQ""] sidechat ""%1 reinforcements request confirmed. Please stand by."" ", name _a];

				if (local _a) then
				{
					call compile format _b;
				}
				else
				{
					GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
				};

				GL4_HC_Reinforcement set [4, True];

				sleep 5 - (random 5);

				if (GL4_HC_Reinforcement select 4) then
				{
					_c = [_a] call (GL4_HC_Reinforcement_F select 0);

					if ({alive _x} count (units _c) > 0) then
					{
						_a setVariable ["GL4_HC_Reinforcement", True];

						if (local _a) then
						{
							[2, _a, -1] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Server.sqf");
						}
						else
						{
							GL4_HC_Reinforcement_Player_PublicVariable = [2, _a, -1]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
						};

						while { ( (alive _a) && (typeName (_a getVariable "GL4_HC_Reinforcement") == "Bool") ) } do
						{
							sleep 1;
						};

						_d = _a getVariable "GL4_HC_Reinforcement";

						if (typeName _d == "Array") then
						{
							sleep 5 - (random 5);

							GL4_HC_Reinforcement set [2, (GL4_HC_Reinforcement select 2) + [_c] ];

							[_a, _c, _d] call (GL4_HC_Reinforcement_F select 1);

							if (GL4_HC_Reinforcement select 5) then
							{
								GL4_HC_Reinforcement set [5, False];

								if (local _a) then
								{
									[4, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Player.sqf");
								}
								else
								{
									GL4_HC_Reinforcement_Player_PublicVariable = [4, _a]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
								};
							};
						}
						else
						{
							_b = [ [" [playerSide, ""HQ""] sidechat""%1 reinforcement request stopped. Standing By."" ", name _a],
	     						       [" [playerSide, ""HQ""] sidechat""%1 reinforcement request cancelled. Standing By."" ", name _a]

							] call GL4_Random_Select_F;

							if (local _a) then
							{
								call compile format _b;
							}
							else
							{
								GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
							};
						};
					}
					else
					{
						if (count (GL4_HC_Reinforcement select 1) > 0) then
						{
							_b = [ [" [playerSide, ""HQ""] sidechat""%1 currently we are unable to send more reinforcement."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 at the moment we do not have more reinforcement available."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 currently we do not have any callable reinforcement."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 currently we can not supply more reinforcement."" ", name _a]

							] call GL4_Random_Select_F;

							if (local _a) then
							{
								call compile format _b;
							}
							else
							{
								GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
							};
						}
						else
						{
							_b = [ [" [playerSide, ""HQ""] sidechat""%1 currently we are unable to send reinforcement."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 at the moment we do not have reinforcement available."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 currently we do not have callable reinforcement."" ", name _a],
							       [" [playerSide, ""HQ""] sidechat""%1 currently we can not supply reinforcement."" ", name _a]

							] call GL4_Random_Select_F;

							if (local _a) then
							{ 
								call compile format _b;
							}
							else
							{
								GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
							};
						};
					};
				};

				GL4_HC_Reinforcement set [3, True];
			}
			else
			{		
				_b = [ [" [playerSide, ""HQ""] sidechat""%1 currently we are unable to send more reinforcement."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 at the moment we do not have more reinforcement available."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 currently we do not have any callable reinforcement."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 currently we can not supply more reinforcement."" ", name _a]

				] call GL4_Random_Select_F;

				if (local _a) then
				{
					call compile format _b;
				}
				else
				{
					GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
				};
			};
		}
		else
		{
			_b = [ [" [playerSide, ""HQ""] sidechat""%1 we do not have reinforcement available. Reinforcement request cancelled."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 we can not supply reinforcement any longer. Reinforcement request cancelled."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 we are unable to supply reinforcement. Reinforcement request failed."" ", name _a]

			] call GL4_Random_Select_F;

			if (local _a) then
			{
				[1, _a, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Player.sqf");
			}
			else
			{
				GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
			};
		};
	}
	else
	{
		_b = [ [" [playerSide, ""HQ""] sidechat""%1 please be patient. We need to confirm the current reinforcement request."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat""%1 please wait till we have confirmed the current reinforcement request."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat""%1 the latest reinforcement request is not confirmed so far. Please stand by."" ", name _a]

		] call GL4_Random_Select_F;

		if (local _a) then
		{
			call compile format _b;
		}
		else
		{
			GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
		};
	};
};