// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Captive
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

switch (_this select 0) do
{
	case 1 :
	{
		_a = _this select 1;
		_b = _this select 2;

		if (local _a) then
		{
			_a stop False;

			_c = getDammage _a;

			while { ( (alive _a) && (alive _b) && (captive _a) ) } do
			{
				if ( (alive _a) && (canMove _a) && (_a distance _b > 100) && (floor (random 100) < (GL4_Global select 57) ) && ( [_a] call (GL4_Captive_F select 5) ) ) then
				{
					_a allowFleeing 1;

					_a stop False;

					_d = format ["%1 is fleeing.", name _a];

					if (isMultiplayer) then
					{
						GL4_Captive_Player_PublicVariable = [3, _a, _b, _d]; publicVariable "GL4_Captive_Player_PublicVariable";

						_b groupChat _d;
					}
					else
					{
						_b groupChat _d;
					};

					sleep 10 + (random 10);

					if ( (alive _a) && (getDammage _a == _c) && !(stopped _a) ) then
					{
						[_a] spawn (GL4_Captive_F select 6);
					};
				}
				else
				{
					if ( (alive _a) && (_a distance _b > 10) ) then
					{
						_a doMove (getPos _b);
					};
				};

				if ( (alive _a) && (getDammage _a > _c) ) then
				{
					_c = getDammage _a;

					_d = [ "Please don't kill me. I will do everything you want.",
					       "Please don't shoot me. I'm your prisoner."

					] call GL4_Random_Select_F;

					if (local _b) then
					{
						_a globalChat _d;
					}
					else
					{
						GL4_Captive_Player_PublicVariable = [4, _a, _d]; publicVariable "GL4_Captive_Player_PublicVariable";
					};
				};

				sleep 5;
			};

			if ( (alive _a) && (captive _a) ) then
			{
				_a allowFleeing 1;

				_a stop False;

				if ( (alive _a) && (getDammage _a == _c) && !(stopped _a) ) then
				{
					[_a] spawn (GL4_Captive_F select 6);
				};
			};
		};
	};

	case 2 :
	{
		_a = _this select 1;

		_a stop True;
	};

	case 3 :
	{
		_a = _this select 1;

		_a stop False;
	};

	case 4 :
	{
		_a = _this select 1;

		GL4_Captive set [3, (GL4_Captive select 3) + [_a] ];

		_a allowFleeing 1;

		[_a] spawn (GL4_Captive_F select 6);
	};
};		