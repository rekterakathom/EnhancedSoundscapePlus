#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * add Sound Effects with Data to the SoundHandler Queue and set the newSound Flag to start Sorting
 *
 * Arguments:
 * 0: Log String <String>
 *
 * Return Value:
 * None
 */

private _text = _this;
if (_this isEqualType []) then {
    _text = format _this;
};
if !(_this isEqualType "") then {
    _text = str _text;
};

if (GVAR(showHintLog)) then {
    while {count GVAR(logData) >= GVAR(maxHintSize)} do {
        GVAR(logData) deleteAt 0;
    };

    GVAR(hintNumber) = GVAR(hintNumber) + 1;
    GVAR(logData) pushBack ((str GVAR(hintNumber)) + ": " + _text + "\n");

    private _str = "";
    {
        _str = _str + _x;
    } count GVAR(logData);
    hintSilent _str;
};

_text = format ["(%1)[L_ES]: %2", diag_frameNo, _text];

diag_log _text;
systemChat _text;
