// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Captive
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e"];

_a = _this select 0;
_b = _this select 2;
_c = _this select 3;

if (alive _a) then
{
	if (player == _c) then
	{
		if !(_a in (GL4_Captive select 2) ) then
		{
			if (_a distance _c > 3) then
			{
				hint "You must be within 3 meters to the captive to Interrogate him.";
			}
			else
			{
				if (floor (random 100) < 5) then
				{
					_a removeAction _b;

					_d = [ "I'm not a traitor.",
					       "Fuck off! I will say nothing!",
					       "You will not get any information from me."

					] call GL4_Random_Select_F;

					_a globalChat _d;
				}
				else
				{
					if (floor (random 100) < 35) then
					{
						_e = [_a, _c] call (GL4_Captive_F select 4);

						if (typeName _e == "Object") then
						{
							if (_e isKindOf "Man") exitWith
							{
								_d = format ["We have some Infantery nearby this location. The leader is %1 %2. A very skilled guy.", rank _e, name _e];
							};

							if (_e isKindOf "Car") exitWith
							{
								_d = "We have some Cars nearby this location.";
							};

							if (_e isKindOf "Tank") exitWith
							{
								_d = "We have some Tanks nearby this location.";
							};

							if (_e isKindOf "Helicopter") exitWith
							{
								_d = "We have some Helicopters nearby this location.";
							};

							if (_e isKindOf "Plane") exitWith
							{
								_d = "We have some Planes nearby this location.";
							};
						}
						else
						{
							_d = [ "I don't know anything.",
							       "I don't know what you wanna to hear from me?",
							       "I can't provide you any informations about others."

							] call GL4_Random_Select_F;
						};

						_a globalChat _d;
					}
					else
					{
						_d = [ "Please! Leave me alone.",
						       "I don't think there is something i should tell you.",
						       "There is nothing i should tell you.",
						       "Why should i tell you something?"

						] call GL4_Random_Select_F;

						_a globalChat _d;
					};
				};

				GL4_Captive set [2, (GL4_Captive select 2) + [_a] ];

				sleep 10;

				GL4_Captive set [2, (GL4_Captive select 2) - [_a] ];
			};
		}
		else
		{
			hint format ["%1 you have to wait some time bevore you can Interrogate %2 again.", name _c, name _a];
		};
	}
	else
	{
		hint format ["%1 you are not allowed to interrogate %2. %2 is captive of %3.", name player, name _a, name _c];
	};
};