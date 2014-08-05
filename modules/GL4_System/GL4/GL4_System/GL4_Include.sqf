// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Include
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////	
private ["_a","_b","_c","_d","_e","_f"];

if (isServer) then
{
	_a = False;

	_b = [ [], [] ];

	while { (True) } do
	{
		_c = allUnits;

		_c = _c - (_b select 0);

		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			_b set [0, (_b select 0) + [_e] ];

			if (_e != leader _e) then
			{
				_e setVariable ["GL4_Included", True];
			};

			if (_a) then
			{
				_e addEventHandler ["Fired", { _this call (GL4_EH_Fired_F select 0) } ];

				_e addEventHandler ["Hit", { _this call (GL4_EH_Hit_F select 0) } ];
	
				_e addEventHandler ["Killed", { _this call (GL4_EH_Killed_F select 0) } ];
			};

			_d = _d + 1;
		};

		_c = allGroups;

		_c = _c - (_b select 1);

		{if (leader _x getVariable "GL4_Included") then {_c = _c - [_x]} } forEach _c;

		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			_f = (vehicle leader _e);

			_b set [1, (_b select 1) + [_e] ];

			if ( (_a) && (side _f in _this) && ( { (_f isKindOf _x) } count (GL4_Global select 69) > 0) ) then
			{
				[_e] spawn (GL4_Marker_F select 1);

				GL4_Groups set [0, (GL4_Groups select 0) + [_e] ];

				GL4_Reinforcement set [0, (GL4_Reinforcement select 0) + [_e] ];
			};

			_d = _d + 1;
		};

		_a = True;

		sleep 30;
	};
};