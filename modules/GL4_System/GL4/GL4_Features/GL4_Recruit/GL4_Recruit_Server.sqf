// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Recruit
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

_a = _this select 0;
_b = _this select 1;
_c = _this select 2;

switch (_a) do
{
	case 1 :
	{
		[_b] join grpNull;

		_d = nearestObjects [_b, ["Man"], 100];

		if (count _d > 0) then
		{
			_e = 0;

			while { (_e < count _d) } do
			{
				_f = (_d select _e);

				if ( (local _f) && (alive _f) && (_f != _b) && (side _f != CIVILIAN) && (group _f != _c) && (_b countFriendly [_f] > 0) ) exitWith
				{
					if (stopped _b) then
					{
						_b stop False;
					};

					[_b] join _f;
				};

				_e = _e + 1;
			};
		};
	};
};