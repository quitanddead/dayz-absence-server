// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Dead Simulation
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c"];

_a = _this select 0;
_b = _this select 2;

_a removeAction _b;

_a setCaptive True;

_a switchMove "AdthPercMstpSlowWrflDnon_1";

sleep 1 + (random 1);

hint "";

_c = _a addAction ["Stop Simulate Dead", (GL4_Path+"GL4\GL4_Features\GL4_Simulate_Dead\GL4_Simulate_Exit.sqf") ];

while { ( (alive _a) && (animationState _a == "AdthPercMstpSlowWrflDnon_1") ) } do
{
	sleep 1;

	if ( (floor (random 100) < 1) && (captive _a) ) then
	{
		_a setCaptive False;

		hint "Warning! Enemy did recognize that you are simulating dead!";
	};
};

_a setCaptive False;

if (alive _a) then
{
	_a removeAction _c;

	sleep 50 + (random 100);

	GL4_Simulate set [0, (GL4_Simulate select 0) - [_a] ];
}
else
{
	_a removeAction _c;

	GL4_Simulate set [0, (GL4_Simulate select 0) - [_a] ];
};