// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Blood Texture
// Idea and Script by Operation Flashpoint MOD E.C.P. ( Enhanced Configuration Project )
// Optimized by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////
private ["_a","_b","_c","_d","_e","_f"];

switch (count _this) do
{
	case 3 :
	{
		_a = random 1;

		_b = 0;
		_c = 0;

		{if (_a < _x) then {_b = _c; _a = 1}; _c = _c + 1} foreach (GL4_Blood select 1);

		_d = ["GL4_Blood_01","GL4_Blood_02","GL4_Blood_03","GL4_Blood_04"];

		_e = (_d select _b) createVehicleLocal [0,0,0];

		_e setDir (random 360);

		_e setPos [_this select 0, _this select 1, 0];

		GL4_Blood set [0, (GL4_Blood select 0) + [_e] ];
	};

	case 4 :
	{
		_a = (_this select 3) createVehicleLocal [0, 0, 0];

		_a setPos [_this select 0, _this select 1, 0];

		_a setDir (random 360);

		_b = (getPos _a);

		_c = (_b select 2);

		while { (_c < 0) } do
		{
			_c = _c + 0.00025;

			_a setPos [ (_b select 0), (_b select 1), _c];
		};

		GL4_Blood set [0, (GL4_Blood select 0) + [_a] ];
	};
};