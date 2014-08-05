// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Force Move
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;
_b = _this select 1;

if (count _b > 0) then
{
	_b = _b;
}
else
{
	_b = (GL4_HC_Force_Move select 1);
};

if (count _b > 0) then
{
	if (count _this == 2) exitWith
	{
		if ( (_a == leader _a) && ( { ( (_a != _x) && (alive _x) && (_x distance _a > 10) ) } count _b > 0) ) then
		{
			_a setVariable ["GL4_HC_Force_Move", True];

			if (count (GL4_HC_Force_Move select 2) > 0) then
			{
				GL4_HC_Force_Move set [1, (GL4_HC_Force_Move select 1) + _b];
			}
			else
			{
				GL4_HC_Force_Move set [1, _b];
			};

			GL4_HC_Force_Move set [2, getPos _a];

			[_a, _b] call (GL4_HC_Force_Move_F select 0);

			_c = format ["Rodger %1 returning to your position.", name _a];

			(_b select 0) sideChat _c;

			if (floor (random 100) < 50) then
			{
				[_a] call (GL4_HC_Force_Move_F select 2);
			};
		}
		else
		{
			if ( { (_x != _a) } count (units _a) > 0) then
			{
				_e = (_b select 0);

				hint format ["%1 the selected unit %2 already is close to your position. You can only order units of your group %3 to move to your position if they are more then 10 meters away from your position.", name _a, name _e, group _a];
			}
			else
			{
				hint format ["%1 currently there are no units in your group %2 which you could order to move.", name _a, group _a];
			};	
		};
	};

	if (count _this == 3) exitWith
	{
		_c = _this select 2;

		_d = [ (_c select 0), (_c select 1), 0];

		_a setVariable ["GL4_HC_Force_Move", False];

		GL4_HC_Force_Move set [2, _d];

		if (isNil "GL4_HC_Force_Move_Marker") then
		{
			GL4_HC_Force_Move_Marker = "GL4_HC_Force_Move_Marker";

			_e = GL4_HC_Force_Move_Marker;

			createMarker [_e, _c];

			_e setMarkerShape "ICON"; _e setMarkerType "selector_selectedMission"; _e setMarkerSize [0.7, 0.7]; _e setMarkerText "<Force Move>"; _e setMarkerColor "ColorBlue";
		}
		else
		{
			GL4_HC_Force_Move_Marker setMarkerPos _c;
		};

		[_a, _b] call (GL4_HC_Force_Move_F select 0);

		_f = format ["Rodger %1 new location confirmed. Moving out.", name _a];

		(_b select 0) sideChat _f;

		sleep 5;

		closeDialog 101;
	};
}
else
{
	if (count (units _a) == 1) then
	{
		hint format ["%1 currently there are no units in your group %2 which you could order to move.", name _a, group _a];
	}
	else
	{
		hint format ["%1 please use the F - Keys to select units which should use the ""Force Move"" feature.", name _a];
	};
};