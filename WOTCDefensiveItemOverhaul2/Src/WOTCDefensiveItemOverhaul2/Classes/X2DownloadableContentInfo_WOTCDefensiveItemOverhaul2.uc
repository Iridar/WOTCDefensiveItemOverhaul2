class X2DownloadableContentInfo_WOTCDefensiveItemOverhaul2 extends X2DownloadableContentInfo;

var config(DefensiveOverhaul) bool bLog;
var config(DefensiveOverhaul) array<name> PatchArmorStatAbilities;
var config(DefensiveOverhaul) array<name> PatchArmorItems;
var config(DefensiveOverhaul) array<string> ArmorUpgradeIcons;
var localized string strAblativeShieldHPLabel;

struct PatchArmorStruct
{
	var name AbilityTemplate;
	var int HealthBonus;
	var ECharStatType ReplaceHPStatType;
};
var config(DefensiveOverhaul) array<PatchArmorStruct> SetArmorHealthBonus;

delegate ModifyTemplate(X2DataTemplate DataTemplate);

static event OnPostTemplatesCreated()
{
	local PatchArmorStruct				PatchArmor;
	local X2AbilityTemplateManager		AbilityTemplateManager;
    local X2AbilityTemplate				Template;
    local array<X2DataTemplate>			DifficultyVariants;
    local X2DataTemplate				DifficultyVariant;
	local X2Effect						Effect;
	local X2Effect_PersistentStatChange	StatEffect;
	local bool							bStatPatched;
	local X2ItemTemplateManager			ItemMgr;
	local X2ArmorTemplate				ArmorTemplate;
	local X2DataTemplate				DataTemplate;
	local name							AbilityName;
	local int i;

	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	foreach ItemMgr.IterateTemplates(DataTemplate)
	{
		ArmorTemplate = X2ArmorTemplate(DataTemplate);
		if (ArmorTemplate == none)
			continue;

		if (default.PatchArmorItems.Find(ArmorTemplate.DataName) != INDEX_NONE)
		{
			PatchArmorTemplate(ArmorTemplate);
		}
		else
		{
			foreach ArmorTemplate.Abilities(AbilityName)
			{
				if (default.SetArmorHealthBonus.Find('AbilityTemplate', AbilityName) != INDEX_NONE || default.PatchArmorStatAbilities.Find(AbilityName) != INDEX_NONE)
				{
					PatchArmorTemplate(ArmorTemplate);
				}
			}
		}
	}

    AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	foreach default.SetArmorHealthBonus(PatchArmor)
	{
		`LOG("Looking to set health bonus for ability:" @ PatchArmor.AbilityTemplate @ "to" @ PatchArmor.HealthBonus, default.bLog, 'ArmorOverhaul');

		AbilityTemplateManager.FindDataTemplateAllDifficulties(PatchArmor.AbilityTemplate, DifficultyVariants);

		foreach DifficultyVariants(DifficultyVariant)
		{
			Template = X2AbilityTemplate(DifficultyVariant);
			if (Template != none)
			{	
				bStatPatched = false;
				foreach Template.AbilityTargetEffects(Effect)
				{
					StatEffect = X2Effect_PersistentStatChange(Effect);
					if (StatEffect != none)
					{
						for (i = 0; i  < StatEffect.m_aStatChanges.Length; i++)
						{
							if (StatEffect.m_aStatChanges[i].StatType == eStat_HP)
							{	
								StatEffect.m_aStatChanges[i].StatAmount = PatchArmor.HealthBonus;
								if (PatchArmor.ReplaceHPStatType != eStat_Invalid)
								{
									StatEffect.m_aStatChanges[i].StatType = PatchArmor.ReplaceHPStatType;
								}
								bStatPatched = true;
								`LOG("Setting health bonus for ability:" @ PatchArmor.AbilityTemplate @ "to" @ PatchArmor.HealthBonus @ StatEffect.m_aStatChanges[i].StatType, default.bLog, 'ArmorOverhaul');
								break;
							}
						}
					}
				}

				if (bStatPatched) continue;

				foreach Template.AbilityShooterEffects(Effect)
				{
					StatEffect = X2Effect_PersistentStatChange(Effect);
					if (StatEffect != none)
					{
						for (i = 0; i  < StatEffect.m_aStatChanges.Length; i++)
						{
							if (StatEffect.m_aStatChanges[i].StatType == eStat_HP)
							{	
								StatEffect.m_aStatChanges[i].StatAmount = PatchArmor.HealthBonus;
								if (PatchArmor.ReplaceHPStatType != eStat_Invalid)
								{
									StatEffect.m_aStatChanges[i].StatType = PatchArmor.ReplaceHPStatType;
								}
								`LOG("Setting health bonus for ability:" @ PatchArmor.AbilityTemplate @ "to" @ PatchArmor.HealthBonus @ StatEffect.m_aStatChanges[i].StatType, default.bLog, 'ArmorOverhaul');
								break;
							}
						}
					}
				}
			}
		}
	}
}
static private function PatchArmorTemplate(out X2ArmorTemplate Template)
{
	local name	AbilityName;
	local int	iMax;
	local int	Index;
	local int	i;

	`LOG("Adding Ablative Plating to armor:" @ Template.GetItemFriendlyNameNoStats() @ Template.DataName, default.bLog, 'ArmorOverhaul');

	Template.Abilities.AddItem('IRI_DefensiveOverhaul_Passive');

	//	Only adding markup if the shield HP can actually get that high to reduce performance impact when it's not necessary.
	iMax = class'XComGameState_ArmorOverhaul'.static.GetMaxShieldBonus();

	if (iMax > 0) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 1, true, ShouldDisplayBonus_T1);
	if (iMax > 1) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 2, true, ShouldDisplayBonus_T2);
	if (iMax > 2) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 3, true, ShouldDisplayBonus_T3);
	if (iMax > 3) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 4, true, ShouldDisplayBonus_T4);
	if (iMax > 4) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 5, true, ShouldDisplayBonus_T5);
	if (iMax > 5) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 6, true, ShouldDisplayBonus_T6);
	if (iMax > 6) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 7, true, ShouldDisplayBonus_T7);
	if (iMax > 7) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 8, true, ShouldDisplayBonus_T8);
	if (iMax > 8) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 9, true, ShouldDisplayBonus_T9);
	if (iMax > 9) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 10, true, ShouldDisplayBonus_T10);
	if (iMax > 10) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 11, true, ShouldDisplayBonus_T11);
	if (iMax > 11) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 12, true, ShouldDisplayBonus_T12);
	if (iMax > 12) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 13, true, ShouldDisplayBonus_T13);
	if (iMax > 13) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 14, true, ShouldDisplayBonus_T14);
	if (iMax > 14) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 15, true, ShouldDisplayBonus_T15);
	if (iMax > 15) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 16, true, ShouldDisplayBonus_T16);
	if (iMax > 16) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 17, true, ShouldDisplayBonus_T17);
	if (iMax > 17) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 18, true, ShouldDisplayBonus_T18);
	if (iMax > 18) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 19, true, ShouldDisplayBonus_T19);
	if (iMax > 19) Template.SetUIStatMarkup(default.strAblativeShieldHPLabel, class'X2Effect_DefensiveOverhaul'.default.AblativePlatingStatType, 20, true, ShouldDisplayBonus_T20);

	foreach Template.Abilities(AbilityName)
	{
		`LOG("Looking at armor ability:" @ AbilityName, default.bLog, 'ArmorOverhaul');
		Index = default.SetArmorHealthBonus.Find('AbilityTemplate', AbilityName);
		if (Index != INDEX_NONE)
		{
			`LOG("We change this ability's bonus.", default.bLog, 'ArmorOverhaul');
			for (i = 0; i < Template.UIStatMarkups.Length; i++)
			{
				if (Template.UIStatMarkups[i].StatType == eStat_HP)
				{
					`LOG("Found HP markup, patching.", default.bLog, 'ArmorOverhaul');

					Template.UIStatMarkups[i].StatModifier = default.SetArmorHealthBonus[Index].HealthBonus;
					if (default.SetArmorHealthBonus[Index].ReplaceHPStatType != eStat_Invalid)
					{
						Template.UIStatMarkups[i].StatType = default.SetArmorHealthBonus[Index].ReplaceHPStatType;	
						if (Template.UIStatMarkups[i].StatType == eStat_ShieldHP)
						{
							Template.UIStatMarkups[i].StatLabel	= default.strAblativeShieldHPLabel;
						}											
					}
					`LOG("Setting stat markup for armor:" @ Template.DataName @ "to" @ Template.UIStatMarkups[i].StatModifier @ Template.UIStatMarkups[i].StatType @ Template.UIStatMarkups[i].StatLabel @ "for ability:" @ AbilityName, default.bLog, 'ArmorOverhaul');
					break;
				}
			}
			break;
		}
	}
}

static function OverrideItemImage(out array<string> imagePath, const EInventorySlot Slot, const X2ItemTemplate ItemTemplate, XComGameState_Unit UnitState)
{
	local X2ArmorTemplate	Template;
	local int				iUpgrades;

	Template = X2ArmorTemplate(ItemTemplate);

	if (Template != none && Template.Abilities.Find('IRI_DefensiveOverhaul_Passive') != INDEX_NONE)
	{
		iUpgrades = class'XComGameState_ArmorOverhaul'.static.GetNumAblativeUpgrades();

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
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 1;
}
static private function bool ShouldDisplayBonus_T2()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 2;
}
static private function bool ShouldDisplayBonus_T3()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 3;
}
static private function bool ShouldDisplayBonus_T4()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 4;
}
static private function bool ShouldDisplayBonus_T5()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 5;
}
static private function bool ShouldDisplayBonus_T6()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 6;
}
static private function bool ShouldDisplayBonus_T7()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 7;
}
static private function bool ShouldDisplayBonus_T8()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 8;
}
static private function bool ShouldDisplayBonus_T9()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 9;
}
static private function bool ShouldDisplayBonus_T10()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 10;
}
static private function bool ShouldDisplayBonus_T11()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 11;
}
static private function bool ShouldDisplayBonus_T12()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 12;
}
static private function bool ShouldDisplayBonus_T13()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 13;
}
static private function bool ShouldDisplayBonus_T14()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 14;
}
static private function bool ShouldDisplayBonus_T15()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 15;
}
static private function bool ShouldDisplayBonus_T16()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 16;
}
static private function bool ShouldDisplayBonus_T17()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 17;
}
static private function bool ShouldDisplayBonus_T18()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 18;
}
static private function bool ShouldDisplayBonus_T19()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 19;
}
static private function bool ShouldDisplayBonus_T20()
{
	return class'XComGameState_ArmorOverhaul'.static.GetShieldBonus() == 20;
}
