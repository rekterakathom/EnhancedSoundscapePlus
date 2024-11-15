#include "script_component.hpp"


if !(hasInterface) exitWith {L_ES_ES_Sys_fnc_fired = {};};

[{
    call FUNC(soundHandler);
    call FUNC(dummyDelete);
}, 0] call CBA_fnc_addPerFrameHandler;

#ifdef ISDEV
player addAction ["Toggle Hint Debuggers", {GVAR(showHintLog) = !GVAR(showHintLog)}];
player addAction ["Start Debug Renderer", {
    GVAR(debugArray) = [];
    GVAR(debugLineArray) = [];
    call FUNC(debugRenderer);
}];
["unit", {
   (_this select 0) addAction ["Toggle Hint Debuggers", {GVAR(showHintLog) = !GVAR(showHintLog)}];
   (_this select 0) addAction ["Start Debug Renderer", {
        GVAR(debugArray) = [];
        GVAR(debugLineArray) = [];
        call FUNC(debugRenderer);
    }];
}] call CBA_fnc_addPlayerEventHandler;
#endif
