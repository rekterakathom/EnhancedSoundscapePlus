class Extended_PreStart_EventHandlers {
    class L_ES_ES_sys {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
	class L_ES_ES_sys {
		init = QUOTE(call COMPILE_FILE(XEH_preInit));
	};
};

class Extended_PostInit_EventHandlers {
	class L_ES_ES_sys {
		init = QUOTE(call COMPILE_FILE(XEH_PostInit));
	};
};

class Extended_FiredBIS_EventHandlers {
	class AllVehicles {
		class L_ES_ES_sys {
			clientFiredBIS = QUOTE(_this call FUNC(fired));
		};
	};
};