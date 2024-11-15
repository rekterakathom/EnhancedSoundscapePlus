#include "script_component.hpp"
/*
 * Author: LAxemann and joko // Jonas
 * Handle the Urban effects
 *
 * Arguments:
 * 0: Shooter <Object>
 * 1: Weapon Prefix <String>
 * 2: Distance from Shooter <Number>
 * 3: Position of the Shooter <Position>
 *
 * Return Value:
 * None
 */
params [
    "_shooter",
    "_prefix",
    "_dist",
    "_sPos"
];
_prefix = _prefix + "_urban_";

if (_dist <= 100) then {
    private _sArray = ["1","2","3","4","5","6","7","8"];
    private _count = count _sArray;
    private _positions = [_shooter, _sPos] call FUNC(getUrbanPos);

    {
        private _index = floor(random (_count));
        private _int = _sArray deleteAt _index;
        private _sound = _prefix + _int;
        _count = _count - 1;
        [_x, _sound, 5] call FUNC(playSound);
    } forEach _positions;
} else {
    private _sound = selectRandom ["1","2","3","4","5","6","7","8"];
    [_sPos, _prefix + _sound] call FUNC(playSound);
};
