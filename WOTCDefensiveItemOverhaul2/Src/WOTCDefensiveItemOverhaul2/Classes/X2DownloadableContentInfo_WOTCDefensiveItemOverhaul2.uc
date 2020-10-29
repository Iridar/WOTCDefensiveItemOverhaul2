class X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2 extends X2DownloadableContentInfo;

struct DefensiveOverhaulStruct
{
	var int		ShieldHP;
	var name	CreateSchematic;
	var string	SchematicImage;

	var StrategyRequirement Requirements;
	var StrategyRequirement SchematicRequirements;
	var StrategyCost		SchematicCost;
};
var config(DefensiveOverhaul) array<DefensiveOverhaulStruct> AblativePlatingUnlocks;

var config(DefensiveOverhaul) bool bLog;
var config(DefensiveOverhaul) array<name> PatchArmorStatAbilities;
var config(DefensiveOverhaul) array<name> PatchArmorItems;
var config(DefensiveOverhaul) array<string> ArmorUpgradeIcons;
var localized string strAblativeShieldHPLabel;

delegate ModifyTemplate(X2DataTemplate DataTemplate);

static event OnPostTemplatesCreated()
{
	IterateTemplatesAllDiff(class'X2ArmorTemplate', PatchArmorTemplate);
}

static private function PatchArmorTemplate(X2DataTemplate DataTemplate)
{
	local X2ArmorTemplate	Template;
	local name				AbilityName;

	Template = X2ArmorTemplate(DataTemplate);
	
	if (Template != none)
	{
		foreach default.PatchArmorStatAbilities(AbilityName)
		{
			if ((Template.Abilities.Find(AbilityName) != INDEX_NONE || default.PatchArmorItems.Find(Template.DataName) != INDEX_NONE) &&
				 Template.Abilities.Find('IRI_DefensiveOverhaul_Passive') == INDEX_NONE)
			{
				`LOG("Adding Ablative Plating to armor:" @ Template.FriendlyName @ Template.DataName,, 'ArmorOverhaul');

				Template.Abilities.AddItem('IRI_DefensiveOverhaul_Passive');

				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 1, true, ShouldDisplayBonus_T1);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 2, true, ShouldDisplayBonus_T2);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 3, true, ShouldDisplayBonus_T3);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 4, true, ShouldDisplayBonus_T4);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 5, true, ShouldDisplayBonus_T5);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 6, true, ShouldDisplayBonus_T6);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 7, true, ShouldDisplayBonus_T7);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 8, true, ShouldDisplayBonus_T8);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 9, true, ShouldDisplayBonus_T9);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 10, true, ShouldDisplayBonus_T10);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 11, true, ShouldDisplayBonus_T11);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 12, true, ShouldDisplayBonus_T12);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 13, true, ShouldDisplayBonus_T13);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 14, true, ShouldDisplayBonus_T14);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 15, true, ShouldDisplayBonus_T15);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 16, true, ShouldDisplayBonus_T16);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 17, true, ShouldDisplayBonus_T17);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 18, true, ShouldDisplayBonus_T18);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 19, true, ShouldDisplayBonus_T19);
				Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 20, true, ShouldDisplayBonus_T20);

				return;
			}
		}
	}
}

static function int CalculateShieldBonus()
{
	local XComGameState_HeadquartersXCom XComHQ;
	local int ShieldBonus;
	local int i;

	XComHQ = `XCOMHQ;
	for (i = 0; i < default.AblativePlatingUnlocks.Length; i++)
	{
		`LOG("Checking Strategic Requirements for Unlock #:" @ i, default.bLog, 'ArmorOverhaul');

		if (XComHQ.MeetsAllStrategyRequirements(default.AblativePlatingUnlocks[i].Requirements))
		{
			`LOG("Requirements met, increasing Ablative Plating bonus by:" @ default.AblativePlatingUnlocks[i].ShieldHP, default.bLog, 'ArmorOverhaul');

			ShieldBonus += default.AblativePlatingUnlocks[i].ShieldHP;
		}
		else `LOG("Requirements are not met.", default.bLog, 'DefensiveOverhaul');
	}

	`LOG("## Total bonus:" @ ShieldBonus, default.bLog, 'DefensiveOverhaul');

	if (`SecondWaveEnabled('BetaStrike'))
	{
		ShieldBonus *= class'X2StrategyGameRulesetDataStructures'.default.SecondWaveBetaStrikeHealthMod;
	}
	
	return ShieldBonus;
}

static function int GetNumAblativeUpgrades()
{
	local XComGameState_HeadquartersXCom XComHQ;
	local int iUpgrades;
	local int i;

	XComHQ = `XCOMHQ;
	for (i = 0; i < default.AblativePlatingUnlocks.Length; i++)
	{
		if (XComHQ.MeetsAllStrategyRequirements(default.AblativePlatingUnlocks[i].Requirements))
		{
			iUpgrades++;
		}
	}
	return iUpgrades;
}

static function OverrideItemImage(out array<string> imagePath, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, XComGameState_Unit UnitState)
{
	local X2ArmorTemplate	Template;
	local int				iUpgrades;

	Template = X2ArmorTemplate(ItemTemplate);

	if (Template != none && Template.Abilities.Find('IRI_DefensiveOverhaul_Passive') != INDEX_NONE)
	{
		iUpgrades = GetNumAblativeUpgrades();

		if (iUpgrades == 0)
			return;

		//	Necessary because the number of upgrades numeration starts from 1, while the icon array starts from zero
		iUpgrades--;

		if (iUpgrades > default.ArmorUpgradeIcons.Length)
		{
			iUpgrades = default.ArmorUpgradeIcons.Length - 1;
		}
		
		imagePath.AddItem(default.ArmorUpgradeIcons[iUpgrades]);
	}
}

static private function bool ShouldDisplayBonus_T1()
{
	return CalculateShieldBonus() == 1;
}
static private function bool ShouldDisplayBonus_T2()
{
	return CalculateShieldBonus() == 2;
}
static private function bool ShouldDisplayBonus_T3()
{
	return CalculateShieldBonus() == 3;
}
static private function bool ShouldDisplayBonus_T4()
{
	return CalculateShieldBonus() == 4;
}
static private function bool ShouldDisplayBonus_T5()
{
	return CalculateShieldBonus() == 5;
}
static private function bool ShouldDisplayBonus_T6()
{
	return CalculateShieldBonus() == 6;
}
static private function bool ShouldDisplayBonus_T7()
{
	return CalculateShieldBonus() == 7;
}
static private function bool ShouldDisplayBonus_T8()
{
	return CalculateShieldBonus() == 8;
}
static private function bool ShouldDisplayBonus_T9()
{
	return CalculateShieldBonus() == 9;
}
static private function bool ShouldDisplayBonus_T10()
{
	return CalculateShieldBonus() == 10;
}
static private function bool ShouldDisplayBonus_T11()
{
	return CalculateShieldBonus() == 11;
}
static private function bool ShouldDisplayBonus_T12()
{
	return CalculateShieldBonus() == 12;
}
static private function bool ShouldDisplayBonus_T13()
{
	return CalculateShieldBonus() == 13;
}
static private function bool ShouldDisplayBonus_T14()
{
	return CalculateShieldBonus() == 14;
}
static private function bool ShouldDisplayBonus_T15()
{
	return CalculateShieldBonus() == 15;
}
static private function bool ShouldDisplayBonus_T16()
{
	return CalculateShieldBonus() == 16;
}
static private function bool ShouldDisplayBonus_T17()
{
	return CalculateShieldBonus() == 17;
}
static private function bool ShouldDisplayBonus_T18()
{
	return CalculateShieldBonus() == 18;
}
static private function bool ShouldDisplayBonus_T19()
{
	return CalculateShieldBonus() == 19;
}
static private function bool ShouldDisplayBonus_T20()
{
	return CalculateShieldBonus() == 20;
}
//	===================================================================================================================================
//														TEMPLATE PATCHING HELPERS
//	===================================================================================================================================

static private function IterateTemplatesAllDiff(class TemplateClass, delegate<ModifyTemplate> ModifyTemplateFn)
{
    local X2DataTemplate                                    IterateTemplate;
    local X2DataTemplate                                    DataTemplate;
    local array<X2DataTemplate>                             DataTemplates;
    local X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2    CDO;
    
    local X2ItemTemplateManager             ItemMgr;
    local X2AbilityTemplateManager          AbilityMgr;
    local X2CharacterTemplateManager        CharMgr;
    local X2StrategyElementTemplateManager  StratMgr;
    local X2SoldierClassTemplateManager     ClassMgr;
 
    if (ClassIsChildOf(TemplateClass, class'X2ItemTemplate'))
    {
        CDO = GetCDO();
        ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
 
        foreach ItemMgr.IterateTemplates(IterateTemplate)
        {
            ItemMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {   
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2AbilityTemplate'))
    {
        CDO = GetCDO();
        AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
 
        foreach AbilityMgr.IterateTemplates(IterateTemplate)
        {
            AbilityMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2CharacterTemplate'))
    {
        CDO = GetCDO();
        CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
        foreach CharMgr.IterateTemplates(IterateTemplate)
        {
            CharMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2StrategyElementTemplate'))
    {
        CDO = GetCDO();
        StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
        foreach StratMgr.IterateTemplates(IterateTemplate)
        {
            StratMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }
    else if (ClassIsChildOf(TemplateClass, class'X2SoldierClassTemplate'))
    {
        
        CDO = GetCDO();
        ClassMgr = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
        foreach ClassMgr.IterateTemplates(IterateTemplate)
        {
            ClassMgr.FindDataTemplateAllDifficulties(IterateTemplate.DataName, DataTemplates);
            foreach DataTemplates(DataTemplate)
            {
                CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
            }
        }
    }    
}
 
static private function ModifyTemplateAllDiff(name TemplateName, class TemplateClass, delegate<ModifyTemplate> ModifyTemplateFn)
{
    local X2DataTemplate                                    DataTemplate;
    local array<X2DataTemplate>                             DataTemplates;
    local X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2    CDO;
    
    local X2ItemTemplateManager             ItemMgr;
    local X2AbilityTemplateManager          AbilityMgr;
    local X2CharacterTemplateManager        CharMgr;
    local X2StrategyElementTemplateManager  StratMgr;
    local X2SoldierClassTemplateManager     ClassMgr;
 
    if (ClassIsChildOf(TemplateClass, class'X2ItemTemplate'))
    {
        ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
        ItemMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2AbilityTemplate'))
    {
        AbilityMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
        AbilityMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2CharacterTemplate'))
    {
        CharMgr = class'X2CharacterTemplateManager'.static.GetCharacterTemplateManager();
        CharMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2StrategyElementTemplate'))
    {
        StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
        StratMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else if (ClassIsChildOf(TemplateClass, class'X2SoldierClassTemplate'))
    {
        ClassMgr = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager();
        ClassMgr.FindDataTemplateAllDifficulties(TemplateName, DataTemplates);
    }
    else return;
    
    CDO = GetCDO();
    foreach DataTemplates(DataTemplate)
    {
        CDO.CallModifyTemplateFn(ModifyTemplateFn, DataTemplate);
    }
}
 
static private function X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2 GetCDO()
{
    return X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2(class'XComEngine'.static.GetClassDefaultObjectByName(default.Class.Name));
}
 
protected function CallModifyTemplateFn(delegate<ModifyTemplate> ModifyTemplateFn, X2DataTemplate DataTemplate)
{
    ModifyTemplateFn(DataTemplate);
}