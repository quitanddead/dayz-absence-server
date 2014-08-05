// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery Position
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g","_h"];

_a = _this select 0;
_b = _this select 1;

if (isMultiplayer) then
{
	GL4_HC_Artillery_Server_PublicVariable = [2, _a, _b]; publicVariable "GL4_HC_Artillery_Server_PublicVariable";
};

if (isServer) then
{
	GL4_HC_Artillery set [3, False];

	GL4_HC_Artillery set [4, False];

	if (isNil "GL4_HC_Artillery_Marker") then
	{
		GL4_HC_Artillery_Marker = "GL4_HC_Artillery_Marker";

		_c = GL4_HC_Artillery_Marker;

		createMarker [_c, _b];

		_c setMarkerShape "ICON"; _c setMarkerType "selector_selectedMission"; _c setMarkerSize [0.7, 0.7]; _c setMarkerText "<Artillery>"; _c setMarkerColor "ColorBlue";
	}
	else
	{
		GL4_HC_Artillery_Marker setMarkerPos _b;
	};

	_d = [ [" [playerSide, ""HQ""] sidechat""%1 artillery coordinates confirmed. Please stand by."" ", name _a],
	       [" [playerSide, ""HQ""] sidechat""%1 artillery target location confirmed. Please stand by."" ", name _a],
	       [" [playerSide, ""HQ""] sidechat""%1 artillery fire location confirmed. Please stand by."" ", name _a]

	] call GL4_Random_Select_F;

	if (local _a) then
	{
		call compile format _d;
	}
	else
	{
		GL4_HC_Artillery_Player_PublicVariable = [1, _a, _d]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
	};

	_e = [_a, _b] call (GL4_HC_Artillery_F select 0);

	if (_e select 0) exitWith
	{
		sleep 5 - (random 5);

		GL4_HC_Artillery set [3, True];

		GL4_HC_Artillery set [4, True];

		if (local _a) then
		{
			call compile format (_e select 1);
		}
		else
		{
			GL4_HC_Artillery_Player_PublicVariable = [1, _a, (_e select 1)]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
		};
	};

	if (alive _a) then
	{
		if (local _a) then
		{
			[3, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf");
		}
		else
		{
			GL4_HC_Artillery_Player_PublicVariable = [3, _a]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
		};

		sleep 10 - (random 5);

		if (GL4_HC_Artillery select 5) then
		{
			_d = [ [" [playerSide, ""HQ""] sidechat""%1 watch out! Artillery will start to fire within the next few seconds."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 artillery ready for fire mission."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 artillery support is on the way."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 prepare for artillery fire mission."" ", name _a],
			       [" [playerSide, ""HQ""] sidechat""%1 artillery strike is on the way."" ", name _a]

			] call GL4_Random_Select_F;

			if (local _a) then
			{
				call compile format _d;
			}
			else
			{
				GL4_HC_Artillery_Player_PublicVariable = [1, _a, _d]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
			};

			_e = (GL4_HC_Artillery select 1);

			_f = 0;

			while { (_f < count _e) } do
			{
				_g = (_e select _f);

				_h = (vehicle leader _g);

				GL4_HC_Artillery set [6, (GL4_HC_Artillery select 6) + [_h] ];

				sleep 1 + (random 2);

				if ( (alive gunner _h) && (canFire _h) ) then
				{
					[_a, _h, _b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Fire.sqf");
				};

				_f = _f + 1;
			};

			while { !(GL4_HC_Artillery select 3) } do
			{
				sleep 1;
			};

			if (GL4_HC_Artillery select 5) then
			{
				if (local _a) then
				{
					[5, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf");
				}
				else
				{
					GL4_HC_Artillery_Player_PublicVariable = [5, _a]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
				};

				_d = [ [" [playerSide, ""HQ""] sidechat""%1 artillery fire mission complete."" ", name _a],
				       [" [playerSide, ""HQ""] sidechat""%1 artillery support successful."" ", name _a]

				] call GL4_Random_Select_F;

				if (local _a) then
				{
					call compile format _d;
				}
				else
				{
					GL4_HC_Artillery_Player_PublicVariable = [1, _a, _d]; publicVariable "GL4_HC_Artillery_Player_PublicVariable";
				};
			};
		}
		else
		{
			GL4_HC_Artillery set [3, True];

			GL4_HC_Artillery set [7, time + (GL4_High_Command select 13) ];
		};
	};

	deleteMarker _c;

	GL4_HC_Artillery_Marker = nil;
};