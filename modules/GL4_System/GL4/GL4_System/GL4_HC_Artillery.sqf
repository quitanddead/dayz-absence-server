// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = _this select 0;

if (typeName _a == "Object") then
{
	GL4_HC_Artillery = [ [], [], 0, True, True, True, [], time];

	if (isNil "GL4_High_Command") then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_High_Command.sqf");
	};

	if (isServer) then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_HC_Artillery_F.sqf");

		_b = [];

		if (isMultiplayer) then
		{
			GL4_High_Command set [8, False];
		};

		if (GL4_High_Command select 8) then
		{
			_b = [vehicle player] call compile preProcessFile (GL4_Path+"GL4\GL4_System\GL4_HC_Friendly.sqf");
		}
		else
		{
			if (_a isKindOf "Logic") then
			{			
				_b = (synchronizedObjects _a);

				_b = _b - [_a];
			};
		};

		if (count _b > 0) then
		{
			_c = 0;

			while { (_c < count _b) } do
			{
				_d = (_b select _c);

				_e = (vehicle leader _d);

				if ( { (isPlayer _x) } count (units _d) > 0) then
				{
					GL4_HC_Artillery set [0, (GL4_HC_Artillery select 0) + [_e] ];
				}
				else
				{
					if ( (_e isKindOf "StaticWeapon") || (_e isKindOf "Tank") ) then
					{
						GL4_HC_Artillery set [1, (GL4_HC_Artillery select 1) + [group _e] ];
					};
				};

				_c = _c + 1;
			};

			publicVariable "GL4_HC_Artillery";
		};
	}
	else
	{
		"GL4_HC_Artillery_Player_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Player.sqf") };
	};

	if (isDedicated) then
	{
		"GL4_HC_Artillery_Server_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Server.sqf") };
	}
	else
	{
		[] spawn
		{
			waitUntil { ( (player == player) && (time > 0) ) };

			if (player == player) then
			{
				if (vehicle player in (GL4_HC_Artillery select 0) ) then
				{
					if (count (GL4_HC_Artillery select 1) > 0) then
					{
						if (GL4_High_Command select 14) then
						{
							{ [_x] call (GL4_Icon_F select 0) } forEach (GL4_HC_Artillery select 1);
						};

						call compile preprocessFile "\Ca\Modules\Functions\Misc\fn_commsMenuCreate.sqf";

						GL4_HC_Artillery_Menu = [

							["H.C. Artillery", False],
							["Request", [2], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Request.sqf"") "] ], "1", "1"]
						];

						if (isNil "GL4_Array_Push_F") then
						{
							call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Extension_F.sqf");
						};

						[BIS_MENU_GroupCommunication, ["H.C. Artillery", [0], "#User:GL4_HC_Artillery_Menu", -5, [ ["expression", ""] ], "1", "1"] ] call GL4_Array_Push_F;

						GL4_HC_Artillery set [0, (GL4_HC_Artillery select 0) - [vehicle player] ];

						GL4_HC_Artillery set [0, (GL4_HC_Artillery select 0) + [name player] ];
					};
				};
			};
		};
	};
};