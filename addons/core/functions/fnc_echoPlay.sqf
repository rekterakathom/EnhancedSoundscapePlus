#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Handle the Echo Effect
 *
 * Arguments:
 * 0: Position of the Echo <Position>
 * 1: Weapon prefix <String>
 *
 * Return Value:
 * None
 */
params ["_pos", "_prefix", "_dist", "_sPos"];

if (_dist >= 100) then {
    private _multi = 5;
    private _sound = if (_dist <= 225) then {
        _multi = 8;
        "_plopp"
    } else {
        format ["_plopp_%1_%2", ["mid", "far"] select (_dist > 495), (floor random 4) + 1]
    };

    [_pos, _prefix + _sound, _multi] call FUNC(playSound);
};
