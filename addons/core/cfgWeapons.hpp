class CfgWeapons
{
	/*******************************************/
	// LMG_RCWS ************************************/
	class MGun;
	class LMG_RCWS: MGun {
		L_ES_Prefix		= "hmg";
		L_ES_maxPlopp 	= 2100;
	};

	/*******************************************/
	// Rifle_Base_F ************************************/
	class Rifle;
	class Rifle_Base_F: Rifle {
		L_ES_Prefix		= "rifle_1";
		L_ES_maxPlopp 	= 1700;
	};

	/*******************************************/
	// Pistol **************************/
	class PistolCore;
	class Pistol: PistolCore {
		L_ES_Prefix		= "pistol";
		L_ES_maxPlopp 	= 1400;
	};

	/*******************************************/
	// Rifle_Long_Base_F *********************/
	class Rifle_Long_Base_F: Rifle_Base_F {
		L_ES_Prefix		= "sniper";
		L_ES_maxPlopp 	= 2100;
	};
	
	/*******************************************/
	// GMG_F **********************************/
	class GMG_F: MGun {
		L_ES_Prefix	= "pistol";
		L_ES_maxPlopp 	= 1200;
	};

	// ESS for whatever reason doesn't include the Protector's base class, so here it is
	class Rifle_Short_Base_F;
	class SMG_05_base_F: Rifle_Short_Base_F {
		L_ES_Prefix		= "pistol";
		L_ES_maxPlopp 	= 1400;
	};
};
