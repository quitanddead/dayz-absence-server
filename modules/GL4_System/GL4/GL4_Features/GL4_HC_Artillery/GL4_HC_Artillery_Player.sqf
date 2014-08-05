// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery Player
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

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
			if (visibleMap) then
			{
				onMapSingleClick "[player, _pos] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Position.sqf""); True";

				while { ( (alive _b) && (visibleMap) ) } do
				{
					sleep 1;
				};

				_b setVariable ["GL4_HC_Artillery", False, True];
			}
			else
			{
				createDialog "RscMiniMap";

				onMapSingleClick "[player, _pos] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Position.sqf""); True";

				while { ( (alive _b) && (dialog) ) } do
				{
					sleep 1;
				};

				_b setVariable ["GL4_HC_Artillery", False, True];
			};
		};
	};

	case 3 :
	{
		if (local _b) then
		{
			sleep 5;

			closeDialog 101;

			onMapSingleClick "";
		};
	};

	case 4 :
	{
		if (local _b) then
		{
			GL4_HC_Artillery_Menu set [2, ["Cancel", [3], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Cancel.sqf"") "] ], "1", "1"] ];
		};
	};

	case 5 :
	{
		if (local _b) then
		{
			GL4_HC_Artillery_Menu set [2, ["Cancel", [3], "", -5, [ ["expression", "[player] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Cancel.sqf"") "] ], "0", "0"] ];
		};
	};
};