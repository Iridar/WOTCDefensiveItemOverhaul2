������� ��������.
������ ������ �����: NeIVIeSiS.
��������� ������������� ��������: lago508.
������� �������: Bethrezen � ������.

������ �� ������ �����: https://sponsr.ru/Iridar/

===================================================
��� ��������� ������ ������� ��������� ������������

������ "AblativePlatingUnlocks" ��������� ��������� ������ ��������� ������������ � ������� ����.
������ ������� ������� - ���� ������� ���������, � �� ����� ����� ��������� ���������:

) ShieldHP - ���������� �������� ����� ����� (��������), ������� ����� ��������� ����� ����� ������������ ����� ������. ��� ���������� ������������� ����������, ���� ������� ����������� ����.

) CreateSchematic - ������� ����� ���������� ��� ������� (template name), � ��������� � ���� ���������� ������ ��������� � ���������� ����� �������������. ��� ��������� � ���� ���������� ������ ����� ����� �������� ����������� (������������� ��������) � ���� Localization\XComGame.rus.

����������: ����� � �����, ��������� - ��� ������ ���� X2SchematicTemplate. ��� �������, ������� ����� �������� ������ � ���������� ������, ��� �������, ����� �������� ������ �������� (��������, ��������� ��������� ��������� �������� � ������� �� ���������), ����, ��� � ������ � ���� �����, ����� ���� ������ ��������� �����. 

) SchematicImage - ���� �� ����� ����������� ��������� ���������.

) Requirements - �������������� ����������, ������� ����� ��������� ����� ���� ���� ������� ���������. � ������ ������ - ������� ����������� ��������� � ��������� ��������.

) SchematicRequirements - �������������� ����������, ������� ����� ��������� ����� ��������� ��������� ����� �������� � ������� � ���������� ������.

) SchematicCost - ��������� ��������� � �������� (ResourceCosts) � ��������� (ArtifactCosts), ������� ����� ��������� � ���������� ������.

��� ���������, ����������� � ���� ���� �� ���������, ������� ���� ����������� ���������, � ���� ���� ����� ��� ������� ���� ��������� � ���������� ������, �� ��� ������ �� ������������ ����.
� ������, ����� ��������� ��������� ������������ � ������ �������, ���� � ������� ��� ������� � ��������� ��������, ��� ������� ����� ���� ���������, � �.�.

������ ��������� ���������� �������������� ����������:
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

���� ��� �������� ����� ����� �������� � ����� �� ���� [b]������������[/b]:[list]
[*] ����� ������������ ������������ ��� ��������� ������� ��� ������� �������� �����.
[*] ����, ����������� ���������������, �� ����� �����, �� � ������������ ������������� �� ����� ������� ������ ������.
[*] ���� �� ��� � ������� ���������� ������������� � ���������� ���� �������� ������ ��������.
[*] ��������� ����� ����� ������� ������ ����� ���� ���� ���� ��� ��������� �������� ���������������.
[*] ���� ������ � ������ "����������� ����", ���� ������������ ����� ���������, ��� �� ��� � ���� ��������.[/list]

��� ���� ��� ���������� ������� ��������� ����� ���, ��� ������ ��������� ����� ������� � ������, � ��� �� �������� ����� ����� ��������� �������� �����. ������ ��������� ������� ����� +1 ���� ������������ �� ���� ����������� ����� XCOM.

[IMG]https://i.imgur.com/e1KW15P.png[/IMG]

���������� ������������ ��������� ������������ �� ����� ����� � ���� ������ �� ����� � ���������. ����� ���������� ����� ������������ �������� � ��������� ������, ��� ����� �� ���������� ����.

������ ���� ��������� �������� ����� ���������� �������� ����, ����� ������ ����� ������ ��������� ���������, � ��� ���� ������ ������������ ����-�� ����� ���������� ������ ������� ������.

[h1]���� ����� ����[/h1]

����� ���� ����� ���� - ������� ���� ��������� ������ ����� �����������. � ������� ����, ������� �������� ����� ����� ��������� ���������� ����� �������� ������, ����� ������� ����� �������� � ����� �����������.

� ���� �����, ��������� ����� � ��������� �������������, �� � �������� ��� ����� ������� ������� ������.

[h1]����������[/h1]

[url=https://steamcommunity.com/workshop/filedetails/?id=1134256495][b]X2 WOTC Community Highlander[/b][/url] ������ 1.21 ��� ����.

����� ��������� �� ����� ��������.

[h1]�������������[/h1]

�� �������, ���� ��������� �� ���� ����� �� ������� ���� � ����������� DLC, ������� ����� ����, � ����� ����� �� �����, ������� ���������� ��������� ����������� ����� �� ������� ����.

� ���������� � �����, � ���� ��� ��������� ��������� ����� �� ���� �����:[list]
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

��� ������ ����� ��������� ��������� ���� �����, �.�. ��� ����� ������ �� �� �� ���������� ����� ��������, � �� ����� ������ ���� ������������.

[url=https://steamcommunity.com/sharedfiles/filedetails/?id=2086473567][b][WOTC] Iridar's Vest and Plating Overhaul[/b][/url] - ��������� � ���� �����, �� ���� �� ������������ ������, ���� ����� ����� �� ����� �������.

[h1]������������[/h1]

���� ��� ��������� ������������� ����� ��������� ����� ������������ �:
[code]..\steamapps\workshop\content\268500\2268770257\Config\[/code]

����� ��������� ������ ������� ��������� ������������, ��� ����� ���� ��������� ���������� � ReadMe_rus.txt.
������������ �����������: ���� ��������� ����� ����� ������������ ����� ���� 20, � ��������� �� �� ����� ����� ������������ ������ ��� +20. 
� ���� ������� ���� ������, ���� ��� �������� ����-�� ������.
��� ����� �������� ���� ������������ �� ������� ���� ��������, ���� ���� ����� �������.

[h1]����������[/h1]

������� [b]NeIVIeSiS[/b] �� ������ ��������� �����.
������� [b]lago508[/b] �� ������ � ����������� ������������� �������� ���������.
������� �������: Bethrezen � ������.

���������� ������ ����� ����� [b][url=https://sponsr.ru/iridar/]Sponsr[/url][/b]. ����������� ����������� - � ����� ��������� ������ ���� ������.
