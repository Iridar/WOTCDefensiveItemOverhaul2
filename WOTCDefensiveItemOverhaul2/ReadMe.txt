Created by Iridar.
Overlay armor icons by NeIVIeSiS.
Some of the descriptions by lago508.

More info here: https://www.patreon.com/Iridar

===================================================
HOW TO ADD MORE ABLATIVE PLATING UPGRADES

Each entry to the "AblativePlatingUnlocks" array can have these parameters:

) ShieldHP - how much bonus HP is added if this upgrade is unlocked. This value is increased by Beta Strike multiplier automatically.

) CreateSchematic - if you specify a template name here, a schematic with that template name will be created by the mod automatically. Don't forget to add localization for it in this mod's Localization\XComGame.int file.

) SchematicImage - specify a path to an inventory image for the schematic created by this entry.

) Requirements - these strategic requirements must be fulfilled so that this unlock counts as, well, unlocked. The full list of Strategic Requirements parameters can be found below.

) SchematicRequirements - these strategic requirements must be fulfilled before the schematic created by this entry can be puchased in Engineering.

) SchematicCost - these ResourceCosts and ArtifactCosts must be paid to purchase the schematic in Engineering.

All of the entries configured for this mod by default create their own schematics, and then the bonus is unlocked by purchasing these schematic in Engineering, however you do not *have* to follow this pattern.
You can potentially tie the ablative HP bonus to any arbitrary condition, such as having 3 Medkits in the Avenger Inventory, or having more than 2 Engineers, or having built a specific facility, etc.

Strategic Requirements parameters:
var array<Name>			RequiredTechs;
var bool				bVisibleIfTechsNotMet;
var array<Name>			RequiredItems;
var array<Name>         AlternateRequiredItems;
var array<ArtifactCost> RequiredItemQuantities;
var bool				bVisibleIfItemsNotMet;
var array<Name>			RequiredEquipment;
var bool				bDontRequireAllEquipment;
var bool				bVisibleIfRequiredEquipmentNotMet;
var array<Name>			RequiredFacilities;
var bool				bVisibleIfFacilitiesNotMet;
var array<Name>			RequiredUpgrades;
var bool				bVisibleIfUpgradesNotMet;
var int					RequiredEngineeringScore;
var int					RequiredScienceScore;
var bool				bVisibleIfPersonnelGatesNotMet;
var int					RequiredHighestSoldierRank;
var Name				RequiredSoldierClass;
var bool				RequiredSoldierRankClassCombo;
var bool				bVisibleIfSoldierRankGatesNotMet;
var array<Name>			RequiredObjectives;
var bool				bVisibleIfObjectivesNotMet;

===================================================

[WOTC] Iridar's Armor Overhaul

Plated Armor now grants +1 HP. Powered Armor grants +2 HP. You can now gradually upgrade all Armor with an increasing bonus of up to +6 Ablative HP by purchasing [b]Ablative Plating[/b] upgrades in Engineering after your perform the required research or autopsy. 

There are six [b]Ablative Plating[/b] upgrades in total, unlocked by:[list]
[*] Hybrid Materials
[*] ADVENT Trooper Autopsy
[*] ADVENT Shieldbearer Autopsy + Plated Armor
[*] Chryssalid Autopsy + Plated Armor
[*] Andromedon Autopsy + Powered Armor
[*] Sectopod Autopsy + Powered Armor[/list]
Ablative Plating upgrades can be purchased in any order, but naturally the lategame unlocks are more expensive.  Each upgrade makes all compatible XCOM Armor grant a cumulative bonus of +1 Ablative HP. When playing with Beta Strike second wave option, this bonus is increased as if it was health.[quote]
Ablative Hit Points are displayed in tactical as an orange bar above soldiers' hitpoints. They normally cannot be restored during the mission.
Taking damage to Ablative HP does not wound the soldier.
Fall damage bypasses Ablative HP.
[/quote]
This mod also configures the game to make Poison damage bypass Ablative HP and damage health directly, as well as makes it possible to Shred armor pips even when dealing only Ablative HP damage.

The number of purchased upgrades is displayed on the armor icons by overlaying a shield icon with one or several chevrons. The total amount of Ablative HP granted by all your upgrades is displayed in the armory on the right. See the screenshots for more context.

Finally, this mod makes [b]Plated Armor[/b] and [b]Powered Armor[/b] schematics 50% cheaper to offset the resource cost associated with having to purchase Ablative Plating upgrades.

[h1]DESIGN GOALS[/h1]

The overall goal of this mod is to make the increases in survivability of your soldiers more granular. Purchasing Predator Armor upgrade in vanilla nearly doubles your soldiers' health, making Tactical layer less challenging and less interesting.

Also, with this mod you can purchase your first couple of Ablative Plating upgrades relatively early, providing a much needed survivability boost, while making early techs other than Magnetic Weapons worth pursuing.

Some numbers: in vanilla, soldiers get up to +6 HP from Warden Armor. With Armor Overhaul they get +2 HP and up to +6 Ablative HP, so the overall raw survivability is increased at most stages of the game.

[h1]REQUIREMENTS[/h1]

[url=https://steamcommunity.com/workshop/filedetails/?id=1134256495][b]X2 WOTC Community Highlander[/b][/url] v1.21 or higher is required.

Does not require a new campaign. 

[h1]COMPATIBILITY[/h1]

Out of the box, the mod is compatible with all Vanilla and DLC Armors, including SPARK Armor, as well as mod-added Armors that use the vanilla passive abilities for their stat bonuses. 

In adition to that, the mod includes explicit support for these mod-added armors:[list]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2222330444][b]Heavy And Light Kevlar Armors[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1511763111][b]WotC] EU Psi Armor[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1281296244][b][WOTC] Playable Titan Armor[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2094672450][b][WoTC] Custodian Pack[/b][/url] / [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1835154434][b][WoTC] Standalone Metion BattleSuit[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1918499687][b][WOTC] The Hive[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2567230602][b][WOTC] Prototype Armoury[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1926276981][b]Cerberus Trooper[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1943937457][b]Cerberus Centurion[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1959737464][b]Cerberus Phantom[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1967389797][b]Cerberus Engineer[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1967418231][b]Cerberus Nemesis[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2026440664][b]Cerberus Guardian[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2018468672][b]CAT6 Sniper[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2064902900][b]CAT6 Heavy[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1989784318][b]CAT6 Specialist[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1137954330][b][WOTC] Superheavy Battlesuits[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=1562717298][b][WOTC] Warhammer 40,000: Armours of the Imperium[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2201956436][b][WOTC] ADVENT Armor: Reverse-Engineering[/b][/url]
[*] [url=https://steamcommunity.com/sharedfiles/filedetails/?id=2389396383][b]PROJECT EXVENT: Playable ADVENT Soldiers [v2.1][/b][/url]
[/list]

All other Armors will not be affected by this mod, meaning they will still provide their full HP bonus and will not grant Ablative HP.

[url=https://steamcommunity.com/sharedfiles/filedetails/?id=2086473567][b][WOTC] Iridar's Vest and Plating Overhaul[/b][/url] (previously known as Defensive Items Overhaul) - compatible, but using both of them together will make your soldiers rather tanky.

[h1]CONFIGURATION[/h1]

The mod is entirely configurable through various configuration files in:
[code]..\steamapps\workshop\content\268500\2268770257\Config\[/code]

You can add more upgrade tiers, I have left some instructions for that in ReadMe.txt.
The only limitation is that if the total bonus is larger than 20 points, it will still be displayed in the armory on the right as only 20 points. I can potentially increase this limit if it becomes an actual issue for someone.
You can also replace the Ablative HP bonus with regular HP, if you wish.

[h1]CREDITS[/h1]

Overlay armor icons by [b]NeIVIeSiS[/b].
Some of the descriptions by [b]lago508[/b].

Please [b][url=https://www.patreon.com/Iridar]support me on Patreon[/url][/b] if you require tech support, have a suggestion for a feature, or simply wish to help me create more awesome mods.
