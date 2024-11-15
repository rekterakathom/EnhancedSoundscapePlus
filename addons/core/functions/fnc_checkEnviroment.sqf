#include "script_component.hpp"
/*
 * Author: LAxemann and joko // Jonas
 * Handles the Types of Enviroment and Pushes them back to the Handle Sound Queue
 *
 * Arguments:
 * 0: shooter <Object>
 * 1: max Plopp Distance <Number>
 * 2: Distance <Number>
 *
 * Return Value:
 * None
 */

params ["_shooter", "_maxPlopp", "_dist", "_prefix", "_cPos", "_sPos"];
private _env = [_shooter, _maxPlopp, _sPos] call FUNC(detectEnvironment);
DUMP("Enviroment: " + str _env);

{
    private _currentEnv = _x;
    switch (_currentEnv) do {

        // Hilly
        case 2 : {
            if (_dist <= 60) then {
                {
                    _x params [
                        "_dist",
                        "_pos"
                    ];
                    private _time = time + ((_dist + (_cPos vectorDistance _pos)) / SPEEDOFSOUND);
                    [_time, _currentEnv,[_pos,_prefix, _dist, _sPos]] call FUNC(addToSoundHandler);
                } forEach (_shooter getVariable "L_ES_Hits");
            } else {
                if (_dist <= 500) then {
                    (_shooter getVariable "L_ES_Hits") params ["_array"];
                    _array params ["_dist","_pos"];
                    private _time = time + ((_dist + (_cPos vectorDistance _pos)) / SPEEDOFSOUND);
                    [_time, _currentEnv, [_pos,_prefix, _dist, _sPos]] call FUNC(addToSoundHandler);
                };
            };
        };

        // Urban
        case 3 : {
            [time + (_dist / SPEEDOFSOUND), _currentEnv, [_shooter, _prefix, _dist, _sPos]] call FUNC(addToSoundHandler);
        };

        // Forest
        case 4 : {
            [time + (_dist / SPEEDOFSOUND), _currentEnv, [_shooter, _prefix, _dist, _sPos]] call FUNC(addToSoundHandler);
        };
    };
} forEach _env;
