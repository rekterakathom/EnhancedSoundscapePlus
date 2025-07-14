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
_sPos params ["_sposX", "_sposY", "_sposZ"];
private _ZPosConstant = _sposZ + sin 4.048 * _maxPlopp;

/*
    We prepare the checks and then run them in parallel (multithreaded) -
    with the alt syntax of lineIntersectsSurfaces
*/
private ["_checkPos", "_dist"]; // Avoid re-creating these every iteration
{
    _x params ["_startAngle", "_endAngle", "_checkAngle"];
    private _intersectionChecks = [];
    for "_i" from _startAngle to _endAngle step _checkAngle do {
        _checkPos = [_sposX + ((sin _i) * _maxPlopp), _sposY + ((cos _i) * _maxPlopp), _ZPosConstant];
        _intersectionChecks pushBack [_sPos, _checkPos, _shooter, _shooter,true,1,"NONE","NONE"];
    };

    {
        if (_x isNotEqualTo []) then {
            _checkPos = _x select 0 select 0;
            _dist = _sPos vectorDistance _checkPos;
            if (_dist >= 100) exitWith {
                _hits pushBack [_dist, _checkPos];
            };
        };
    } forEach lineIntersectsSurfaces [_intersectionChecks];

    if ((count _hits) >= 2) exitWith {};
} forEach [
    // Total possible raycasts: 32 (none overlapping)
    [0, 360, 45],
    [22.5, 382.5, 45],
    [11.25, 371.25, 22.5]
];

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
