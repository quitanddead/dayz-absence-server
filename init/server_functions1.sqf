waituntil {!isnil "bis_fnc_init"};

BIS_MPF_remoteExecutionServer = {
	if ((_this select 1) select 2 == "JIPrequest") then {
		[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
	};
};
/* Skaronator - secured better remoteExecServer
BIS_MPF_remoteExecutionServer = {
	if ((_this select 1) select 2 == "JIPrequest") then {
		_playerObj = (_this select 1) select 0;			
		remExField = [nil, nil, format ["";if !(isServer) then {[] execVM "ca\Modules\Functions\init.sqf";};""]];
		(owner _playerObj) publicVariableClient "remExField";
	};
};*/

BIS_Effects_Burn =				{};
server_playerLogin =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerLogin.sqf";
server_playerSetup =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSetup.sqf";
server_onPlayerDisconnect = 	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_onPlayerDisconnect.sqf";
server_updateObject =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateObject.sqf";
server_playerDied =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDied.sqf";
server_publishObj = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishObject.sqf";
server_deleteObj =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_deleteObj.sqf";
server_swapObject =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_swapObject.sqf"; 
server_publishVeh = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle.sqf";
server_publishVeh2 = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle2.sqf";
server_publishVeh3 = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishVehicle3.sqf";
server_tradeObj = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_tradeObject.sqf";
server_traders = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_traders.sqf";
server_playerSync =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSync.sqf";
server_spawnCrashSite  =    	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSite.sqf";
server_spawnEvents =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnEvent.sqf";
//server_weather =				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_weather.sqf";
fnc_plyrHit   =					compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_plyrHit.sqf";
server_deaths = 				compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDeaths.sqf";
fnc_hTime = compile preprocessFile "\z\addons\dayz_server\EMS\misc\fnc_hTime.sqf"; //Random integer selector for mission wait time
server_maintainArea = 			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_maintainArea.sqf";

/* PVS/PVC - Skaronator */
server_sendToClient =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_sendToClient.sqf";

//onPlayerConnected 			{[_uid,_name] call server_onPlayerConnect;};
onPlayerDisconnected 		{[_uid,_name] call server_onPlayerDisconnect;};

server_updateNearbyObjects = {
	private["_pos"];
	_pos = _this select 0;
	{
		[_x, "gear"] call server_updateObject;
	} forEach nearestObjects [_pos, dayz_updateObjects, 10];
};

server_handleZedSpawn = {
	private["_zed"];
	_zed = _this select 0;
	_zed enableSimulation false;
};

zombie_findOwner = {
	private["_unit"];
	_unit = _this select 0;
	#ifdef DZE_SERVER_DEBUG
	diag_log ("CLEANUP: DELETE UNCONTROLLED ZOMBIE: " + (typeOf _unit) + " OF: " + str(_unit) );
	#endif
	deleteVehicle _unit;
};

vehicle_handleInteract = {
	private["_object"];
	_object = _this select 0;
	needUpdate_objects = needUpdate_objects - [_object];
	[_object, "all"] call server_updateObject;
};

array_reduceSizeReverse = {
	private["_array","_count","_num","_newarray","_startnum","_index"];
	_array = _this select 0;
	_newarray = [];
	_count = _this select 1;
	_num = count _array;
	if (_num > _count) then {
		_startnum = _num - 1;
		_index = _count - 1;
		for "_i" from 0 to _index do {
			_newarray set [(_index-_i),_array select (_startnum - _i)];
		};
		_array = _newarray;
	}; 
	_array
};

array_reduceSize = {
	private ["_array1","_array","_count","_num"];
	_array1 = _this select 0;
	_array = _array1 - ["Hatchet_Swing","Machete_Swing","Fishing_Swing","sledge_swing","crowbar_swing","CSGAS"];
	_count = _this select 1;
	_num = count _array;
	if (_num > _count) then {
		_array resize _count;
	};
	_array
};

object_handleServerKilled = {
	private["_unit","_objectID","_objectUID","_killer"];
	_unit = _this select 0;
	_killer = _this select 1;
	
	_objectID =	 _unit getVariable ["ObjectID","0"];
	_objectUID = _unit getVariable ["ObjectUID","0"];
		
	[_objectID,_objectUID,_killer] call server_deleteObj;
	
	_unit removeAllMPEventHandlers "MPKilled";
	_unit removeAllEventHandlers "Killed";
	_unit removeAllEventHandlers "HandleDamage";
	_unit removeAllEventHandlers "GetIn";
	_unit removeAllEventHandlers "GetOut";
};

check_publishobject = {
	private["_allowed","_object","_playername"];

	_object = _this select 0;
	_playername = _this select 1;
	_allowed = false;

	if ((typeOf _object) in dayz_allowedObjects) then {
			//diag_log format ["DEBUG: Object: %1 published by %2 is Safe",_object, _playername];
			_allowed = true;
	};
    _allowed
};

//event Handlers
eh_localCleanup = {
	private ["_object"];
	_object = _this select 0;
	_object addEventHandler ["local", {
		if(_this select 1) then {
			private["_type","_unit"];
			_unit = _this select 0;
			_type = typeOf _unit;
			 _myGroupUnit = group _unit;
 			_unit removeAllMPEventHandlers "mpkilled";
 			_unit removeAllMPEventHandlers "mphit";
 			_unit removeAllMPEventHandlers "mprespawn";
 			_unit removeAllEventHandlers "FiredNear";
			_unit removeAllEventHandlers "HandleDamage";
			_unit removeAllEventHandlers "Killed";
			_unit removeAllEventHandlers "Fired";
			_unit removeAllEventHandlers "GetOut";
			_unit removeAllEventHandlers "GetIn";
			_unit removeAllEventHandlers "Local";
			clearVehicleInit _unit;
			deleteVehicle _unit;
			deleteGroup _myGroupUnit;
			//_unit = nil;
			diag_log ("CLEANUP: DELETED A " + str(_type) );
		};
	}];
};

server_hiveWrite = {
	private["_data"];
	_data = "HiveExt" callExtension _this;
};

server_hiveReadWrite = {
	private["_key","_resultArray","_data"];
	_key = _this;
	_data = "HiveExt" callExtension _key;
	_resultArray = call compile format ["%1",_data];
	_resultArray
};

server_hiveReadWriteLarge = {
	private["_key","_resultArray","_data"];
	_key = _this;
	_data = "HiveExt" callExtension _key;
	_resultArray = call compile _data;
	_resultArray
};

server_checkIfTowed = {
	private ["_vehicle","_player","_attached"];
	if (DZE_HeliLift) then {
		_vehicle = 	_this select 0;
		_player = 	_this select 2;
		_attached = _vehicle getVariable["attached",false];
		if ((typeName _attached == "OBJECT")) then {
			_player action ["eject", _vehicle];
			detach _vehicle;
			_vehicle setVariable["attached",false,true];
			_attached setVariable["hasAttached",false,true];
		};
	};
};

server_characterSync = {
	private ["_characterID","_playerPos","_playerGear","_playerBackp","_medical","_currentState","_currentModel","_key"];
	_characterID = 	_this select 0;	
	_playerPos =	_this select 1;
	_playerGear =	_this select 2;
	_playerBackp =	_this select 3;
	_medical = 		_this select 4;
	_currentState =	_this select 5;
	_currentModel = _this select 6;
	
	_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,false,false,0,0,0,0,_currentState,0,0,_currentModel,0];
	_key call server_hiveWrite;
};

if(isnil "dayz_MapArea") then {
	dayz_MapArea = 10000;
};
if(isnil "DynamicVehicleArea") then {
	DynamicVehicleArea = dayz_MapArea / 2;
};

// Get all buildings and roads only once TODO: set variables to nil after done if nessicary 
MarkerPosition = getMarkerPos "center";
RoadList = MarkerPosition nearRoads DynamicVehicleArea;

// Very taxing !!! but only on first startup
BuildingList = [];
{
	if (DZE_MissionLootTable) then {
		if (isClass (missionConfigFile >> "CfgBuildingLoot" >> (typeOf _x))) then
		{
				BuildingList set [count BuildingList,_x];
		};
	} else {
		if (isClass (configFile >> "CfgBuildingLoot" >> (typeOf _x))) then
		{
			BuildingList set [count BuildingList,_x];
		};
	};
	
	
} forEach (MarkerPosition nearObjects ["building",DynamicVehicleArea]);

spawn_vehicles = {
	private ["_random","_lastIndex","_weights","_index","_vehicle","_velimit","_qty","_isAir","_isShip","_position","_dir","_istoomany","_veh","_objPosition","_marker","_iClass","_itemTypes","_cntWeights","_itemType","_num","_allCfgLoots"];
	
	if (!isDedicated) exitWith { }; //Be sure the run this

	while {count AllowedVehiclesList > 0} do {
		// BIS_fnc_selectRandom replaced because the index may be needed to remove the element
		_index = floor random count AllowedVehiclesList;
		_random = AllowedVehiclesList select _index;

		_vehicle = _random select 0;
		_velimit = _random select 1;

		_qty = {_x == _vehicle} count serverVehicleCounter;

		// If under limit allow to proceed
		if (_qty <= _velimit) exitWith {};

		// vehicle limit reached, remove vehicle from list
		// since elements cannot be removed from an array, overwrite it with the last element and cut the last element of (as long as order is not important)
		_lastIndex = (count AllowedVehiclesList) - 1;
		if (_lastIndex != _index) then {
			AllowedVehiclesList set [_index, AllowedVehiclesList select _lastIndex];
		};
		AllowedVehiclesList resize _lastIndex;
	};

	if (count AllowedVehiclesList == 0) then {
		diag_log("DEBUG: unable to find suitable vehicle to spawn");
	} else {

		// add vehicle to counter for next pass
		serverVehicleCounter set [count serverVehicleCounter,_vehicle];
	
		// Find Vehicle Type to better control spawns
		_isAir = _vehicle isKindOf "Air";
		_isShip = _vehicle isKindOf "Ship";
	
		if(_isShip || _isAir) then {
			if(_isShip) then {
				// Spawn anywhere on coast on water
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [MarkerPosition,0,DynamicVehicleArea,10,1,2000,1] call BIS_fnc_findSafePos;
				//diag_log("DEBUG: spawning boat near coast " + str(_position));
			} else {
				// Spawn air anywhere that is flat
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [MarkerPosition,0,DynamicVehicleArea,10,0,2000,0] call BIS_fnc_findSafePos;
				//diag_log("DEBUG: spawning air anywhere flat " + str(_position));
			};
		
		
		} else {
			// Spawn around buildings and 50% near roads
			if((random 1) > 0.5) then {
			
				waitUntil{!isNil "BIS_fnc_selectRandom"};
				_position = RoadList call BIS_fnc_selectRandom;
			
				_position = _position modelToWorld [0,0,0];
			
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [_position,0,10,10,0,2000,0] call BIS_fnc_findSafePos;
			
				//diag_log("DEBUG: spawning near road " + str(_position));
			
			} else {
			
				waitUntil{!isNil "BIS_fnc_selectRandom"};
				_position = BuildingList call BIS_fnc_selectRandom;
			
				_position = _position modelToWorld [0,0,0];
			
				waitUntil{!isNil "BIS_fnc_findSafePos"};
				_position = [_position,0,40,5,0,2000,0] call BIS_fnc_findSafePos;
			
				//diag_log("DEBUG: spawning around buildings " + str(_position));
		
			};
		};
		// only proceed if two params otherwise BIS_fnc_findSafePos failed and may spawn in air
		if ((count _position) == 2) then { 
	
			_dir = round(random 180);
		
			_istoomany = _position nearObjects ["AllVehicles",50];
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many vehicles at " + str(_position)); };
		
			//place vehicle 
			_veh = createVehicle [_vehicle, _position, [], 0, "CAN_COLLIDE"];
			_veh setdir _dir;
			_veh setpos _position;		
			
			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText _vehicle;
			};	
		
			// Get position with ground
			_objPosition = getposatl _veh;
		
			clearWeaponCargoGlobal  _veh;
			clearMagazineCargoGlobal  _veh;
			// _veh setVehicleAmmo DZE_vehicleAmmo;

			// Add 0-3 loots to vehicle using random cfgloots 
			_num = floor(random 4);
			_allCfgLoots = ["trash","civilian","food","generic","medical","military","policeman","hunter","worker","clothes","militaryclothes","specialclothes","trash"];
			
			for "_x" from 1 to _num do {
				_iClass = _allCfgLoots call BIS_fnc_selectRandom;

				_itemTypes = [];
				if (DZE_MissionLootTable) then {
					_itemTypes = ((getArray (missionConfigFile >> "cfgLoot" >> _iClass)) select 0);
				} else {
					_itemTypes = ((getArray (configFile >> "cfgLoot" >> _iClass)) select 0);
				};

				_index = dayz_CLBase find _iClass;
				_weights = dayz_CLChances select _index;
				_cntWeights = count _weights;
				
				_index = floor(random _cntWeights);
				_index = _weights select _index;
				_itemType = _itemTypes select _index;
				_veh addMagazineCargoGlobal [_itemType,1];
				//diag_log("DEBUG: spawed loot inside vehicle " + str(_itemType));
			};

			[_veh,[_dir,_objPosition],_vehicle,true,"0"] call server_publishVeh;
		};
	};
};

spawn_ammosupply = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];
	if (isDedicated) then {
		_WreckList = ["Supply_Crate_DZE"];
		waitUntil{!isNil "BIS_fnc_selectRandom"};
		_position = RoadList call BIS_fnc_selectRandom;
		_position = _position modelToWorld [0,0,0];
		waitUntil{!isNil "BIS_fnc_findSafePos"};
		_position = [_position,5,20,5,0,2000,0] call BIS_fnc_findSafePos;
		if ((count _position) == 2) then {

			_istoomany = _position nearObjects ["All",5];
			
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many at " + str(_position)); };
			
			_spawnveh = _WreckList call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};
			
			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;
			_veh setDir round(random 360);
			_veh setpos _position;
			_veh setVariable ["ObjectID","1",true];
		};
	};
};

DZE_LocalRoadBlocks = [];

spawn_roadblocks = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_WreckList"];
	_WreckList = ["SKODAWreck","HMMWVWreck","UralWreck","datsun01Wreck","hiluxWreck","datsun02Wreck","UAZWreck","Land_Misc_Garb_Heap_EP1","Fort_Barricade_EP1","Rubbish2"];
	
	waitUntil{!isNil "BIS_fnc_selectRandom"};
	if (isDedicated) then {
	
		_position = RoadList call BIS_fnc_selectRandom;
		
		_position = _position modelToWorld [0,0,0];
		
		waitUntil{!isNil "BIS_fnc_findSafePos"};
		_position = [_position,0,10,5,0,2000,0] call BIS_fnc_findSafePos;
		
		if ((count _position) == 2) then {
			// Get position with ground
			
			_istoomany = _position nearObjects ["All",5];
		
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG: Too many at " + str(_position)); };
			
			waitUntil{!isNil "BIS_fnc_selectRandom"};
			_spawnveh = _WreckList call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};

			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;

			_veh setDir round(random 360); // Randomize placement a bit
			_veh setpos _position;

			_veh setVariable ["ObjectID","1",true];
		};
	
	};
	
};

spawn_mineveins = {
	private ["_position","_veh","_istoomany","_marker","_spawnveh","_positions"];

	if (isDedicated) then {
		
		_position = [getMarkerPos "center",0,(HeliCrashArea*0.75),10,0,2000,0] call BIS_fnc_findSafePos;

		if ((count _position) == 2) then {
			
			_positions = selectBestPlaces [_position, 500, "(1 + forest) * (1 + hills) * (1 - houses) * (1 - sea)", 10, 5];

			_position = (_positions call BIS_fnc_selectRandom) select 0;

			// Get position with ground
			_istoomany = _position nearObjects ["All",10];
		
			if((count _istoomany) > 0) exitWith { diag_log("DEBUG VEIN: Too many objects at " + str(_position)); };

			if(isOnRoad _position) exitWith { diag_log("DEBUG VEIN: on road " + str(_position)); };
			
			_spawnveh = ["Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Iron_Vein_DZE","Silver_Vein_DZE","Silver_Vein_DZE","Silver_Vein_DZE","Gold_Vein_DZE","Gold_Vein_DZE"] call BIS_fnc_selectRandom;

			if(DZEdebug) then {
				_marker = createMarker [str(_position) , _position];
				_marker setMarkerShape "ICON";
				_marker setMarkerType "DOT";
				_marker setMarkerText str(_spawnveh);
			};
			
			//diag_log("DEBUG: Spawning a crashed " + _spawnveh + " with " + _spawnloot + " at " + str(_position));
			_veh = createVehicle [_spawnveh,_position, [], 0, "CAN_COLLIDE"];
			_veh enableSimulation false;

			// Randomize placement a bit
			_veh setDir round(random 360);
			_veh setpos _position;

			_veh setVariable ["ObjectID","1",true];

		
		};
	};
};

if(isnil "DynamicVehicleDamageLow") then {
	DynamicVehicleDamageLow = 0;
};
if(isnil "DynamicVehicleDamageHigh") then {
	DynamicVehicleDamageHigh = 100;
};

if(isnil "DynamicVehicleFuelLow") then {
	DynamicVehicleFuelLow = 0;
};
if(isnil "DynamicVehicleFuelHigh") then {
	DynamicVehicleFuelHigh = 100;
};

if(isnil "DZE_DiagFpsSlow") then {
	DZE_DiagFpsSlow = false;
};
if(isnil "DZE_DiagFpsFast") then {
	DZE_DiagFpsFast = false;
};
if(isnil "DZE_DiagVerbose") then {
	DZE_DiagVerbose = false;
};

dze_diag_fps = {
	if(DZE_DiagVerbose) then {
		diag_log format["DEBUG FPS : %1 OBJECTS: %2 : PLAYERS: %3", diag_fps,(count (allMissionObjects "")),(playersNumber west)];
	} else {
		diag_log format["DEBUG FPS : %1", diag_fps];
	};
};

// Damage generator function
generate_new_damage = {
	private ["_damage"];
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	_damage;
};

// Damage generator fuction
generate_exp_damage = {
	private ["_damage"];
    _damage = ((random(DynamicVehicleDamageHigh-DynamicVehicleDamageLow))+DynamicVehicleDamageLow) / 100;
	
	// limit this to 85% since vehicle would blow up otherwise.
	//if(_damage >= 0.85) then {
	//	_damage = 0.85;
	//};
	_damage;
};

server_getDiff =	{
	private["_variable","_object","_vNew","_vOld","_result"];
	_variable = _this select 0;
	_object = 	_this select 1;
	_vNew = 	_object getVariable[_variable,0];
	_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
	_result = 	0;
	if (_vNew < _vOld) then {
		//JIP issues
		_vNew = _vNew + _vOld;
		_object getVariable[(_variable + "_CHK"),_vNew];
	} else {
		_result = _vNew - _vOld;
		_object setVariable[(_variable + "_CHK"),_vNew];
	};
	_result
};

server_getDiff2 =	{
	private["_variable","_object","_vNew","_vOld","_result"];
	_variable = _this select 0;
	_object = 	_this select 1;
	_vNew = 	_object getVariable[_variable,0];
	_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
	_result = _vNew - _vOld;
	_object setVariable[(_variable + "_CHK"),_vNew];
	_result
};

dayz_objectUID = {
	private["_position","_dir","_key","_object"];
	_object = _this;
	_position = getposatl _object;
	_dir = direction _object;
	_key = [_dir,_position] call dayz_objectUID2;
    _key
};

dayz_objectUID2 = {
	private["_position","_dir","_key"];
	_dir = _this select 0;
	_key = "";
	_position = _this select 1;
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_key = _key + str(round(_x));
	} forEach _position;
	_key = _key + str(round(_dir));
	_key
};

dayz_objectUID3 = {
	private["_position","_dir","_key"];
	_dir = _this select 0;
	_key = "";
	_position = _this select 1;
	{
		_x = _x * 10;
		if ( _x < 0 ) then { _x = _x * -10 };
		_key = _key + str(round(_x));
	} forEach _position;
	_key = _key + str(round(_dir + time));
	_key
};

dayz_recordLogin = {
	private["_key"];
	_key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
	_key call server_hiveWrite;
};

    //----------InitMissions--------//
    MissionGo = 0;
    MissionGoMinor = 0;
    if (isServer) then {
	          SMarray = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11","SM12","SM13","SM14","SM15","SM16","SM17","SM18","SM19"];
      [] execVM "\z\addons\dayz_server\EMS\major\SMfinder.sqf"; //Starts major mission system
      SMarray2 = ["SM1","SM2","SM3","SM4","SM5","SM6","SM7","SM8","SM9","SM10","SM11","SM12","SM13","SM14","SM15","SM16","SM17","SM18","SM19","SM20","SM21","SM22","SM23","SM24","SM25","SM26","SM27","SM28","SM29","SM30","SM31","SM32","SM33","SM34","SM35","SM36","SM37","SM38","SM39","SM40","SM41","SM42","SM43","SM44","SM45","SM46","SM47","SM48","SM49","SM50","SM51","SM52","SM53","SM54","SM55","SM56","SM57"];
      [] execVM "\z\addons\dayz_server\EMS\minor\SMfinder.sqf"; //Starts minor mission system
    };
    //---------EndInitMissions------//
	    EXT_fnc_atot 			= compile preprocessFile "\z\addons\dayz_server\extern\EXT_fnc_atot.sqf";
EXT_fnc_SortByDistance		= compile preprocessFile "\z\addons\dayz_server\extern\EXT_fnc_Common_SortByDistance.sqf";
WC_fnc_sortlocationbydistance	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_sortlocationbydistance.sqf";
WC_fnc_setskill 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_setskill.sqf";
EXT_fnc_upsmon			= compile preprocessFile "\z\addons\dayz_server\extern\upsmon.sqf";
	
	//////////////////
	// CONFIG FILES
	//////////////////

	WC_fnc_commoninitconfig		= compile preprocessFile "\z\addons\dayz_server\ems\WC_fnc_commoninitconfig.sqf";

	// warcontext anim - camera
	WC_fnc_intro			= compile preprocessFile "\z\addons\dayz_server\warcontext\camera\WC_fnc_intro.sqf";
	WC_fnc_camfocus 		= compile preprocessFile "\z\addons\dayz_server\warcontext\camera\WC_fnc_camfocus.sqf";
	WC_fnc_credits			= compile preprocessFile "\z\addons\dayz_server\warcontext\camera\WC_fnc_credits.sqf";
	WC_fnc_outro			= compile preprocessFile "\z\addons\dayz_server\warcontext\camera\WC_fnc_outro.sqf";
	WC_fnc_outrolooser		= compile preprocessFile "\z\addons\dayz_server\warcontext\camera\WC_fnc_outrolooser.sqf";

	///////////////////////
	// RESOURCES PARSER
	///////////////////////

	WC_fnc_enumcfgpatches 		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enumcfgpatches.sqf";
	WC_fnc_enumcompositions		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enumcompositions.sqf";
	WC_fnc_enumfaction 		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enumfaction.sqf";
	WC_fnc_enummagazines 		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enummagazines.sqf";
	WC_fnc_enummusic 		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enummusic.sqf";
	WC_fnc_enumvehicle 		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enumvehicle.sqf";
	WC_fnc_enumweapons 		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enumweapons.sqf";
	WC_fnc_enumvillages		= compile preprocessFile "\z\addons\dayz_server\warcontext\ressources\WC_fnc_enumvillages.sqf";

	/////////////////////
	// GLOBAL FUNCTIONS
	////////////////////

	WC_fnc_addplayerscore 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_addplayerscore.sqf";
	WC_fnc_attachmarker 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_attachmarker.sqf";
	WC_fnc_attachmarkerlocal	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_attachmarkerlocal.sqf";
	WC_fnc_attachmarkerinzone	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_attachmarkerinzone.sqf";
	WC_fnc_backupbuilding		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_backupbuilding.sqf";
	WC_fnc_checkpilot		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_checkpilot.sqf";
	WC_fnc_clockformat 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_clockformat.sqf";
	WC_fnc_copymarker 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_copymarker.sqf";
	WC_fnc_copymarkerlocal 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_copymarkerlocal.sqf";
	WC_fnc_copymarkerlocal2 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_copymarkerlocal2.sqf";
	WC_fnc_creategridofposition	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_creategridofposition.sqf";
	WC_fnc_createmarker 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createmarker.sqf";
	WC_fnc_createmarker2 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createmarker2.sqf";
	WC_fnc_createmarkerlocal	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createmarkerlocal.sqf";
	WC_fnc_createmarkerlocal2	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createmarkerlocal2.sqf";
	WC_fnc_createcircleposition	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createcircleposition.sqf";
	WC_fnc_createposition 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createposition.sqf";
	WC_fnc_createpositionaround	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createpositionaround.sqf";
	WC_fnc_createpositioninmarker 	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createpositioninmarker.sqf";
	WC_fnc_createpositioninmarker2 	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_createpositioninmarker2.sqf";
	WC_fnc_deletemarker		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_deletemarker.sqf";
	WC_fnc_exportweaponsplayer	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_exportweaponsplayer.sqf";
	WC_fnc_farofpos		 	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_farofpos.sqf";
	WC_fnc_feelwithzero	 	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_feelwithzero.sqf";
	WC_fnc_garbagecollector		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_garbagecollector.sqf";
	WC_fnc_getobject		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_getobject.sqf";
	WC_fnc_gethousespositions	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_gethousespositions.sqf";
	WC_fnc_getterraformvariance	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_getterraformvariance.sqf";
	WC_fnc_markerhint		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_markerhint.sqf";
	WC_fnc_markerhintlocal		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_markerhintlocal.sqf";
	WC_fnc_missionname	 	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_missionname.sqf";
	WC_fnc_newdate		 	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_newdate.sqf";
	WC_fnc_playerhint		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_playerhint.sqf";
	WC_fnc_sortlocationbydistance	= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_sortlocationbydistance.sqf";
	WC_fnc_refreshmarkers		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_refreshmarkers.sqf";
	WC_fnc_relocatelocation		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_relocatelocation.sqf";
	WC_fnc_relocateposition		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_relocateposition.sqf";
	WC_fnc_restorebuilding 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_restorebuilding.sqf";
	WC_fnc_seed	 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_seed.sqf";
	WC_fnc_setskill 		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_setskill.sqf";
	WC_fnc_weaponcanflare		= compile preprocessFile "\z\addons\dayz_server\warcontext\functions\WC_fnc_weaponcanflare.sqf";

	////////////////////////////////
	// WARCONTEXT STANDALONE MODULES 
	////////////////////////////////

	// ALTIMETER	
	WC_fnc_altimeter	 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_altimeter\WC_fnc_altimeter.sqf";

	// AIR BOMBING
	WC_fnc_bomb			= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_airbombing\WC_fnc_bomb.sqf";

	// AIR PATROL
	WC_fnc_airpatrol 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_airpatrols\WC_fnc_airpatrol.sqf";
	WC_fnc_initairpatrol		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_airpatrols\WC_fnc_initairpatrol.sqf";

	// AMMOBOX
	WC_fnc_createammobox 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_ammobox\WC_fnc_createammobox.sqf";
	WC_fnc_loadweapons		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_ammobox\WC_fnc_loadweapons.sqf";

	// ANIMALS
	WC_fnc_createsheep		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_animals\WC_fnc_createsheep.sqf";
	
	// ANTI AIR
	WC_fnc_antiair 			= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_antiair\WC_fnc_antiair.sqf";	

	// CIVIL CAR
	WC_fnc_createcivilcar 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilcars\WC_fnc_createcivilcar.sqf";	

	// CIVILIANS
	WC_fnc_altercation 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_altercation.sqf";
	WC_fnc_buildercivilian		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_buildercivilian.sqf";
	WC_fnc_civilianinit 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_civilianinit.sqf";
	WC_fnc_drivercivilian		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_drivercivilian.sqf";
	WC_fnc_healercivilian		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_healercivilian.sqf";
	WC_fnc_popcivilian		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_popcivilian.sqf";
	WC_fnc_propagand		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_propagand.sqf";
	WC_fnc_sabotercivilian 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_sabotercivilian.sqf";
	WC_fnc_walkercivilian 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_civilians\WC_fnc_walkercivilian.sqf";	

	// CLOTHES
	WC_fnc_restorebody		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_clothes\WC_fnc_restorebody.sqf";

	// COMPOSITIONS
	WC_fnc_createcomposition	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_compositions\WC_fnc_createcomposition.sqf";

	// TOWN GENERATOR
	WC_fnc_computeavillage 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_computevillage\WC_fnc_computeavillage.sqf";

	// DOGS PATROL
	WC_fnc_dogpatrol		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_dogpatrol\WC_fnc_dogpatrol.sqf";

	// ENEMYS GROUPS
	WC_fnc_ambiantlife 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_enemygroups\WC_fnc_ambiantlife.sqf";
	WC_fnc_popgroup 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_enemygroups\WC_fnc_popgroup.sqf";
	WC_fnc_creategroup 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_enemygroups\WC_fnc_creategroup.sqf";
	WC_fnc_creategroup2 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_enemygroups\WC_fnc_creategroup2.sqf";
	WC_fnc_creategroupdefend	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_enemygroups\WC_fnc_creategroupdefend.sqf";
	WC_fnc_creategroupsupport	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_enemygroups\WC_fnc_creategroupsupport.sqf";

	// FAST TIME
	WC_fnc_fasttime			= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_fasttime\WC_fnc_fasttime.sqf";

	// GESTURE
	WC_fnc_dosillything		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_gesture\WC_fnc_dosillything.sqf";
	
	// HANDLER
	WC_fnc_civilhandler		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_handler\WC_fnc_civilhandler.sqf";
	WC_fnc_grouphandler		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_handler\WC_fnc_grouphandler.sqf";
	WC_fnc_vehiclehandler 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_handler\WC_fnc_vehiclehandler.sqf";

	// HUD
	WC_fnc_lifeslider		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_hud\WC_fnc_lifeslider.sqf";

	// IED
	WC_fnc_createied 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_ied\WC_fnc_createied.sqf";
	WC_fnc_createiedintown 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_ied\WC_fnc_createiedintown.sqf";
	WC_fnc_ieddetector		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_ied\WC_fnc_ieddetector.sqf";

	// KEYMAPPER
	WC_fnc_keymapper		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_keymapper\WC_fnc_keymapper.sqf";

	// LOADOUT	
	WC_fnc_saveloadout		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_loadout\WC_fnc_saveloadout.sqf";
	WC_fnc_restoreloadout		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_loadout\WC_fnc_restoreloadout.sqf";
	
	// MARKERS
	WC_fnc_playersmarkers		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_markers\WC_fnc_playersmarkers.sqf";
	WC_fnc_vehiclesmarkers		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_markers\WC_fnc_vehiclesmarkers.sqf";	

	// MINEFIELD
	WC_fnc_createminefield 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_minefield\WC_fnc_createminefield.sqf";
	
	// MORTAR
	WC_fnc_mortar		 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_mortar\WC_fnc_mortar.sqf";

	// MORTUARY
	WC_fnc_createmortuary		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_mortuary\WC_fnc_createmortuary.sqf";

	// NUKE
	WC_fnc_createnuclearfire 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_nuke\WC_fnc_createnuclearfire.sqf";
	WC_fnc_createnuclearzone 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_nuke\WC_fnc_createnuclearzone.sqf";	
	WC_fnc_nuclearnuke		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_nuke\WC_fnc_nuclearnuke.sqf";
	WC_fnc_radiationzone		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_nuke\WC_fnc_radiationzone.sqf";

	// WHEN PLAYER IS KILLED
	WC_fnc_onkilled			= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_onkilled\WC_fnc_onkilled.sqf";
	WC_fnc_restoreactionmenu	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_onkilled\WC_fnc_restoreactionmenu.sqf";

	// RANKING
	WC_fnc_playerranking		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_ranking\WC_fnc_playerranking.sqf";
	WC_fnc_playerscore		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_ranking\WC_fnc_playerscore.sqf";

	// RESPAWNABLE VEHICLE
	WC_fnc_respawnvehicle		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_respawnvehicle\WC_fnc_respawnvehicle.sqf";

	// ROAD PATROL
	WC_fnc_roadpatrol 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_roadpatrols\WC_fnc_roadpatrol.sqf";
	WC_fnc_createconvoy 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_roadpatrols\WC_fnc_createconvoy.sqf";

	// SABOTAGE
	WC_fnc_nastyvehicleevent	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_sabotage\WC_fnc_nastyvehicleevent.sqf";	

	// SEA PATROL
	WC_fnc_createseapatrol		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_seapatrols\WC_fnc_createseapatrol.sqf";
	WC_fnc_seapatrol 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_seapatrols\WC_fnc_seapatrol.sqf";

	// REPAIR ZONE
	WC_fnc_servicing 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_repairzone\WC_fnc_servicing.sqf";
	
	// STATIC WEAPONS
	WC_fnc_createstatic	 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_staticweapons\WC_fnc_createstatic.sqf";

	// STEALTH
	WC_fnc_stealth	 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_stealth\WC_fnc_stealth.sqf";
	
	// SUPPORT
	WC_fnc_support	 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_support\WC_fnc_support.sqf";

	// TARGET ADDACTION
	WC_fnc_targetaction		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_targetaction\WC_fnc_targetaction.sqf";

	// TACTICAL OBJECTS
	WC_fnc_creategenerator 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_tacticalobjects\WC_fnc_creategenerator.sqf";
	WC_fnc_createradio	 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_tacticalobjects\WC_fnc_createradio.sqf";
	WC_fnc_createmhq	 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_tacticalobjects\WC_fnc_createmhq.sqf";

	// UNITS PATROL
	WC_fnc_patrol			= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_unitpatrols\WC_fnc_patrol.sqf";
	WC_fnc_protectobject		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_unitpatrols\WC_fnc_protectobject.sqf";
	WC_fnc_sentinelle	 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_unitpatrols\WC_fnc_sentinelle.sqf";

	// UNITS ROLE
	WC_fnc_createmedic 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_unitsrole\WC_fnc_createmedic.sqf";
	WC_fnc_fireflare 		= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_unitsrole\WC_fnc_fireflare.sqf";

	// virtual
	// WC_fnc_virtual		 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_virtual\WC_fnc_virtual.sqf";

	// WEATHER
	WC_fnc_light			= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_weather\WC_fnc_light.sqf";
	WC_fnc_weather		 	= compile preprocessFile "\z\addons\dayz_server\warcontext\modules\wc_weather\WC_fnc_weather.sqf";

	/////////////////
	// END OF MODULES
	/////////////////

	///////////////////
	// WIT MAIN SCRIPTS
	///////////////////

	WC_fnc_creatediary		= compile preprocessFile "\z\addons\dayz_server\warcontext\WC_fnc_creatediary.sqf";
	WC_fnc_createlistofmissions	= compile preprocessFile "\z\addons\dayz_server\warcontext\WC_fnc_createlistofmissions.sqf";
	WC_fnc_createsidemission 	= compile preprocessFile "\z\addons\dayz_server\warcontext\WC_fnc_createsidemission.sqf";
	WC_fnc_debug			= compile preprocessFile "\z\addons\dayz_server\warcontext\WC_fnc_debug.sqf";
	WC_fnc_deletemissioninsafezone	= compile preprocessFile "\z\addons\dayz_server\warcontext\WC_fnc_deletemissioninsafezone.sqf";
	WC_fnc_eventhandler 		= compile preprocessFile "\z\addons\dayz_server\warcontext\WC_fnc_eventhandler.sqf";
	WC_fnc_mainloop 		= compile preprocessFile "\z\addons\dayz_server\warcontext\WC_fnc_mainloop.sqf";

	//////////////
	// CLIENT SIDE
	//////////////
	WC_fnc_clientinitconfig 	= compile preprocessFile "\z\addons\dayz_server\warcontext\client\WC_fnc_clientinitconfig.sqf";
	WC_fnc_clienthandler		= compile preprocessFile "\z\addons\dayz_server\warcontext\client\WC_fnc_clienthandler.sqf";
	WC_fnc_clientside		= compile preprocessFile "\z\addons\dayz_server\warcontext\client\WC_fnc_clientside.sqf";
	WC_fnc_clientitems		= compile preprocessFile "\z\addons\dayz_server\warcontext\client\WC_fnc_clientitems.sqf";
	
	//////////////
	// SERVER SIDE
	//////////////
	WC_fnc_publishmission		= compile preprocessFile "\z\addons\dayz_server\warcontext\server\WC_fnc_publishmission.sqf";
	WC_fnc_serverinitconfig 	= compile preprocessFile "\z\addons\dayz_server\warcontext\server\WC_fnc_serverinitconfig.sqf";
	WC_fnc_serverhandler 		= compile preprocessFile "\z\addons\dayz_server\warcontext\server\WC_fnc_serverhandler.sqf";
	WC_fnc_serverside 		= compile preprocessFile "\z\addons\dayz_server\warcontext\server\WC_fnc_serverside.sqf";

	////////////
	// MISSIONS
	////////////

	WC_fnc_bringunit		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_bringunit.sqf";
	WC_fnc_bringvehicle		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_bringvehicle.sqf";
	WC_fnc_build			= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_build.sqf";
	WC_fnc_defend			= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_defend.sqf";
	WC_fnc_destroygroup		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_destroygroup.sqf";
	WC_fnc_destroygroup2		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_destroygroup2.sqf";
	WC_fnc_destroyvehicle		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_destroyvehicle.sqf";
	WC_fnc_heal			= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_heal.sqf";
	WC_fnc_jail			= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_jail.sqf";
	WC_fnc_liberatehotage 		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_liberatehotage.sqf";
	WC_fnc_record			= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_record.sqf";
	WC_fnc_rescuecivil		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_rescuecivil.sqf";
	WC_fnc_rob			= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_rob.sqf";
	WC_fnc_steal	 		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_steal.sqf";
	WC_fnc_sabotage	 		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_sabotage.sqf";
	WC_fnc_securezone 		= compile preprocessFile "\z\addons\dayz_server\warcontext\missions\WC_fnc_securezone.sqf";
	
wceastside = [["INS","BIS_GER"],[["INS","ins_Soldier_1"],["INS","ins_Soldier_AT"],["ins","ins_Soldier_2"],["ins","Ins_Villager3"],["ins","Ins_Villager4"],["ins","ins_Soldier_AA"],["ins","ins_Soldier_AT"],["ins","ins_Commander"],["ins","ins_Soldier_Sniper"],["ins","ins_Soldier_AR"],["ins","ins_Soldier_MG"],["ins","ins_Woodlander1"],["ins","ins_Soldier_GL"],["ins","ins_Soldier_Medic"],["ins","ins_Soldier_CO"],["ins","ins_Soldier_3"],["ins","ins_Soldier_sab"],["ins","ins_Soldier_sapper"],["ins","ins_Bardak"],["ins","Ins_Lopotev"],["BIS_US","US_Soldier_EP1"],["BIS_US","US_Soldier_B_EP1"],["BIS_US","US_Soldier_AMG_EP1"],["BIS_US","US_Soldier_AAR_EP1"],["BIS_US","US_Soldier_AHAT_EP1"],["BIS_US","US_Soldier_AAT_EP1"],["BIS_US","US_Soldier_Light_EP1"],["BIS_US","US_Soldier_GL_EP1"],["BIS_US","US_Soldier_Officer_EP1"],["BIS_US","US_Soldier_SL_EP1"],["BIS_US","US_Soldier_TL_EP1"],["BIS_US","US_Soldier_LAT_EP1"],["BIS_US","US_Soldier_AT_EP1"],["BIS_US","US_Soldier_HAT_EP1"],["BIS_US","US_Soldier_AA_EP1"],["BIS_US","US_Soldier_Medic_EP1"],["BIS_US","US_Soldier_AR_EP1"],["BIS_US","US_Soldier_MG_EP1"],["BIS_US","US_Soldier_Spotter_EP1"],["BIS_US","US_Soldier_Sniper_EP1"],["BIS_US","US_Soldier_Sniper_NV_EP1"],["BIS_US","US_Soldier_SniperH_EP1"],["BIS_US","US_Soldier_Marksman_EP1"],["BIS_US","US_Soldier_Engineer_EP1"],["BIS_US","US_Soldier_Pilot_EP1"],["BIS_US","US_Soldier_Crew_EP1"],["BIS_US","US_Delta_Force_EP1"],["BIS_US","US_Delta_Force_TL_EP1"],["BIS_US","US_Delta_Force_Medic_EP1"],["BIS_US","US_Delta_Force_Assault_EP1"],["BIS_US","US_Delta_Force_SD_EP1"],["BIS_US","US_Delta_Force_MG_EP1"],["BIS_US","US_Delta_Force_AR_EP1"],["BIS_US","US_Delta_Force_Night_EP1"],["BIS_US","US_Delta_Force_Marksman_EP1"],["BIS_US","US_Delta_Force_M14_EP1"],["BIS_US","US_Delta_Force_Air_Controller_EP1"],["BIS_US","US_Pilot_Light_EP1"],["BIS_US","Drake"],["BIS_US","Herrera"],["BIS_US","Pierce"],["BIS_US","Graves"],["BIS_US","Drake_Light"],["BIS_US","Herrera_Light"],["BIS_US","Pierce_Light"],["BIS_US","Graves_Light"],["BIS_ger","GER_Soldier_EP1"]]];
		wcresistanceside = [["BIS_TK_GUE","BIS_UN","PMC_BAF"],[["BIS_TK_GUE","TK_GUE_Soldier_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AAT_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_2_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_3_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_4_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_5_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AA_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AT_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_HAT_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_TL_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_Sniper_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_AR_EP1"],["BIS_TK_GUE","TK_GUE_Soldier_MG_EP1"],["BIS_TK_GUE","TK_GUE_Bonesetter_EP1"],["BIS_TK_GUE","TK_GUE_Warlord_EP1"],["BIS_UN","UN_CDF_Soldier_EP1"],["BIS_UN","UN_CDF_Soldier_B_EP1"],["BIS_UN","UN_CDF_Soldier_AAT_EP1"],["BIS_UN","UN_CDF_Soldier_AMG_EP1"],["BIS_UN","UN_CDF_Soldier_AT_EP1"],["BIS_UN","UN_CDF_Soldier_MG_EP1"],["BIS_UN","UN_CDF_Soldier_SL_EP1"],["BIS_UN","UN_CDF_Soldier_Officer_EP1"],["BIS_UN","UN_CDF_Soldier_Guard_EP1"],["BIS_UN","UN_CDF_Soldier_Pilot_EP1"],["BIS_UN","UN_CDF_Soldier_Crew_EP1"],["BIS_UN","UN_CDF_Soldier_Light_EP1"],["PMC_BAF","CIV_Contractor1_BAF"],["PMC_BAF","CIV_Contractor2_BAF"],["PMC_BAF","Soldier_PMC"],["PMC_BAF","Soldier_M4A3_PMC"],["PMC_BAF","Soldier_Engineer_PMC"],["PMC_BAF","Soldier_Crew_PMC"],["PMC_BAF","Soldier_Medic_PMC"],["PMC_BAF","Soldier_TL_PMC"],["PMC_BAF","Soldier_Pilot_PMC"],["PMC_BAF","Soldier_MG_PMC"],["PMC_BAF","Soldier_MG_PKM_PMC"],["PMC_BAF","Soldier_Sniper_PMC"],["PMC_BAF","Soldier_Sniper_KSVK_PMC"],["PMC_BAF","Soldier_GL_PMC"],["PMC_BAF","Soldier_GL_M16A2_PMC"],["PMC_BAF","Soldier_Bodyguard_M4_PMC"],["PMC_BAF","Soldier_Bodyguard_AA12_PMC"],["PMC_BAF","Soldier_AA_PMC"],["PMC_BAF","Soldier_AT_PMC"],["PMC_BAF","Poet_PMC"],["PMC_BAF","Ry_PMC"],["PMC_BAF","Reynolds_PMC"],["PMC_BAF","Tanny_PMC"],["PMC_BAF","Dixon_PMC"]]];
		wcwestside = ["Survivor1_DZ"];	
	wcallsides = wceastside + wcresistanceside;
// blacklist of faction
	wcblacklistside = [];
	wcwithrussian == 1;
	wcwithtakistan == 1;
	if (wcwithrussian == 0) then {
		wcblacklistside = wcblacklistside + ["RU", "INS", "GUE"];
	};

	if (wcwithtakistan == 0) then {
		wcblacklistside = wcblacklistside + ["BIS_TK_INS", "BIS_TK", "BIS_TK_GUE", "BIS_UN"];
	};
	wcfactions = (wcallsides select 0) - wcblacklistside;
	wcclasslist = wcallsides select 1;

	// UPSMON INIT
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\extern\Init_UPSMON.sqf";
_pos = getmarkerpos "jail";
[_pos,80,4,4,1] execVM "\z\addons\dayz_server\EMS\guard_jail.sqf";//Jail Guards	
	// enemy zone size
	wclevel = 5;
	wcdistancegrowth = 10;
	wcdistance = 200 + (wclevel * wcdistancegrowth);
	
	t5 = getposasl town5;
	t6 = getposasl town6;
	t7 = getposasl town7;
	t8 = getposasl town8;
	t9 = getposasl town9;
	t10 = getposasl town10;
	t11 = getposasl town11;
	t12 = getposasl town12;
	t13 = getposasl town13;
	t15 = getposasl town15;
	t16 = getposasl town16;
	t17 = getposasl town17;
	t18 = getposasl town18;
	t19 = getposasl town19;
	t20 = getposasl town20;
	t21 = getposasl town21;
	t22 = getposasl town22;
	t23 = getposasl town23;
	t24 = getposasl town24;
	t25 = getposasl town25;
	t26 = getposasl town26;
	t27 = getposasl town27;
	t28 = getposasl town28;
	t29 = getposasl town29;
	t30 = getposasl town30;
	t31 = getposasl town31;
	t32 = getposasl town32;
	t33 = getposasl town33;
	t34 = getposasl town34;
	t35 = getposasl town35;
	t36 = getposasl town36;
	t37 = getposasl town37;
	t38 = getposasl town38;
	t39 = getposasl town39;
	t40 = getposasl town40;
	t41 = getposasl town41;
	t42 = getposasl town42;
	t43 = getposasl town43;
	t44 = getposasl town44;
	t45 = getposasl town45;
	t46 = getposasl town46;
	t47 = getposasl town47;
	t48 = getposasl town48;
	t49 = getposasl town49;
	t50 = getposasl town50;
	t51 = getposasl town51;
	t52 = getposasl town52;
	t53 = getposasl town53;
	t54 = getposasl town54;
	t55 = getposasl town55;
	t56 = getposasl town56;
	t57 = getposasl town57;
	t58 = getposasl town58;
	t59 = getposasl town59;
	t60 = getposasl town60;
	t70 = getposasl town70;
	t71 = getposasl town71;
	t72 = getposasl town72;
	t73 = getposasl town73;
	t74 = getposasl town74;
	t75 = getposasl town75;
	t76 = getposasl town76;
	t77 = getposasl town77;
	wctownlocations = [t5,t6,t7,t8,t9,t10,t11,t12,t13,t15,t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t33,t34,t35,t36,t37,t38,t39,t40,t41,t42,t43,t44,t45,t46,t47,t48,t49,t50,t60,t70,t71,t72,t73,t74,t75,t76,t77];

	
	//wcskill = wcskill + 0.02;
_position = getmarkerpos "c1";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
			 
 _position = getmarkerpos "c2";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			
			 
_position = getmarkerpos "c3";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;	
			 
			 		 
_position = getmarkerpos "c4";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
			  		 
_position = getmarkerpos "c5";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
			  		 
_position = getmarkerpos "c6";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
			 		 
_position = getmarkerpos "FBZel_2";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
				 
_position = getmarkerpos "Westrovka";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			
			  	 
_position = getmarkerpos "small_7";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
			  		 
_position = getmarkerpos "small_6";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
			   		 
_position = getmarkerpos "high_1";
			_vehicle = createvehicle ["RoadBarrier_long", _position, [], 0, "NONE"];
			wcgarbage = [_vehicle, 5] spawn WC_fnc_setskill;
			 [_vehicle] spawn WC_fnc_protectobject;
			 wcgarbage = [_position] spawn WC_fnc_createstatic;
			 
   wcgarbage = [] call WC_fnc_commoninitconfig;
//   /////////////////////////////////////////////////////////////////
//	//	SERVER SIDE
//	/////////////////////////////////////////////////////////////////

//	if (isserver) then { wcgarbage = [] spawn WC_fnc_serverside;};	
	


dayz_perform_purge = {
	if(!isNull(_this)) then {
		_this removeAllMPEventHandlers "mpkilled";
		_this removeAllMPEventHandlers "mphit";
		_this removeAllMPEventHandlers "mprespawn";
		_this removeAllEventHandlers "FiredNear";
		_this removeAllEventHandlers "HandleDamage";
		_this removeAllEventHandlers "Killed";
		_this removeAllEventHandlers "Fired";
		_this removeAllEventHandlers "GetOut";
		_this removeAllEventHandlers "GetIn";
		_this removeAllEventHandlers "Local";
		clearVehicleInit _this;
		deleteVehicle _this;
		deleteGroup (group _this);
	};
};

dayz_perform_purge_player = {

	private ["_countr","_backpack","_backpackType","_backpackWpn","_backpackMag","_objWpnTypes","_objWpnQty","_location","_dir","_holder","_weapons","_magazines"];
    diag_log ("Purging player: " + str(_this));	

	if(!isNull(_this)) then {

		_location = getposatl _this;
		_dir = getDir _this;

		_holder = createVehicle ["GraveDZE", _location, [], 0, "CAN_COLLIDE"];
		_holder setDir _dir;
		_holder setPosATL _location;

		_holder enableSimulation false;

		_weapons = weapons _this;
		_magazines = magazines _this;

		// find backpack
		if(!(isNull unitBackpack _this)) then {
			_backpack = unitBackpack _this;
			_backpackType = typeOf _backpack;
			_backpackWpn = getWeaponCargo _backpack;
			_backpackMag = getMagazineCargo _backpack;

			_holder addBackpackCargoGlobal [_backpackType,1];

			// add items from backpack 
			_objWpnTypes = _backpackWpn select 0;
			_objWpnQty = _backpackWpn select 1;
			_countr = 0;
			{
				_holder addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} forEach _objWpnTypes;

			// add backpack magazine items
			_objWpnTypes = _backpackMag select 0;
			_objWpnQty = _backpackMag select 1;
			_countr = 0;
			{
				_holder addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
				_countr = _countr + 1;
			} forEach _objWpnTypes;
		};
	};

	// add weapons
	{ 
		_holder addWeaponCargoGlobal [_x, 1];
	} forEach _weapons;

	// add mags
	{ 
		_holder addMagazineCargoGlobal [_x, 1];
	} forEach _magazines;

	_this removeAllMPEventHandlers "mpkilled";
	_this removeAllMPEventHandlers "mphit";
	_this removeAllMPEventHandlers "mprespawn";
	_this removeAllEventHandlers "FiredNear";
	_this removeAllEventHandlers "HandleDamage";
	_this removeAllEventHandlers "Killed";
	_this removeAllEventHandlers "Fired";
	_this removeAllEventHandlers "GetOut";
	_this removeAllEventHandlers "GetIn";
	_this removeAllEventHandlers "Local";
	clearVehicleInit _this;
	deleteVehicle _this;
	deleteGroup (group _this);
	//  _this = nil;
};


dayz_removePlayerOnDisconnect = {
	if(!isNull(_this)) then {
		_this removeAllMPEventHandlers "mphit";
		deleteVehicle _this;
		deleteGroup (group _this);
	};
};

server_timeSync = {
	//Send request
	private ["_hour","_minute","_date","_key","_result","_outcome"];
    _key = "CHILD:307:";
	_result = _key call server_hiveReadWrite;
	_outcome = _result select 0;
	if(_outcome == "PASS") then {
		_date = _result select 1; 
		
		if(dayz_fullMoonNights) then {
			_hour = _date select 3;
			_minute = _date select 4;
			//Force full moon nights
			_date = [2013,8,3,_hour,_minute];
		};

		setDate _date;
		PVDZE_plr_SetDate = _date;
		publicVariable "PVDZE_plr_SetDate";
		diag_log ("TIME SYNC: Local Time set to " + str(_date));	
	};
};

// must spawn these 
server_spawncleanDead = {
	private ["_deathTime","_delQtyZ","_delQtyP","_qty","_allDead"];
	_allDead = allDead;
	_delQtyZ = 0;
	_delQtyP = 0;
	{
		if (local _x) then {
			if (_x isKindOf "zZombie_Base") then
			{
				_x call dayz_perform_purge;
				sleep 0.05;
				_delQtyZ = _delQtyZ + 1;
			} else {
				if (_x isKindOf "CAManBase") then {
					_deathTime = _x getVariable ["processedDeath", diag_tickTime];
					if (diag_tickTime - _deathTime > 1800) then {
						_x call dayz_perform_purge_player;
						sleep 0.025;
						_delQtyP = _delQtyP + 1;
					};
				};
			};
		};
		sleep 0.025;
	} forEach _allDead;
	if (_delQtyZ > 0 or _delQtyP > 0) then {
		_qty = count _allDead;
		diag_log (format["CLEANUP: Deleted %1 players and %2 zombies out of %3 dead",_delQtyP,_delQtyZ,_qty]);
	};
};
server_cleanupGroups = {
	if (DZE_DYN_AntiStuck3rd > 3) then { DZE_DYN_GroupCleanup = nil; DZE_DYN_AntiStuck3rd = 0; };
	if(!isNil "DZE_DYN_GroupCleanup") exitWith {  DZE_DYN_AntiStuck3rd = DZE_DYN_AntiStuck3rd + 1;};
	DZE_DYN_GroupCleanup = true;
	{
		if (count units _x == 0) then {
			deleteGroup _x;
		};
		sleep 0.001;
	} forEach allGroups;
	DZE_DYN_GroupCleanup = nil;
};

server_checkHackers = {
	if (DZE_DYN_AntiStuck2nd > 3) then { DZE_DYN_HackerCheck = nil; DZE_DYN_AntiStuck2nd = 0; };
	if(!isNil "DZE_DYN_HackerCheck") exitWith {  DZE_DYN_AntiStuck2nd = DZE_DYN_AntiStuck2nd + 1;};
	DZE_DYN_HackerCheck = true;
	{
		 if(vehicle _x != _x && !(vehicle _x in PVDZE_serverObjectMonitor) && (isPlayer _x) && (vehicle _x getVariable ["Sarge",0] != 1) && !((typeOf vehicle _x) in DZE_safeVehicle)) then {
			diag_log ("CLEANUP: KILLING A HACKER " + (name _x) + " " + str(_x) + " IN " + (typeOf vehicle _x));
			(vehicle _x) setDamage 1;
			_x setDamage 1;
			sleep 0.25;
		};
		sleep 0.001;
	} forEach allUnits;
	DZE_DYN_HackerCheck = nil;
};

server_spawnCleanFire = {
	private ["_delQtyFP","_qty","_delQtyNull","_missionFires"];
	_missionFires = allMissionObjects "Land_Fire_DZ";
	_delQtyFP = 0;
	{
		if (local _x) then {
			deleteVehicle _x;
			sleep 0.025;
			_delQtyFP = _delQtyFP + 1;
		};
		sleep 0.001;
	} forEach _missionFires;
	if (_delQtyFP > 0) then {
		_qty = count _missionFires;
		diag_log (format["CLEANUP: Deleted %1 fireplaces out of %2",_delQtyNull,_qty]);
	};
};
server_spawnCleanLoot = {
	private ["_created","_delQty","_nearby","_age","_keep","_qty","_missionObjs","_dateNow"];
	if (DZE_DYN_AntiStuck > 3) then { DZE_DYN_cleanLoot = nil; DZE_DYN_AntiStuck = 0; };
	if(!isNil "DZE_DYN_cleanLoot") exitWith {  DZE_DYN_AntiStuck = DZE_DYN_AntiStuck + 1;};
	DZE_DYN_cleanLoot = true;

	_missionObjs =  allMissionObjects "ReammoBox";
	_delQty = 0;
	_dateNow = (DateToNumber date);
	{
		_keep = _x getVariable ["permaLoot",false];
		if (!_keep) then {
			_created = _x getVariable ["created",-0.1];
			if (_created == -0.1) then {
				_x setVariable ["created",_dateNow,false];
				_created = _dateNow;
			} else {
				_age = (_dateNow - _created) * 525948;
				if (_age > 20) then {
					_nearby = {(isPlayer _x) and (alive _x)} count (_x nearEntities [["CAManBase","AllVehicles"], 130]);
					if (_nearby==0) then {
						deleteVehicle _x;
						sleep 0.025;
						_delQty = _delQty + 1;
					};
				};
			};
		};
		sleep 0.001;
	} forEach _missionObjs;
	if (_delQty > 0) then {
		_qty = count _missionObjs;
		diag_log (format["CLEANUP: Deleted %1 Loot Piles out of %2",_delQty,_qty]);
	};
	DZE_DYN_cleanLoot = nil;
};

server_spawnCleanAnimals = {
	private ["_pos","_delQtyAnimal","_qty","_missonAnimals","_nearby"];
	_missonAnimals = entities "CAAnimalBase";
	_delQtyAnimal = 0;
	{
		if (local _x) then {
			_x call dayz_perform_purge;
			sleep 0.05;
			_delQtyAnimal = _delQtyAnimal + 1;
		} else {
			if (!alive _x) then {
				_pos = getposatl _x;
				if (count _pos > 0) then {
					_nearby = {(isPlayer _x) and (alive _x)} count (_pos nearEntities [["CAManBase","AllVehicles"], 130]);
					if (_nearby==0) then {
						_x call dayz_perform_purge;
						sleep 0.05;
						_delQtyAnimal = _delQtyAnimal + 1;
					};
				};
			};
		};
		sleep 0.001;
	} forEach _missonAnimals;
	if (_delQtyAnimal > 0) then {
		_qty = count _missonAnimals;
		diag_log (format["CLEANUP: Deleted %1 Animals out of %2",_delQtyAnimal,_qty]);
	};
};

server_getLocalObjVars = {
	private ["_player","_obj","_objectID","_objectUID","_weapons","_magazines","_backpacks"];

	_player = _this select 0;
	_obj = _this select 1;

	_objectID 	= _obj getVariable["ObjectID","0"];
	_objectUID	= _obj getVariable["ObjectUID","0"];

	_weapons = _obj getVariable ["WeaponCargo", false];
	_magazines = _obj getVariable ["MagazineCargo", false];
	_backpacks = _obj getVariable ["BackpackCargo", false];

	PVDZE_localVarsResult = [_weapons,_magazines,_backpacks];
	(owner _player) publicVariableClient "PVDZE_localVarsResult";
	
	diag_log format["SAFE UNLOCKED: ID:%1 UID:%2 BY %3(%4)", _objectID, _objectUID, (name _player), (getPlayerUID _player)];
};

server_setLocalObjVars = {
	private ["_obj","_holder","_weapons","_magazines","_backpacks","_player","_objectID","_objectUID"];

	_obj = _this select 0;
	_holder = _this select 1;
	_player = _this select 2;

	_objectID 	= _obj getVariable["ObjectID","0"];
	_objectUID	= _obj getVariable["ObjectUID","0"];

	_weapons = 		getWeaponCargo _obj;
	_magazines = 	getMagazineCargo _obj;
	_backpacks = 	getBackpackCargo _obj;
	
	deleteVehicle _obj;

	_holder setVariable ["WeaponCargo", _weapons];
	_holder setVariable ["MagazineCargo", _magazines];
	_holder setVariable ["BackpackCargo", _backpacks];
	
	diag_log format["SAFE LOCKED: ID:%1 UID:%2 BY %3(%4)", _objectID, _objectUID, (name _player), (getPlayerUID _player)];
};