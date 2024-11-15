#include "script_component.hpp"
/*
 * Author: LAxemann and joko // Jonas
 * Handle the Forest effects
 *
 * Arguments:
 * 0: Shooter <Object>
 * 1: Weapon prefix <String>
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
_prefix = _prefix + "_forest_";

if (_dist <= 75) then {
    private _posV = _shooter modelToWorld [0, 70, 1];
    private _posL = _shooter modelToWorld [-70, 0, 1];
    private _posR = _shooter modelToWorld [ 70, 0, 1];
    private _posH = _shooter modelToWorld [ 0, -70, 1];

    private _fArray = [1,2,3,4,5,6,7,8];
    private _count = count _fArray;

    {
        if (((positionCameraToWorld [0,0,0]) vectorDistance _x) >= 15) then {
            private _index = floor(random (_count));
            private _sound = _prefix + str (_fArray deleteAt _index);
            _count = _count - 1;
            [_x, _sound] call FUNC(playSound);
        };
    } forEach [_posV, _posL, _posR, _posH];
} else {
    private _sound = switch (true) do {
        case (_dist >= 750) : {["far_1","far_2"]};
        case (_dist >= 275) : {["mid_1","mid_2"]};
        default {["1","2","3","4","5","6","7","8"]};
    };
    [_sPos, _prefix + (selectRandom _sound)] call FUNC(playSound);
};
