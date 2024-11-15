#include "script_component.hpp"
/*
 * Author: LAxemann
 * Checks for intersections with nearby hills/mountains
 *
 * Arguments:
 * 0: shooter <Object>
 * 1: scan range in m <Number>
 *
 * Return Value:
 * Type of Surrounding Area<Number>
 */
params [
    "_shooter",
    "_maxPlopp"
];

private _sPos =  eyePos _shooter;
private _hits = [];

// Define some constants
private _sposX = _spos # 0;
private _sposY = _spos # 1;
private _sposZ = _spos # 2;
private _ZPosConstant = _sposZ + sin 4.048 * _maxPlopp;

private ["_checkPos", "_intersec", "_dist"]; // Avoid re-creating these every iteration
for "_i" from 0 to 360 step 4 do {
    _checkPos = [_sposX + ((sin _i) * _maxPlopp), _sposY + ((cos _i) * _maxPlopp), _ZPosConstant];
    _intersec = lineIntersectsSurfaces [_sPos, _checkPos, _shooter, _shooter,true,1,"NONE","NONE"];

    if (_intersec isNotEqualTo []) then {
        _checkPos = _intersec select 0 select 0;
        _dist = _sPos vectorDistance _checkPos;
        if (_dist < 100) exitWith {
            _i = _i + 45;
        };
        if (_dist >= 100) exitWith {
            _hits pushBack [_dist, _checkPos];
            if (_dist >= 300) then {
                _i = _i + 35;
            } else {
                _i = _i + 50;
            };
        };
    };
};

#ifdef ISDEV
    GVAR(debugLineArray) pushBack [_sPos, _hits];
#endif

private "_result";
if ((count _hits) >= 2) then {
    _result = 2;    // Hilly
    _hits sort true;
    _shooter setVariable ["L_ES_Hits", _hits];
} else {
    _result = 1;    // Flat
    _shooter setVariable ["L_ES_Hits", []];
};
_result
