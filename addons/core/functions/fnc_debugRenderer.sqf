#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Renders Debug Icons with Text at Locations where Sounds get Played
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
if (isNil QGVAR(debuggerDraw3D)) then {
    GVAR(debuggerDraw3D) = addMissionEventHandler ["Draw3D", {
        {
            _x params ["_obj", ["_text", ""]];
            if (isNull _obj) then {
                GVAR(debugArray) deleteAt _forEachIndex;
            };
            private _pos = getPos _obj;
            _pos set [2, 0];
            drawIcon3D ["\a3\ui_f\data\gui\rsc\rscdisplayarsenal\radio_ca.paa", [1,1,1,1], _pos, 1, 1, 45, _text];
        } forEach GVAR(debugArray);

        {
            _x params ["_shooterPos", "_hits"];
            {
                _x params ["", "_pos"];
                drawLine3D [ASLToAGL _shooterPos, ASLToAGL _pos, [1,0,0,1]];
            } forEach _hits;
        } forEach GVAR(debugLineArray);
    }];
};


