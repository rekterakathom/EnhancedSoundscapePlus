#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Read Value from config and save it in the cache Location and read and save the value if the value not exist
 * if config entry not exist return the Default Value
 *
 * Arguments:
 * 0: Config Path or Array with Config Path <Config, Array>
 * 1: Variable Name for Saving <String>
 * 2: Default Return <Any> (Default: "")
 *
 * Return Value:
 * Cached Value <Any>
 *
 * Example:
 * ["example"] call DS_sys_fnc_readCacheValue;
 */
params [
    ["_config", configNull, [configNull, []]],
    ["_varName", "", [""]],
    ["_default", ""]
];

if (_varName isEqualTo "") exitWith { _default };

GVAR(variableHandler) getOrDefaultCall [
    _varName,
    {

        // I have literally no idea what this is trying to do.
        if (IS_ARRAY(_config)) then {
            _path = configFile;
            {
                _path = _path >> _x;
            } count _config;
            _config = _path;
        };
        
        call {
            if (isText _config) exitWith {
                getText _config;
            };
            if (isNumber _config) exitWith {
                getNumber _config;
            };
            if (isArray _config) exitWith {
                getArray _config;
            };
            _default
        }
    },
    true
]
