// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0 System Config
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

class CfgPatches
{
	class GL4_System
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"CAData", "CA_Modules", "CAUI"};
	};
};

#include "CfgResource.hpp"

#define GL4_EH_System "if (isNil ""GL4_Path"") then {GL4_Path = ""\z\addons\dayz_server\modules\GL4_System\""}; _this execVM (GL4_Path+""GL4_System.sqf"")";

#define GL4_EH_Defend "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; if (isServer) then {_this execVM (GL4_Path+""GL4\GL4_System\GL4_Defend.sqf"") }";

#define GL4_EH_Static "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; if (isServer) then {_this execVM (GL4_Path+""GL4\GL4_System\GL4_Static.sqf"") }";

#define GL4_EH_Custom "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; if (isServer) then {_this execVM (GL4_Path+""GL4\GL4_System\GL4_Custom.sqf"") }";

#define GL4_EH_Special_FX "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_Special_FX.sqf"")";

#define GL4_EH_Time "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_Random\GL4_Time.sqf"")";

#define GL4_EH_Weather "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_Random\GL4_Weather.sqf"")";

#define GL4_EH_Position "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_Random\GL4_Position.sqf"")";

#define GL4_EH_Snow "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_Random\GL4_Snow.sqf"")";

#define GL4_EH_HC_Reinforcement "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_HC_Reinforcement.sqf"")";

#define GL4_EH_HC_Helicopter "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_HC_Helicopter.sqf"")";

#define GL4_EH_HC_Artillery "if (isNil ""GL4_Path"") then {GL4_Path = ""\GL4_System\""}; _this execVM (GL4_Path+""GL4\GL4_System\GL4_HC_Artillery.sqf"")";

class Extended_Init_Eventhandlers
{
	class CAManBase
	{
		class GL4_System
		{
			init = GL4_EH_System
		};
	};
};

class CfgVehicles
{
	class Logic;

	class GL4_System : Logic
	{
		displayName = "Group Link 4: System ( Initialize )";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_System
		};
	};

	class GL4_Defend : Logic
	{
		displayName = "Group Link 4: A.I. Enhancement ( Defend )";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Defend
		};
	};

	class GL4_Static : Logic
	{
		displayName = "Group Link 4: A.I. Enhancement ( Static )";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Static
		};
	};

	class GL4_Custom : Logic
	{
		displayName = "Group Link 4: A.I. Enhancement ( Custom )";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Custom
		};
	};

	class GL4_Special_FX : Logic
	{
		displayName = "Group Link 4: Special FX ( Initialize )";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Special_FX
		};
	};

	class GL4_Time : Logic
	{
		displayName = "Group Link 4: Random Time";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Time
		};
	};

	class GL4_Weather : Logic
	{
		displayName = "Group Link 4: Random Weather";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Weather
		};
	};

	class GL4_Position : Logic
	{
		displayName = "Group Link 4: Random Position";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Position
		};
	};

	class GL4_Snow : Logic
	{
		displayName = "Group Link 4: Random Snow";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_Snow
		};
	};

	class GL4_HC_Reinforcement : Logic
	{
		displayName = "Group Link 4: High Command Reinforcement";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_HC_Reinforcement
		};
	};

	class GL4_HC_Helicopter : Logic
	{
		displayName = "Group Link 4: High Command Helicopter";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_HC_Helicopter
		};
	};

	class GL4_HC_Artillery : Logic
	{
		displayName = "Group Link 4: High Command Artillery";
		icon = "\ca\ui\data\icon_functions_ca.paa";
		picture = "\ca\ui\data\icon_functions_ca.paa";
		vehicleClass = "Modules";

		class EventHandlers
		{
			init = GL4_EH_HC_Artillery
		};
	};
};

class CfgAddOns
{
	class PreloadBanks {};
	
	class PreloadAddOns
	{
		class GL4_System
		{
			list[] = {"GL4_System"};
		};
	};
};