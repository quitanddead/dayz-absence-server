// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Recruit
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;
_b = _this select 1;

switch (_a) do
{
	case 1 :
	{
		if (isNil "GL4_Recruit_F") then
		{
			call compile preprocessFile (GL4_Path+"GL4\GL4_Functions\GL4_Feature_F\GL4_Recruit_F.sqf");

			[_b] spawn (GL4_Recruit_F select 0);
		};
	};

	case 2 :
	{
		_c = _b addAction [format ["Recruit %1", name _b], (GL4_Path+"GL4\GL4_Features\GL4_Recruit\GL4_Recruit.sqf")];

		[_b, _c] spawn (GL4_Recruit_F select 1);

		_d = (leader _b);

		while { ( (alive _b) && (_b in units _d) ) } do
		{
			sleep 1;
		};

		_b removeAction _c;
	};

	case 3 :
	{
		_c = _this select 2;

		if (player in units _c) then
		{
			_d = _this select 3;

			_c groupChat _d;
		};
	};
};