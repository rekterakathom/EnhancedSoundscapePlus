#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "L_ES_ES_main",
            "ESSP_core",
            "loadorder_f_vietnam"
        };
        skipWhenMissingDependencies = 1;
        author = "ThomasAngel";
        authors[] = {"ThomasAngel"};
        url = "";
        VERSION_CONFIG;
    };
};

#include "cfgWeapons.hpp"
