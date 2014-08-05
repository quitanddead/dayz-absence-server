// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.1.87 Local Settings
// ////////////////////////////////////////////////////////////////////////////
// The GL4 Local settings are stored in the global array GL4_Local.
// You can change settings of GL4 by editing the GL4_Local array.
// For each custom setting uncomment remove the "//" in front of the respective line and modify the value.
// GL4_Local set [ Index, Value ];
// In multiplayer all GL4_Local settings are used by every player individual.
// ////////////////////////////////////////////////////////////////////////////

  /* Legend:

   1.) 
       * Player Map Marker
       * Dubbing
       * Blood FX
       * Radio Chatter
       * Sound FX
       * Weapon FX
       * Shell FX
       * Impact FX
       * Explosion FX
       * Wrack FX
       * Burning FX
       * Crew FX
       * Backblast FX
       * Artillery FX
       * Autumn FX
       * Simulate Dead
       * Force Move
       * Multiplayer Debug
  */

  // ==============================================================
  // GL4 Player Map Marker:
  // ==============================================================
  // Choose if a player should use/get a map marker.
  // True / False, default is True
    // (GL4_Local select 0) set [0, False];

    // GL4 Player Map Marker Type:
    // ==============================================================
    // Choose which "Map Marker Type" should be used.
    // Note: Choose True to enable millitary marker types.
    // "Dot", "Arrow", "Select", "Destroy" / True, default is True
      // (GL4_Local select 0) set [1, "Dot"];

  // ==============================================================
  // GL4 Dubbing:
  // ==============================================================
  // Choose if the "Dubbing" feature should be used.
  // Dubbing Features A.I.: Dynamic Speaking A.I. Enemy and Dynamic Speaking A.I. Friendly.
  // Dubbing Features Player: Reloading and Incoming Rocket.
  // Dubbing Features A.I. and Player: Grenade Thrown.
  // True / False, default is True
     GL4_Local set [1, true];

    // GL4 Dubbing Distance:
    // Choose in which distance to a player the "Dubbing" feature should be used.
    // 0 - 500, default is 200 meters
       GL4_Local set [2, 200];

    // GL4 Dubbing Player:
    // Choose if groups leaded by player should use the "Dubbing" feature.
    // True / False, default is True
      (GL4_Local select 3) set [0, False];

    // GL4 Dubbing A.I.:
    // Choose if groups leaded by A.I. should use the "Dubbing" feature.
    // True / False, default is True
       (GL4_Local select 3) set [1, true];

    // GL4 Dubbing Chance:
    // Choose the chance of which the "Dubbing" feature should be used.
    // 0 - 100, default is 50%
      (GL4_Local select 3) set [2, 50];

  // ==============================================================
  // GL4 Blood FX:
  // ==============================================================
  // Choose if the "Blood FX" feature should be used.
    // GL4_Local set [4, False];

    // GL4 Bleeding FX:
    // ==============================================================
    // Choose if the "Bleeding FX" feature should be used.
    // Note: The "Bleeding" feature requires the "Blood FX" feature.
      // GL4_Local set [5, False];

    // GL4 Blood FX Distance:
    // Choose in which distance to a player the "Blood FX" feature should be used.
    // 0 - 500, default is 200 meters
      // GL4_Local set [6, 200];

    // GL4 Blood FX Chance:
    // Choose the chance in which the "Blood FX" feature should be used.
    // Description: The lower this value the more the "Blood FX" feature will be used.
    // 0 - 100, default is 50%
      // GL4_Local set [7, 50];

    // GL4 Blood FX Particles Maximum:
    // Choose how much "Blood FX" particles should be spawned.
    // Description: The higher this value the more "Blood FX" particles will be spawned.
    // 0 - 70, default is 30
      // GL4_Local set [8, 30];

    // GL4 Blood FX Object Maximum:
    // Choose how much "Blood FX" objects can be created at the same time at all.
    // Description: The higher this value the more "Blood FX" objects can be created at the same time at all.
    // 0 - 500, default is 300
      // GL4_Local set [9, 300];

    // GL4 Blood FX Particle Front Spread:
    // ==============================================================
    // GL4 Blood Particle Degrees:
    // Choose the degrees angle of how the blood particles should spread.
    // 0 / 70, default is 35
      // GL4_Local set [10, 35];

    // GL4 Blood FX Particle Degrees Factor:
    // Choose the degrees factor angle of the blood particles defined above.
    // 0 / 10, default is 2
      // GL4_Local set [11, 2];

    // GL4 Blood FX Particle Speed Factor:
    // Choose the factor of how to spread blood particles.
    // 0 / 10, default is 1.5
      // GL4_Local set [12, 1.5];

    // GL4 Blood FX Particle Minimum Speed:
    // Choose the blood particles minimum spread speed.
    // 0 / 10, default is 1
      // GL4_Local set [13, 1];

    // GL4 Blood FX Particle Maximum Speed:
    // Choose the blood particles maximum spread speed.
    // 0 / 50, default is 10
      // GL4_Local set [14, 10];

    // GL4 Blood FX Particle Minimum Speed Vertical:
    // Choose the blood particles minimum vertical spread speed.
    // -10 / 10, default is -2
      // GL4_Local set [15, -2];

    // GL4 Blood FX Particle Maximum Speed Vertical:
    // Choose the blood particles maximum vertical spread speed.
    // 0 / 10, default is 2
      // GL4_Local set [16, 2];

    // GL4 Blood FX Particle Back Spread:
    // ==============================================================
    // GL4 Blood FX Particle Degrees:
    // Choose the degrees angle of how the blood particles should spread.
    // 0 / 100, default is 35
      // GL4_Local set [17, 35];

    // GL4 Blood FX Particle Maximum Speed:
    // Choose the blood particles maximum spread speed.
    // 0 / 50, default is 10
      // GL4_Local set [18, 6];

    // GL4 Blood FX Particle Minimum Size:
    // ==============================================================
    // GL4 Blood FX Particle Minimum Size:
    // Choose the blood particles minimum size.
    // 0.01 / 1, default is 0.5
      // GL4_Local set [19, 0.5];

    // GL4 Blood FX Particle Maximum Size:
    // Choose the blood particles maximum size.
    // 0.01 / 1, default is 0.7
      // GL4_Local set [20, 0.7];

    // GL4 Blood FX Particle Color:
    // Choose the blood particles color.
    // [ [Start Color], [Middle Color], [Middle Color], [End Color] ], default is [ [0.1,0,0,1], [0.1,0,0,1], [0.1,0,0,1], [0.1,0,0,1] ]
      // GL4_Local set [21, [ [0.1,0,0,1], [0.1,0,0,1], [0.1,0,0,1], [0.1,0,0,1] ] ];

  // ==============================================================
  // GL4 Radio Chatter:
  // ==============================================================
  // Choose if the "Radio Chatter" feature should be used.
  // Description: The "Radio Chatter" feature add different "Radio Chatters" to "Tank" and "Air" vehicles.
  // True / False, default is True
     GL4_Local set [22, true];

  // ==============================================================
  // GL4 Sound FX:
  // ==============================================================
  // Choose if the "Sound FX" feature should be used.
  // Sound FX Features: Sound FX Artillery Shell, Sound FX Explosion and Sound FX Explosion Sparks.
  // True / False, default is True
    // GL4_Local set [23, False];

    // Sound FX Bullet:
    // Choose if the "Sound FX Bullet" feature should be use.
    // True / False, default is True
      // GL4_Local set [24, False];

      // Sound FX Bullet Chance:
      // Choose the chance of how to use the "Sound FX Bullet" feature.
      // 0 - 100, default is 50%
        // GL4_Local set [25, 50];

    // Sound FX Shell:
    // Choose if the "Sound FX Shell" feature should be use.
    // True / False, default is True
      // GL4_Local set [26, False];

    // Sound FX Artillery Shell Chance:
    // Choose the chance of how to use the "Sound FX Artillery Shell" feature.
    // 0 - 100, default is 50%
      // GL4_Local set [27, 50];

    // Sound FX Flies Chance:
    // Choose the chance of how to use the "Sound FX Flies" feature after a soldier was killed.
    // 0 - 100, default is 50%
      // GL4_Local set [28, 50];

      // Sound FX Flies Maximum:
      // Choose how many killed soldiers can use the "Sound FX Flies" feature at the same time.
      // 0 / 10, default is 5
        // GL4_Local set [29, 5];

  // ==============================================================
  // GL4 Weapon FX:
  // ==============================================================
  // Choose if the "Weapon FX" feature should be used.
  // Weapon FX Features: Weapon FX Impact Sparks and Weapon FX Impact Mud.
  // Note: The "Weapon FX" feature is used by high caliber weapons mounted on vehicles only.
  // True / False, default is True
    // GL4_Local set [30, True];

    // Weapon FX Intensity:
    // Description: The higher this value the lower the "Weapon FX" feature will be used.
    // Note: The intensity of all "Weapon FX" features will be divided by this value.
    // Set this value to 3 or 4 to reduce the CPU load of the "Weapon FX" feature.
    // 1 / 5, default is 1
      // GL4_Local set [31, 1];

    // Weapon FX Impact Sparks Change: ( Bullet )
    // Choose the chance of how to use the "Weapon FX Impact Sparks" feature.
    // Description: The "Weapon FX Impact Sparks" feature do spawn "Weapon FX Impact Sparks" at the position of where a bullet was impacted.
    // 0 - 100, default is 50%
      // GL4_Local set [32, 50];

    // Weapon FX Impact Mud: ( Bullet )
    // Choose if the "Weapon FX Impact Mud" feature should be use.
    // Description: The "Weapon FX Impact Mud" feature do spawn "Weapon FX Impact Mud" at the position of where a bullet was impacted.
    // True / False, default is True
      // GL4_Local set [33, True];

    // Weapon FX Impact Sparks Change: ( Grenade / Rocket / Missile )
    // Choose the chance of how to use the "Weapon FX Impact Sparks" feature.
    // Description: The "Weapon FX Impact Sparks" feature do spawn "Weapon FX Impact Sparks" at the position of where a grenade / rocket / missile was impacted.
    // 0 - 100, default is 75%
      // GL4_Local set [34, 75];

    // Weapon FX Impact Stones: ( Grenade / Rocket / Missile )
    // Choose if the "Weapon FX Impact Stones" feature should be use.
    // Description: The "Weapon FX Impact Stones" feature do spawn "Weapon FX Impact Stones" at the position of where a grenade / rocket / missile was impacted.
    // True / False, default is True
      // GL4_Local set [35, True];

  // ==============================================================
  // GL4 Shell FX:
  // ==============================================================
  // Choose if the "Shell FX" feature should be used.
  // True / False, default is True
    // GL4_Local set [36, True];

    // Shell FX Intensity:
    // Description: The higher this value the lower the "Shell FX" feature will be used.
    // Note: The intensity of all "Shell FX" features will be divided by this value.
    // Set this value to 3 or 4 to reduce the CPU load of the "Shell FX" feature.
    // 1 / 5, default is 1
      // GL4_Local set [37, 1];

    // Shell FX Impact Sparks Change:
    // Choose the chance of how to use the "Shell FX Impact Sparks" feature after a shell was impacted.
    // Description: The "Shell FX Impact Sparks" feature do spawn "Shell FX Impact Sparks" at the position of where a shell was impacted.
    // 0 - 100, default is 50%
      // GL4_Local set [38, 50];

    // Shell FX Impact Mud Change:
    // Choose the chance of how to use the "Shell FX Impact Mud" feature after a shell was impacted.
    // Description: The "Shell FX Impact Mud" feature do spawn "Shell FX Impact Mud" at the position of where a shell was impacted.
    // 0 - 100, default is 75%
      // GL4_Local set [39, 75];

    // Shell FX Impact Mud Trail Change:
    // Choose the chance of how to use the "Shell FX Impact Mud Trail" feature after a shell was impacted.
    // Description: The "Shell FX Impact Mud Trail" feature do spawn "Shell FX Impact Mud Trail" at the position of where a shell was impacted.
    // 0 - 100, default is 75%
      // GL4_Local set [40, 75];

    // Shell FX Impact Stones:
    // Choose the chance of how to use the "Shell FX Impact Stones" feature after a shell was impacted.
    // Description: The "Shell FX Impact Stones" feature do spawn "Shell FX Impact Stones" at the position of where a shell was impacted.
    // 0 - 100, default is 75%
      // GL4_Local set [41, 75];

    // Shell FX Impact Shock:
    // Choose the chance of how to use the "Shell FX Impact Shock" feature after a shell was impacted.
    // True / False, default is True
      // GL4_Local set [42, True];

  // ==============================================================
  // GL4 Impact FX:
  // ==============================================================
  // Choose if the "Impact FX" feature should be used.
  // Description: The "Impact FX" feature do spawn "Impact FX Sparks" and "Impact FX Debris" after a vehicle was hit by a projectile.
  // Note: This feature require the "Explosion FX" feature to reach the full range of intensity.
  // True / False, default is True
    // GL4_Local set [43, True];

    // Impact FX Intensity:
    // Description: The higher this value the lower the "Impact FX" feature will be used.
    // Note: The intensity of all "Impact FX" features will be divided by this value.
    // Set this value to 3 or 5 to reduce the CPU load of the "Impact FX" feature.
    // 1 / 5, default is 1
      // GL4_Local set [44, 1];

    // Impact FX Sparks Chance:
    // Choose the chance of how to use the "Impact FX Sparks" feature after a vehicle was hit by a projectile.
     // 0 - 100, default is 50%
      // GL4_Local set [45, 50];

    // Impact FX Debris Chance:
    // Choose the chance of how to spawn "Impact FX Debris" after a vehicle was hit by a projectile.
     // 0 - 100, default is 35%
      // GL4_Local set [46, 35];

  // ==============================================================
  // GL4 Explosion FX:
  // ==============================================================
  // Choose if the "Explosion FX" feature should be used.
  // Explosion FX Features: Flash, Shock Wave, Fire Flash and Sparks, Debris, Stones, Leaves, Mud, Dust Wave, Fire Light and Fuel Smoke.
  // True / False, default is True
    // GL4_Local set [47, True];

    // Choose in which distance to a player the "Explosion FX" feature should be used.
    // Note: By default the view distance which was set in ArmA 2 is used as default value.
    // This means you can see explosions as far as you can see.
      // GL4_Local set [48, viewdistance];

    // Explosion FX Intensity:
    // Choose how intensive the "Explosion FX" feature should be.
    // Description: The higher this value the lower the "Explosion FX" will be.
    // Note: The intensity of all "Explosion FX" features will be divided by this value.
    // Set this value to 3 or 4 to reduce the CPU load of the "Explosion FX" feature.
    // 1 / 10, default is 1
      // GL4_Local set [49, 1];

    // Explosion FX Small Chance:
    // Choose the chance of how to use Small Explosion FX.
    // Description: The higher this value the higher the chance to see a Small Explosion.
    // 0 - 100, default is 75%
      // GL4_Local set [50, 75];

    // Explosion FX Small Size:
    // Choose the size of which vehicles should use the Small Explosion FX.
    // Description: This array contains all small size vehicles.
    // Info: Traktor, UAZ, HUMMWEE and BRDM
    // 0 / 30, default is [0,1,2,3,4,5,6,7]
      // GL4_Local set [51, [0,1,2,3,4,5,6,7] ];

    // Explosion FX Medium Chance:
    // Choose the chance of how to use Medium Explosion FX.
    // Description: The higher this value the higher the chance to see a Medium Explosion.
    // 0 - 100, default is 50%
      // GL4_Local set [52, 50];

    // Explosion FX Medium Size:
    // Choose the size of which vehicles should use the Medium Explosion FX.
    // Description: This array contains all medium size vehicles.
    // Info: URAL, T90 and M1A1
    // 0 / 30, default is [8,9,10,11,12,13,14]
      // GL4_Local set [53, [8,9,10,11,12,13,14] ];

    // Explosion FX Large Chance:
    // Choose the chance of how to use Large Explosion FX.
    // Description: The higher this value the higher the chance to see a Large Explosion.
    // 0 - 100, default is 35%
      // GL4_Local set [54, 35];

    // Explosion FX Large Size:
    // Choose the size of which vehicles should use the Large Explosion FX.
    // Description: This array contains all large size vehicles.
    // Info: T90, M1A1, MI-24D, MH-60S and SU-34 
    // 0 / 30, default is [10,11,12,13,14,15,16,17,18,19,20,21]
      // GL4_Local set [55, [10,11,12,13,14,15,16,17,18,19,20,21] ];

    // Explosion FX Flash:
    // Choose the chance of how to use the "Explosion FX Flash" feature.
    // True / False, default is True
      // GL4_Local set [56, True];

    // Explosion FX Shock Wave Chance:
    // Choose the chance of how to use the "Explosion Shock Wave" feature.
    // 0 - 100, default is 35%
      // GL4_Local set [57, 35];

    // Explosion FX Fire Flash and Sparks Chance:
    // Choose the chance of how to use the "Explosion Fire Flash and Sparks" feature.
    // 0 - 100, default is 75%
      // GL4_Local set [58, 75];

    // Explosion FX Debris Chance:
    // Choose the chance of how to use the "Explosion Debris Fire" feature.
    // 0 - 100, default is 75%
      // GL4_Local set [59, 75];

    // Explosion FX Debris FX Chance:
    // Choose the chance of how to use the "Explosion Debris FX" feature.
    // 0 - 100, default is 50%
      // GL4_Local set [60, 50];

    // Explosion FX Stone Chance:
    // Choose the chance of how to use the "Explosion Stones" feature.
    // 0 - 100, default is 50%
      // GL4_Local set [61, 50];

    // Explosion FX Leaves Chance:
    // Choose the chance of how to use the "Explosion Leaves" feature.
    // 0 - 100, default is 50%
      // GL4_Local set [62, 50];

    // Explosion FX Mud Chance:
    // Choose the chance of how to use the "Explosion Mud" feature.
    // 0 - 100, default is 75%
      // GL4_Local set [63, 75];

    // Explosion FX Dust Wave:
    // Choose the chance of how to use the "Explosion Dust Wave" feature.
    // True / False, default is True
      // GL4_Local set [64, True];

    // Explosion FX Fuel Smoke Chance:
    // Choose the chance of how to use the "Explosion Fuel Smoke" feature.
    // 0 - 100, default is 35%
      // GL4_Local set [65, 35];

  // ==============================================================
  // GL4 Wrack FX:
  // ==============================================================
  // Choose if the "Wrack FX" feature should be used.
  // True / False, default is True
    // GL4_Local set [66, False];

    // Wrack FX Player Distance:
    // Choose in which distance to a player the "Wrack FX" feature should be used.
    // Note: By default the view distance which was set in ArmA 2 is used as default value.
    // This means you can see the "Wrack FX" as far as you can see.
      // GL4_Local set [67, viewdistance];

    // Wrack FX Fire Sparks and Ashes Chance:
    // Choose the chance of how to use the "Wrack FX Fire Sparks and Ashes" feature.
    // 0 - 100, default is 75%
      // GL4_Local set [68, 75];

    // Wrack FX Hot Ground Chance:
    // Choose the chance of how to use the "Wrack FX Hot Ground" feature.
    // 0 - 100, default is 35%
      // GL4_Local set [69, 35];

    // Wrack FX Sparks Chance:
    // Choose the chance of how to use the "Wrack FX Sparks" feature.
    // 0 - 100, default is 50%
      // GL4_Local set [70, 50];

  // ==============================================================
  // GL4 Burning FX:
  // ==============================================================
  // Choose if the "Burning FX" feature should be used.
  // True / False, default is True
    // GL4_Local set [71, False];

    // Burning FX Camp Fire:
    // Choose if the "Burning FX Camp Fire" feature should be used.
    // Description: Adds Sparks and Ashes to burning camp fire.
    // True / False, default is True
      // GL4_Local set [72, False];

    // Burning FX House:
    // Choose if the "Burning FX House" feature should be used.
    // Description: After a house was hit by a shell/or damaged the house randomly will start burning.
    // True / False, default is True
      // GL4_Local set [73, False];

    // Burning FX Player:
    // Choose if the "Burning FX Player" feature should be used.
    // Description: If the "Burning FX Player" feature is used then a player will get dammage if the player is too close to any kind of burning object.
    // Warning: If a player is very close to a burning object ( Car, Tank, House, Camp Fire ) then the player will start burning too.
    // True / False, default is True
      // GL4_Local set [74, False];

  // ==============================================================
  // GL4 Crew FX:
  // ==============================================================
  // Choose if the "Crew FX" feature should be used.
  // True / False, default is True
    // GL4_Local set [75, False];

    // Crew FX Chance:
    // Choose the chance of how to use the "Crew FX" feature after a vehicle was destroyed.
    // Description: After a vehicle was destroyed the "Crew FX" feature will randomly eject the crew of a destroyed vehicle and let them burn to dead.
    // 0 - 100, default is 15%
      // GL4_Local set [76, 15];

  // ==============================================================
  // GL4 Backblast FX:
  // ==============================================================
  // Choose if the "Backblast FX" feature should be used.
  // True / False, default is True
    // GL4_Local set [77, False];

    // Backblast FX Flash:
    // Choose if the "Backblast FX Flash" feature should be used.
    // True / False, default is True
      // GL4_Local set [78, False];

    // Backblast FX Dammage:
    // Choose if the "Backblast FX Damage" dammage feature should be used.
    // Description: If a soldier is inside the "Backblast" angle then the soldier will get dammage from the "Backblast".
    // True / False, default is True
      // GL4_Local set [79, False];

  // ==============================================================
  // GL4 Artillery FX:
  // ==============================================================
  // Choose if the "Artillery FX" feature should be used.
  // Note: This feature require the "Shell FX" feature to reach the full range of intensity.
  // True / False, default is True
    // GL4_Local set [80, False];

    // Artillery FX Shock:
    // Choose if the "Artillery FX Shock" feature should be used.
    // True / False, default is True
      // GL4_Local set [81, False];

  // ==============================================================
  // GL4 Autumn FX:
  // ==============================================================
  // Choose if the "Autumn FX" feature should be used.
  // True / False, default is True
    // GL4_Local set [82, False];

    // Autumn FX Interval:
    // Choose the time interval in which the "Autumn FX" feature should be used.
    // 0 - 300, default is 50
      // GL4_Local set [83, 50];

  // ==============================================================
  // GL4 Simulate Dead:
  // ==============================================================
  // Choose if the "Simulate Dead" feature should be used.
  // Note: This feature gives the player the ability to simulate dead if the player was hit by a enemy and if no allied are nearby.
  // Warning: While a player do simulate dead there is a chancse that enemys do recognize the simulating player.
  // True / False, default is True
    // GL4_Local set [84, False];

    // Simulate Dead Allied Distance:
    // Choose how far each allied of the player group must be away from the player that he get the ability to simulate dead.
    // Note: If there are no units of the player group within this range to the player then the player will be able to simulate dead.
    // 0 - 300, default is 100 meters
      // GL4_Local set [85, 100];

  // ==============================================================
  // GL4 Force Move:
  // ==============================================================
  // Choose if the "Force Move" feature should be used.
  // Note: This feature gives the player the ability to force specific units of his group to move to his or any specific position.
  // Warning: After forcing units of a player group to move the units will totally ignore each enemy and dangerouse event.
  // True / False, default is True
    // GL4_Local set [86, False];

  // ==============================================================
  // GL4 Multiplayer Debug:
  // ==============================================================
  // Choose if the "Multiplayer" debug should be used.
  // Note: This debug requires the "Array" debug in "GL4_Global" to be set to True.
  // True / False, default is True
     GL4_Global set [87, False];