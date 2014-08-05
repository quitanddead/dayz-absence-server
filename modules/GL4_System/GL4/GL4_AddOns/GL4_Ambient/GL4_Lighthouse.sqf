// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Lighthouse
// Idea and Sounds by Operation Flashpoint MOD E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

call compile preprocessFile (GL4_Path+"GL4\GL4_System\GL4_Join_In_Progress.sqf");

sleep 10 + (random 30);

while { (True) } do
{
	if !( (dayTime > 5.00) && (dayTime < 19.00) ) then
	{
		_a = (vehicle player);

		_b = nearestObjects [_a, ["Land_NAV_Lighthouse","Land_NAV_Lighthouse1","Land_NAV_Lighthouse2"], 500];

		if (count _b > 0) then
		{
			_c = (GL4_Resource select 35) call GL4_Random_Select_F;

			(_b select 0) say _c;

			sleep 240 + (random 240);
		}
		else
		{
			sleep 240 + (random 240);
		};
	}
	else
	{
		sleep 240 + (random 240);
	};
};