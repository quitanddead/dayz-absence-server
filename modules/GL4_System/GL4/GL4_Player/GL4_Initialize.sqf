// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Initialize
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];	

_a = _this select 0;

_b = 0;

while { (_b < count units _a) } do
{
	_c = (units _a select _b);

	_d = (vehicle _c);

	if !(_d in (GL4_Player select 0) ) then
	{
		GL4_Player set [0, (GL4_Player select 0) + [_d] ];

		if ( (GL4_Local select 0 select 0) && (isPlayer _d) && (local _d) ) then
		{
			[_d] execVM (GL4_Path+"GL4\GL4_Player\GL4_Marker.sqf");
		};

		_d addEventHandler ["Fired", { _this call (GL4_EH_Fired_F select 0) } ];

		_d addEventHandler ["Hit", { _this call (GL4_EH_Hit_F select 0) } ];
	
		_d addEventHandler ["Killed", { _this call (GL4_EH_Killed_F select 0) } ];

		if !(group _d in (GL4_Player select 1) ) then
		{
			GL4_Player set [1, (GL4_Player select 1) + [group _d] ];
		};
	};

	_b = _b + 1;
};