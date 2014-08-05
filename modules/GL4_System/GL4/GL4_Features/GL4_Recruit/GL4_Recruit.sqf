// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Recruit
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;
_b = _this select 2;

_c = player;

if ( (_c == leader _c) || (rank _c in (GL4_Global select 65) ) ) then
{
	if (isPlayer _a) then
	{
		hint format ["%1 you are not allowed to recruit %2. %2 is a player.", name _c, name _a];
	}
	else
	{
		if (side _a == CIVILIAN) then
		{
			hint format ["%1 you are not allowed to recruit %2. %2 is a civilian.", name _c, name _a];
		}
		else
		{
			if ( (_a == leader _a) && (count (units _a) > 1) ) then
			{
				hint format ["%1 you are not allowed to recruit %2. %2 is leader of %3.", name _c, name _a, group _a];
			}
			else
			{
				[_a] join _c;

				if (stopped _a) then
				{
					_a stop False;
				};

				GL4_Force_Move set [1, (GL4_Force_Move select 1) + [_a] ];

				_d = _a addAction [format ["Release %1", name _a], (GL4_Path+"GL4\GL4_Features\GL4_Recruit\GL4_Recruit_Release.sqf"), _c];

				_e = format ["%1 was recruited by %2.", name _a, name _c];

				if (isMultiplayer) then
				{
					GL4_Recruit_Player_PublicVariable = [3, _a, _c, _e]; publicVariable "GL4_Recruit_Player_PublicVariable";

					_c groupChat  _e;
				}
				else
				{
					_c groupChat  _e;
				};

				while { ( (alive _a) && (_a in units _c) ) } do
				{
					sleep 1;
				};

				if (alive _a) then
				{
					_a removeAction _d;

					_e = format ["%1 was released by %2.", name _a, name _c];

					if (isMultiplayer) then
					{
						GL4_Recruit_Player_PublicVariable = [3, _a, _c, _e]; publicVariable "GL4_Recruit_Player_PublicVariable";

						_c groupChat _e;
					}
					else
					{
						_c groupChat _e;
					};

					[2, _a] execVM (GL4_Path+"GL4\GL4_Features\GL4_Recruit\GL4_Recruit_Player.sqf");
				}
				else
				{
					_a removeAction _d;
				};
			};
		};
	};
}
else
{
	if !(rank _c in (GL4_Global select 65) ) then
	{
		hint format ["%1 your rank ( %2 ) is not allow to recruit %3.", name _c, rank _c, name _a];
	}
	else
	{
		if (_c != leader _c) then
		{
			hint format ["%1 you are not leader of %2. Only leaders are allowed to recruit %3.", name _c, group _c, name _a];
		};
	};
};