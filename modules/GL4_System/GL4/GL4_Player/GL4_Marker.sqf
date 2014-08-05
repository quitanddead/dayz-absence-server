// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Player Marker
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d"];

_a = _this select 0;

_b = str _a;

_c = (vehicle leader _a);

if (typeName (GL4_Local select 0 select 1) == "Bool") then
{
	_d = [_c] call (GL4_Icon_F select 0);
}
else
{
	_d = (GL4_Local select 0 select 1);
};

if (isPlayer _a) then
{
	createMarkerLocal [_b, position _c];

	_b setMarkerShapeLocal "Icon"; _b setMarkerTypeLocal _d; _b setMarkerSizeLocal [0.7,0.7]; _b setMarkerColorLocal "ColorBlue"; _b setMarkerTextLocal format ["%1 ( %2 )", group _a, name _a];

	while { (alive _c) } do
	{
		_c = (vehicle player);

		_b setMarkerPosLocal (getPos _c);

		sleep 1;
	};

	deleteMarkerLocal _b;
}
else
{
	if (captive _c) then
	{
		createMarkerLocal [_b, position _c];

		_b setMarkerShapeLocal "Icon"; _b setMarkerTypeLocal _d; _b setMarkerSizeLocal [0.7,0.7]; _b setMarkerColorLocal "ColorWhite"; _b setMarkerTextLocal format ["%1 ( Captive )", name _c];

		while { ( (alive _c) && (captive _c) ) } do
		{
			_c = (vehicle _a);

			_b setMarkerPosLocal (getPos _c);

			sleep 1;
		};

		deleteMarkerLocal _b;
	};
};