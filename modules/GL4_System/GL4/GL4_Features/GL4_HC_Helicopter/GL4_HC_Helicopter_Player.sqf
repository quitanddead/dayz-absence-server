// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Helicopter Player
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;
_b = _this select 1;

switch (_a) do
{
	case 1 :
	{
		if (local _b) then
		{
			_c = _this select 2;

			call compile format _c;
		};
	};

	case 2 :
	{
		if (local _b) then
		{
			_c = _this select 2;

			if (leader _c != _b) then
			{
				sleep 1;

				if (GL4_High_Command select 7) then
				{
					[group _c] call (GL4_Icon_F select 0);
				};

				_c setVariable ["GL4_HC_Helicopter", getPos _c];

				GL4_HC_Helicopter set [2, (GL4_HC_Helicopter select 2) + [group _c] ];

				[driver _c] join _b;

				GL4_HC_Helicopter set [3, (GL4_HC_Helicopter select 3) + [_c] ];

				GL4_HC_Helicopter set [5, True];
			};

			if (GL4_HC_Helicopter select 6) then
			{
				GL4_HC_Helicopter set [6, False];

				hint "Instruction: You can change the helicopter(s) destination at any time by select the helicopter(s) in your group list with the F - Keys and Map - Location Click.";

				GL4_HC_Helicopter_Menu set [2, ["Fly Low", [3], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Low.sqf"") "] ], "1", "1"] ];

				GL4_HC_Helicopter_Menu set [3, ["Fly High", [4], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_High.sqf"") "] ], "1", "1"] ];

				GL4_HC_Helicopter_Menu set [4, ["Land", [5], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Land.sqf"") "] ], "1", "1"] ];

				GL4_HC_Helicopter_Menu set [5, ["Status", [6], "", -5, [ ["expression", "[player, (groupSelectedUnits player) ] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Status.sqf"") "] ], "1", "1"] ];

				GL4_HC_Helicopter_Menu set [6, ["Cancel", [7], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Cancel.sqf"") "] ], "1", "1"] ];
			};

			while { ( (alive _b) && (alive _c) && (vehicle _b != _c) && (GL4_HC_Helicopter select 5) ) } do
			{
				sleep 1;
			};

			if (alive _c) then
			{
				if ( (alive _b) && (vehicle _b == _c) ) then
				{
					hint "Instruction: Please choose your destination by select the helicopter(s) in your group list with the F - Keys and Map - Click.";

					_d = _c addAction ["Fly Low", (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Low.sqf"), _c, 2];

					_e = _c addAction ["Fly High", (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_High.sqf"), _c, 2];

					_f = _c addAction ["Land", (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Land.sqf"), _c, 2];

					while { ( (alive _c) && (vehicle _b == _c) && (GL4_HC_Helicopter select 5) ) } do
					{
						sleep 1;
					};

					{_c removeAction _x} forEach [_d, _e, _f];

					if (GL4_HC_Helicopter select 5) then
					{
						if (alive _c) then
						{
							[2, _b, _c] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Helicopter\GL4_HC_Helicopter_Player.sqf");
						};
					};
				};
			}
			else
			{
				call compile format [" [playerSide, ""HQ""] sidechat""%1 we have lost the signal of %2."" ", group _b, group _c];

				GL4_HC_Helicopter set [2, (GL4_HC_Helicopter select 2) - [group _c] ];
			};
		};
	};
};