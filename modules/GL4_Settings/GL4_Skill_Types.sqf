// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.1.87 Skill Types Settings
// ////////////////////////////////////////////////////////////////////////////
// The "Skill Types" settings allow you to define specific "Skill Types" to specific classes and ranks.
// Info: ["Class", ["Skill_Type", [Fixed Value, Random Value] ], "Rank", ["Skill_Type", [Fixed Value, Random Value] ] ]
// In multiplayer all settings are used and synchronized by the server.
// ////////////////////////////////////////////////////////////////////////////

  // Skill Types Example: ( Class and Rank )
  // ==============================================================
  // ["RU_Soldier_Sniper",    ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
  //  "USMC_SoldierS_Sniper", ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
  //  "PRIVATE",              ["aimingAccuracy", [0.10, 0.10], "aimingShake", [0.10, 0.10], "commanding",   [0.35, 0.35] ],
  //  "CORPORAL",             ["aimingAccuracy", [0.15, 0.15], "aimingShake", [0.15, 0.15], "commanding",   [0.50, 0.50] ],
  //  "CAPTAIN",              ["aimingAccuracy", [0.35, 0.35], "aimingShake", [0.35, 0.35], "commanding",   [0.75, 0.25] ]
  // ];

  // Skill Types Example: ( Class and Rank )
  // ==============================================================
  // ["RU_Soldier_Sniper",    ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
  //  "USMC_SoldierS_Sniper", ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
  //  "PRIVATE",              ["aimingAccuracy", [0.10, 0.25], "aimingShake", [0.10, 0.25], "commanding",   [0.10, 0.25] ],
  //  "CORPORAL",             ["aimingAccuracy", [0.20, 0.25], "aimingShake", [0.20, 0.25], "commanding",   [0.20, 0.25] ],
  //  "SERGEANT",             ["aimingAccuracy", [0.30, 0.25], "aimingShake", [0.30, 0.25], "commanding",   [0.30, 0.25] ],
  //  "LIEUTENANT",           ["aimingAccuracy", [0.40, 0.25], "aimingShake", [0.40, 0.25], "commanding",   [0.40, 0.25] ],
  //  "CAPTAIN",              ["aimingAccuracy", [0.50, 0.25], "aimingShake", [0.50, 0.25], "commanding",   [0.50, 0.25] ],
  //  "MAJOR",                ["aimingAccuracy", [0.60, 0.25], "aimingShake", [0.60, 0.25], "commanding",   [0.60, 0.25] ],
  //  "COLONEL",              ["aimingAccuracy", [0.70, 0.25], "aimingShake", [0.70, 0.25], "commanding",   [0.70, 0.25] ]
  // ];

  // Skill Types Default: ( Sniper Classes )
  // ==============================================================
  ["RU_Soldier_Sniper",     ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
   "RU_Soldier_SniperH",    ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
   "RU_Soldier_Marksman",   ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
   "USMC_SoldierS_Sniper",  ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ],
   "USMC_SoldierS_SniperH", ["aimingAccuracy", [0.75, 0.25], "aimingShake", [0.75, 0.25], "spotDistance", [0.75, 0.25] ]
  ];
