// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.1.87 Core Settings
// ////////////////////////////////////////////////////////////////////////////
// The GL4 Core settings are stored in the global array GL4_Core.
// You can change settings of GL4 by editing the GL4_Core array.
// For each custom setting uncomment remove the "//" in front of the respective line and modify the value.
// GL4_Core set [ Index, Value ];
// In multiplayer all GL4_Core settings are used and synchronized by the server.
// Note: The core settings are only used by the "Default" initialize of GL4.
// ////////////////////////////////////////////////////////////////////////////

  // GL4 Default ( C.B.A. ) Initialize:
  // ==============================================================
  // Choose if Group Link 4 should be initialized by using the Community Base AddOns.
  // Note: Set this value to False to disable the "Community Base AddOns" initialize completly.
  // True / False, default is True
    GL4_Core set [0, true];

  // GL4 Enemy A.I. Enhancement:
  // ==============================================================
  // Choose if the "Enemy A.I. Enhancement" should be used.
  // Note: Set this value to False to disable the "Enemy A.I. Enhancement" completly.
  // True / False, default is True
  GL4_Core set [1, true];

  // GL4 Player and Friendly A.I. Enhancement:
  // ==============================================================
  // Choose if the "Player and Friendly A.I. Enhancement" should be used.
  // Note: Set this value to False to disable the "Player and Friendly A.I. Enhancement" completly.
  // True / False, default is True
     GL4_Core set [2, true];

  // GL4 Special FX:
  // ==============================================================
  // Choose if the "Special FX" feature should be used.
  // Note: Set this value to False to disable the "Special FX" completly.
  // True / False, default is True
     GL4_Core set [3, False];

  // GL4 Initialize Debug:
  // ==============================================================
  // Choose if the "Initialize" debug should be used.
  // Note: This debug displays how "Group Link 4" was initialized directly after the initialize of "Group Link 4" was done.
  // True / False, default is True
    GL4_Core set [4, true];