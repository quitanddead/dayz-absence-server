//Created by TheSzerdi
_ai = _this select 0;
_ai_type = typeof _ai;

//_aikiller = _this select 1;
{
	if ((isplayer _x) && (_x distance _ai < 100)) then {
_aikiller_name = name _x;
_humanityBoost = 2000; //Set this to whatever you want the humanity to increase by
// (player distance _ai < 100) then {player = _aikiller} foreach playableunits;
_humanity = _x getVariable ["humanity",0];
_humanity = _humanity - _humanityBoost;
_x setVariable["humanity", _humanity,true];

_killsH = _x getVariable["humanKills",0];
_killsH = _killsH + 1;
_x setVariable["humanKills",_killsH,true];
};
diag_log format ["EMS: Hostage %1 was killed by %2 (-%3 humanity, new total %4)",_ai_type,_aikiller_name,_humanityBoost,_humanity];
}foreach playableunits;


sleep 1500;
deletevehicle _ai;

