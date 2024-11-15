#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * get Acctual reflectsion points and chacnes them for a amout of time
 *
 * Arguments:
 * 0: Shooter <Object>
 * 1: Position of the Shooter <Position>
 *
 * Return Value:
 * None
 */
params ["_shooter", "_sPos"];

private _time = _shooter getVariable [QGVAR(UrbanCacheTime), -9999];
private _oldPos = _shooter getVariable [QGVAR(UrbanCachePos), [0,0,0]];
if (time - _time >= 15 && {((_sPos vectorDistance _oldPos) >= 3)}) then {
    _shooter setVariable [QGVAR(UrbanCacheTime), time];
    _shooter setVariable [QGVAR(UrbanCachePos), _sPos];

    private _posV = _shooter modelToWorld [0, 15, 1];
    private _posL = _shooter modelToWorld [-15, 0, 1];
    private _posR = _shooter modelToWorld [15, 0, 1];
    private _posH = _shooter modelToWorld [0, -15, 1];

    private _positions = [];
    {
        private _nearBuilding = nearestObjects [_x, ["house"], 20];
        if (_nearBuilding isNotEqualTo []) then {
            private _building = (_nearBuilding select 0);
            private _ils = lineIntersectsSurfaces [AGLToASL _sPos, getPosASL _building, _shooter, objNull, true, -1, "VIEW", "FIRE", true];
            {
                _x params ["_iPos", "", "_iObj", "_pObj"];
                if (_building in [_iObj, _pObj] ) exitWith {
                    _positions pushBackUnique _iPos; // only get 1 pos
                };
            } forEach _ils;
        };
    } forEach [_posV, _posL, _posR, _posH];
    #ifdef ISDEV
        private _debugPos = (+_positions) apply {[0, _x]};
        GVAR(debugLineArray) pushBack [eyePos _shooter, _debugPos];
    #endif

    _shooter setVariable [QGVAR(UrbanCachePositions), _positions];
};
_shooter getVariable [QGVAR(UrbanCachePositions), []];
