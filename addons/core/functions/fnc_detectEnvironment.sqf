#include "script_component.hpp"
/*
 * Author: LAxemann and joko // Jonas
 * Checks Enviroment and select Fitting Enviroment
 *
 * Arguments:
 * 0: Shooter <Object>
 * 1: max Plopp Distance <Number>
 *
 * Remarks:
 *  Enviroment Types
 *  1 = Flat
 *  2 = Hilly
 *  3 = Urban
 *  4 = Forest
 *
 * Return Value:
 * None
 */

params [
    "_shooter",
    "_maxPlopp",
    "_sPos"
];

if (((time - (_shooter getVariable ["L_ES_LastUpdate", -5])) >= 5) && {((_sPos) vectorDistance (_shooter getVariable ["L_ES_LastPos", [0,0,0]])) >= 8}) then {

    private _environment = [];
    private _forestValue = _sPos getEnvSoundController "forest";
    private _housesVaule = _sPos getEnvSoundController "houses";
    if (_housesVaule >= 0.5) then {
        _environment pushBack 3;
    };
    if (_forestValue >= 0.84) then {
        _environment pushBack 4;
    };
    if (_environment isEqualTo [] || _housesVaule <= 0.8 && _forestValue <= 0.84) then {
        _environment pushBack ([_shooter, _maxPlopp] call FUNC(surroundCheck));
    };

    _shooter setVariable ["L_ES_Environment", _environment];
    _shooter setVariable ["L_ES_LastUpdate", time];
    _shooter setVariable ["L_ES_LastPos", _sPos];
    _environment // Return
} else {
    _shooter getVariable "L_ES_Environment"; // Return
};
