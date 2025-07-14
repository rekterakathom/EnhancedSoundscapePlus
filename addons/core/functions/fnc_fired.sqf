#include "script_component.hpp"
/*
 * Author: LAxemann and joko // Jonas
 * Handles Every Gun Shot and checks if L_ES jumps in
 *
 * Arguments:
 * FiredEH Args
 *
 * Return Value:
 * None
 */

params [
    "_shooter",            // Shooting unit/vehicle
    "_weapon",            // Weapon classname
    "_muzzle",            // muzzle
    "_disabled1",        // Not needed
    "_ammo",            // Ammo classname
    "_magazine"            // Magazine classname
];

if (toLowerANSI(_weapon) isEqualTo "put") exitWith {};
if (underwater _shooter) exitWith {}; // Fucking SDAR

if (
    !isNull objectParent _shooter
    && {!(_weapon in (weapons _shooter))} // They've fired the vehicle weapon, not their own
) then {_shooter = objectParent _shooter};

if (_shooter isKindOf "Air") exitWith {};

private _cpos = positionCameraToWorld [0,0,0];    // Position of the current camera
private _sPos = POSITIONAGL(_shooter);
private _dist = (_cpos vectorDistance _sPos);                // Distance from player to shooter

/*****************************************************************************************************************/
//-- Make exit checks
if (_dist >= 1500) exitWith {};    // No reason to do shit beyond 1500m!

// if the Shooter is inside of a building exit the Code
if (insideBuilding _shooter isEqualTo 1) exitWith {};

private ["_config","_maxPlopp","_cachedVarName", "_isSuppressed"];
//-- Get the prefix and check if the "weapon" equals the muzzle
if (_muzzle == _weapon) then {
    _config = configFile >> "cfgWeapons" >> _weapon;
    _cachedVarName = format ["_%1", _weapon];
    _isSuppressed = [_shooter,_weapon] call FUNC(suppCheck);
} else {
    _config = configFile >> "cfgWeapons" >> _weapon >> _muzzle;
    _cachedVarName = format ["_%1_%2", _weapon, _muzzle];
    _isSuppressed = false;
};

if (_isSuppressed) exitWith {};

private _prefix = [(_config >> "L_ES_Prefix"), QGVAR(cached_Prefix) + _cachedVarName] call FUNC(readCacheValues);
if (_prefix == "nosound") exitWith {};

if (_prefix isEqualTo "") then {
    if (_weapon == handgunWeapon _shooter) then {
        _prefix = "pistol";
        _maxPlopp = 1400;
    } else {
        _prefix = "rifle_1";
        _maxPlopp = 1600;
    };
} else {
    _maxPlopp = [(_config >> "L_ES_maxPlopp"), QGVAR(cached_maxPlopp) + _cachedVarName] call FUNC(readCacheValues);
};

[_shooter, _maxPlopp, _dist, _prefix, _cPos, _sPos] call FUNC(checkEnviroment);
