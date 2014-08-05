		// -----------------------------------------------
		// Author: team  code34 nicolas_boiteux@yahoo.fr
		// WARCONTEXT - Description: Handler for all enemy units
		// -----------------------------------------------	

		private ["_vehicle"];

		_vehicle = _this select 0;

		_vehicle addeventhandler ['killed', {
			wcgarbage = _this spawn WC_fnc_garbagecollector; 
		}];

		//if(isnil "mando_missile_init_done") then {
		//	_vehicle removeAllEventHandlers "HandleDamage";
		//};

	
		_vehicle addEventHandler ['Fired', '
			_increase = ceil(random 5);
			if(position _vehicle distance wcmissionposition < wcalertzonesize) then {
				if((wcalert + _increase) < 101) then {
					wcalert = wcalert + _increase;
				} else {
					wcalert = 100;
				};
			};
			(_this select 0) setvariable ["cible", assignedtarget (_this select 0), false];
		'];

		_vehicle addeventhandler ['FiredNear', {
			private ["_gunner", "_commander"];
			if(side(_this select 1) in [west, civilian]) then {
				_gunner = gunner (_this select 0);
				_commander = commander (_this select 0);
				{
					_x reveal (_this select 1);
					_x dotarget (_this select 1);
					_x dofire (_this select 1);
				}foreach [_gunner, _commander];
			};
			// if vehicle fire itself, it puts itself as cible to search and destroy on its own position
			(_this select 0) setvariable ["cible", (_this select 1), false];
		}];

		wcvehicles = wcvehicles + [_vehicle];