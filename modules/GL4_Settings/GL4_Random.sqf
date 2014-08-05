// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.1.87 Random Settings
// ////////////////////////////////////////////////////////////////////////////
// The GL4 Random settings are stored in the global array GL4_Random.
// You can change settings of GL4 by editing the GL4_Random array.
// For each custom setting uncomment remove the "//" in front of the respective line and modify the value.
// GL4_Random set [ Index, Value ];
// In multiplayer all GL4_Random settings are used by every player individual and by the server.
// ////////////////////////////////////////////////////////////////////////////

  // GL4 Random Time:
  // ==============================================================
  // Random Time Fix:
  // Choose the time which should be used.
  // Note: If this value is set to 0 then the script will set 24 as default value.
  // 0 / 24, default is 10
    // GL4_Random set [0, 10];

    // Random Time Random:
    // Choose the random time which should be used.
    // Note: This value will randomly increase the value given above.
    // 0 / 24, default is 14
      // GL4_Random set [1, 14];

  // GL4 Random Weather:
  // ==============================================================
  // Random Weather Change Interval:
  // Choose the interval in which the weather should change.
  // 900 = Minimum weather change interval time.
  // 1200 = Maximum weather change interval time.
  // [5, 10] / [1000, 2000], default is [900, 1200]
    // GL4_Random set [2, [900, 1200] ];

    // Random Weather Change Time:
    // Choose how much time have to pass till the next weather change.
    // 300 = Minimum weather change time.
    // 600 = Maximum weather change time.
    // [5, 10] / [1000, 2000], default is [300, 600]
      // GL4_Random set [3, [300, 600] ];

    // Random Weather Overcast:
    // Choose the maximum and the minimum overcast value.
    // 0 = Minimum overcast value.
    // 1 = Maximum overcast value.
    // Note: 0 = No overcast.
    //       1 = Heavy overcast.
    // [0, 0] / [1, 1], default is [0, 1]
      // GL4_Random set [4, [0, 1] ];

    // Random Weather Rain:
    // Choose the maximum and the minimum rain value.
    // 0 = Minimum rain value.
    // 1 = Maximum rain value.
    // Note: 0 = No rain.
    //       1 = Heavy rain.
    // [0, 0] / [1, 1], default is [0, 1]
      // GL4_Random set [5, [0, 1] ];

    // Random Weather Fog:
    // Choose the maximum and the minimum fog value.
    // 0 = Minimum fog value.
    // 1 = Maximum fog value.
    // Note: 0 = No fog.
    //       1 = Heavy fog.
    // [0, 0] / [1, 1], default is [0, 1]
      // GL4_Random set [6, [0, 1] ];

  // GL4 Random Snow:
  // ==============================================================
  // Random Snow Overcast:
  // Choose the overcast value when it should start snowing.
  // Note: 0 = It will start snowing even with blue sky.
  //       1 = It only will start snowing if there is heavy overcast.
  // 0 / 1, default is 0.3
    // GL4_Random set [7, 0.3];

    // Random Snow Interval:
    // Choose the interval of how much snow should fall.
    // Note: The snow interval also is set by the overcast.
    // The more overcast the higher the snow interval will be.
    // Warning: Very high values ( 100 - 300 ) may will cause lag.
    // 0 / 70, default is 30
      // GL4_Random set [8, 30];