// ////////////////////////////////////////////////////////////////////////////
// GL4 v.1.1.87 Radio Chatter
// ////////////////////////////////////////////////////////////////////////////
// The GL4 Radio Chatter settings are stored in the global array GL4_Chatter.
// You can change settings by editing the GL4_Chatter array.
// GL4_Chatter set [ Index, Value ];
// In multiplayer all GL4_Chatter settings are used by every player individual.
// Available Keys: http://community.bistudio.com/wiki/ListOfKeyCodes
// ////////////////////////////////////////////////////////////////////////////

  // GL4 Radio Chatter Default Volume:
  // ==============================================================
  // Choose your default Radio Chatter volume.
  // 0.1 - 1, default 0.3
     GL4_Chatter set [2, 0.3];

  // GL4 Radio Chatter Key Volume Up:
  // ==============================================================
  // Choose which keys should be used to raise the Radio Chatter volume.
  // "Volume Up", default key is "Pos1"
     GL4_Chatter set [3, 210];

  // GL4 Radio Chatter Key Volume Down:
  // ==============================================================
  // Choose which key should be used to lower the Radio Chatter volume.
  // "Volume Down", default key is "Insert"
     GL4_Chatter set [4, 199];