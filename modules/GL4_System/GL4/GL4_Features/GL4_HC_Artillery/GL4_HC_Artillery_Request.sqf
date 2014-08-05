// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery Request
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

_a = _this select 0;

if (isMultiplayer) then
{
	GL4_HC_Artillery_Server_PublicVariable = [1, _a]; publicVariable "GL4_HC_Artillery_Server_PublicVariable";
};

if (isServer) then
{
	{if !(alive gunner vehicle leader _x) then {GL4_HC_Artillery set [1, (GL4_HC_Artillery select 1) - [_x] ] } } forEach (GL4_HC_Artillery select 1);

	if (count (GL4_HC_Artillery select 1) > 0) then
	{
		if ( (GL4_HC_Artillery select 2) < (GL4_High_Command select 9) ) then
		{
			if (GL4_HC_Artillery select 3) then
			{
				if (GL4_HC_Artillery select 4) then
				{
					GL4_HC_Artillery set [3, False];

					GL4_HC_Artillery set [4, False];

					GL4_HC_Artillery set [5, True];

					_b = [" [playerSide, ""HQ""] sidechat""%1 artillery request confirmed. Please stand by."" ", name _a];

					if (local _a) then
					{
						call compile format _b;
					}
					else
					{
						GL4_HC_Artillery_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
					};

					sleep 5 - (random 5);

					_b = [ [" [playerSide, ""HQ""] sidechat""%1 please transfer the artillery fire position by Map - Click."" ", name _a],
	     				       [" [playerSide, ""HQ""] sidechat""%1 please submit the artillery fire range by Map - Click."" ", name _a]

					] call GL4_Random_Select_F;

					if (local _a) then
					{
						call compile format _b;
					}
					else
					{
						GL4_HC_Artillery_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
					};

					if (local _a) then
					{
						[2, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf");
					}
					else
					{
						GL4_HC_Artillery_Player_PublicVariable = [2, _a]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
					};

					_a setVariable ["GL4_HC_Artillery", True, True];

					while { ( (alive _a) && (_a getVariable "GL4_HC_Artillery") ) } do
					{
						sleep 1;
					};

					if (isNil "GL4_HC_Artillery_Marker") then
					{
						_b = [ [" [playerSide, ""HQ""] sidechat""%1 artillery request stopped. Standing By."" ", name _a],
	     					       [" [playerSide, ""HQ""] sidechat""%1 artillery request cancelled. Standing By."" ", name _a]

						] call GL4_Random_Select_F;

						if (local _a) then
						{
							call compile format _b;
						}
						else
						{
							GL4_HC_Artillery_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
						};

						GL4_HC_Artillery set [3, True];

						GL4_HC_Artillery set [4, True];

						if (local _a) then
						{
							[3, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf");
						}
						else
						{
							GL4_HC_Artillery_Player_PublicVariable = [3, _a]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
						};
					}
					else
					{
						GL4_HC_Artillery set [2, (GL4_HC_Artillery select 2) + 1];

						if (local _a) then
						{
							[4, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf");
						}
						else
						{
							GL4_HC_Artillery_Player_PublicVariable = [4, _a]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
						};
					};
				}
				else
				{
					if (time < (GL4_HC_Artillery select 7) ) then
					{
						_c = (GL4_HC_Artillery select 7) - time;

						_b = [ [" [playerSide, ""HQ""] sidechat""%1 we need to reload the artillery. Please be patied."" ", name _a],
						       [" [playerSide, ""HQ""] sidechat""%1 next artillery request can be made in %2 minutes."" ", name _a, _c],
						       [" [playerSide, ""HQ""] sidechat""%1 please wait %2 minutes bevore requesting artillery."" ", name _a, _c],
						       [" [playerSide, ""HQ""] sidechat""%1 artillery will be ready in %2 minutes. Please stand by."" ", name _a, _c]

						] call GL4_Random_Select_F;

						if (local _a) then
						{
							call compile format _b;
						}
						else
						{
							GL4_HC_Artillery_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
						};
					}
					else
					{
						GL4_HC_Artillery set [4, True];
					};
				};	
			}
			else
			{
				_b = [ [" [playerSide, ""HQ""] sidechat""%1 currently all artillery positions are in use."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 at the moment we are unable to give more artillery support."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 please wait till the current artillery fire mission is finished."" ", name _a]

				] call GL4_Random_Select_F;

				if (local _a) then
				{
					call compile format _b;
				}
				else
				{
					GL4_HC_Artillery_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
				};
			};
		}
		else
		{
			_b = [" [playerSide, ""HQ""] sidechat""%1 we can not provide more artillery suppport. Artillery request cancelled."" ", name _a];

			if (local _a) then
			{
				[1, _a, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf");
			}
			else
			{
				GL4_HC_Artillery_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
			};
		};
	}
	else
	{
		_b = [ [" [playerSide, ""HQ""] sidechat""%1 we have lost our artillery positions. Artillery request cancelled."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat""%1 we do not have artillery available. Artillery request cancelled."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat""%1 all artillerys was destroyed. Artillery request failed."" ", name _a]

		] call GL4_Random_Select_F;

		if (local _a) then
		{
			[1, _a, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf");
		}
		else
		{
			GL4_HC_Artillery_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
		};
	};
};