// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.0
// ////////////////////////////////////////////////////////////////////////////
// Array Monitor
// Idea by Operation Flashpoint MOD E.C.P. ( Enhanced Configuration Project )
// Script by =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

_a = _this select 0;

switch (_a) do
{
	case 1 :
	{
		while { (True) } do
		{
			if (count (GL4_Player select 0) > 0) then {{if !(alive _x) then {GL4_Player set [0, (GL4_Player select 0) - [_x] ] } } } forEach (GL4_Player select 0);

			sleep 30;

			if (count (GL4_Player select 1) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Player set [1, (GL4_Player select 1) - [_x] ] } } } forEach (GL4_Player select 1);

			sleep 30;
		};
	};

	case 2 :
	{
		while { (True) } do
		{
			if (count (GL4_Captive select 0) > 0) then {{if ( !(alive _x) || (side _x != CIVILIAN) ) then {GL4_Captive set [0, (GL4_Captive select 0) - [_x] ] } } } forEach (GL4_Captive select 0);

			sleep 30;

			if (count (GL4_Captive select 2) > 0) then {{if ( !(alive _x) || (side _x != CIVILIAN) ) then {GL4_Captive set [2, (GL4_Captive select 2) - [_x] ] } } } forEach (GL4_Captive select 2);

			sleep 30;

			if (count (GL4_Simulate select 0) > 0) then {{if !(alive _x) then {GL4_Simulate set [0, (GL4_Simulate select 0) - [_x] ] } } } forEach (GL4_Simulate select 0);

			sleep 30;

			if (isServer) then
			{
				if (count (GL4_Recruit select 0) > 0) then {{if !(alive _x) then {GL4_Recruit set [0, (GL4_Recruit select 0) - [_x] ] } } } forEach (GL4_Recruit select 0);

				sleep 30;
			};
		};
	};

	case 3 :
	{
		while { (True) } do
		{
			if (count (GL4_Groups select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Groups set [0, (GL4_Groups select 0) - [_x] ] } } } forEach (GL4_Groups select 0);

			sleep 10;

			if (count (GL4_Defend select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Defend set [0, (GL4_Defend select 0) - [_x] ] } } } forEach (GL4_Defend select 0);

			sleep 10;

			if (count (GL4_Location select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Location set [0, (GL4_Location select 0) - [_x] ] } } } forEach (GL4_Location select 0);

			sleep 10;

			if (count (GL4_Static select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Static set [0, (GL4_Static select 0) - [_x] ] } } } forEach (GL4_Static select 0);

			sleep 10;

			if (count (GL4_Reinforcement select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Reinforcement set [0, (GL4_Reinforcement select 0) - [_x] ] } } } forEach (GL4_Reinforcement select 0);

			sleep 10;

			if (count (GL4_Reinforcement select 1) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Reinforcement set [1, (GL4_Reinforcement select 1) - [_x] ] } } } forEach (GL4_Reinforcement select 1);

			sleep 10;

			if (count (GL4_House_Search select 1) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_House_Search set [1, (GL4_House_Search select 1) - [_x] ] } } } forEach (GL4_House_Search select 1);

			sleep 10;

			if (count (GL4_Advancing select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Advancing set [0, (GL4_Advancing select 0) - [_x] ] } } } forEach (GL4_Advancing select 0);

			sleep 10;

			if (count (GL4_Suppressed select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Suppressed set [0, (GL4_Suppressed select 0) - [_x] ] } } } forEach (GL4_Suppressed select 0);

			sleep 10;

			if (count (GL4_Body_Detect select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Body_Detect set [0, (GL4_Body_Detect select 0) - [_x] ] } } } forEach (GL4_Body_Detect select 0);

			sleep 10;

			if (count (GL4_Artillery select 0) > 0) then {{_b = (vehicle leader _x); if ( !(_b isKindOf "StaticCannon") || !(alive _b) || !(canFire _b) || !(alive gunner _b) ) then {GL4_Artillery set [0, (GL4_Artillery select 0) - [_x] ] } } } forEach (GL4_Artillery select 0);

			sleep 10;

			if (count (GL4_Airstrike select 0) > 0) then {{_b = (vehicle leader _x); if ( !(_b isKindOf "Plane") || !(alive _b) || !(canFire _b) || !(alive driver _b) ) then {GL4_Airstrike set [0, (GL4_Airstrike select 0) - [_x] ] } } } forEach (GL4_Airstrike select 0);

			sleep 10;

			if (count (GL4_Extraction select 0) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Extraction set [0, (GL4_Extraction select 0) - [_x] ] } } } forEach (GL4_Extraction select 0);

			sleep 10;

			if (count (GL4_Extraction select 1) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Extraction set [1, (GL4_Extraction select 1) - [_x] ] } } } forEach (GL4_Extraction select 1);

			sleep 10;

			if (count (GL4_Extraction select 2) > 0) then {{if ( { (alive _x) } count (units _x) == 0) then {GL4_Extraction set [2, (GL4_Extraction select 2) - [_x] ] } } } forEach (GL4_Extraction select 2);

			sleep 10;

			if (count (GL4_Rearm select 0) > 0) then {{if (primaryWeapon _x == "") then {GL4_Rearm set [0, (GL4_Rearm select 0) - [_x] ] } } } forEach (GL4_Rearm select 0);

			sleep 10;
		};
	};
};