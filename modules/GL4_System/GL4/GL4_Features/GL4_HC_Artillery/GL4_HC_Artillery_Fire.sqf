// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery Fire
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g","_h","_i"];

_a = _this select 0;
_b = _this select 1;
_c = _this select 2;

_b doWatch [ (_c select 0), (_c select 1), 500 ];

sleep 5 + (random 5);

_d = [_b] call (GL4_HC_Artillery_F select 1);

if (_d == "") then
{
	_d = (GL4_High_Command select 10);
};

_e = (GL4_High_Command select 11);

_f = (GL4_High_Command select 12);

_g = 0;

while { ( (alive _b) && (_g < _e) && (GL4_HC_Artillery select 5) ) } do
{
	_b selectWeapon (typeOf _b);

	_b fire (typeOf _b);

	if (_b distance _c > 5000) then
	{
		_h = 10;
	}
	else
	{
		if (_b distance _c > 4000) then
		{
			_h = 9;
		}
		else
		{
			if (_b distance _c > 3000) then
			{
				_h = 8;
			}
			else
			{
				if (_b distance _c > 2000) then
				{
					_h = 7;
				}
				else
				{
					if (_b distance _c > 1000) then
					{
						_h = 6;
					}
					else
					{
						if (_b distance _c > 500) then
						{
							_h = 5;
						}
						else
						{
							_h = 4;
						};
					};
				};
			};
		};
	};

	sleep _h;

	_i = [_b, _c, _d, _f] call GL4_Artillery_Velocity_F;

	if (isDedicated) then
	{
		GL4_AddOn_PublicVariable = [7, _i]; publicVariable "GL4_AddOn_PublicVariable";
	}
	else
	{
		[_i] call (GL4_Artillery_FX_F select 0);
	};

	if (_b isKindOf "StaticWeapon") then
	{
		sleep 10 + (random 5);
	};

	_g = _g + 1;
};

GL4_HC_Artillery set [6, (GL4_HC_Artillery select 6) - [_b] ];

if (count (GL4_HC_Artillery select 6) == 0) then
{
	GL4_HC_Artillery set [3, True];
};

GL4_HC_Artillery set [7, time + (GL4_High_Command select 13) ];