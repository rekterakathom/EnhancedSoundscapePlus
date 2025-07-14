#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Create a Dummy Object and play via say3D a Sound Effect on the Object, the dummy Object get pushed back in the Dummy
 * Array to get Deleted in the Garbage Collector
 *
 * Arguments:
 * 0: Position <Position>
 * 1: Sound Effect <String>
 * 2: Multiplyer for sounds volume <Number> (default: 5)
 * Return Value:
 * None
 */
params ["_pos", ["_sound", ""], ["_multiplyer", 5, [5]]];

// Alt-tabbed, don't play anything
// say3D makes really annoying sounds in alt-tab...
if (!isGameFocused) exitWith {};

if (_sound == "") then {
    DUMP("Error Sound not found at: " + str _pos + " " + str _multiplyer);
};
DUMP("Play Sound 3D: " + str _sound);
private _distance = GVAR(soundData) getOrDefault [_sound, 3000];
private _dummy = "#particlesource" createVehicleLocal _pos;
private _soundplayer = _dummy say3D [_sound, _distance, 0.9 + random 0.2];
#ifdef ISDEV
    GVAR(debugArray) pushBack [_pos, _sound];
    private _marker = createMarkerLocal [format [QGVAR(DebugMarker%1), GVAR(count)], _pos];
    _marker setMarkerColorLocal "ColorBlack";
    _marker setMarkerTextLocal " " + _sound;
    _marker setMarkerTypeLocal "hd_dot";
    GVAR(count) = GVAR(count) + 1;
#endif
GVAR(dummyArray) pushBack [_dummy, _soundplayer];
