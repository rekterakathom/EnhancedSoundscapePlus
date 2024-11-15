class CfgWeapons
{
	// Parent class of all SMG's in prairie fire
	class vn_rifle;
	class vn_smg: vn_rifle {
		L_ES_Prefix		= "pistol";
		L_ES_maxPlopp 	= 1400;
	};

	// Bolt action rifles
	class vn_rifle762;
	class vn_rifle_boltaction_base: vn_rifle762 {
		L_ES_Prefix		= "sniper";
		L_ES_maxPlopp 	= 2100;
	};

	// I don't think melee triggers ESS anyways but better safe than sorry
	class Pistol_Base_F;
	class vn_melee_base: Pistol_Base_F {
		L_ES_Prefix		= "nosound";
		L_ES_maxPlopp 	= 0;
	};

	// L34A1 - integrally suppressed variant of L2A3 aka the sterling gun
	class vn_l2a3;
	class vn_l34a1: vn_l2a3 {
		L_ES_Prefix		= "nosound";
		L_ES_maxPlopp 	= 0;
	};

	// This variant for some reason doesn't inherit from vn_l34a1
	class vn_l34a1_xm148: vn_l2a3 {
		L_ES_Prefix		= "nosound";
		L_ES_maxPlopp 	= 0;
	};

	// Integral suppressor
	// Works for Welrod too because Welrod inherits from HD
	class vn_pistol;
	class vn_hd: vn_pistol {
		L_ES_Prefix		= "nosound";
		L_ES_maxPlopp 	= 0;
	};

	// Vehicle horns
	class SmokeLauncher;
	class vn_ship_horn: SmokeLauncher {
		L_ES_Prefix		= "nosound";
		L_ES_maxPlopp 	= 0;
	};
};
