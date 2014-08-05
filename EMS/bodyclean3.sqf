//Created by TheSzerdi
_ai = _this select 0;
_ai_type = typeof _ai;

_aikiller = _this select 1;
_aikiller_name = name _aikiller;
_humanityBoost = 2000; //Set this to whatever you want the humanity to increase by

_humanity = _aikiller getVariable ["humanity",0];
_humanity = _humanity - _humanityBoost;
_aikiller setVariable["humanity", _humanity,true];

_killsH = _aikiller getVariable["humanKills",0];
_killsH = _killsH + 1;
_aikiller setVariable["humanKills",_killsH,true];

diag_log format ["EMS: JailGuard %1 was killed by %2 (-%3 humanity, new total %4)",_ai_type,_aikiller_name,_humanityBoost,_humanity];

sleep 1500;
deletevehicle _ai;

