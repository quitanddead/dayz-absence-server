// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Reinforcement Status
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g"];

_a = _this select 0;

if (isMultiplayer) then
{
	GL4_HC_Reinforcement_Server_PublicVariable = [3, _a]; publicVariable "GL4_HC_Reinforcement_Server_PublicVariable";
};

if (isServer) then
{
	_b = [" [playerSide, ""HQ""] sidechat ""%1 you have requested ( %2 ) groups as reinforcement."" ", name _a, count (GL4_HC_Reinforcement select 2) ];

	if (local _a) then
	{
		call compile format _b;
	}
	else
	{
		GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
	};

	sleep 5;

	_c = (GL4_HC_Reinforcement select 2);

	if (count _c > 0) then
	{
		_d = 0;

		while { (_d < count _c) } do
		{
			_e = (_c select _d);

			_f = (vehicle leader _e);

			if (typeName _f == "Object") then
			{
				if (_f isKindOf "Man") exitWith
				{
					_g = "Man";
				};

				if (_f isKindOf "Car") exitWith
				{
					_g = "Car";
				};

				if (_f isKindOf "Tank") exitWith
				{
					_g = "Tank";
				};

				if (_f isKindOf "Air") exitWith
				{
					_g = "Air";
				};
			};

			_b = [" [playerSide, ""HQ""] sidechat ""%1 | Vehicle: %2 | Size: %3 | Distance: %4"" ", _e, _g, count units _e, round (_f distance _a) ];

			if (local _a) then
			{
				call compile format _b;
			}
			else
			{
				GL4_HC_Reinforcement_Player_PublicVariable = [1, _a, _b]; publicVariable "GL4_HC_Reinforcement_Player_PublicVariable";
			};

			sleep 5;

			_d = _d + 1;
		};
	};  
};