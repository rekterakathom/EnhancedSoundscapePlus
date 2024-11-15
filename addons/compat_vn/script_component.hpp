#define COMPONENT compat_vn
#define COMPONENT_BEAUTIFIED Compat_VN
#include "script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_ESSP_CORE
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_ESSP_CORE
    #define DEBUG_SETTINGS DEBUG_SETTINGS_ESSP_CORE
#endif

#ifdef ISDEV
    #define DUMP(var) var call FUNC(log)
#else
    #define DUMP(var) /* Disabled */
#endif

#include "script_macros.hpp"
