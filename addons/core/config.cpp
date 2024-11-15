#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "L_ES_ES_main"
        };
        author = "ThomasAngel";
        authors[] = {"ThomasAngel"};
        url = "";
        VERSION_CONFIG;
    };
};

#include "cfgWeapons.hpp"
#include "cfgSounds.hpp"
#include "CfgEventHandlers.hpp"
