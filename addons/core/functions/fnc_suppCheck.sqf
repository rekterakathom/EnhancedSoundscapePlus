#include "script_component.hpp"
/*
 * Author: LAxemann
 * Checks if a unit is using a silencer
 *
 * Arguments:
 * 0: Shooter <Object>
 * 1: Classname of weapon fired <String>
 *
 * Return Value:
 * Unit dont have a Supressor <Bool>
 *
 * Example:
 * [SHOOTER,WEAPONCLASSNAME] call FUNC(suppCheck)
 *
 */
scopeName "MainSuppCheck";

params [
	"_shooter", 	// Shooter
	"_weapon"	// Weapon classname
];

// if !(isNull (objectParent _shooter)) exitWith { false };
if (
    _weapon isEqualTo "" 
    || !(_weapon in (weapons _shooter)) // Fire from vehicles support, ignore vehicle weapon this way
) exitWith { false };

private _supp = switch (_weapon) do {
    case (handgunWeapon _shooter): {
        (handgunItems _shooter) select 0;
    };
    case (primaryWeapon _shooter): {
        (primaryWeaponItems _shooter) select 0;
    };
    case (secondaryWeapon _shooter): {
        (secondaryWeaponItems _shooter) select 0;
    };
    default { false breakOut "MainSuppCheck"; };
};

if (_supp isEqualTo "") exitWith {false};

private _cfgWeaponsSuppressor = configFile >> "CfgWeapons" >> _supp >> "ItemInfo" >> "AmmoCoef";
private _audibleFire = [(_cfgWeaponsSuppressor >> "audibleFire"), _supp + "audibleFire", 1] call FUNC(readCacheValues);
private _audibleFireTime = [(_cfgWeaponsSuppressor >> "audibleFireTime"), _supp + "audibleFireTime", 1] call FUNC(readCacheValues);

if (_audibleFire isEqualType "") then {
    _audibleFire = getNumber (_cfgWeaponsSuppressor >> "audibleFire");
    GVAR(variableHandler) set [_supp + "audibleFire", _audibleFire];
};
if (_audibleFireTime isEqualType "") then {
    _audibleFireTime = getNumber (_cfgWeaponsSuppressor >> "audibleFireTime");
    GVAR(variableHandler) set [_supp + "audibleFireTime", _audibleFireTime];
};
DUMP("AF: " + str _audibleFire + " AFT: " + str _audibleFireTime);
private _audibleData = _audibleFire / _audibleFireTime;
(_audibleData <= 0.7)
