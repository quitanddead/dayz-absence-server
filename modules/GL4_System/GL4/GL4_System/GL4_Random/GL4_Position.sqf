// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Position
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f","_g"];

_a = _this select 0;

if (_a isKindOf "Logic") then
{
	GL4_Position = [ [] ];

	if (isServer) then
	{
		_b = (synchronizedObjects _a);

		_b = _b - [_a];

		if (count _b > 0) then
		{
			_c = [];

			_d = [];

			_e = 0;

			while { (_e < count _b) } do
			{
				_f = (_b select _e);

				if (_f isKindOf "Man") then
				{
					_c = _c + units _f;
				}
				else
				{
					if (_f isKindOf "Logic") then
					{
						_d = _d + [getPos _f];

						deleteVehicle _f;
					};
				};

				_e = _e + 1;
			};

			if (count _c == 0) then
			{
				hint "Error: You need to synchronize a player with the ""Group Link 4: Position"" module.";
			}
			else
			{
				if (count _d == 0) then
				{
					hint "Error: You need to create some positions ( Logics ) somewhere at the map and synchronize them with the ""Group Link 4: Position"" module.";
				}
				else
				{
					_g = (count _d) - 1;
					_g = random _g;
					_g = _d select _g;

					GL4_Position set [0, [_c, _g] ]; publicVariable "GL4_Position";

					waitUntil { (time > 0) };

					{if (local vehicle _x) then {vehicle _x setPos _g} } forEach _c;
				};
			};
		}
		else
		{
			hint "Error: No player and/or position ( Logic ) was synchronized with the ""Group Link 4: Position"" module.";
		};
	}
	else
	{
		waitUntil { ( (player == player) && (time > 0) ) };

		if (player == player) then
		{
			if (count (GL4_Position select 0) > 0) then
			{
				_a = (GL4_Position select 0);

				{if (local vehicle _x) then {vehicle _x setPos (_a select 1) } } forEach (_a select 0);
			};
		};
	};
};