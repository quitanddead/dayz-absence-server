// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Display
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b"];

_a = _this select 0;
_b = _this select 1;

if (GL4_Core select 4) then
{
	waitUntil { (cameraOn == (vehicle player) ) };

	switch (_b) do
	{
		case 1 :
		{
			player sideChat format ["( %1 ) Group Link 4 ""%2"" Initializing.", time, _a];
		};

		case 2 :
		{
			player sideChat format ["( %1 ) Group Link 4 ""%2"" Initialized.", time, _a];
		};
	};
};