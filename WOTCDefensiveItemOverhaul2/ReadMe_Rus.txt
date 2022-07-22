Создано Иридаром.
Иконки уровня брони: NeIVIeSiS.
Некоторые внутриигровые описания: lago508.
Русский перевод: Bethrezen и Иридар.

Больше об авторе здесь: https://sponsr.ru/Iridar/

===================================================
КАК ДОБАВЛЯТЬ БОЛЬШЕ УРОВНЕЙ УЛУЧШЕНИЯ БРОНЕПЛАСТИН

Массив "AblativePlatingUnlocks" позволяет настроить уровни улучшения бронепластин в течение игры.
Каждый элемент массива - один уровень улучшения, и он может иметь следующие параметры:

) ShieldHP - количество бонусных очков щитов (здоровья), которое будет добавлено броне после приобретения этого уровня. Это количество автоматически увеличится, если включён Решительный удар.

) CreateSchematic - укажите здесь внутреннее имя шаблона (template name), и схематика с этим внутренним именем добавится в инженерный отсек автоматически. Для схематики с этим внутренним именем будет нужно добавить локализацию (внутриигровое описание) в файл Localization\XComGame.rus.

Примечение: здесь и далее, схематика - это шаблон типа X2SchematicTemplate. Это предмет, который можно единожды купить в инженерном отсеке, как правило, чтобы улучшить другие предметы (например, схематика улучшения штурмовых винтовок с обычных до магнитных), либо, как в случае с этим модом, чтобы дать игроку улучшение брони. 

) SchematicImage - путь до файла изображения созданной схематики.

) Requirements - стратегические требования, которые нужно выполнить чтобы дать этот уровень улучшения. В данном случае - наличие определённой схематики в инвентаре Мстителя.

) SchematicRequirements - стратегические требования, которые нужно выполнить чтобы созданная схематика стала доступна к покупке в инженерном отсеке.

) SchematicCost - стоимость схематики в ресурсах (ResourceCosts) и предметах (ArtifactCosts), которую нужно заплатить в инженерном отсеке.

Все улучшения, настроенные в этом моде по умолчанию, создают свои собственные схематики, и дают свой бонус при покупке этой схематики в инженерном отсеке, но это далеко не единственный путь.
В теории, можно привязать улучшение бронепластин к любому условию, хоть к наличию трёх аптечек в инвентаре Мстителя, или наличию более двух инженеров, и т.д.

Список возможных параметров стратегических требований:
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

Листовая броня теперь даёт +1 очко здоровья, Силовая броня даёт +2 очка. Теперь можно постепенно улучшать всю броню, чтобы она давала бонус до +6 очков бронепластин (щитов, оранжевой полоски ХП), покупая улучшения для покрытия брони в Инженерном отсеке после необходимого исследования или вскрытия.

Всего к покупке доступно шесть уровней улучшения покрытия, для которых требуются:[list]
[*] Гибридные материалы
[*] Вскрытие солдата "Адвента"
[*] Вскрытие щитоносца "Адвента" + Листовая броня
[*] Вскрытие криссалида + Листовая броня
[*] Вскрытие андромедона + Силовая броня
[*] Поломка сектопода + Силовая броня[/list]
Эти улучшения можно покупать в любом порядке, но более поздние улучшения более дороги. Каждое улучшение добавит бонус +1 очко бронепластин ко всей совместимой броне XCOM. Это количество автоматически увеличится, если включён Решительный удар.[quote]
Очки бронепластин показаны в виде оранжевой полоски над полоской очков здоровья бойца. Обычно их нельзя восстановить во время задания.
Повреждения бронепластин не ранят бойца.
Урон от падения проходит сквозь очки бронепластин, и бьёт напрямую по очкам здоровья.
[/quote]
Этот мод также настраивает игру, чтобы урон от яда проходил сквозь очки бронепластин / щиты, и бил по здоровью напрямую. Он также делает возможным разрывать броню, даже если урон был нанесён только очкам бронепластин / щитам.

Количество приобретённых улучшений показывается на самой броне в виде иконок со щитом и шевронами. Общее количество очков бронепластин показано в оружейной справа, как видно на скриншотах выше.

Последнее изменение этого мода: он делает покупку Листовой брони и Силовой брони дешевле на 50% чтобы скомпенсировать стоимость улучшений покрытия брони.

[h1]ЦЕЛИ ЭТОГО МОДА[/h1]

Общая цель этого мода - сделать рост живучести бойцов более постепенным. В базовой игре, покупка Листовой брони почти удваивает количество очков здоровья бойцов, делая задания менее сложными и менее интересными.

Также, с этим модом у вас будет возможность приобрести первую пару улучшений покрытия довольно рано, давая бойцам столь нужное повышение живучести, и при этом делает исследование чего-то кроме магнитного оружия стоящей затеей.

Немного сравнительной арифметики: в базовой игре, бойцы получают до +6 очков здоровья от Брони надзирателя. С этим модом, у них будет +2 очка здоровья от брони, и +6 очков бронепластин, так что этот мод повысит среднюю живучесть бойцов на всех этапах игры.

[h1]ТРЕБОВАНИЯ[/h1]

[url=https://steamcommunity.com/workshop/filedetails/?id=1134256495][b]X2 WOTC Community Highlander[/b][/url] версии 1.21 или выше.

Можно добавлять во время кампании.

[h1]СОВМЕСТИМОСТЬ[/h1]

Из коробки, этот совместим со всей бронёй из базовой игры и официальных DLC, включая броню ИСКР, а также броню из модов, которая использует пассивные способности брони из базовой игры.

В дополнение к этому, в этот мод добавлена поддержка брони из этих модов:[list]
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

Вся другая броня останется нетронута этим модом, т.е. она будут давать всё то же количество очков здоровья, и не будут давать очки бронепластин.

[url=https://steamcommunity.com/sharedfiles/filedetails/?id=2086473567][b][WOTC] Iridar's Vest and Plating Overhaul[/b][/url] - совместим с этим модом, но если их использовать вместе, ваши бойцы будут ну очень живучие.

[h1]КОНФИГУРАЦИЯ[/h1]

Этот мод полностью настраивается через различные файлы конфигурации в:
[code]..\steamapps\workshop\content\268500\2268770257\Config\[/code]

Можно добавлять больше уровней улучшения бронепластин, для этого есть некоторые инструкции в ReadMe_rus.txt.
Единственное ограничение: если суммарный бонус очков бронепластин будет выше 20, в оружейной он всё равно будет отображаться только как +20. 
Я могу поднять этот предел, если это окажется кому-то нужным.
Ещё можно заменить очки бронепластин на обычные очки здоровья, если есть такое желание.

[h1]ЗАКЛЮЧЕНИЕ[/h1]

Спасибо [b]NeIVIeSiS[/b] за иконки улучшения брони.
Спасибо [b]lago508[/b] за помощь в составление внутриигровых описаний улучшений.
Русский перевод: Bethrezen и Иридар.

Поддержать автора можно через [b][url=https://sponsr.ru/iridar/]Sponsr[/url][/b]. Становитесь подписчиком - и будем создавать крутые моды вместе.
