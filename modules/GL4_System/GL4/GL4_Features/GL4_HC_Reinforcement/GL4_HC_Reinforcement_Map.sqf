// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement Map
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;
_b = _this select 1;

if (local _a) then
{
	if (typeName _b == "Array") then
	{
		_c = [	[" [playerSide, ""HQ""] sidechat ""%1 reinforcements target location confirmed. Coordinates are transfered."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat ""%1 we have received your reinforcement coordinates. Coordinate transfer in progress."" ", name _a] 

		] call GL4_Random_Select_F;

		call compile format _c;

		onMapSingleClick "";

		[] spawn
		{
			sleep 5;

			closeDialog 101;
		};

		if (isMultiplayer) then
		{
			GL4_HC_Reinforcement_Server_PublicVariable = [2, _a, _b]; publicVariable "GL4_HC_Reinforcement_Server_PublicVariable";
		};
	}
	else
	{
		_c = [	[" [playerSide, ""HQ""] sidechat ""%1 please select your reinforcement target location by Map - Click."" ", name _a],
		       [" [playerSide, ""HQ""] sidechat ""%1 please transfere your reinforcement target location by Map - Click."" ", name _a] 

		] call GL4_Random_Select_F;

		call compile format _c;

		if (visibleMap) then
		{
			onMapSingleClick "[player, _pos] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Map.sqf""); True";

			while { ( (alive _a) && (visibleMap) ) } do
			{
				sleep 1;
			};

			_a setVariable ["GL4_HC_Reinforcement", -1, True];

			onMapSingleClick "";
		}
		else
		{
			createDialog "RscMiniMap";

			onMapSingleClick "[player, _pos] execVM (GL4_Path+""GL4\GL4_Features\GL4_HC_Reinforcement\GL4_HC_Reinforcement_Map.sqf""); True";

			while { ( (alive _a) && (dialog) ) } do
			{
				sleep 1;
			};

			_a setVariable ["GL4_HC_Reinforcement", -1, True];

			closeDialog 101;

			onMapSingleClick "";
		};
	};
};

if ( (isServer) && (typeName _b == "Array") ) then
{
	if (isNil "GL4_HC_Reinforcement_Marker") then
	{
		GL4_HC_Reinforcement_Marker = "GL4_HC_Reinforcement_Marker";

		_c = GL4_HC_Reinforcement_Marker;

		createMarker [_c, _b];

		_c setMarkerShape "ICON"; _c setMarkerType "selector_selectedMission"; _c setMarkerSize [0.7, 0.7]; _c setMarkerText "<Reinforcement>"; _c setMarkerColor "ColorBlue";
	}
	else
	{
		GL4_HC_Reinforcement_Marker setMarkerPos _b;
	};

	if (typeName (_a getVariable "GL4_HC_Reinforcement") == "Bool") then
	{
		_a setVariable ["GL4_HC_Reinforcement", _b];

		(GL4_HC_Reinforcement select 6) setPos _b;
	}
	else
	{
		if (count (GL4_HC_Reinforcement select 2) > 0) then
		{
			_d = (GL4_HC_Reinforcement select 2);

			_e = 0;

			while { (_e < count _d) } do
			{
				_f = (_d select _e);

				if ( { (alive _x) } count (units _f) > 0) then
				{
					{_x doMove _b} forEach units _f;
				}
				else
				{
					GL4_HC_Reinforcement set [1, (GL4_HC_Reinforcement select 1) - [_f] ];

					GL4_HC_Reinforcement set [2, (GL4_HC_Reinforcement select 2) - [_f] ];
				};

				_e = _e + 1;
			};

			(GL4_HC_Reinforcement select 6) setPos _b;
		};
	};
};