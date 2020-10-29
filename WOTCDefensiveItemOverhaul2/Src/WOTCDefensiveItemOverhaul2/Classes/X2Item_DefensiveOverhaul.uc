class X2Item_DefensiveOverhaul extends X2Item dependson(XComGameState_ArmorOverhaul);

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate>				Templates;
	local array<DefensiveOverhaulStruct>	Unlocks;
	local int i;

	Unlocks = class'XComGameState_ArmorOverhaul'.default.AblativePlatingUnlocks;

	for (i = 0; i < Unlocks.Length; i++)
	{
		if (Unlocks[i].CreateSchematic != '')
		{
			Templates.AddItem(Create_Schematic(Unlocks[i].CreateSchematic, i, Unlocks[i].SchematicImage,  Unlocks[i].SchematicRequirements,  Unlocks[i].SchematicCost));
		}
	}
	return Templates;
}

static function X2DataTemplate Create_Schematic(name TemplateName, int SortingTier, string Image, StrategyRequirement Requirements, StrategyCost Cost)
{
	local X2SchematicTemplate Template;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, TemplateName);

	Template.ItemCat = 'armor';
	Template.strImage = Image;
	Template.PointsToComplete = 0;
	Template.Tier = SortingTier;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	//	Dumb that I need to do this
	Template.ReferenceItemTemplate = TemplateName;

	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;

	Template.Requirements = Requirements;
	Template.Cost = Cost;

	return Template;
}