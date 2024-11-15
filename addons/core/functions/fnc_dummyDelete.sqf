#include "script_component.hpp"
/*
 * Author: LAxemann
 * Garbage Collector for dummy Objects
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [FUNC(dummyDelete), 0, [] ] call CBA_fnc_addPerFrameHandler;
 *
 */

/*
private _amount = count GVAR(dummyArray);
if (_amount < 50) exitWith {};
if (_amount >= 50) then {
    deleteVehicle (GVAR(dummyArray) deleteAt 0);

    // Oh no, there is a lot of them, delete a bunch now!
    if (_amount >= 250) then {
        for "_i" from 0 to (_amount - 50) do {
            deleteVehicle (GVAR(dummyArray) deleteAt 0);
        };
    };
};
*/

// Delete the oldest element when its soundplayer turns null (sound is no longer playing)
if (GVAR(dummyArray) isNotEqualTo [] && {isNull ((GVAR(dummyArray) # 0) # 1)}) then {
    // Pop first element and delete the dummy object that the sound was attached to
    // Array resizing is so fast these days that it really doesn't matter when it's happening once a few frames.
    deleteVehicle ((GVAR(dummyArray) deleteAt 0) # 0);
};
