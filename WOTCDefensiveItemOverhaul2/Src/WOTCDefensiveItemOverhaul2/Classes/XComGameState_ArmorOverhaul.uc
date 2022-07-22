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
static final function int GetShieldBonus()
{
	local XComGameState_ArmorOverhaul Obj;

	Obj = XComGameState_ArmorOverhaul(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_ArmorOverhaul', true));
	if (Obj == none)
	{
		return 0;
	}

	return Obj.iShieldBonus;
}

// class'XComGameState_ArmorOverhaul'.static.GetNumAblativeUpgrades()
static final function int GetNumAblativeUpgrades()
{
	local XComGameState_ArmorOverhaul Obj;

	Obj = XComGameState_ArmorOverhaul(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_ArmorOverhaul', true));
	if (Obj == none)
	{
		return 0;
	}

	return Obj.iNumAblativeUpgrades;
}

// class'XComGameState_ArmorOverhaul'.static.GetMaxShieldBonus()
static final function int GetMaxShieldBonus()
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
static final function Update()
{
	local XComGameState_ArmorOverhaul Obj;
	local XComGameState NewGameState;

	Obj = XComGameState_ArmorOverhaul(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_ArmorOverhaul', true));
	if (Obj == none)
	{
		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Creating Armor Overhaul Object");
		Obj = XComGameState_ArmorOverhaul(NewGameState.CreateNewStateObject(class'XComGameState_ArmorOverhaul'));
		UpdateInternal(Obj);
		`GAMERULES.SubmitGameState(NewGameState);
	}
	else
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
	local XComGameState_HeadquartersXCom	XComHQ;
	local DefensiveOverhaulStruct			Unlock;
	local int uUpgrades;
	local int uShieldBonus;
	local int i;

	XComHQ = `XCOMHQ;
	foreach default.AblativePlatingUnlocks(Unlock, i)
	{
		`LOG("Checking Strategic Requirements for Unlock #:" @ i, class'X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2'.default.bLog, 'ArmorOverhaul');

		if (XComHQ.MeetsAllStrategyRequirements(Unlock.Requirements))
		{
			`LOG("Requirements met, increasing Ablative Plating bonus by:" @ Unlock.ShieldHP, class'X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2'.default.bLog, 'ArmorOverhaul');

			uUpgrades++;
			uShieldBonus += Unlock.ShieldHP;
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

