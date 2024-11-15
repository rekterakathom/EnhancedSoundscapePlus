// Garbage Collector
PREP(dummyDelete);

// Fired Event Trigger
PREP(fired);
PREP(checkEnviroment);

// Detect Enviroment Functions
PREP(detectEnvironment);
PREP(surroundCheck);

// Sound handler Loop
PREP(soundHandler);
PREP(addToSoundHandler);

// Effects
// - Forrest
PREP(forestPlay);
// - Urban
PREP(urbanPlay);
PREP(getUrbanPos);
// - Reverb Echo
PREP(echoPlay);

// Misc
PREP(readCacheValues);
PREP(suppCheck);
PREP(playSound);

// dev stuff
#ifdef ISDEV
    GVAR(showHintLog) = false;
    GVAR(maxHintSize) = 30;
    GVAR(logData) = [];
    GVAR(count) = 0;
    GVAR(debugArray) = [];
    GVAR(debugLineArray) = [];
    GVAR(hintNumber) = 0;
    PREP(log); // dev Log Macro
    PREP(debugRenderer);
#endif
