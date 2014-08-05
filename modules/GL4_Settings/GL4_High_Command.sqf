// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.1.87 High Command Settings
// ////////////////////////////////////////////////////////////////////////////
// The GL4 High Command settings are stored in the global array GL4_High_Command.
// You can change settings of GL4 by editing the GL4_High_Command array.
// For each custom setting uncomment remove the "//" in front of the respective line and modify the value.
// GL4_High_Command set [ Index, Value ];
// In multiplayer all GL4_High_Command settings are used by every player individual and by the server.
// ////////////////////////////////////////////////////////////////////////////

  // GL4 High Command Reinforcement:
  // ==============================================================
  // High Command Reinforcement Default:
  // Choose if the "High Command Reinforcement" feature should be initialized by default.
  // Warning: The default initialize do not work in multiplayer.
  // True / False, default is False
     GL4_High_Command set [0, True];

    // High Command Reinforcement Groups:
    // Choose how many friendly A.I. groups can be requested as reinforcement at the same time.
    // 0 - 30, default is 3
       GL4_High_Command set [1, 3];

    // High Command Reinforcement Distance:
    // Choose the distance in which a player should be able to request reinforcement.
    // 0 - 50000, default is 50000
       GL4_High_Command set [2, 50000];

    // High Command Reinforcement 3D Marker:
    // Choose if friendly A.I. groups should use/get a 3D marker.
    // True / False, default is True
       GL4_High_Command set [3, False];

  // GL4 High Command Helicopter:
  // ==============================================================
  // High Command Helicopter Default:
  // Choose if the "High Command Helicopter" feature should be initialized by default.
  // Warning: The default initialize do not work in multiplayer.
  // True / False, default is False
     GL4_High_Command set [4, True];

    // High Command Helicopter Groups:
    // Choose how many friendly A.I. helicopters can be requested at the same time.
    // 0 - 10, default is 2
       GL4_High_Command set [5, 2];

    // High Command Helicopter Distance:
    // Choose the distance in which a player should be able to request helicopters.
    // 0 - 50000, default is 50000
       GL4_High_Command set [6, 50000];

    // High Command Helicopter 3D Marker:
    // Choose if friendly A.I. helicopters should use/get a 3D marker.
    // True / False, default is True
       GL4_High_Command set [7, False];

  // GL4 High Command Artillery:
  // ==============================================================
  // High Command Artillery Default:
  // Choose if the "High Command Artillery" feature should be initialized by default.
  // Warning: The default initialize do not work in multiplayer.
  // True / False, default is False
    // GL4_High_Command set [8, True];

    // High Command Artillery Request:
    // Choose how much artillery can be requested by a player at the same time.
    // 0 - 10, default is 3
      // GL4_High_Command set [9, 3];

    // High Command Artillery Ammo:
    // Choose the artillery ammo.
    // Available ammo classes: "Sh_85_HE", "Sh_105_HE", "Sh_120_HE", "Sh_120_SABOT", "Sh_122_HE", "Sh_125_HE", "Sh_125_SABOT", "Bomb", "Grenade"
    // Default is "Sh_125_HE"
      // GL4_High_Command set [10, "Sh_85_HE"];

    // High Command Artillery Round:
    // Choose how often artillery should fire per request.
    // 0 - 10, default is 5
      // GL4_High_Command set [11, 5];

    // High Command Artillery Accuracy:
    // Choose how accurate artillery will hit the target.
    // 0 - 100, default is 50
      // GL4_High_Command set [12, 50];

    // High Command Artillery Fire Pause:
    // Choose after which amount of time artillery should be available to be requested in again.
    // 0 - 1000, default is 240
      // GL4_High_Command set [13, 240];

    // High Command Artillery 3D Marker:
    // Choose if friendly A.I. groups should use/get a 3D marker.
    // True / False, default is True
      // GL4_High_Command set [14, False];