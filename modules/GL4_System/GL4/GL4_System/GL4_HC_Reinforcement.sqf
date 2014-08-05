// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = _this select 0;

if (typeName _a == "Object") exitWith
{
	GL4_HC_Reinforcement = [ [], [], [], True, True, True, "Logic" createVehicleLocal [0,0,0], "Logic" createVehicleLocal [0,0,0] ];

	if (isNil "GL4_High_Command") then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_Database\GL4_High_Command.sqf");
	};

	if (isServer) then
	{
		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_HC_Reinforcement_F.sqf");

		_b = [];

		if (isMultiplayer) then
		{
			GL4_High_Command set [0, False];
		};

		if (GL4_High_Command select 0) then
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
					GL4_HC_Reinforcement set [0, (GL4_HC_Reinforcement select 0) + [_e] ];
				}
				else
				{
					if ( (_e isKindOf "Man") || (_e isKindOf "Car") || (_e isKindOf "Tank") || (_e isKindOf "Air") ) then
					{	
						GL4_HC_Reinforcement set [1, (GL4_HC_Reinforcement select 1) + [group _e] ];
					};
				};

				_c = _c + 1;
			};

			publicVariable "GL4_HC_Reinforcement";
		};
	}
	else
	{
		"GL4_HC_Reinforcement_Player_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Player.sqf") };
	};

	if (isDedicated) then
	{
		"GL4_HC_Reinforcement_Server_PublicVariable" addPublicVariableEventHandler { (_this select 1) execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Server.sqf") };
	}
	else
	{
		[] spawn
		{
			waitUntil { ( (player == player) && (time > 0) ) };

			if (player == player) then
			{
				if (vehicle player in (GL4_HC_Reinforcement select 0) ) then
				{
					if (count (GL4_HC_Reinforcement select 1) > 0) then
					{
						call compile preprocessFile "\Ca\Modules\Functions\Misc\fn_commsMenuCreate.sqf";

						GL4_HC_Reinforcement_Menu = [

							["H.C. Reinforcement", False],
							["Request", [2], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Request.sqf"") "] ], "1", "1"]
						];

						if (isNil "GL4_Array_Push_F") then
						{
							call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Extension_F.sqf");
						};

						[BIS_MENU_GroupCommunication, ["H.C. Reinforcement", [0], "#User:GL4_HC_Reinforcement_Menu", -5, [ ["expression", ""] ], "1", "1"] ] call GL4_Array_Push_F;

						GL4_HC_Reinforcement set [0, (GL4_HC_Reinforcement select 0) - [vehicle player] ];

						GL4_HC_Reinforcement set [0, (GL4_HC_Reinforcement select 0) + [name player] ];
					};
				};
			};
		};
	};
};

if (typeName _a == "Array") exitWith
{
	if (count _a == 0) then
	{
		GL4_System = [];

		GL4_System set [7, [] ];

		GL4_System set [8, [] ];

		GL4_System set [9, [] ];

		GL4_System set [10, True];

		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_System_F.sqf");

		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Vehicle_Mount_F.sqf");

		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Helicopter_F.sqf");

		call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Remount_F.sqf");
	};
};