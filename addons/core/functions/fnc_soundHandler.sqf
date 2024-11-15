#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Handles all the Sounds and the Sound Timings
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */

// Sort soundHandler Array if a new entry got added
if (GVAR(newSoundHandler)) then {
    GVAR(newSoundHandler) = false;
    GVAR(soundHandler) sort true;
};

private _deleted = false;

// Cycle throw all Sound Handler and check if one needs to be played
{
    _x params ["_time", "_type", "_data"];
    // exit Sound Handler Loop if a time is not passed
    // here we exit the complete loop to save some performance because the Sound Handler is Sorted and we know that
    // every thing after this entry is higher than the entrys befors
    if (_time > time) exitWith {};
    DUMP("Play Env Effect: " + str _type);
    // select Type of sound
    switch (_type) do {
        // Echo Reverb
        case 2: {
            _data call FUNC(echoPlay);
        };
        // Urban Reverb
        case 3: {
            _data call FUNC(urbanPlay);
        };
        // Forest Reverb
        case 4: {
            _data call FUNC(forestPlay);
        };
        default {DUMP("Unkown type: " + str _type);};
    };
    // set flag for deleted object
    _deleted = true;
    // overwrite current Index with objenull
    GVAR(soundHandler) set [_forEachIndex, objNull];
} forEach GVAR(soundHandler);


// if delted Flag is set remove all ObjNull from the array
if (_deleted) then {
    GVAR(soundHandler) = GVAR(soundHandler) - [objNull];
};
