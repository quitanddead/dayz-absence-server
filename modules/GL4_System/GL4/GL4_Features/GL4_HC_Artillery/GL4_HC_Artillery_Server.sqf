// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// High Command Artillery Server
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;
_b = _this select 1;
_c = _this select 2;

switch (_a) do
{
	case 1 :
	{
		[_b, "", _c] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Request.sqf");
	};

	case 2 :
	{
		_d = _this select 3;

		[_b, _c, _d] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Position.sqf");
	};

	case 3 :
	{
		[_b] execVM (GL4_Path+"GL4\GL4_Features\GL4_HC_Artillery\GL4_HC_Artillery_Cancel.sqf");
	};
};
		