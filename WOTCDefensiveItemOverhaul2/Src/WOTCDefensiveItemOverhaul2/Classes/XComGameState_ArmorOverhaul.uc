class XComGameState_ArmorOverhaul extends XComGameState_BaseObject config(DefensiveOverhaul);

//	Helper state object, used to cache info about unlocked upgrades to reduce lag on the armory screen.

struct DefensiveOverhaulStruct
{
	var int		ShieldHP;
	var name	CreateSchematic;
	var string	SchematicImage;

	var StrategyRequirement Requirements;
	var StrategyRequirement SchematicRequirements;
	var StrategyCost		SchematicCost;
};
var config array<DefensiveOverhaulStruct> AblativePlatingUnlocks;

//	Variables for storing cached info
var private int iShieldBonus;
var private int iNumAblativeUpgrades;

//	-------------------------- PUBLIC INTERFACE FUNCTIONS -------------------------- 

// class'XComGameState_ArmorOverhaul'.static.GetShieldBonus()
static function int GetShieldBonus()
{
	local XComGameState_ArmorOverhaul Obj;

	GetOrCreate(Obj);

	return Obj.iShieldBonus;
}

// class'XComGameState_ArmorOverhaul'.static.GetNumAblativeUpgrades()
static function int GetNumAblativeUpgrades()
{
	local XComGameState_ArmorOverhaul Obj;

	GetOrCreate(Obj);

	return Obj.iNumAblativeUpgrades;
}

// class'XComGameState_ArmorOverhaul'.static.GetMaxShieldBonus()
static function int GetMaxShieldBonus()
{
	local DefensiveOverhaulStruct AblativePlatingUnlock;
	local int iMaxShieldBonus;

	foreach default.AblativePlatingUnlocks(AblativePlatingUnlock)
	{
		iMaxShieldBonus += AblativePlatingUnlock.ShieldHP;
	}
	return iMaxShieldBonus;
}

// class'XComGameState_ArmorOverhaul'.static.Update()
static function Update()
{
	local XComGameState_ArmorOverhaul Obj;
	local XComGameState NewGameState;

	if (GetOrCreate(Obj))
	{
		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating Armor Overhaul Object");

		Obj = XComGameState_ArmorOverhaul(NewGameState.ModifyStateObject(class'XComGameState_ArmorOverhaul', Obj.ObjectID));

		UpdateInternal(Obj);

		`GAMERULES.SubmitGameState(NewGameState);
	}
}

//	-------------------------- INTERNAL FUNCTIONS -------------------------- 

static private function UpdateInternal(XComGameState_ArmorOverhaul NewObj)
{
	local XComGameState_HeadquartersXCom XComHQ;
	local int uUpgrades;
	local int uShieldBonus;
	local int i;

	XComHQ = `XCOMHQ;

	for (i = 0; i < default.AblativePlatingUnlocks.Length; i++)
	{
		`LOG("Checking Strategic Requirements for Unlock #:" @ i, class'X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2'.default.bLog, 'ArmorOverhaul');

		if (XComHQ.MeetsAllStrategyRequirements(default.AblativePlatingUnlocks[i].Requirements))
		{
			`LOG("Requirements met, increasing Ablative Plating bonus by:" @ default.AblativePlatingUnlocks[i].ShieldHP, class'X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2'.default.bLog, 'ArmorOverhaul');

			uUpgrades++;
			uShieldBonus += default.AblativePlatingUnlocks[i].ShieldHP;
		}
		else `LOG("Requirements are not met.", class'X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2'.default.bLog, 'DefensiveOverhaul');
	}

	if (`SecondWaveEnabled('BetaStrike'))
	{
		uShieldBonus *= class'X2StrategyGameRulesetDataStructures'.default.SecondWaveBetaStrikeHealthMod;
	}

	`LOG("## Total bonus:" @ uShieldBonus, class'X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2'.default.bLog, 'DefensiveOverhaul');

	NewObj.iShieldBonus = uShieldBonus;
	NewObj.iNumAblativeUpgrades = uUpgrades;
}

// Returns true if the object was retrieved from history and needs an update.
// Returns false if the object was just created and updated.
static private function bool GetOrCreate(out XComGameState_ArmorOverhaul Obj)
{
	local XComGameState NewGameState;

	Obj = XComGameState_ArmorOverhaul(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_ArmorOverhaul', true));

	if (Obj == none)
	{
		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Creating Armor Overhaul Object");
		Obj = XComGameState_ArmorOverhaul(NewGameState.CreateNewStateObject(class'XComGameState_ArmorOverhaul'));
		UpdateInternal(Obj);
		`GAMERULES.SubmitGameState(NewGameState);

		return false;
	}

	return true;
}
