#include "script_component.hpp"

ADDON = false;

// Compile Functions
#include "PREP.hpp"

// sound dummy array
GVAR(dummyArray) = [];
// Array for all Sounds that should get Played
GVAR(soundHandler) = [];
// Flag for soundHandler to get Sorted in next Frame
GVAR(newSoundHandler) = false;

// Definition for the sound player
GVAR(soundPlayerDefinition) = [
    // Flags
    ["#flags", [
        "noCopy",
        "unscheduled",
        "sealed"
    ]],

    // Constructor
    ["#create", {
        params [
            ["_pos", [0,0,0], [[]]],
            ["_sound", "", [""]],
            ["_multiplier", 5, [5]]
        ];

        private _distance = GVAR(soundData) getOrDefault [_sound, 3000];
        private _dummy = "#particlesource" createVehicleLocal _pos;
        private _soundSource = _dummy say3D [_sound, _distance, 0.9 + random 0.2];

        _self set ["soundDummy", _dummy];
        _self set ["soundSource", _soundSource];
    }],

    // Deconstructor
    ["#delete", {
        private _soundDummy = _self get "soundDummy";
        private _soundSource = _self get "soundSource";

        if !(isNull _soundSource) then {deleteVehicle _soundSource};
        if !(isNull _soundDummy) then {deleteVehicle _soundDummy};
    }],

    // Keys for later use
    ["soundDummy", objNull],
    ["soundSource", objNull]
];

// Sound Distances to fix BI Shit
GVAR(soundData) = createHashMap;
{
    if ((getNumber (_x >> "isESSound")) isEqualTo 1) then {
        GVAR(soundData) set [configName _x, (getArray (_x >> "sound")) select 3];
    };
} forEach (configProperties [configFile >> "CfgSounds", "isClass _x", true]);
// Config Save Namespace
GVAR(variableHandler) = createHashMap;

ADDON = true;
